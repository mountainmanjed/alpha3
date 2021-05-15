;Alpha 3
;By Jed
;based off of a3 euro avalanche

	include "memorydata.asm"
	include "GameValues.asm"
	include "cps2constants.asm"
	include "chardata.asm"
	include "macros.asm"

;Vector Table
	dc.l $00ff8000, EntryPoint,BusError,AddrError
	dc.l IllegalInst,DivbyZero,CHKinst,TrapVinst
	dc.l PrivVilation,TraceOn,Line_A_error,Line_F_error
	dc.l $00000000, $00000000, $00000000, $00000000
	dc.l $00000000, $00000000, $00000000, $00000000
	dc.l $00000000, $00000000, $00000000, $00000000

	dc.l loc_00014e,loc_00014e,loc_001198,loc_00014e
	dc.l loc_00014e,loc_00014e,loc_00014e,loc_00014e

	dc.l loc_001306,loc_001326,loc_00134a,loc_00137c
	dc.l loc_0013a6,loc_0013cc,loc_0013e8,loc_0013fc
	dc.l loc_00014e,loc_00014e,loc_00014e,loc_00014e
	dc.l loc_00014e,loc_00014e,loc_00014e,loc_00014e

;==============================================
BusError:
	move.w #0,$ff0000
	lea (8,a7),a7
	bra.w loc_000150

AddrError:
	move.w #1,$ff0000
	lea (8,a7),a7
	bra.b loc_000150

IllegalInst:
	ori.w #$2600,sr
	move.w #2,$ff0000
	bra.b loc_000150

DivbyZero:
	ori.w #$2600,sr
	move.w #3,$ff0000
	bra.b loc_000150

CHKinst:
	ori.w #$2600,sr
	move.w #4,$ff0000
	bra.b loc_000150

TrapVinst:
	ori.w #$2600,sr
	move.w #5,$ff0000
	bra.b loc_000150

PrivVilation:
	ori.w #$2600,sr
	move.w #6,$ff0000
	bra.b loc_000150

TraceOn:
	ori.w #$2600,sr
	move.w #7,$ff0000
	bra.b loc_000150

Line_A_error:
	ori.w #$2600,sr
	move.w #8,$ff0000
	bra.b loc_000150

Line_F_error:
	ori.w #$2600,sr
	move.w #9,$ff0000
	bra.b loc_000150

loc_00014e:
	rte

loc_000150:
	lea (6,a7),a7
	move.l a7,$ff0054
	lea $ff0054,a7
	movem.l d0-d7/a0-a6,-(a7)
	bra.w loc_000600

;===============================================
loc_000168:
	lea $ff8000,a5
	move.l usp,a0
	move.l a0,(-$7fa8,a5)
	moveq #0,d0
	move.w d0,(-$7ffe,a5)
	move.w d0,(-$7ffc,a5)
	move.l #$ff8000,(-$7ff0,a5)
	move.w d0,(-$7fec,a5)
	move.w d0,(-$7fea,a5)
	lea (-$7da4,a5),a7
	move.w (gfxram8x8,a5),(-$7ffa,a5)
	move.w (palrampointer,a5),(-$7ff8,a5)
	move.w ($32,a5),(-$7ff6,a5)
	move.w ($22,a5),(-$7ff4,a5)
	move.w ($24,a5),(-$7ff2,a5)
	lea $91e400,a0
	lea ($90e,pc),a1
	movem.l (a1),d0-d3
	movem.l d0-d3,(a0)
	bsr.w loc_000500
	bsr.w loc_000354
	bsr.w loc_000272
	move #$2000,sr

loc_0001d2:
	tst.b (-$7b9c,a5)
	beq.b loc_0001d2
	clr.b (-$7b9c,a5)
	move.w (-$7ffe,a5),d0
	move.w loc_0001ea(pc,d0.w),d1
	jsr loc_0001ea(pc,d1.w)
	bra.b loc_0001d2

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0001ea:
	dc.w loc_0001ee-loc_0001ea
	dc.w loc_00025a-loc_0001ea

;----------------------------------------------
loc_0001ee:
	bsr.w loc_000560
	btst #$c,d0
	bne.b loc_000200
	bsr.w loc_0002ca
	bra.w loc_0004ce

loc_000200:
	move.w #2,(-$7ffe,a5)
	move.w (-$7ffa,a5),(gfxram8x8,a5)
	move.w (-$7ff8,a5),(palrampointer,a5)
	move.w (-$7ff6,a5),($32,a5)
	move.w (-$7ff4,a5),($22,a5)
	move.w (-$7ff2,a5),($24,a5)
	move.w #0,$708002
	eori.b #1,($94,a5)
	move.b ($94,a5),OBJram_Bank1
	nop
	nop
	move.w #0,$708002
	eori.b #1,($94,a5)
	move.b ($94,a5),OBJram_Bank1
	nop
	nop
	rts

;----------------------------------------------
loc_00025a:
	bsr.w loc_000560
	btst #$a,d0
	beq.b loc_00026a
	eori.b #1,($94,a5)

loc_00026a:
	btst #$c,d0
	bne.b loc_000272
	rts

loc_000272:
	clr.w (-$7ffe,a5)
	move.w #$92c0,(gfxram8x8,a5)
	move.w #$12c2,($32,a5)
	move.w #0,($22,a5)
	move.w #$100,($24,a5)
	move.w #-$6e20,(palrampointer,a5)
	move.w #$8000,$708002
	eori.b #1,($94,a5)
	move.b ($94,a5),OBJram_Bank1
	nop
	nop
	move.w #$8000,$708002
	eori.b #1,($94,a5)
	move.b ($94,a5),OBJram_Bank1
	nop
	nop
	rts

;##############################################
loc_0002ca:
	bsr.w loc_000560
	moveq #$10,d1
	move.l (-$7ff0,a5),d2
	move.w (INP_P1_repeat,a5),d3
	not.w d3
	and.w (INP_P1,a5),d3
	btst #9,d3
	bne.w loc_000324
	btst #8,d0
	beq.b loc_0002f2
	move.l #$100,d1

loc_0002f2:
	btst #2,d0
	beq.b loc_000308
	sub.l d1,d2
	cmpi.l #$ff0000,d2
	bcc.b loc_000308
	move.l #$ff0000,d2

loc_000308:
	btst #3,d0
	beq.b loc_00031e
	add.l d1,d2
	cmpi.l #$ffff80,d2
	bls.b loc_00031e
	move.l #$ffff80,d2

loc_00031e:
	move.l d2,(-$7ff0,a5)
	rts

;==============================================
loc_000324:
	addq.w #4,(-$7ffc,a5)
	andi.w #$c,(-$7ffc,a5)
	move.w (-$7ffc,a5),d1
	move.l Debug_Memory_Shortcuts(pc,d1.w),d2
	bne.b loc_00031e
	move.l (-$7fb0,a5),d2
	andi.l #$fffff0,d2
	bra.b loc_00031e

;##############################################
Debug_Memory_Shortcuts:
	dc.l $00ff8000,$00ff8400,$00ff8800,$00000000

;----------------------------------------------
loc_000354:
	moveq #0,d0
	bsr.w loc_000592
	moveq #1,d0
	add.w (-$8000,a5),d0
	bsr.w loc_000592

	lea $92c230,a1
	move.l (-$7fe8,a5),d0
	bsr.w loc_00052c

	lea $92c234,a1
	move.l (-$7fe4,a5),d0
	bsr.w loc_00052c

	lea $92c238,a1
	move.l (-$7fe0,a5),d0
	bsr.w loc_00052c

	lea $92c23c,a1
	move.l (-$7fdc,a5),d0
	bsr.w loc_00052c

	lea $92c830,a1
	move.l (-$7fd8,a5),d0
	bsr.w loc_00052c

	lea $92c834,a1
	move.l (-$7fd4,a5),d0
	bsr.w loc_00052c

	lea $92c838,a1
	move.l (-$7fd0,a5),d0
	bsr.w loc_00052c

	lea $92c83c,a1
	move.l (-$7fcc,a5),d0
	bsr.w loc_00052c

	lea $92ce30,a1
	move.l (-$7fc8,a5),d0
	bsr.w loc_00052c

	lea $92ce34,a1
	move.l (-$7fc4,a5),d0
	bsr.w loc_00052c

	lea $92ce38,a1
	move.l (-$7fc0,a5),d0
	bsr.w loc_00052c

	lea $92ce3c,a1
	move.l (-$7fbc,a5),d0
	bsr.w loc_00052c

	lea $92d430,a1
	move.l (-$7fb8,a5),d0
	bsr.w loc_00052c

	lea $92d434,a1
	move.l (-$7fb4,a5),d0
	bsr.w loc_00052c

	lea $92d438,a1
	move.l (-$7fb0,a5),d0
	bsr.w loc_00052c

	lea $92d43c,a1
	move.l (-$7fac,a5),d0
	bsr.w loc_00052c

	lea $92cdc0,a1
	move.l (-$7fac,a5),d0
	bsr.w loc_00052c

	lea $92d440,a1
	move.l (-$7fa8,a5),d0
	bsr.w loc_00052c

	movea.l (-$7fac,a5),a3
	lea $92c840,a1
	move.w (-6,a3),d0
	bsr.w loc_000532

	move.l (-4,a3),d0
	lea $92c894,a1
	bsr.w loc_00052c
	cmpi.w #2,(-$8000,a5)
	bcc.b loc_0004c4
	move.l (-$c,a3),d0
	lea $92c898,a1
	bsr.w loc_00052c
	move.l (-$e,a3),d3
	moveq #$b,d0
	btst #4,d3
	bne.b loc_0004a4
	moveq #$c,d0

loc_0004a4:
	bsr.w loc_000592
	moveq #$d,d0
	btst #3,d3
	bne.b loc_0004b2
	moveq #$e,d0

loc_0004b2:
	bsr.w loc_000592
	andi.w #$0007,d3
	moveq #0,d0
	move.b loc_0004c6(pc,d3.w),d0
	bpl.w loc_000592

loc_0004c4:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0004c6:
	dc.b $ff,$0f,$10,$ff,$ff,$11,$12,$13

;==============================================
loc_0004ce:
	movea.l (-$7ff0,a5),a0
	lea $92c04c,a2
	moveq #7,d6

loc_0004da:
	lea (a2),a1
	move.l a0,d0
	bsr.w loc_00052c
	lea ($80,a1),a1
	moveq #7,d3

loc_0004e8:
	move.w (a0)+,d0
	bsr.w loc_000532
	lea ($80,a1),a1
	dbra d3,loc_0004e8
	lea (4,a2),a2
	dbra d6,loc_0004da
	rts

;==============================================
loc_000500:
	lea $930000,a0
	move.l #$200000,d0
	move.l d0,d1
	move.l d0,d2
	move.l d0,d3
	move.w #$ff,d6

loc_000516:
	movem.l d0-d3,-(a0)
	movem.l d0-d3,-(a0)
	movem.l d0-d3,-(a0)
	movem.l d0-d3,-(a0)
	dbra d6,loc_000516
	rts

;==============================================
loc_00052c:
	swap d0
	bsr.b loc_000532
	swap d0

loc_000532:
	move.w d0,d2
	lsr.w #8,d0
	bsr.b loc_00053a
	move.w d2,d0

loc_00053a:
	move.b d0,d1
	lsr.b #4,d0
	bsr.b loc_000542
	move.b d1,d0

loc_000542:
	andi.w #$f,d0
	cmpi.w #$a,d0
	bcs.b loc_00054e
	addq.w #7,d0

loc_00054e:
	addi.w #$30,d0
	move.w d0,(a1)
	move.w #0,(2,a1)
	lea ($80,a1),a1
	rts

;==============================================
loc_000560:
	move.w (INP_P1_repeat,a5),d0
	beq.b loc_000580
	cmpi.b #$20,(-$7fec,a5)
	blt.b loc_000586
	bsr.b loc_00058a
	andi.w #$1400,d0
	move.w (INP_P1,a5),d1
	andi.w #$ebfe,d1
	or.w d1,d0
	rts

loc_000580:
	move.b #0,(-$7fec,a5)

loc_000586:
	addq.b #1,(-$7fec,a5)

loc_00058a:
	not.w d0
	and.w (INP_P1,a5),d0 
	rts

;==============================================
loc_000592:
	moveq #0,d2
	add.b d0,d0
	bcc.b loc_00059a
	moveq #-1,d2

loc_00059a
	move.w loc_0005d8(pc,d0.w),d0
	lea loc_0005d8(pc,d0.w),a0

loc_0005a2
	moveq #0,d0
	lea Palettebank3,a1
	move.b (a0)+,d0
	lsl.w #7,d0
	add.b (a0)+,d0
	lea (a1,d0.w),a1
	moveq #0,d1
	move.b (a0)+,d1

loc_0005b8:
	moveq #0,d0
	move.b (a0)+,d0
	beq.b loc_0005d6
	bmi.b loc_0005a2
	tst.b d2
	beq.b loc_0005c6
	moveq #$20,d0

loc_0005c6:
	addi.w #0,d0
	move.w d0,(a1)
	move.w d1,(2,a1)
	lea ($80,a1),a1
	bra.b loc_0005b8

loc_0005d6:
	rts

loc_0005d8:
	dc.w $0052,$01aa,$01be,$01d6,$01f4,$020a,$0224,$0240
	dc.w $025e,$026e,$0286,$029e,$02a6,$02b0,$02c4,$02d4
	dc.w $02e2,$02f2,$0306,$031c 

;===============================================
loc_000600:
	move #$2700,sr
	moveq #0,d0
	moveq #0,d1
	moveq #0,d2
	moveq #0,d3
	moveq #0,d4
	moveq #0,d5
	moveq #0,d6
	moveq #0,d7
	movea.l d0,a0
	movea.l d0,a1
	movea.l d0,a2
	movea.l d0,a3
	movea.l d0,a4
	movea.l d0,a5
	movea.l d0,a6
	movea.l d0,a7
	jmp EntryPoint

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
CrashText:;62a
	dc.b $01,$14,$00
	dc.b 'PROGRAM COUNTER:',$ff

	dc.b $01,$18,$00
	dc.b 'ACCESS ADDRESS :',$ff


	dc.b $01,$1c,$00
	dc.b 'CYCLE          :',$ff


	dc.b $01,$20,$00
	dc.b 'ACCESS         :',$ff

	dc.b $01,$24,$00
	dc.b 'FUNCTION CODE  :',$ff

	dc.b $01,$30,$00
	dc.b 'D0:         D4:         A0:         A4:',$ff


	dc.b $01,$34,$00
	dc.b 'D1:         D5:         A1:         A5:',$ff


	dc.b $01,$38,$00
	dc.b 'D2:         D6:         A2:         A6:',$ff

	dc.b $01,$3c,$00
	dc.b 'D3:         D7:         A3:         A7:',$ff

	dc.b $0d,$40,$00
	dc.b 'SR:       SSP:         USP:',$ff

	dc.b $09,$48,$00
	dc.b '+0   +2   +4   +6   +8   +A   +C   +E',$00
	even

	dc.b $01,$0c,$00
	dc.b '---BUS ERROR---',$00
	even

	dc.b $01,$0c,$00
	dc.b '---ADDRESS ERROR---',$00
	even

	dc.b $01,$0c,$00
	dc.b '---ILLEGAL INSTRUCTION---',$00
	even

	dc.b $01,$0c,$00
	dc.b '---ZERO DIVIDE---',$00
	even

	dc.b $01,$0c,$00
	dc.b '---CHK INSTRUCTION---',$00
	even

	dc.b $01,$0c,$00
	dc.b '---TRAPV INSTRUCTION---',$00
	even

	dc.b $01,$0c,$00
	dc.b '---PRIVILEGE VIOLATION---',$00
	even

	dc.b $01,$0c,$00
	dc.b '---TRACE---',$00
	even

	dc.b $01,$0c,$00
	dc.b '---1010 EMULATOR---',$00
	even

	dc.b $01,$0c,$00
	dc.b '---1111 EMULATOR---',$00
	even

	dc.b $11,$1c,$00
	dc.b 'READ',$00
	even

	dc.b $11,$1c,$00
	dc.b 'WRITE',$00
	even

	dc.b $11,$20,$00
	dc.b 'NOT INSTRUCTION',$00
	even

	dc.b $11,$20,$00
	dc.b 'INSTRUCTION',$00
	even

	dc.b $11,$24,$00
	dc.b 'USER DATA',$00
	even

	dc.b $11,$24,$00
	dc.b 'USER PROGRAM',$00
	even

	dc.b $11,$24,$00
	dc.b 'SUPERVISOR DATA',$00
	even

	dc.b $11,$24,$00
	dc.b 'SUPERVISOR PROGRAM',$00
	even

	dc.b $11,$24,$00
	dc.b 'INTERRUPT ACKNOWLEDGE',$00
	even

;90e
	dc.w $f000,$0000,$f88f,$f88f,$f88f,$f88f,$f88f,$f88f


;==============================================
EntryPoint:;91e
	move.w #$7000,$fffff0
	move.w #0,$8040a0
	move.w #-$7f83,$fffff2
	move.w #$2461,$fffff4
	move.w #0,$fffff6
	move.w #$40,$fffff8
	move.w #$10,$fffffa
	move.w #$f00,$804040
	WATCHDOG
	lea loc_00096c(pc),a4
	bra.w loc_000e32

;==============================================
loc_00096c:
	move.w #$ffc0,$80410c
	move.w #0,$80410e
	move.w #$9000,cps0_gpuregistera
	move.w #$9000,cps0_gpuregisterb
	move.w #$9040,cps1_gpuregister
	move.w #$9080,cps2_gpuregister
	move.w #$90e0,raster_gpuregister
	lea loc_0009ac(pc),a4
	bra.w loc_000dd6

loc_0009ac:
	lea loc_0009b4(pc),a4
	bra.w loc_000d7a

loc_0009b4:
	lea loc_0009bc(pc),a4
	bra.w loc_000d8e

loc_0009bc:
	lea loc_0009c4(pc),a4
	bra.w loc_000da2

loc_0009c4:
	move.w #$e,$804122
	move.w #$1b02,$804166
	move.w #$3f,$804170
	move.w #Mainpalette,palette_gpuregister
	lea Mes_workram(pc),a2
	lea loc_0009f0(pc),a5
	bra.w loc_000d28

loc_0009f0:
	lea $ff0000,a0
	lea (a0),a1
	adda.l #$fffe,a1
	lea Mes_workram_ng(pc),a2
	lea loc_000a0a(pc),a6
	bra.w loc_000cb6

loc_000a0a:
	lea Mes_workram_ok(pc),a2
	lea loc_000a16(pc),a5
	bra.w loc_000d28

loc_000a16:
	lea Mes_cps0ram(pc),a2
	lea loc_000a22(pc),a5
	bra.w loc_000d28

loc_000a22:
	lea $900000,a0
	lea (a0),a1
	adda.l #$fffe,a1
	lea Mes_cps0ram_ng(pc),a2
	lea loc_000a3c(pc),a6
	bra.w loc_000cb6

loc_000a3c:
	lea Mes_cps0ram_ok(pc),a2
	lea loc_000a48(pc),a5
	bra.w loc_000d28

loc_000a48:
	lea Mes_cps1ram(pc),a2
	lea loc_000a54(pc),a5
	bra.w loc_000d28

loc_000a54:
	lea $910000,a0
	lea (a0),a1
	adda.l #$fffe,a1
	lea Mes_cps1ram_ng(pc),a2
	lea loc_000a6e(pc),a6
	bra.w loc_000cb6

loc_000a6e:
	lea Mes_cps1ram_ok(pc),a2
	lea loc_000a7a(pc),a5
	bra.w loc_000d28

loc_000a7a:
	lea Mes_cps2ram(pc),a2
	lea loc_000a86(pc),a5
	bra.w loc_000d28

loc_000a86:
	lea $920000,a0
	lea (a0),a1
	adda.l #$fffe,a1
	lea Mes_cps2ram_ng(pc),a2
	lea loc_000aa0(pc),a6
	bra.w loc_000cb6

loc_000aa0:
	lea Mes_cps2ram_ok(pc),a2
	lea loc_000aac(pc),a5
	bra.w loc_000d28

loc_000aac:
	lea Mes_objram(pc),a2
	lea loc_000ab8(pc),a5
	bra.w loc_000d28

loc_000ab8:
	lea ObjectRam,a0
	lea (a0),a1
	adda.l #$1ffe,a1
	lea Mes_objram_ng(pc),a2
	lea loc_000ad2(pc),a6
	bra.w loc_000cb6

loc_000ad2:
	lea Mes_objram_ok(pc),a2
	lea loc_000ade(pc),a5
	bra.w loc_000d28

loc_000ade:
	move.w #$f08,$804040
	lea Mes_QSRam(pc),a2
	lea loc_000af2(pc),a5
	bra.w loc_000d28

loc_000af2:
	WATCHDOG
	cmpi.b #$77,Sound_END
	bne.b loc_000af2
	lea Soundram,a0
	lea ($1ffe,a0),a1
	lea Mes_QSRam_NG(pc),a2
	lea loc_000b18(pc),a6
	bra.w loc_000ce0

loc_000b18:
	lea Mes_QSRam_OK(pc),a2
	lea loc_000b24(pc),a5
	bra.w loc_000d28

loc_000b24:
	lea loc_000b2c(pc),a4
	bra.w loc_000d5e

loc_000b2c:
	lea loc_000b34(pc),a4
	bra.w loc_000d8e

loc_000b34:
	lea loc_000b3c(pc),a4
	bra.w loc_000da2

loc_000b3c:
	lea loc_000b44(pc),a4
	bra.w loc_000dd6

loc_000b44:
	lea loc_000b4c(pc),a4
	bra.w QSRam_FF_Fill

loc_000b4c:
	lea loc_000b54(pc),a4
	bra.w loc_000db6

loc_000b54:
	WATCHDOG
	moveq #0,d0
	lea $ff8000,a5
	move.w #$9000,cps0_gpuregistera
	move.w #$9000,cps0_gpuregisterb
	move.w #$9040,cps1_gpuregister
	move.w #$9080,cps2_gpuregister
	move.w #$90e0,raster_gpuregister
	move.w #Mainpalette,palette_gpuregister
	move.w d0,$804110
	move.w d0,$804112
	move.w d0,$804114
	move.w d0,$804116
	move.w d0,$804120
	move.w #$f,$804122
	move.w #$1b02,$804166
	move.w #$3f,$804170

;Set Sprite Data
	move.w #$7000,$fffff0
	move.w #$807d,$fffff2
	move.w #$2461,$fffff4
	move.w #$40,$fffff8
	move.w #$10,$fffffa

;Set Main Pointers
	move.w #$9000,(gfxram8x8,a5)
	move.w #$9040,(gfxram16x16,a5)
	move.w #$9080,(gfxram32x32,a5)
	move.w #$90e0,(rasterram,a5)
	move.w #Mainpalette,(palrampointer,a5)

;Clear
	move.w d0,($22,a5)
	move.w d0,($24,a5)
	move.w d0,($26,a5)
	move.w d0,($28,a5)
	move.w d0,($2a,a5)
	move.w d0,($2c,a5)
	move.w d0,($2e,a5)
	move.w #$f,($30,a5)
	move.w #$1b02,($32,a5)
	move.w #$3f,($34,a5)
	move.w #$7000,($36,a5)
	move.w #-$7f83,($38,a5)
	move.w #$2461,($3a,a5)
	move.w #$40,($3c,a5)
	move.w #$10,($3e,a5)
	move.w #$f08,$804040
	move.w #$f00,($6a,a5)
	move.b #$8,($88,a5)
	move.b #0,($d1,a5)

;Set Secondary
	move.w #$9000,($40,a5)
	move.w #$9040,($42,a5)
	move.w #$9080,($44,a5)
	move.w #$90e0,($46,a5)
	move.w #Mainpalette,($48,a5)
	move.w d0,($4a,a5)
	move.w d0,($4c,a5)
	move.w d0,($4e,a5)
	move.w d0,($50,a5)
	move.w d0,($52,a5)
	move.w d0,($54,a5)
	WATCHDOG
	jmp loc_000f7a

;----------------------------------------------
loc_000cb6:
	movea.l a0,a3
	move.w #1,d1
	moveq #0,d3

loc_000cbe:
	move.l loc_000d1c(pc,d3.w),d0
	lea (a3),a0

loc_000cc4:
	WATCHDOG
	move.l (a0),d2
	move.l d0,(a0)
	cmp.l (a0),d0
	bne.b loc_000d0c
	move.l d2,(a0)+
	cmpa.l a1,a0
	bls.b loc_000cc4
	addq.w #4,d3
	dbra d1,loc_000cbe
	jmp (a6)

;==============================================
loc_000ce0:
	movea.l a0,a3

loc_000ce2:
	move.w #1,d1
	moveq #0,d3

loc_000ce8:
	move.w loc_000d24(pc,d3.w),d0
	lea (a3),a0

loc_000cee:
	WATCHDOG
	move.w d0,(a0)
	cmp.b (1,a0),d0
	bne.b loc_000d0c
	lea (2,a0),a0
	cmpa.l a1,a0
	bls.b loc_000cee
	addq.w #2,d3
	dbra d1,loc_000ce8
	jmp (a6)

;==============================================
loc_000d0c:
	lea loc_000d14(pc),a5
	bra.w loc_000d28

loc_000d14:
	WATCHDOG
	bra.b loc_000d14

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV/\/\/\
loc_000d1c:
	dc.l $00000000,$ffffffff

loc_000d24:
	dc.w $0000,$5555

;==============================================
loc_000d28:
	lea (a2),a0
	moveq #0,d0
	move.b (a0)+,d0
	lsl.w #7,d0
	add.b (a0)+,d0
	movea.l #$900000,a1
	lea (a1,d0.w),a1
	moveq #0,d1
	move.b (a0)+,d1

loc_000d40:
	moveq #0,d0
	move.b (a0)+,d0
	beq.b loc_000d5c
	WATCHDOG
	addi.w #0,d0
	move.w d0,(a1)
	move.w d1,(2,a1)
	lea ($80,a1),a1
	bra.b loc_000d40

loc_000d5c:
	jmp (a5)

;==============================================
loc_000d5e:
	lea $ff0000,a0
	move.w #$1ffd,d4
	moveq #0,d0

loc_000d6a:
	WATCHDOG
	move.l d0,(a0)+
	move.l d0,(a0)+
	dbra d4,loc_000d6a
	jmp (a4)

;==============================================
loc_000d7a:
	lea $900000,a0
	lea $903fff,a1
	move.w #$20,d0
	moveq #0,d1
	bra.b loc_000dc6

loc_000d8e:
	lea $904000,a0
	lea $907fff,a1
	move.w #$6c20,d0
	moveq #0,d1
	bra.b loc_000dc6

loc_000da2:
	lea $908000,a0
	lea $90bfff,a1
	move.w #$b00,d0
	moveq #0,d1
	bra.b loc_000dc6

loc_000db6:
	lea $910000,a0
	lea $92ffff,a1
	moveq #0,d0
	moveq #0,d1

loc_000dc6:
	WATCHDOG
	move.w d0,(a0)+
	move.w d1,(a0)+
	cmpa.l a1,a0
	bls.b loc_000dc6
	jmp (a4)

;==============================================
loc_000dd6:
	moveq #0,d0
	move.w #0,OBJram_Bank0
	lea ObjectRam,a0
	move.w #$7ff,d7

loc_000dea:
	WATCHDOG
	move.l d0,(a0)+
	dbra d7,loc_000dea
	move.w #1,OBJram_Bank0
	lea ObjectRam,a0
	move.w #$7ff,d7

loc_000e08:
	WATCHDOG
	move.l d0,(a0)+
	dbra d7,loc_000e08
	jmp (a4)

;==============================================
QSRam_FF_Fill:
	lea Soundram,a0
	lea Sound_Test_end,a1
	moveq #-1,d0

QSRam_FF_Fill_Repeat:
	WATCHDOG
	move.w d0,(a0)+
	cmpa.l a1,a0
	bls.b QSRam_FF_Fill_Repeat
	jmp (a4)

;==============================================
loc_000e32:
	movea.l #loc_33c4b4,a0
	lea $90c400,a1
	lea loc_000e46(pc),a2
	bra.w loc_000e98

loc_000e46:
	movea.l #loc_340994,a0
	lea $90c800,a1
	lea loc_000e5a(pc),a2
	bra.w loc_000e98

loc_000e5a:
	movea.l #loc_3477f4,a0
	lea $90cc00,a1
	lea loc_000e6e(pc),a2
	bra.w loc_000e98

loc_000e6e:
	movea.l #loc_33bc74,a0
	lea $90d000,a1
	lea loc_000e82(pc),a2
	bra.w loc_000e98

loc_000e82:
	movea.l #loc_33bc74,a0
	lea $90d400,a1
	lea loc_000e96(pc),a2
	bra.w loc_000e98

loc_000e96:
	jmp (a4)

;==============================================
loc_000e98:
	moveq #$1f,d7
	move.l #$f000f000,d0

loc_000ea0:
	WATCHDOG
	move.l (a0)+,(a1)
	or.l d0,(a1)+
	move.l (a0)+,(a1)
	or.l d0,(a1)+
	move.l (a0)+,(a1)
	or.l d0,(a1)+
	move.l (a0)+,(a1)
	or.l d0,(a1)+
	move.l (a0)+,(a1)
	or.l d0,(a1)+
	move.l (a0)+,(a1)
	or.l d0,(a1)+
	move.l (a0)+,(a1)
	or.l d0,(a1)+
	move.l (a0)+,(a1)
	or.l d0,(a1)+
	dbra d7,loc_000ea0
	jmp (a2)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
Mes_workram:
	dc.b $11,$30,$00
	dc.b 'WORK',$00

Mes_workram_ng:
	dc.b $1a,$30,$00
	dc.b 'RAM NG',$00

Mes_workram_ok:
	dc.b $1a,$30,$00
	dc.b 'RAM OK',$00

Mes_cps0ram:
	dc.b $11,$38,$00
	dc.b 'CPS0',$00

Mes_cps0ram_ng:
	dc.b $1a,$38,$00
	dc.b 'RAM NG',$00

Mes_cps0ram_ok:
	dc.b $1a,$38,$00
	dc.b 'RAM OK',$00

Mes_cps1ram:
	dc.b $11,$40,$00
	dc.b 'CPS1',$00

Mes_cps1ram_ng:
	dc.b $1a,$40,$00
	dc.b 'RAM NG',$00

Mes_cps1ram_ok:
	dc.b $1a,$40,$00
	dc.b 'RAM OK',$00

Mes_cps2ram:
	dc.b $11,$48,$00
	dc.b 'CPS2',$00

Mes_cps2ram_ng:
	dc.b $1a,$48,$00
	dc.b 'RAM NG',$00

Mes_cps2ram_ok:
	dc.b $1a,$48,$00
	dc.b 'RAM OK',$00

Mes_objram:
	dc.b $11,$50,$00
	dc.b 'OBJECT',$00

Mes_objram_ng:
	dc.b $1a,$50,$00
	dc.b 'RAM NG',$00

Mes_objram_ok:
	dc.b $1a,$50,$00
	dc.b 'RAM OK',$00

Mes_QSRam:
	dc.b $11,$58,$00
	dc.b 'Q SOUND',$00

Mes_QSRam_NG:
	dc.b $1a,$58,$00
	dc.b 'RAM NG',$00

Mes_QSRam_OK:
	dc.b $1a,$58,$00
	dc.b 'RAM OK',$00
	even


;==============================================
loc_000f7a:
	lea $ff8000,a7
	lea $ff8000,a5
	moveq #0,d0
	move.w d0,($22,a5)
	move.w d0,($24,a5)
	move.w d0,($26,a5)
	move.w d0,($28,a5)
	move.w d0,($2a,a5)
	move.w d0,($2c,a5)
	jsr loc_00319e
	WATCHDOG
	jsr loc_01f792
	WATCHDOG
	jsr loc_0031ba
	moveq #0,d0
	move.b d0,($95,a5)
	move.b d0,($94,a5)
	move.w d0,OBJram_Bank0
	move.b #1,($e4,a5)
	move.w $804030,d1
	andi.w #-$1000,d1
	cmpi.w #-$4000,d1
	beq.b loc_000fee
	cmpi.w #-$3000,d1
	beq.b loc_000fee
	clr.b ($e4,a5)
 
loc_000fee:
	lea (-$7b1a,a5),a0
	lea (-$7da4,a5),a6
	move.w #$f,d7

loc_000ffa:
	WATCHDOG
	move.l a0,($c,a6)
	lea ($80,a0),a0
	lea ($20,a6),a6
	dbra d7,loc_000ffa
	WATCHDOG
	jsr loc_025a60
	move.w #$a,(Region,a5)
	move.b #0,($89,a5)
	move.w (Region,a5),d0
	lsr.w #1,d0
	move.b #$6e,d1
	btst d0,d1
	beq.b loc_00103c
	move.b #1,($89,a5)

loc_00103c:
	WATCHDOG
	move.b #-$78,$619ffb
	move.b #0,$619ffd
	move.b #-1,$619fff
	WATCHDOG
	clr.b ($86,a5)

;Network Link Check
	move.w QsoundVolume,d0
	andi.w #$4000,d0
	bne.b loc_00107a
	st ($86,a5)
	jsr Loc_Test_Network

loc_00107a:
	move.w CPSinput02,d0
	andi.w #$3304,d0
	bne.b loc_0010b0
	tst.b ($86,a5)
	beq.b loc_001092
	jsr loc_002e12

loc_001092:
	jsr loc_001d22
	bset #2,($64,a5)
	bset #2,($65,a5)
	bset #2,($66,a5)
	bset #2,($67,a5)

loc_0010b0
	WATCHDOG
	moveq #0,d0
	move.l d0,($1f6,a5)
	move.w d0,($1fa,a5)
	move.b d0,($1fc,a5)
	move.b d0,(-$7398,a5)
	move.b d0,(-$7397,a5)
	move.b d0,(-$7396,a5)
	move.b d0,(-$7395,a5)
	jsr loc_00188a
	clr.b ($e5,a5)
	clr.b ($a6,a5)
	clr.b ($bf,a5)
	WATCHDOG
	moveq #0,d1
	moveq #0,d2
	move.w #0,d0
	movea.l #loc_003eba,a0
	jsr loc_001302(pc)
	nop
	move.w #$1e0,d0
	movea.l #loc_016c12,a0
	jsr loc_001302(pc)
	nop

loc_001110:
	clr.b (-$7b9c,a5)
	lea (-$7da4,a5),a0
	move.w #$f,d0
 
loc_00111c:
	move #$2600,sr
	tst.b (-$7b9c,a5)
	bne.b loc_001110
	move.b (a0),d1
	cmpi.b #4,d1
	bcc.b loc_001142

loc_00112e:
	move #$2000,sr
	lea ($20,a0),a0
	dbra d0,loc_00111c
	jsr loc_001414
	bra.b loc_001110

loc_001142:
	pea loc_00112e(pc)
	move.w d0,-(a7)
	move.l a0,-(a7)
	move.l a7,(-$7ba4,a5)
	move.l a0,(-$7ba0,a5)
	ext.w d1
	movea.l loc_00115a-4(pc,d1.w),a1
	jmp (a1)

loc_00115a:
	dc.l loc_001170,loc_001174,loc_001184

;==============================================
loc_001166:
	movea.l (-$7ba4,a5),a7
	movea.l (a7)+,a0
	move.w (a7)+,d0
	rts

;==============================================
loc_001170:
	move.b #8,(a0)

loc_001174:
	move.l (4,a0),-(a7)
	move.w (2,a0),-(a7)
	movea.l (8,a0),a1
	move.l a1,usp
	rte

;==============================================
loc_001184:
	move.b #8,(a0)
	movea.l ($4,a0),a1
	movea.l ($c,a0),a4
	move.l a4,usp
	move #0,sr
	jmp (a1)

;==============================================
loc_001198:
	move.b ($94,a5),OBJram_Bank1
	movem.l d0-d7/a0-a6,-(a7)
	lea $ff8000,a5
	bsr.w loc_0012a4
	move.w ($40,a5),cps0_gpuregisterb
	move.w (gfxram8x8,a5),($40,a5)
	move.w ($42,a5),cps1_gpuregister
	move.w (gfxram16x16,a5),($42,a5)
	move.w ($44,a5),cps2_gpuregister
	move.w (gfxram32x32,a5),($44,a5)
	move.w ($46,a5),raster_gpuregister
	move.w (rasterram,a5),($46,a5)
	move.w ($36,a5),$fffff0
	move.w ($3a,a5),$fffff4
	move.w ($3c,a5),$fffff8
	move.w ($3e,a5),$fffffa
	jsr loc_00141c
	jsr loc_00306a
	bsr.w loc_00128c
	jsr loc_00140c
	jsr loc_0030c4
	jsr loc_001662
	jsr loc_0017f6
	bsr.w loc_0015dc
	jsr loc_002e40
	jsr loc_0015a2
	jsr loc_0015e4
	tst.b ($80,a5)
	bne.b loc_001250
	jsr loc_002c48

loc_001250:
	addq.b #1,($80,a5)
	st (-$7b9c,a5)
	clr.b ($84,a5)
	clr.b ($95,a5)
	lea (-$7da4,a5),a0
	move.w #$f,d0

loc_001268:
	cmpi.b #1,(a0)
	bne.b loc_001278
	subq.b #1,(1,a0)
	bne.b loc_001278
	move.b #4,(a0)

loc_001278:
	lea ($20,a0),a0
	dbra d0,loc_001268
	WATCHDOG
	movem.l (a7)+,d0-d7/a0-a6
	rte

;==============================================
loc_00128c:
	move.w ($34,a5),$804170
	move.w ($48,a5),palette_gpuregister
	move.w (palrampointer,a5),($48,a5)
	rts

;==============================================
loc_0012a4:
	tst.b ($a9,a5)
	beq.b loc_0012c6
	clr.b ($a9,a5)
	move.w #-$7000,(gfxram8x8,a5)
	move.w #-$6fc0,(gfxram16x16,a5)
	move.w #-$6f80,(gfxram32x32,a5)
	move.w #-$6f20,(rasterram,a5)

loc_0012c6:
	rts

;==============================================
loc_0012c8:
	move.l #$1234567,d1
	move.l d1,d2
	move.l d1,d3
	move.l d1,d4
	move.l d1,d5
	move.l d1,d6
	move.l d1,d7
	tst.b ($bf,a5)
	bne.b loc_001300
	move.w (INP_P1_repeat,a5),d0
	not.w d0
	and.w (INP_P1,a5),d0
	andi.w #$7708,d0
	cmpi.w #$7708,d0
	bne.b loc_001300
	btst #1,($60,a5)
	beq.b loc_001300
	divs.w #0,d0

loc_001300:
	rts

;==============================================
loc_001302:
	trap #0
	rts

;==============================================
loc_001306:
	lea (-$7da4,a5),a1
	tst.b (0,a1,d0.w)
	bne.b loc_001322
	move.w #$c00,(0,a1,d0.w)
	move.l a0,(4,a1,d0.w)
	move.w d1,($10,a1,d0.w)
	move.w d2,($12,a1,d0.w)

loc_001322:
	rte

;==============================================
loc_001324:
	trap #1

loc_001326:
	addq.l #6,a7
	movea.l (-$7ba0,a5),a0
	moveq #0,d0
	move.l d0,($10,a0)
	move.l d0,($14,a0)
	move.l d0,($18,a0)
	move.l d0,($1c,a0)
	move.b #0,(a0)
	bra.w loc_001166

;==============================================
loc_001346:
	trap #2
	rts

;==============================================
loc_00134a:
	lea (-$7da4,a5),a4
	tst.b (0,a4,d0.w)
	beq.w loc_00136e
	moveq #0,d1
	move.l d1,($10,a4,d0.w)
	move.l d1,($14,a4,d0.w)
	move.l d1,($18,a4,d0.w)
	move.l d1,($1c,a4,d0.w)
	move.b #0,(0,a4,d0.w)

loc_00136e:
	rte

;==============================================
loc_001370:
	movem.l d0-d7/a0-a6,-(a7)
	trap #3
	movem.l (a7)+,d0-d7/a0-a6
	rts

;==============================================
loc_00137c:
	movea.l (-$7ba0,a5),a0
	move.w #$100,d1
	tst.b d0
	bne.b loc_00138c
	move.w #$200,d1

loc_00138c:
	or.w d1,d0
	move.w d0,(a0)
	move.l usp,a1
	move.l a1,(8,a0)
	move.w (a7)+,(2,a0)
	move.l (a7)+,(4,a0)
	bra.w loc_001166

loc_0013a2:
	trap #4
	rts

;==============================================
loc_0013a6:
	movea.l (-$7ba0,a5),a0
	move.b #4,(a0)
	move.l usp,a1
	move.l a1,(8,a0)
	move.w (a7)+,(2,a0)
	move.l (a7)+,(4,a0)
	bra.w loc_001166
	movem.l d0-d7/a0-a6,-(a7)
	trap #5
	movem.l (a7)+,d0-d7/a0-a6
	rts

loc_0013cc:
	lea (-$7da4,a5),a4
	move.b #2,(0,a4,d0.w)
	clr.b ($1,a4,d0.w)
	rte

;==============================================
loc_0013dc:
	movem.l d0-d7/a0-a6,-(a7)
	trap #6
	movem.l (a7)+,d0-d7/a0-a6
	rts

;==============================================
loc_0013e8:
	lea (-$7da4,a5),a4
	move.b #4,(0,a4,d0.w)
	move.b d1,(1,a4,d0.w)
	rte

;==============================================
loc_0013f8:
	trap #7
	rts

;==============================================
loc_0013fc:
	tst.b d0
	bne.b loc_001406
	andi.w #$f8ff,(a7)
	rte

loc_001406
	ori.w #$700,(a7)
	rte

;==============================================
loc_00140c:
	move.w #$6f,d0
	moveq #$1f,d1
	bra.b loc_00141a

loc_001414:
	move.w #$20,d0
	moveq #0,d1

loc_00141a:
	rts


;==============================================
loc_00141c:
	WATCHDOG
	move.w #-$7f83,d1
	move.b ($96,a5),d0
	lsl.w #8,d0
	or.w ($30,a5),d0
	move.w d0,$804122
	bpl.b loc_00143c
	move.w #$808e,d1

loc_00143c:
	move.w d1,$fffff2
	move.w ($32,a5),$804166
	tst.b ($87,a5)
	bne.b loc_001466
	move.w ($6a,a5),d0
	andi.w #$7f33,d0
	or.b ($88,a5),d0
	or.b ($d1,a5),d0
	move.w d0,$804040

loc_001466:
	move.w $804030,($68,a5)
	move.l ($60,a5),d0
	lsr.l #8,d0
	move.l d0,($60,a5)
	move.l ($64,a5),d0
	lsr.l #8,d0
	move.l d0,($64,a5)
	move.b CPSinput02,d1
	not.b d1
	move.b d1,($60,a5)
	move.b $804021,d0
	not.b d0
	move.b d0,($64,a5)
	move.w (INP_P1,a5),(INP_P1_repeat,a5)
	move.w (INP_P2,a5),(INP_P2_repeat,a5)
	move.b $804011,d3
	not.b d3
	move.b d3,d4
	lsl.b #4,d3
	andi.b #$70,d3
	andi.b #$30,d4
	andi.b #$40,d1
	or.b d1,d4
	move.b $804001,d0
	not.b d0
	move.b d0,d1
	andi.b #$f,d0
	andi.b #$70,d1
	lsr.b #4,d1
	or.b d3,d1
	move.b d0,($59,a5)
	move.b d1,(INP_P1,a5)
	move.b CPSinput00,d0
	not.b d0
	move.b d0,d1
	andi.b #$f,d0
	andi.b #$70,d1
	lsr.b #4,d1
	or.b d4,d1
	move.b d0,($5d,a5)
	move.b d1,(INP_P2,a5)
	move.b ($1c4,a5),($1c5,a5)
	move.b CPSinput01,($1c4,a5)
	bsr.w loc_001516
	moveq #0,d0
	move.l d0,($1c0,a5)
	rts

loc_001516:
	moveq #$40,d1
	move.w ($4a,a5),$80410c
	move.w ($22,a5),d0
	sub.w d1,d0
	move.w d0,($4a,a5)
	move.w ($4e,a5),$804110
	move.w ($26,a5),d0
	subi.w #$100,d0
	move.w d0,($4e,a5)
	move.w ($52,a5),$804114
	move.w ($2a,a5),d0
	sub.w d1,d0
	move.w d0,($52,a5)
	move.w ($4c,a5),$80410e
	move.w #$100,d0
	sub.w ($24,a5),d0
	move.w d0,($4c,a5)
	move.w ($50,a5),$804112
	move.w #$300,d0
	sub.w ($28,a5),d0
	move.w d0,($50,a5)
	move.w ($54,a5),$804116
	move.w #$700,d0
	sub.w ($2c,a5),d0
	move.w d0,($54,a5)
	move.w ($56,a5),$804120
	move.w #$300,d0
	sub.w ($2e,a5),d0
	move.w d0,($56,a5)
	rts

;==============================================
loc_0015a2:
	btst #0,(Active_Player,a5)
	beq.b loc_0015ae
	addq.l #1,($534,a5)

loc_0015ae:
	btst #1,(Active_Player,a5)
	beq.b loc_0015ba
	addq.l #1,($934,a5)

loc_0015ba:
	addq.l #1,($b0,a5)
	addq.l #1,($1f6,a5)
	cmpi.l #$4f1a00,($1f6,a5)
	bcs.b loc_0015da
	moveq #0,d0
	move.l d0,($1f6,a5)
	move.w d0,($1fa,a5)
	move.b d0,($1fc,a5)

loc_0015da:
	rts

;==============================================
loc_0015dc:
	moveq #0,d0
	move.b d0,($85,a5)
	rts

;==============================================
loc_0015e4:
	tst.b (-$7398,a5)
	beq.b loc_0015f4
	jsr loc_001dc4
	subq.b #1,(-$7398,a5)

loc_0015f4:
	tst.b (-$7397,a5)
	beq.b loc_001604
	jsr loc_001df4
	subq.b #1,(-$7397,a5)

loc_001604
	tst.b (-$7396,a5)
	beq.b loc_001640
	tst.b ($bf,a5)
	bne.b loc_00163c
	cmpi.w #$1e,($1fa,a5)
	bcs.b loc_00163c
	cmpi.l #$d2f00,($1f6,a5) ;loc?
	bcs.b loc_00163c
	tst.b ($1fc,a5)
	bne.b loc_00163c
	st ($1fc,a5)
	cmpi.l #$9b,($ea,a5)
	bcc.b loc_00163c
	jsr loc_001e2a

loc_00163c:
	subq.b #1,(-$7396,a5)

loc_001640:
	tst.b (-$7395,a5)
	beq.b loc_001660
	tst.b ($bf,a5)
	bne.b loc_00165c
	move.b ($ef,a5),d0
	cmp.b (game_unlock,a5),d0
	bls.b loc_00165c
	jsr loc_001e4e

loc_00165c:
	subq.b #1,(-$7395,a5)

loc_001660:
	rts

;==============================================
loc_001662:
	tst.b ($82,a5)
	bne.b loc_0016b8
	bsr.w loc_0016ba
	bsr.w loc_001728
	bsr.w loc_00175a
	tst.b ($9c,a5)
	bne.b loc_0016b8
	cmpi.b #3,($6c,a5)
	bne.b loc_0016b8
	jsr loc_001d9a
	jsr loc_002aa2
	moveq #0,d1
	lea ($70,a5),a6
	move.b ($9e,a5),d1

loc_001698:
	move.b ($6,a6),d0
	addq.b #1,d0
	cmpi.b #9,d0
	bls.b loc_0016a8
	move.b #9,d0

loc_0016a8:
	move.b d0,(6,a6)
	lea (8,a6),a6
	dbra d1,loc_001698
	addq.b #1,(-$7399,a5)

loc_0016b8:
	rts

;==============================================
loc_0016ba:
	moveq #0,d0
	moveq #0,d1
	moveq #0,d2
	moveq #0,d3
	move.b ($63,a5),d0
	lsl.b #2,d0
	lsl.b #1,d0
	roxl.b #1,d2
	lsl.b #1,d0
	roxl.b #1,d1
	move.b ($67,a5),d0
	lsr.b #3,d0
	roxl.b #1,d3
	move.b ($62,a5),d0
	lsl.b #2,d0
	lsl.b #1,d0
	roxl.b #1,d2
	lsl.b #1,d0
	roxl.b #1,d1
	move.b ($66,a5),d0
	lsr.b #3,d0
	roxl.b #1,d3
	move.b ($61,a5),d0
	lsl.b #2,d0
	lsl.b #1,d0
	roxl.b #1,d2
	lsl.b #1,d0
	roxl.b #1,d1
	move.b ($65,a5),d0
	lsr.b #3,d0
	roxl.b #1,d3
	move.b ($60,a5),d0
	lsl.b #2,d0
	lsl.b #1,d0
	roxl.b #1,d2
	lsl.b #1,d0
	roxl.b #1,d1
	move.b ($64,a5),d0
	lsr.b #3,d0
	roxl.b #1,d3
	move.b d1,($75,a5)
	move.b d2,($7d,a5)
	move.b d3,($6c,a5)
	rts

;==============================================
loc_001728:
	move.b ($6f,a5),d0
	beq.b loc_001742
	subq.b #1,d0
	move.b d0,($6f,a5)
	cmpi.b #$20,d0
	bne.b loc_001758
	andi.b #$fe,($6b,a5)
	rts

loc_001742:
	tst.b ($6e,a5)
	beq.b loc_001758
	subq.b #1,($6e,a5)
	ori.b #1,($6b,a5)
	move.b #$40,($6f,a5)

loc_001758:
	rts

;==============================================
loc_00175a:
	lea ($70,a5),a6
	bsr.b loc_00176a
	tst.b ($9f,a5)
	beq.b loc_001790
	lea ($78,a5),a6

loc_00176a:
	move.b (a6),d1
	bne.b loc_001780
	cmpi.b #3,(5,a6)
	bne.b loc_001790
	addq.b #1,(a6)
	move.b #$32,(4,a6)
	rts

loc_001780:
	cmpi.b #$c,(5,a6)
	beq.b loc_001792
	subq.b #1,(4,a6)
	bne.b loc_001790
	clr.b (a6)

loc_001790:
	rts

;==============================================
loc_001792:
	clr.b (a6)
	jsr loc_001d70
	jsr loc_002a58
	tst.b ($9e,a5)
	bne.b loc_0017aa
	lea ($70,a5),a6

loc_0017aa:
	addq.b #1,($6e,a5)
	addq.b #1,(1,a6)
	tst.b ($9d,a5)
	bne.b loc_0017c8
	move.b (1,a6),d0
	cmp.b (2,a6),d0
	bge.b loc_0017c8
	addq.b #1,(-$739a,a5)
	rts

loc_0017c8:
	moveq #0,d0
	move.b (3,a6),d0
	move.b (6,a6),d1
	andi.b #$77,ccr
	abcd d0,d1
	bcs.b loc_0017de
	move.b d1,(6,a6)

loc_0017de:
	cmpi.b #9,(6,a6)
	bls.b loc_0017ec
	move.b #9,(6,a6)

loc_0017ec:
	clr.b (1,a6)
	addq.b #1,(-$7399,a5)
	rts

;==============================================
loc_0017f6:
	moveq #0,d0
	tst.b (-$739a,a5)
	beq.w loc_00180c
	moveq #1,d0
	subq.b #1,(-$739a,a5)
	jsr loc_003470

loc_00180c:
	tst.b (-$7399,a5)
	beq.b loc_00181e
	moveq #1,d0
	subq.b #1,(-$7399,a5)
	jmp loc_003490

loc_00181e:
	rts

;==============================================
loc_001820:
	move.b ($6b,a5),d0

loc_001824:
	andi.b #$cf,d0
	move.b d0,($6b,a5)
	rts

;==============================================
loc_00182e:
	move.b ($6b,a5),d0
	tst.b ($9c,a5)
	bne.b loc_001824
	bsr.b loc_001842
	bsr.b loc_00185c
	move.b d0,($6b,a5)
	rts

loc_001842:
	move.b ($76,a5),d2
	add.b ($73,a5),d2
	cmpi.b #9,d2
	bhi.b loc_001856
	ori.b #$10,d0
	rts

loc_001856:
	andi.b #$ef,d0
	rts

loc_00185c:
	tst.b ($9f,a5)
	beq.b loc_001884
	move.b ($76,a5),d2
	add.b ($73,a5),d2
	tst.b ($9e,a5)
	beq.b loc_001878
	move.b ($7e,a5),d2
	add.b ($7b,a5),d2

loc_001878:
	cmpi.b #9,d2
	bhi.b loc_001884
	ori.b #$20,d0
	rts

loc_001884:
	andi.b #$df,d0
	rts

;==============================================
loc_00188a:
	WATCHDOG
	move.w #$3f,(-$7290,a5)
	move.w #0,(-$728c,a5)
	bsr.w loc_002110
	bne.b loc_0018c0
	bsr.w loc_00234c
	lea ($20,a0),a0
	lea (-$7374,a5),a1
	moveq #3,d7

loc_0018b0:
	move.l (a0)+,d0
	cmp.l (a1)+,d0
	bne.b loc_0018c0
	dbra d7,loc_0018b0
	bsr.w loc_001e7c
	bra.b loc_0018d8

loc_0018c0:
	bsr.w loc_0020b2
	move.w #$3e,(-$7290,a5)
	move.w #0,(-$728c,a5)
	bsr.w loc_0021b2
	bne.w loc_0020da

loc_0018d8:
	WATCHDOG
	moveq #0,d0
	move.b d0,(Dip_Continue,a5)
	move.b d0,($9c,a5)
	move.b d0,($9d,a5)
	lea (-$7394,a5),a4;Epprom
	move.b (a4),d0
	move.b d0,(Dip_Coin_Mode,a5)
	cmpi.b #$12,d0
	beq.b loc_001908
	cmpi.b #$11,d0
	beq.b loc_00191a
	bsr.w loc_0024b8
	bra.b loc_001930

loc_001908:
	move.w #$101,d0
	move.b d0,($9c,a5)
	move.w d0,($72,a5)
	move.w d0,($7a,a5)
	bra.b loc_001930

loc_00191a:
	move.w #$101,d0
	move.b d0,(Dip_Continue,a5)
	move.b d0,($9d,a5)
	move.w d0,($72,a5)
	move.w d0,($7a,a5)
	bra.b loc_001936

loc_001930:
	move.b (1,a4),(Dip_Continue,a5)

loc_001936:
	move.b (2,a4),($96,a5)
	move.b (3,a4),(Dip_Demo_Sound,a5)
	move.b (4,a4),(Dip_Sound_Mode,a5)
	moveq #0,d0
	move.b (5,a4),d0
	move.b d0,(Dip_Chutes,a5)
	bsr.w loc_0024f0
	move.b (6,a4),($bb,a5)
	move.b (7,a4),($bc,a5)
	clr.b ($92,a5)
	move.b (8,a4),($93,a5)
	move.b (9,a4),($ce,a5)
	moveq #0,d0
	moveq #0,d1
	move.b ($a,a4),d0
	move.b ($b,a4),d1
	move.b d0,($d2,a5)
	move.b d1,($d3,a5)
	bsr.w loc_002508
	move.b ($10,a4),(Dip_Difficulty,a5)
	move.b ($11,a4),(Dip_Damage,a5)
	move.b ($12,a4),(Dip_Timer_Speed,a5)
	move.b ($13,a4),(Dip_Game_Turbo,a5)
	move.b ($14,a4),(Dip_1PRounds,a5)
	move.b ($15,a4),(Dip_2PRounds,a5)
	move.b ($16,a4),(Dip_EventMode,a5)
	beq.b loc_0019ba
	clr.b (Dip_Continue,a5)

loc_0019ba:
	move.b ($17,a4),(Dip_Join_in,a5)
	move.l ($60,a4),($c0,a5)
	move.l ($64,a4),($c4,a5)
	move.l ($68,a4),($c8,a5)
	move.l ($6c,a4),($d8,a5)
	move.l ($70,a4),($ea,a5)
	move.b ($75,a4),(game_unlock,a5);Load Unlock Level
	bra.w loc_00252a

;==============================================
;Save Epprom Data
loc_0019e8:
	WATCHDOG
	bsr.w loc_00234c
	movem.l ($20,a0),d0-d3
	moveq #0,d4
	lea (-$7394,a5),a4
	move.b (Dip_Coin_Mode,a5),(a4)
	move.b (Dip_Continue,a5),($1,a4)
	move.b ($96,a5),($2,a4)
	move.b (Dip_Demo_Sound,a5),($3,a4)
	move.b (Dip_Sound_Mode,a5),($4,a4)
	move.b (Dip_Chutes,a5),($5,a4)
	move.b ($bb,a5),($6,a4)
	move.b ($bc,a5),($7,a4)
	move.b ($93,a5),($8,a4)
	move.b ($ce,a5),($9,a4)
	move.b ($d2,a5),($a,a4)
	move.b ($d3,a5),($b,a4)
	move.b (Dip_Difficulty,a5),($10,a4)
	move.b (Dip_Damage,a5),($11,a4)
	move.b (Dip_Timer_Speed,a5),($12,a4)
	move.b (Dip_Game_Turbo,a5),($13,a4)
	move.b (Dip_1PRounds,a5),($14,a4)
	move.b (Dip_2PRounds,a5),($15,a4)
	move.b (Dip_EventMode,a5),($16,a4)
	move.b (Dip_Join_in,a5),($17,a4)
	movem.l d0-d3,($20,a4)
	lea ($30,a4),a4
	move.b (Dip_Coin_Mode,a5),(a4)
	move.b (Dip_Continue,a5),($1,a4)
	move.b ($96,a5),($2,a4)
	move.b (Dip_Demo_Sound,a5),($3,a4)
	move.b (Dip_Sound_Mode,a5),($4,a4)
	move.b (Dip_Chutes,a5),($5,a4)
	move.b ($bb,a5),($6,a4)
	move.b ($bc,a5),($7,a4)
	move.b ($93,a5),($8,a4)
	move.b ($ce,a5),($9,a4)
	move.b ($d2,a5),($a,a4)
	move.b ($d3,a5),($b,a4)
	move.b (Dip_Difficulty,a5),($10,a4)
	move.b (Dip_Damage,a5),($11,a4)
	move.b (Dip_Timer_Speed,a5),($12,a4)
	move.b (Dip_Game_Turbo,a5),($13,a4)
	move.b (Dip_1PRounds,a5),($14,a4)
	move.b (Dip_2PRounds,a5),($15,a4)
	move.b (Dip_EventMode,a5),($16,a4)
	move.b (Dip_Join_in,a5),($17,a4)
	movem.l d0-d3,($20,a4)
	move.w #$2f,(-$7290,a5)
	move.w #0,(-$728c,a5)
	bsr.w loc_0021b2
	bne.w loc_0020da
	bra.w loc_0018d8

loc_001b12:
	bsr.w loc_00234c
	move.b (a0),(Dip_Coin_Mode,a5)
	move.b (1,a0),(Dip_Continue,a5)
	move.b (2,a0),($96,a5)
	move.b (3,a0),(Dip_Demo_Sound,a5)
	move.b (4,a0),(Dip_Sound_Mode,a5)
	move.b (5,a0),(Dip_Chutes,a5)
	move.b (6,a0),($bb,a5)
	move.b (7,a0),($bc,a5)
	move.b (8,a0),($93,a5)
	move.b (9,a0),($ce,a5)
	move.b ($a,a0),($d2,a5)
	move.b ($b,a0),($d3,a5)
	move.b ($10,a0),(Dip_Difficulty,a5)
	move.b ($11,a0),(Dip_Damage,a5)
	move.b ($12,a0),(Dip_Timer_Speed,a5)
	move.b ($13,a0),(Dip_Game_Turbo,a5)
	move.b ($14,a0),(Dip_1PRounds,a5)
	move.b ($15,a0),(Dip_2PRounds,a5)
	move.b ($16,a0),(Dip_EventMode,a5)
	move.b ($17,a0),(Dip_Join_in,a5)
	rts

;==============================================
loc_001b8e:
	bsr.w loc_00234c
	lea (-$7394,a5),a1
	moveq #$2f,d7

loc_001b98:
	WATCHDOG
	move.b (a0)+,d0
	cmp.b (a1)+,d0
	bne.b loc_001bc0
	dbra d7,loc_001b98
	bsr.w loc_00234c
	moveq #$2f,d7

loc_001bae:
	WATCHDOG
	move.b (a0)+,d0
	cmp.b (a1)+,d0
	bne.b loc_001bc0
	dbra d7,loc_001bae
	moveq #0,d0

loc_001bc0:
	rts

;==============================================
loc_001bc2:
	bsr.w loc_00234c
	move.b (a0),d0
	cmp.b (Dip_Coin_Mode,a5),d0
	bne.w loc_001ca2

	move.b (1,a0),d0
	cmp.b (Dip_Continue,a5),d0
	bne.w loc_001ca2

	move.b (2,a0),d0
	cmp.b ($96,a5),d0
	bne.w loc_001ca2

	move.b (3,a0),d0
	cmp.b (Dip_Demo_Sound,a5),d0
	bne.w loc_001ca2

	move.b (4,a0),d0
	cmp.b (Dip_Sound_Mode,a5),d0
	bne.w loc_001ca2

	move.b (5,a0),d0
	cmp.b (Dip_Chutes,a5),d0
	bne.w loc_001ca2

	move.b (6,a0),d0
	cmp.b ($bb,a5),d0
	bne.w loc_001ca2

	move.b (7,a0),d0
	cmp.b ($bc,a5),d0
	bne.w loc_001ca2

	move.b (8,a0),d0
	cmp.b ($93,a5),d0
	bne.w loc_001ca2

	move.b (9,a0),d0
	cmp.b ($ce,a5),d0
	bne.w loc_001ca2

	move.b ($a,a0),d0
	cmp.b ($d2,a5),d0
	bne.b loc_001ca2

	move.b ($b,a0),d0
	cmp.b ($d3,a5),d0
	bne.b loc_001ca2

	move.b ($10,a0),d0
	cmp.b (Dip_Difficulty,a5),d0
	bne.b loc_001ca2

	move.b ($11,a0),d0
	cmp.b (Dip_Damage,a5),d0
	bne.b loc_001ca2

	move.b ($12,a0),d0
	cmp.b (Dip_Timer_Speed,a5),d0
	bne.b loc_001ca2

	move.b ($13,a0),d0
	cmp.b (Dip_Game_Turbo,a5),d0
	bne.b loc_001ca2

	move.b ($14,a0),d0
	cmp.b (Dip_1PRounds,a5),d0
	bne.b loc_001ca2

	move.b ($15,a0),d0
	cmp.b (Dip_2PRounds,a5),d0
	bne.b loc_001ca2

	move.b ($16,a0),d0
	cmp.b (Dip_EventMode,a5),d0
	bne.b loc_001ca2

	move.b ($17,a0),d0
	cmp.b (Dip_Join_in,a5),d0
	bne.b loc_001ca2
	moveq #0,d0

loc_001ca2:
	rts

;==============================================
loc_001ca4:
	move.w #$3f,(-$7290,a5)
	move.w #0,(-$728c,a5)
	bsr.w loc_002110
	moveq #-1,d6
	bsr.b loc_001ce8
	bne.b loc_001ce6
	move.w #-$5556,d6
	bsr.b loc_001ce8
	bne.b loc_001ce6
	move.w #$5555,d6
	bsr.b loc_001ce8
	bne.b loc_001ce6
	moveq #0,d6
	bsr.b loc_001ce8
	bne.b loc_001ce6
	bsr.w loc_001e7c
	move.w #$3f,(-$7290,a5)
	move.w #0,(-$728c,a5)
	bsr.w loc_0021b2
	moveq #0,d0

loc_001ce6:
	rts

loc_001ce8:
	lea (-$7314,a5),a1
	moveq #$3f,d7

loc_001cee:
	move.w d6,(a1)+
	dbra d7,loc_001cee
	move.l #$ff0cec,(-$7294,a5)
	move.w #$3f,(-$728e,a5)
	move.w #0,(-$728a,a5)
	bsr.w loc_002216
	bsr.w loc_00214e
	lea (-$7314,a5),a1
	moveq #$3f,d7

loc_001d16:
	cmp.w (a1)+,d6
	bne.b loc_001d20
	dbra d7,loc_001d16
	moveq #0,d0

loc_001d20:
	rts

;==============================================
loc_001d22:
	moveq #0,d0
	move.l d0,($c0,a5)
	move.l d0,($c4,a5)
	move.l d0,($c8,a5)
	move.l d0,($d8,a5)
	move.l d0,($ea,a5)
	move.b d0,(game_unlock,a5)
	move.l d0,(-$7334,a5)
	move.l d0,(-$7330,a5)
	move.l d0,(-$732c,a5)
	move.l d0,(-$7328,a5)
	move.l d0,(-$7324,a5)
	move.w d0,(-$7320,a5)
	move.w d0,(-$731e,a5)
	move.l d0,(-$731c,a5)
	move.l d0,(-$7318,a5)
	move.w #$f,(-$7290,a5)
	move.w #$60,(-$728c,a5)
	bra.w loc_0021b2

;==============================================
loc_001d70:
	addq.l #1,($c0,a5)
	tst.b ($86,a5)
	bne.b loc_001d98
	move.l ($c0,a5),d0
	cmp.l (-$7334,a5),d0
	beq.b loc_001d98
	move.l d0,(-$7334,a5)
	move.w #1,(-$7290,a5)
	move.w #$60,(-$728c,a5)
	bra.w loc_0021b2

loc_001d98:
	rts

;==============================================
loc_001d9a:
	addq.l #1,($c4,a5)
	tst.b ($86,a5)
	bne.b loc_001dc2
	move.l ($c4,a5),d0
	cmp.l (-$7330,a5),d0
	beq.b loc_001dc2
	move.l d0,(-$7330,a5)
	move.w #1,(-$7290,a5)
	move.w #$64,(-$728c,a5)
	bra.w loc_0021b2

loc_001dc2:
	rts

;==============================================
loc_001dc4:
	tst.b ($9c,a5)
	beq.b loc_001df2
	addq.l #1,($c8,a5)
	tst.b ($86,a5)
	bne.b loc_001df2
	move.l ($c8,a5),d0
	cmp.l (-$732c,a5),d0
	beq.b loc_001df2
	move.l d0,(-$732c,a5)
	move.w #1,(-$7290,a5)
	move.w #$68,(-$728c,a5)
	bra.w loc_0021b2

loc_001df2:
	rts

;==============================================
loc_001df4:
	addq.l #1,($d8,a5)
	bra.b loc_001dfe

loc_001dfa:
	clr.l ($d8,a5)

loc_001dfe:
	tst.b ($86,a5)
	bne.b loc_001e22
	move.l ($d8,a5),d0
	cmp.l (-$7328,a5),d0
	beq.b loc_001e22
	move.l d0,(-$7328,a5)
	move.w #1,(-$7290,a5)
	move.w #$6c,(-$728c,a5)
	bra.w loc_0021b2

loc_001e22:
	rts

;==============================================
loc_001e24:
	bsr.b loc_001e2e
	bra.w loc_00252a

loc_001e2a:
	addq.l #1,($ea,a5)

loc_001e2e:
	move.l ($ea,a5),d0

loc_001e32
	cmp.l (-$7324,a5),d0
	beq.b loc_001e4c
	move.l d0,(-$7324,a5)
	move.w #1,(-$7290,a5)
	move.w #$70,(-$728c,a5)
	bra.w loc_0021b2

loc_001e4c:
	rts

;==============================================
loc_001e4e:
	move.b ($ef,a5),(game_unlock,a5)
	bsr.b loc_001e5a
	bra.w loc_002566

loc_001e5a:
	moveq #0,d0
	move.b (game_unlock,a5),d0
	cmp.w (-$7320,a5),d0
	beq.b loc_001e7a
	move.w d0,(-$7320,a5)
	move.w #0,(-$7290,a5)
	move.w #$74,(-$728c,a5)
	bra.w loc_0021b2

loc_001e7a:
	rts

;==============================================
loc_001e7c:
	bsr.w loc_00234c
	lea (-$7394,a5),a1
	lea ($30,a1),a2
	moveq #1,d0
	cmpi.w #4,(Region,a5)
	beq.b loc_001e9e
	moveq #2,d0
	cmpi.w #$c,(Region,a5)
	beq.b loc_001e9e
	moveq #$12,d0

loc_001e9e:
	cmp.b (a1),d0
	bcc.b loc_001ebe
	cmpi.w #4,(Region,a5)
	beq.b loc_001eb2
	cmpi.w #$c,(Region,a5)
	bne.b loc_001eb8

loc_001eb2:
	cmpi.b #$9,(a1)
	beq.b loc_001ebe

loc_001eb8:
	move.b (a0),d0
	move.b d0,(a1)
	move.b d0,(a2)

loc_001ebe:
	move.b ($2,a1),d0
	andi.b #$7f,d0
	beq.b loc_001ed4
	move.b (2,a0),d0
	move.b d0,(2,a1)
	move.b d0,(2,a2)

loc_001ed4:
	cmpi.b #1,(3,a1)
	bls.b loc_001ee8
	move.b (3,a0),d0
	move.b d0,(3,a1)
	move.b d0,(3,a2)

loc_001ee8:
	cmpi.b #1,(4,a1)
	bls.b loc_001efc
	move.b (4,a0),d0
	move.b d0,(4,a1)
	move.b d0,(4,a2)

loc_001efc:
	cmpi.b #2,(5,a1)
	bls.b loc_001f10
	move.b (5,a0),d0
	move.b d0,(5,a1)
	move.b d0,(5,a2)

loc_001f10:
	cmpi.b #1,(6,a1)
	bls.b loc_001f24
	move.b (6,a0),d0
	move.b d0,(6,a1)
	move.b d0,(6,a2)

loc_001f24:
	moveq #0,d0
	cmpi.w #8,(Region,a5)
	bne.b loc_001f30
	moveq #1,d0

loc_001f30:
	cmp.b (7,a1),d0
	bcc.b loc_001f42
	move.b (7,a0),d0
	move.b d0,(7,a1)
	move.b d0,(7,a2)

loc_001f42:
	move.b (8,a1),d0
	cmpi.w #$a,(Region,a5)
	beq.b loc_001f56
	cmp.b (8,a0),d0
	beq.b loc_001f6a
	bra.b loc_001f5e

loc_001f56:
	subq.b #2,d0
	cmpi.b #4,d0
	bls.b loc_001f6a

loc_001f5e:
	move.b (8,a0),d0
	move.b d0,(8,a1)
	move.b d0,(8,a2)

loc_001f6a:
	moveq #1,d0
	cmpi.w #4,(Region,a5)
	beq.b loc_001f7e
	cmpi.w #$c,(Region,a5)
	beq.b loc_001f7e
	moveq #0,d0

loc_001f7e:
	cmp.b (9,a1),d0
	bcc.b loc_001f90
	move.b (9,a0),d0
	move.b d0,(9,a1)
	move.b d0,(9,a2)

loc_001f90:
	moveq #6,d0
	cmpi.w #4,(Region,a5)
	beq.b loc_001fa4
	cmpi.w #$c,(Region,a5)
	beq.b loc_001fa4
	moveq #0,d0

loc_001fa4:
	cmp.b ($a,a1),d0
	bcc.b loc_001fb6
	move.b ($a,a0),d0
	move.b d0,($a,a1)
	move.b d0,($a,a2)

loc_001fb6:
	moveq #$12,d0
	cmpi.w #4,(Region,a5)
	beq.b loc_001fca
	cmpi.w #$c,(Region,a5)
	beq.b loc_001fca
	moveq #0,d0

loc_001fca:
	cmp.b ($b,a1),d0
	bcc.b loc_001fdc
	move.b ($b,a0),d0
	move.b d0,($b,a1)
	move.b d0,($b,a2)

loc_001fdc:
	cmpi.b #7,($10,a1)
	bls.b loc_001ff0
	move.b ($10,a0),d0
	move.b d0,($10,a1)
	move.b d0,($10,a2)

loc_001ff0:
	cmpi.b #3,($11,a1)
	bls.b loc_002004
	move.b ($11,a0),d0
	move.b d0,($11,a1)
	move.b d0,($11,a2)

loc_002004:
	cmpi.b #3,($12,a1)
	bls.b loc_002018
	move.b ($12,a0),d0
	move.b d0,($12,a1)
	move.b d0,($12,a2)

loc_002018:
	cmpi.b #4,($13,a1)
	bls.b loc_00202c
	move.b ($13,a0),d0
	move.b d0,($13,a1)
	move.b d0,($13,a2)

loc_00202c:
	cmpi.b #2,($14,a1)
	bls.b loc_002040
	move.b ($14,a0),d0
	move.b d0,($14,a1)
	move.b d0,($14,a2)

loc_002040:
	cmpi.b #2,($15,a1)
	bls.b loc_002054
	move.b ($15,a0),d0
	move.b d0,($15,a1)
	move.b d0,($15,a2)

loc_002054:
	cmpi.b #1,($16,a1)
	bls.b loc_002068
	move.b ($16,a0),d0
	move.b d0,($16,a1)
	move.b d0,($16,a2)

loc_002068:
	moveq #0,d0
	tst.b ($16,a1)
	bne.b loc_002082
	moveq #1,d0
	cmpi.b #$11,(a1)
	beq.b loc_002082
	cmpi.b #1,(1,a1)
	bls.b loc_002094
	bra.b loc_002088

loc_002082:
	cmp.b (1,a1),d0
	beq.b loc_002094
 
loc_002088:
	move.b (1,a0),d0
	move.b d0,(1,a1)
	move.b d0,(1,a2)

loc_002094:
	moveq #0,d0
	tst.b ($16,a1)
	bne.b loc_00209e
	moveq #1,d0

loc_00209e:
	cmp.b ($17,a1),d0
	bcc.b loc_0020b0
	move.b ($17,a0),d0
	move.b d0,($17,a1)
	move.b d0,($17,a2)

loc_0020b0:
	rts

;==============================================
loc_0020b2:
	lea (-$7394,a5),a1
	bsr.w loc_00234c
	moveq #$17,d7

loc_0020bc:
	move.w (a0)+,(a1)+
	dbra d7,loc_0020bc
	bsr.w loc_00234c
	moveq #$17,d7

loc_0020c8:
	move.w (a0)+,(a1)+
	dbra d7,loc_0020c8
	moveq #0,d0
	moveq #$f,d7

loc_0020d2:
	move.w d0,(a1)+
	dbra d7,loc_0020d2
	rts

loc_0020da:
	lea $900938,a1
	lea loc_002104(pc),a0
	moveq #$1f,d1
	moveq #$b,d2

loc_0020e8:
	moveq #0,d0
	move.b (a0)+,d0
	addi.w #0,d0
	movem.w d0-d1,(a1)
	lea ($80,a1),a1
	dbra d2,loc_0020e8

loc_0020fc:
	WATCHDOG
	bra.b loc_0020fc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_002104:
	dc.b 'EEPROM ERROR'

;==============================================
loc_002110:
	move.b #$a,(-$7288,a5)

loc_002116:
	move.l #$ff0c6c,(-$7294,a5)
	move.w (-$7290,a5),(-$728e,a5)
	move.w (-$728c,a5),(-$728a,a5)
	bsr.b loc_00214e
	lea (-$7394,a5),a1
	lea ($30,a1),a2
	moveq #$17,d7

loc_002136:
	move.w (a1)+,d0
	cmp.w (a2)+,d0
	bne.b loc_002144
	dbra d7,loc_002136
	moveq #0,d0
	rts

loc_002144:
	subq.b #1,(-$7288,a5)
	bne.b loc_002116
	moveq #-1,d0
	rts

;==============================================
loc_00214e:
	move.b #1,($87,a5)
	moveq #0,d2
	movea.l (-$7294,a5),a0
	move.w (-$728e,a5),d5
	move.w (-$728a,a5),d4
	lea (a0,d4.w),a0
	lsr.w #1,d4
	andi.w #$3f,d4
	ori.w #$180,d4

loc_002170:
	bsr.w loc_0022fc
	moveq #0,d0
	moveq #$f,d3

loc_002178:
	add.w d0,d0
	bsr.w loc_00232a
	move.w CPSinput02,d1
	andi.w #1,d1
	or.w d1,d0
	WATCHDOG
	dbra d3,loc_002178
	bsr.w loc_00232a
	andi.w #$bfff,d2
	bsr.w loc_002334
	bsr.w loc_00232a
	move.w d0,(a0)+
	addq.w #1,d4
	dbra d5,loc_002170
	clr.b ($87,a5)
	rts

;==============================================
loc_0021b2
	move.b #$a,(-$7288,a5)

loc_0021b8:
	move.l #$ff0c6c,(-$7294,a5)
	move.w (-$7290,a5),(-$728e,a5)
	move.w (-$728c,a5),(-$728a,a5)
	bsr.b loc_002216
	move.l #$ff0cec,(-$7294,a5)
	move.w (-$7290,a5),(-$728e,a5)
	move.w (-$728c,a5),(-$728a,a5)
	bsr.w loc_00214e
	lea (-$7394,a5),a1
	lea (-$7314,a5),a2
	move.w (-$728c,a5),d0
	lea (a1,d0.w),a1
	lea (a2,d0.w),a2
	move.w (-$7290,a5),d7

loc_0021fe:
	move.w (a1)+,d0
	cmp.w (a2)+,d0
	bne.b loc_00220c
	dbra d7,loc_0021fe
	moveq #$0,d0
	rts

loc_00220c:
	subq.b #1,(-$7288,a5)
	bne.b loc_0021b8
	moveq #-1,d0
	rts

;==============================================
loc_002216:
	move.b #1,($87,a5)
	moveq #0,d2
	move.w #$130,d4
	bsr.w loc_0022fc
	andi.w #$bfff,d2
	bsr.w loc_002334
	bsr.w loc_00232a
	movea.l (-$7294,a5),a0
	move.w (-$728e,a5),d5
	move.w (-$728a,a5),d4
	lea (a0,d4.w),a0
	lsr.w #1,d4

loc_002244:
	andi.w #$3f,d4
	ori.w #$1c0,d4
	bsr.w loc_0022fc
	bsr.w loc_00232a
	andi.w #$bfff,d2
	bsr.w loc_002334
	bsr.w loc_00232a
	bsr.b loc_0022c8
	bne.b loc_0022c0
	andi.w #$3f,d4
	ori.w #$140,d4
	bsr.w loc_0022fc
	moveq #$f,d3
	move.w (a0)+,d0

loc_002274:
	add.w d0,d0
	roxr.w #1,d1
	lsr.w #3,d1
	andi.w #$1000,d1
	andi.w #$efff,d2
	or.w d1,d2
	bsr.w loc_002334
	bsr.w loc_00232a
	WATCHDOG
	dbra d3,loc_002274
	andi.w #$bfff,d2
	bsr.w loc_002334
	bsr.w loc_00232a
	bsr.w loc_00232a
	bsr.b loc_0022c8
	bne.b loc_0022c0
	andi.w #$dfff,d2
	bsr.w loc_002334
	addq.w #1,d4
	dbra d5,loc_002244
	clr.b ($87,a5)
	moveq #0,d0
	rts

loc_0022c0
	clr.b ($87,a5)
	moveq #-1,d0
	rts

;==============================================
loc_0022c8:
	ori.w #$4000,d2
	bsr.b loc_002334
	move.l #$2ffff,d1

loc_0022d4:
	subq.l #1,d1
	beq.b loc_0022f8
	WATCHDOG
	bsr.b loc_00232a
	move.w CPSinput02,d0
	andi.w #1,d0
	beq.b loc_0022d4
	andi.w #$bfff,d2
	bsr.b loc_002334
	bsr.b loc_00232a
	moveq #0,d0
	rts

loc_0022f8:
	moveq #-1,d0
	rts

;==============================================
loc_0022fc:
	ori.w #$4000,d2
	bsr.b loc_002334
	move.w #$9,d3
	move.w d4,d1
	lsl.w #6,d1

loc_00230a:
	lsl.w #1,d1
	roxr.w #1,d0
	lsr.w #3,d0
	andi.w #$1000,d0
	andi.w #$efff,d2
	or.w d0,d2
	bsr.b loc_002334
	bsr.b loc_00232a
	WATCHDOG
	dbra d3,loc_00230a
	rts

;==============================================
loc_00232a:
	ori.w #$2000,d2
	bsr.b loc_002334
	andi.w #$dfff,d2

loc_002334:
	or.w ($6a,a5),d2
	andi.w #$7f33,d2
	or.b ($88,a5),d2
	move.w d2,$804040
	andi.w #$7000,d2
	rts

;==============================================
loc_00234c:
	move.w (Region,a5),d0
	move.w loc_00235a(pc,d0.w),d0
	lea loc_00235a(pc,d0.w),a0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00235a:
	dc.w $000e,$003e,$006e,$009e,$00ce,$00fe,$012e

;000e
	dc.w $0001,$0001,$0100,$0000,$0000,$0000,$0000,$0000  ;................
	dc.w $0101,$0101,$0101,$0001,$0000,$0000,$0000,$0000  ;................
	dc.w $9809,$0400,$535a,$334a,$205a,$4552,$4f20,$3320  ;....SZ3J ZERO 3 

;003e
	dc.w $0901,$0001,$0100,$0100,$0200,$0000,$0000,$0000  ;................
	dc.w $0401,$0102,$0101,$0001,$0000,$0000,$0000,$0000  ;................
	dc.w $9809,$0402,$535a,$3355,$414c,$5048,$4120,$3320  ;....SZ3UALPHA 3 

;006e
	dc.w $0001,$0001,$0100,$0100,$0201,$0204,$0000,$0000  ;................
	dc.w $0401,$0102,$0101,$0001,$0000,$0000,$0000,$0000  ;................
	dc.w $9809,$0404,$535a,$3348,$616c,$7068,$6120,$3320  ;....SZ3Halpha 3 

;009e
	dc.w $0901,$0001,$0100,$0100,$0200,$0000,$0000,$0000  ;................
	dc.w $0401,$0103,$0101,$0001,$0000,$0000,$0000,$0000  ;................
	dc.w $9809,$0406,$535a,$334e,$416c,$7068,$6120,$3320  ;....SZ3NAlpha 3 

;00ce
	dc.w $0001,$0001,$0100,$0100,$0200,$0000,$0000,$0000  ;................
	dc.w $0701,$0103,$0101,$0001,$0000,$0000,$0000,$0000  ;................
	dc.w $9809,$0408,$535a,$3341,$207a,$6572,$6f20,$3320  ;....SZ3A zero 3 

;00fe
	dc.w $0901,$0001,$0100,$0100,$0200,$0000,$0000,$0000  ;................
	dc.w $0401,$0103,$0101,$0001,$0000,$0000,$0000,$0000  ;................
	dc.w $9809,$040a,$535a,$3345,$5346,$414c,$5048,$4133  ;....SZ3ESFALPHA3

;012e
	dc.w $0001,$0001,$0100,$0100,$0201,$0204,$0000,$0000  ;................
	dc.w $0401,$0102,$0101,$0001,$0000,$0000,$0000,$0000  ;................
	dc.w $9809,$040c,$535a,$3342,$5346,$416c,$7068,$6133  ;....SZ3BSFAlpha3

;==============================================
loc_0024b8:
	add.w d0,d0
	move.w loc_0024c8(pc,d0.w),d0
	move.w d0,($72,a5)
	move.w d0,($7a,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0024c8:
	dc.w $0101,$0102,$0103,$0104,$0105,$0106,$0107,$0108
	dc.w $0109,$0201,$0301,$0401,$0501,$0601,$0701,$0801
	dc.w $0901,$0101,$0101,$0101

;==============================================
loc_0024f0:
	add.w d0,d0
	move.b loc_002500(pc,d0.w),($9f,a5)
	move.b loc_002500+1(pc,d0.w),($9e,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_002500:
	dc.b $01,$00,$01,$01,$00,$00,$01,$00

;==============================================
loc_002508:
	move.b loc_002516(pc,d0.w),($d4,a5)
	move.b loc_002516(pc,d1.w),($d5,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_002516:
	dc.b $02,$03,$04,$05,$06,$07,$08,$09,$0a,$0b,$0c,$0d,$0e,$0f,$10,$11
	dc.b $12,$13,$14,$15

;==============================================
loc_00252a:
	moveq #0,d0
	tst.b ($bf,a5)
	bne.b loc_002562
	cmpi.l #$10,($ea,a5)
	bcs.b loc_002562
	moveq #1,d0
	cmpi.l #$1d,($ea,a5)
	bcs.b loc_002562
	moveq #2,d0
	cmpi.l #$32,($ea,a5)
	bcs.b loc_002562
	moveq #3,d0
	cmpi.l #$9b,($ea,a5)
	bcs.b loc_002562
	moveq #4,d0

loc_002562:
	move.b d0,($ef,a5)

loc_002566:
	moveq #$1a,d0
	cmpi.b #1,(game_unlock,a5)
	bcs.b loc_002572
	moveq #$1d,d0

loc_002572:
	move.w d0,(-$5c44,a5)
	rts

;==============================================
	include "network/loctestnet.asm"

;==============================================
loc_002e5e
	lea $900e98,a1
	moveq #$1e,d1
	move.l (-$727e,a5),d0
	tst.b ($86,a5)
	bne.b loc_002e74
	move.l ($c0,a5),d0

loc_002e74:
	jsr loc_01b252
	lea $900ea0,a1
	moveq #$1e,d1
	move.l (-$727a,a5),d0
	tst.b ($86,a5)
	bne.b loc_002e90
	move.l ($c4,a5),d0

loc_002e90:
	jsr loc_01b252
	tst.b ($86,a5)
	beq.b loc_002ec4
	lea $900eb0,a1
	moveq #$1e,d1
	move.l (-$7276,a5),d3
	move.l (-$7272,a5),d2
	bne.b loc_002ebc
	moveq #0,d0
	move.l d0,(-$7286,a5)
	move.l d0,(-$7282,a5)
	bsr.b loc_002f32
	bra.b loc_002ec4

loc_002ebc:
	jsr loc_01bb9c
	bsr.b loc_002f04

loc_002ec4:
	lea $900ea8,a1
	moveq #$1e,d1
	cmpi.w #4,(Region,a5)
	beq.b loc_002ef0
	cmpi.w #$c,(Region,a5)
	beq.b loc_002ef0
	move.l (-$726e,a5),d0
	tst.b ($86,a5)
	bne.b loc_002eea
	move.l ($c8,a5),d0

loc_002eea:
	jmp loc_01b252

loc_002ef0:
	move.l (-$726a,a5),d0
	tst.b ($86,a5)
	bne.b loc_002efe
	move.l ($d8,a5),d0

loc_002efe:
	jmp loc_01b252

;==============================================
loc_002f04:
	moveq #$3c,d2
	jsr loc_01bb9c
	move.w d0,(-$7286,a5)
	jsr loc_01bb9c
	move.w d0,(-$7284,a5)
	move.l d3,d0
	cmpi.l #$63,d0
	bls.b loc_002f32
	moveq #$63,d0
	move.w #$3b,(-$7284,a5)
	move.w #$3b,(-$7286,a5)

loc_002f32:
	bsr.w loc_002f5e
	move.w #$3a,(a1)
	move.w #$1e,(2,a1)
	lea ($80,a1),a1
	move.w (-$7284,a5),d0
	bsr.w loc_002f5e
	move.w #$3a,(a1)
	move.w #$1e,(2,a1)
	lea ($80,a1),a1
	move.w (-$7286,a5),d0

loc_002f5e:
	moveq #$1e,d1
	jmp loc_01b282

loc_002f66:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_002f68:
	dc.b 'CAPCOMBGSSTREET FIGHTER ZR 3',$98,$09,$04,$00
	dc.b 'CAPCOMBGSSTREET FIGHTER AL 3',$98,$09,$04,$02
	dc.b 'CAPCOMBGSSTREET FIGHTER AL 3',$98,$09,$04,$04
	dc.b 'CAPCOMBGSSTREET FIGHTER AL 3',$98,$09,$04,$06
	dc.b 'CAPCOMBGSSTREET FIGHTER ZR 3',$98,$09,$04,$08
	dc.b 'CAPCOMBGSSTREET FIGHTER AL 3',$98,$09,$04,$0a
	dc.b 'CAPCOMBGSSTREET FIGHTER AL 3',$98,$09,$04,$0c

;==============================================
loc_003048:
	clr.b ($d0,a5)
	tst.b ($ce,a5)
	beq.b loc_003068
	move.b #0,($d1,a5)
	move.b ($1c4,a5),d0
	andi.b #$40,d0
	beq.b loc_003068
	move.b #$40,($d1,a5)

loc_003068:
	rts

;==============================================
loc_00306a:
	tst.b ($ce,a5)
	beq.b loc_0030ac
	move.b ($1c4,a5),d0
	andi.b #$70,d0
	btst #5,d0
	sne.b ($cf,a5)
	cmpi.b #$40,($d1,a5)
	beq.b loc_0030ae
	tst.b ($cf,a5)
	bmi.b loc_0030ac
	bclr.b #7,($d0,a5)
	bne.b loc_0030a6
	tst.b ($d0,a5)
	beq.b loc_0030ac
	btst #4,d0
	beq.b loc_0030ac
	subq.b #1,($d0,a5)

loc_0030a6:
	move.b #$40,($d1,a5)

loc_0030ac:
	rts

loc_0030ae:
	move.b ($1c5,a5),d1
	not.b d0
	and.b d0,d1
	btst #6,d1
	beq.b loc_0030ac
	move.b #0,($d1,a5)
	rts

;==============================================
loc_0030c4:
	moveq #0,d0
	tst.b (Dip_Sound_Mode,a5)
	beq.b loc_0030ce
	moveq #-1,d0

loc_0030ce:
	move.b d0,$619ffd
	move.w ($6e82,a5),d0
	cmp.w ($6e80,a5),d0
	beq.w loc_003166
	cmpi.b #$ff,$61801f
	bne.b loc_003166
	lea ($5e80,a5),a4
	move.w ($6e82,a5),d0
	move.b (a4,d0.w),$618007
	move.b (1,a4,d0.w),$618009
	move.b (2,a4,d0.w),$618001
	move.b (3,a4,d0.w),$618003
	move.b (4,a4,d0.w),$618005
	move.b (5,a4,d0.w),$61800d
	move.b (6,a4,d0.w),$61800f
	move.b (7,a4,d0.w),$618011
	move.b (8,a4,d0.w),$618017
	move.b (9,a4,d0.w),$618019
	move.b ($a,a4,d0.w),$618013
	move.b ($b,a4,d0.w),$618015
	move.b #0,$61801f
	addi.w #$10,d0
	andi.w #$ff0,d0
	move.w d0,($6e82,a5)

loc_003166:
	rts

;==============================================
loc_003168:
	tst.b (Dip_Demo_Sound,a5)
	bne.b loc_003174
	tst.b ($83,a5)
	bne.b loc_00319c

loc_003174:
	lea ($5e80,a5),a4
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
	lea ($5e80,a5),a0
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
	jsr loc_003168
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
	jsr loc_003168
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
	jsr loc_003168
	move.l #$741,d1
	moveq #0,d2
	moveq #0,d3
	jsr loc_003168
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
	jsr loc_003168
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
	jsr loc_003168
	jmp loc_00329c

;==============================================
loc_003956:
	btst.b #0,($59,a4)
	beq.b loc_003962
	addi.w #$500,d1

loc_003962:
	jsr loc_0032b8
	jsr loc_003168
	jmp loc_00329c

;==============================================
loc_003974:
	btst.b #0,($59,a4)
	beq.b loc_003980
	addi.w #$500,d1

loc_003980:
	jsr loc_0032ac
	jsr loc_003168
	jmp loc_00329c


;==============================================
loc_003992:
	btst.b #0,($59,a6)
	beq.b loc_00399e
	addi.w #$500,d1

loc_00399e:
	jsr loc_0032b8
	jsr loc_003168
	jmp loc_00329c

;==============================================
loc_0039b0:
	btst.b #0,($59,a6)
	beq.b loc_0039bc
	addi.w #$500,d1

loc_0039bc:
	jsr loc_003168
	jmp loc_00329c

;==============================================
loc_0039c8:
	btst.b #0,($59,a4)
	beq.b loc_0039d4
	addi.w #$500,d1

loc_0039d4:
	jsr loc_003168
	jmp loc_00329c

;==============================================
loc_0039e0:
	cmpi.w #$16,d0
	beq.b loc_0039ec
	tst.b ($a6,a5)
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
	dc.w loc_003a30-loc_003a10
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
loc_003a30:
	lea (p3memory,a5),a4
	tst.w ($138,a5)
	bne.b loc_003a48
	lea (p1memory,a5),a4
	tst.b ($130,a5)
	bne.b loc_003a48
	lea (p2memory,a5),a4

loc_003a48:
	moveq #0,d0
	move.b ($102,a4),d0
	cmpi.b #6,d0
	bne.b loc_003a5e
	tst.b ($132,a4)
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
	cmpi.w #9,($114,a5)
	bne.b loc_003a86
	cmpi.b #0,d0
	bne.b loc_003a86
	moveq #$22,d0
	bra.b loc_003aac

loc_003a86:
	cmpi.w #8,($114,a5)
	bne.b loc_003a9a
	cmpi.w #$14,(stageid,a5)
	bne.b loc_003a9a
	moveq #$23,d0
	bra.b loc_003aac

loc_003a9a:
	cmpi.w #8,($114,a5)
	bne.b loc_003aac
	cmpi.w #4,(stageid,a5)
	bne.b loc_003aac
	moveq #$24,d0

loc_003aac:
	moveq #0,d1
	move.b loc_003aba(pc,d0.w),d1
	moveq #0,d2
	moveq #0,d3
	bra.w loc_0038d8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_003aba:
	dc.b $09,$0a,$0b,$0c,$0d,$0e,$0f,$10,$11,$12,$13,$14,$15,$16,$17,$18
	dc.b $19,$1a,$00,$00,$00,$1e,$1f,$00,$21,$22,$23,$24,$25,$26,$27,$27
	dc.b $1d,$20,$28,$29,$1b,$00

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
	dc.w $002d,$002f,$0008,$0002,$0004,$0004,$0005
	dc.w $0003,$0006,$0007,$0001,$0008,$002b,$002c
	dc.w $0029

;==============================================
loc_003b16:
	moveq #1,d1
	moveq #0,d2
	move.l #$7fff,d3
	tst.b ($a6,a5)
	bne.b loc_003b34
	tst.b (Dip_Demo_Sound,a5)
	bne.b loc_003b32
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
loc_003cc8:
	jsr loc_0032a4
	jsr RNGFunction
	andi.w #$f,d0
	cmp.b (-$718c,a5),d0
	bne.b loc_003ce4
	addq.w #8,d0
	andi.w #$f,d0

loc_003ce4:
	move.w d0,(-$718c,a5)
	move.l #$120,d1
	add.w d0,d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
loc_003cfe:
	jsr loc_0032a4
	move.l #$102,d1
	add.b ($89,a5),d1
	move.l #$1000,d2
	moveq #0,d3
	jmp loc_0038d8

;==============================================
loc_003d1c:
	jsr loc_0032a4
	move.l #$100,d1
	add.b ($89,a5),d1
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
	dc.w $0305,$0328,$0345,$0365
	dc.w $0385,$03a5,$03c5,$03e5
	dc.w $0405,$0425,$0445,$0465
	dc.w $0485,$04a5,$04c5,$04e5
	dc.w $0505,$0525,$0000,$0525
	dc.w $0000,$05a5,$05c5,$0000
	dc.w $0603,$0625,$0645,$0665
	dc.w $0685,$06a2,$05c5,$05c5

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
	dc.w $0300,$0320,$0340,$0360
	dc.w $0380,$03a0,$03c0,$03e0
	dc.w $0400,$0420,$0440,$0460
	dc.w $0480,$04a0,$04c0,$04e0
	dc.w $0500,$0520,$0000,$0520
	dc.w $0000,$05a0,$05c0,$0000
	dc.w $0600,$0620,$0640,$0660
	dc.w $0680,$06a0,$05c0,$05c0

;==============================================
loc_003eba:
	st.b ($e9,a5)
	jsr loc_0172da
	jsr loc_01b0e6
	jsr loc_017320

loc_003ed0:
	move.w (0,a5),d0
	move.w loc_003eec(pc,d0.w),d0
	jsr loc_003eec(pc,d0.w)
	jsr loc_00182e
	moveq #1,d0
	jsr loc_001370
	bra.b loc_003ed0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_003eec:
	dc.w loc_003ef6-loc_003eec
	dc.w loc_003f28-loc_003eec
	dc.w loc_003f54-loc_003eec
	dc.w loc_003f8e-loc_003eec
	dc.w loc_003fa6-loc_003eec

;==============================================
loc_003ef6:
	addq.w #2,(0,a5)
	move.b #1,($83,a5)
	clr.b ($bf,a5)
	move.w #0,($22,a5)
	move.w #$100,($24,a5)
	tst.b ($86,a5)
	bne.b loc_003f1c
	move.w #$01c3,(RngByte0,a5);Rng Seed

loc_003f1c:
	jsr SetRegionBootPalette(pc)
	nop
	jmp loc_0088dc

;==============================================
loc_003f28:
	addq.w #2,(0,a5)
	move.w #$b4,(2,a5)
	jsr loc_003cfe
	move.w (Region,a5),d0
	move.w loc_003f46(pc,d0.w),d0
	jmp loc_01c3e8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_003f46:
	dc.w $0000,$0001,$0002,$0003,$0004,$0005,$0006

;==============================================
loc_003f54:
	bsr.w Input_P1Shot_check
	bne.b loc_003f60
	subq.w #1,(2,a5)
	bpl.b loc_003f7e

loc_003f60:
	addq.w #2,(0,a5)
	move.w #$b4,(2,a5)
	jsr loc_01b0e6
	move.w (Region,a5),d0
	move.w loc_003f80(pc,d0.w),d0
	jmp loc_01c3e8

loc_003f7e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_003f80:
	dc.w $0007,$0008,$0009,$000a,$000b,$000c,$000d

;==============================================
loc_003f8e:
	bsr.w Input_P1Shot_check
	bne.b loc_003f9a
	subq.w #1,(2,a5)
	bpl.b loc_003fa4

loc_003f9a:
	addq.w #2,(0,a5)
	jmp loc_01b0e6

loc_003fa4:
	rts

;==============================================
loc_003fa6:
	moveq #0,d0
	move.l d0,(0,a5)
	move.l d0,(4,a5)
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	jsr loc_003048
	jsr loc_01b0e6
	jsr loc_01f792
	move.w #$40,d0
	movea.l #loc_004036,a0
	jsr loc_001302
	jmp loc_001324

;==============================================
SetRegionBootPalette:
	move.w (Region,a5),d0
	add.w d0,d0
	move.l BootFontPalettes(pc,d0.w),d0
	move.l #$f000f000,d1
	lea $90c420,a0
	move.l d1,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d0,(a0)+
	move.l d1,(a0)+
	move.l d1,(a0)+
	move.l d1,(a0)+
	move.l d1,(a0)+
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
BootFontPalettes:
	dc.w $ffff,$ffff;00 Japan
	dc.w $ff00,$ff00;02 Usa
	dc.w $f0f0,$f0f0;04 Hispanic
	dc.w $ff90,$ff90;06 Oceania
	dc.w $fff0,$fff0;08 Asia
	dc.w $f00f,$f00f;0a Europe
	dc.w $ff0f,$ff0f;0c Brazil

;==============================================
Input_P1Shot_check:
	move.w (INP_P1,a5),d0
	btst #8,d0
	rts

;==============================================
loc_004036:
	move.w #$1b0e,($32,a5)
	move.w #$2461,($3a,a5)
	move.b #1,($83,a5)
	moveq #0,d0
	move.l d0,(0,a5)
	move.w d0,(stageid,a5)
	move.b d0,($8e,a5)
	move.b d0,(Active_Player,a5)
	move.b d0,($8d,a5)
	move.b d0,($aa,a5)
	move.b d0,($181,a5)
	move.b d0,($182,a5)
	move.b d0,($183,a5)
	move.b d0,($8f,a5)
	move.b d0,($bd,a5)
	move.w d0,(-$718a,a5)
	move.b d0,($ab,a5)
	move.w d0,($dc,a5)
	move.w d0,($22,a5)
	move.w d0,($24,a5)
	move.w d0,($26,a5)
	move.w d0,($28,a5)
	move.w d0,($2a,a5)
	move.w d0,($2c,a5)
	moveq #1,d0
	jsr loc_001370

loc_0040a2:
	addq.b #1,($81,a5)
	move.b #$1f,($cd,a5)
	move.w (0,a5),d0
	move.w loc_0040d6(pc,d0.w),d0
	jsr loc_0040d6(pc,d0.w)
	jsr loc_00182e
	bsr.w loc_004510
	jsr RNGFunction
	bsr.w loc_004462
	moveq #1,d0
	jsr loc_001370
	bra.b loc_0040a2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0040d6:
	dc.w loc_00410a-loc_0040d6 ;00
	dc.w loc_00436e-loc_0040d6 ;02
	dc.w loc_004344-loc_0040d6 ;04
	dc.w loc_00436e-loc_0040d6 ;06
	dc.w loc_00413a-loc_0040d6 ;08
	dc.w loc_00436e-loc_0040d6 ;0a
	dc.w loc_004298-loc_0040d6 ;0c
	dc.w loc_00436e-loc_0040d6 ;0e
	dc.w loc_00433e-loc_0040d6 ;10
	dc.w loc_00436e-loc_0040d6 ;12
	dc.w loc_004368-loc_0040d6 ;14
	dc.w loc_00436e-loc_0040d6 ;16
	dc.w loc_004344-loc_0040d6 ;18
	dc.w loc_00436e-loc_0040d6 ;1a
	dc.w loc_0043ec-loc_0040d6 ;1c
	dc.w loc_0041f2-loc_0040d6 ;1e
	dc.w loc_00436e-loc_0040d6 ;20
	dc.w loc_004298-loc_0040d6 ;22
	dc.w loc_00436e-loc_0040d6 ;24
	dc.w loc_00433e-loc_0040d6 ;26
	dc.w loc_00436e-loc_0040d6 ;28
	dc.w loc_004368-loc_0040d6 ;2a
	dc.w loc_00436e-loc_0040d6 ;2c
	dc.w loc_004344-loc_0040d6 ;2e
	dc.w loc_00436e-loc_0040d6 ;30
	dc.w loc_0043ec-loc_0040d6 ;32

;==============================================
loc_00410a:
	addq.w #2,(0,a5)
	move.w #$92a0,(palrampointer,a5)
	move.w #$92a0,($48,a5)
	tst.b ($e9,a5)
	beq.b loc_004128
	clr.b ($e9,a5)
	addq.w #4,(0,a5)

loc_004128:
	jsr loc_01fa5e
	jsr loc_00389a
	jmp loc_01bdd6

;==============================================
loc_00413a:
	move.w (4,a5),d0
	move.w loc_004146(pc,d0.w),d1
	jmp loc_004146(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_004146:
	dc.w loc_00414c-loc_004146
	dc.w loc_0041ca-loc_004146
	dc.w loc_0041e2-loc_004146

;==============================================
loc_00414c:
	addq.w #2,(4,a5)
	move.w #0,($22,a5)
	move.w #$100,($24,a5)
	move.w #0,($26,a5)
	move.w #$300,($28,a5)
	move.w #0,($2a,a5)
	move.w #$700,($2c,a5)
	moveq #0,d1
	lea $900864,a1
	jsr loc_004914
	lea $908000,a1
	moveq #$4f,d0
	jsr loc_0190d2
	lea $908100,a1
	moveq #$50,d0
	jsr loc_0190d2
	move.w #$1e0e,($32,a5)
	move.w #$4261,($3a,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.w #0,($128,a5)
	jsr loc_01fa5e
	move.w #0,$90cc00
	jmp loc_01738a

;==============================================
loc_0041ca:
	tst.b ($182,a5)
	bne.b loc_0041f0
	addq.w #2,(4,a5)
	move.w #$c0,(6,a5)
	moveq #4,d0
	jmp loc_0039e0

loc_0041e2:
	subq.w #1,(6,a5)
	bne.b loc_0041f0
	addq.w #2,(0,a5)
	clr.l (4,a5)

loc_0041f0:
	rts

;==============================================
loc_0041f2:
	move.w (4,a5),d0
	move.w loc_0041fe(pc,d0.w),d1
	jmp loc_0041fe(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0041fe:
	dc.w loc_004204-loc_0041fe
	dc.w loc_004276-loc_0041fe
	dc.w loc_004288-loc_0041fe

;==============================================
loc_004204:
	cmpi.w #2,(Region,a5);USA CHECK
	bne.w loc_00428e
	addq.w #2,(4,a5)
	move.w #0,($22,a5)
	move.w #$100,($24,a5)
	move.w #0,($26,a5)
	move.w #$300,($28,a5)
	move.w #$80,($2a,a5)
	move.w #$700,($2c,a5)
	lea $908000,a1
	moveq #$50,d0
	jsr loc_0190d2
	lea $908100,a1
	moveq #$51,d0
	jsr loc_0190d2
	move.w #$360e,($32,a5)
	move.w #$6241,($3a,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.w #0,($128,a5)
	jsr loc_01fa5e
	jmp loc_01738a

loc_004276:
	tst.b ($182,a5)
	bne.b loc_004286
	addq.w #2,(4,a5)
	move.w #$c0,(6,a5)

loc_004286:
	rts

loc_004288:
	subq.w #1,(6,a5)
	bne.b loc_004296

loc_00428e:
	addq.w #2,(0,a5)
	clr.l (4,a5)

loc_004296:
	rts

;==============================================
loc_004298:
	move.w (4,a5),d0
	move.w loc_0042a4(pc,d0.w),d1
	jmp loc_0042a4(pc,d1.w)
 
;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0042a4:
	dc.w loc_0042aa-loc_0042a4
	dc.w loc_00431c-loc_0042a4
	dc.w loc_00432e-loc_0042a4

;==============================================
loc_0042aa:
	addq.w #2,(4,a5)
	move.w #0,($22,a5)
	move.w #$100,($24,a5)
	move.w #0,($26,a5)
	move.w #$300,($28,a5)
	move.w #0,($2a,a5)
	move.w #$700,($2c,a5)
	moveq #0,d1
	lea $9007bc,a1
	jsr loc_004914
	moveq #0,d0
	moveq #0,d1
	lea $908000,a1
	jsr loc_01babc
	move.w #$1e0e,($32,a5)
	move.w #$4261,($3a,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.w #0,($128,a5)
	jsr loc_01fa5e
	move.w #0,$90cc00
	jmp loc_01738a

;==============================================
loc_00431c:
	tst.b ($182,a5)
	bne.b loc_00432c
	addq.w #2,(4,a5)
	move.w #$80,(6,a5)

loc_00432c:
	rts

;==============================================
loc_00432e:
	subq.w #1,(6,a5)
	bne.b loc_00433c
	addq.w #2,(0,a5)
	clr.l (4,a5)

loc_00433c:
	rts

;==============================================
loc_00433e:
	jmp loc_004c9a

;==============================================
loc_004344:
	move.w (4,a5),d0
	move.w loc_004350(pc,d0.w),d1
	jmp loc_004350(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_004350:
	dc.w loc_004354-loc_004350
	dc.w loc_00435a-loc_004350

;==============================================
loc_004354:
	jmp loc_025838

loc_00435a:
	addq.w #2,(0,a5)
	clr.l (4,a5)
	jmp loc_00320c

;==============================================
loc_004368:
	jmp loc_004958

;==============================================
loc_00436e:
	move.w (4,a5),d0
	move.w loc_00437a(pc,d0.w),d1
	jmp loc_00437a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00437a:
	dc.w loc_004380-loc_00437a
	dc.w loc_00438a-loc_00437a
	dc.w loc_0043a2-loc_00437a

;==============================================
loc_004380:
	addq.w #2,(4,a5)
	jmp loc_017366

loc_00438a:
	tst.b ($182,a5)
	bne.b loc_0043a0
	addq.w #2,(4,a5)
	move.w #$92a0,(palrampointer,a5)
	move.w #$92a0,($48,a5)

loc_0043a0:
	rts

;==============================================
loc_0043a2:
	addq.w #2,(0,a5)
	moveq #0,d0
	move.w d0,(4,a5)
	move.w d0,(8,a5)
	move.w d0,($c,a5)
	move.w d0,($10,a5)
	move.w d0,($14,a5)
	move.w d0,($22,a5)
	move.w d0,($24,a5)
	move.w d0,($26,a5)
	move.w d0,($28,a5)
	move.w d0,($2a,a5)
	move.w d0,($2c,a5)
	move.w #$1b0e,($32,a5)
	move.w #$2461,($3a,a5)
	jsr loc_01bdd6
	jmp loc_01b0e6

;==============================================
loc_0043ec:
	moveq #0,d0
	addq.w #2,(0,a5)
	addq.b #2,(-$718a,a5)
	btst.b #1,(-$718a,a5)
	bne.b loc_004404
	move.w #$c,(0,a5)

loc_004404:
	addq.b #2,(-$7189,a5)
	cmpi.b #$a,(-$7189,a5)
	bls.b loc_004414
	move.b d0,(-$7189,a5)

loc_004414:
	move.w d0,(2,a5)
	move.l d0,(4,a5)
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	rts

;==============================================
loc_00442e:
	jsr loc_01c3ac
	beq.b loc_004460
	move.l #$1000800,(a4)
	st.b ($31,a4)
	move.w #$e,d0
	tst.b ($9c,a5)
	bne.b loc_00445c
	move.w #$f,d0
	tst.b ($9d,a5)
	bne.b loc_00445c
	move.w #$f,d0
	add.b ($72,a5),d0

loc_00445c:
	move.b d0,($3c,a4)

loc_004460:
	rts

;==============================================
loc_004462:
	moveq #0,d7
	cmpi.w #4,(Region,a5)
	beq.w loc_004478
	cmpi.w #$c,(Region,a5)
	bne.w loc_0044ee

loc_004478:
	btst.b #0,(INP_P1,a5)
	beq.w loc_0044e6
	lea ($79c2,a5),a4
	move.w #$20c0,d1
	moveq #$1f,d3
	move.l (-$727e,a5),d0
	tst.b ($86,a5)
	bne.b loc_00449a
	move.l ($c0,a5),d0

loc_00449a:
	jsr Hex_to_Decimal
	move.w #$e080,d0
	move.l (-$5d2a,a5),d4
	bsr.b loc_0044f0
	move.l (-$727a,a5),d0
	tst.b ($86,a5)
	bne.b loc_0044b8
	move.l ($c4,a5),d0

loc_0044b8:
	jsr Hex_to_Decimal
	move.w #$e0e0,d0
	move.l (-$5d2a,a5),d4
	bsr.b loc_0044f0
	move.l (-$726a,a5),d0
	tst.b ($86,a5)
	bne.b loc_0044d6
	move.l ($d8,a5),d0

loc_0044d6:
	jsr Hex_to_Decimal
	move.w #$e140,d0
	move.l (-$5d2a,a5),d4
	bsr.b loc_0044f0

loc_0044e6:
	move.w d7,($71bc,a5)
	move.w d7,($71c0,a5)

loc_0044ee:
	rts

;==============================================
loc_0044f0:
	moveq #7,d6

loc_0044f2:
	rol.l #4,d4
	move.l d4,d2
	andi.w #$f,d2
	addi.w #$6e30,d2
	movem.w d0-d3,(a4)
	addq.b #1,d7
	addq.w #8,d0
	lea (8,a4),a4
	dbra d6,loc_0044f2
	rts

;==============================================
loc_004510:
	tst.b ($9c,a5)
	bne.w loc_004578
	move.b ($76,a5),d0
	or.b ($71,a5),d0
	or.b ($7e,a5),d0
	or.b ($79,a5),d0
	bne.b loc_00452c
	rts

loc_00452c:
	moveq #0,d0
	move.l d0,(0,a5)
	move.l d0,(4,a5)
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	jsr loc_01b0e6
	jsr loc_01bdd6
	jsr loc_0038bc
	move.w #$20,d0
	jsr loc_001346
	move.w #$60,d0
	movea.l #loc_0045ea,a0
	jsr loc_001302
	jmp loc_001324

loc_004578:
	bsr.b loc_0045ac
	tst.b (Active_Player,a5)
	beq.w loc_0045e8
	tst.b ($183,a5)
	bne.b loc_0045a0
	move.w #$100,d0
	jsr loc_001346
	st.b ($183,a5)
	clr.b ($181,a5)
	jsr loc_017366


loc_0045a0:
	tst.b ($182,a5)
	bne.b loc_0045e8
	jmp loc_00485c

loc_0045ac:
	move.b ($61,a5),d0
	not.b d0
	and.b ($60,a5),d0
	andi.b #3,d0
	beq.b loc_0045e8
	tst.b (Dip_Join_in,a5)
	bne.b loc_0045d4
	tst.b (Active_Player,a5)
	bne.w loc_0045e8
	cmpi.b #3,d0
	bne.b loc_0045d4
	move.b #2,d0

loc_0045d4:
	tst.b (Dip_EventMode,a5)
	beq.b loc_0045dc
	moveq #3,d0

loc_0045dc:
	or.b d0,(Active_Player,a5)
	clr.b ($76,a5)
	clr.b ($7e,a5)

loc_0045e8:
	rts

;==============================================
loc_0045ea:
	moveq #0,d0
	move.b d0,($181,a5)
	move.b d0,($182,a5)
	move.b d0,($8f,a5)
	move.b d0,($bd,a5)
	move.b d0,($8d,a5)
	move.b d0,($ac,a5)
	move.b d0,($ad,a5)
	move.b d0,($ab,a5)
	move.w d0,($128,a5)
	move.b #1,($83,a5)
	move.b #$1f,($cd,a5)
	move.w #$92a0,(palrampointer,a5)
	move.w #$92a0,($48,a5)
	jsr loc_01fcaa
	jsr loc_01bdd6
	jsr loc_01b0e6
	jsr loc_00320c
	move.w #1,d0
	jsr loc_001370
	jsr loc_00377a

loc_004650:
	move.w (0,a5),d0
	move.w loc_004672(pc,d0.w),d1
	jsr loc_004672(pc,d1.w)
	jsr loc_00182e
	jsr RNGFunction
	moveq #1,d0
	jsr loc_001370
	bra.b loc_004650

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_004672:
	dc.w loc_004678-loc_004672
	dc.w loc_00478a-loc_004672
	dc.w loc_0047a4-loc_004672

;==============================================
loc_004678:
	addq.w #2,(0,a5)
	moveq #0,d0
	move.w d0,($22,a5)
	move.w #$100,($24,a5)
	move.w d0,($26,a5)
	move.w #$300,($28,a5)
	move.w d0,($2a,a5)
	move.w #$700,($2c,a5)
	move.l d0,($14,a5)
	lea loc_35bb94,a0
	lea $90c020,a1
	moveq #0,d7

	jsr loc_01b7ce
	lea loc_35bc14,a0
	lea $90c040,a1
	moveq #0,d7

	jsr loc_01b7ce
	lea loc_35bc94,a0
	lea $90c060,a1
	moveq #0,d7

	jsr loc_01b7ce
	lea loc_35bd74,a0
	lea $90c080,a1
	moveq #0,d7

	jsr loc_01b7ce
	lea loc_35bdf4,a0
	lea $90c100,a1
	moveq #0,d7

	jsr loc_01b7ce
	lea loc_362854,a0
	lea $90c400,a1
	moveq #0,d7

	jsr loc_01b7ce
	lea loc_363b34,a0
	lea $90c800,a1
	moveq #0,d7

	jsr loc_01b7ce
	lea loc_363bb4,a0
	lea $90c820,a1
	moveq #0,d7

	jsr loc_01b7ce
	lea loc_364894,a0
	lea $90cc00,a1
	moveq #0,d7

	jsr loc_01b7ce
	jsr loc_004bec
	jsr loc_0b4de0
	move.w #$1e0e,($32,a5)
	move.w #$4261,($3a,a5)
	move.w #Mainpalette,(palrampointer,a5)
	jsr loc_003d1c
	jsr loc_03330e
	jsr loc_0336d6
	jmp loc_020c4a

;==============================================
loc_00478a:
	addq.w #2,(0,a5)
	clr.b ($183,a5)
	jsr loc_03330e
	jsr loc_0336d6
	jmp loc_020c4a

;==============================================
loc_0047a4:
	move.b ($61,a5),d0
	not.b d0
	and.b ($60,a5),d0
	andi.b #3,d0
	beq.w loc_00482e
	moveq #1,d3
	add.b ($9d,a5),d3
	tst.b ($9e,a5)
	beq.b loc_0047e0
	lea ($78,a5),a6
	btst #1,d0
	beq.b loc_0047d0
	moveq #1,d1
	bsr.b loc_0047fa

loc_0047d0:
	lea ($70,a5),a6
	btst #0,d0
	beq.b loc_0047de
	moveq #0,d1
	bsr.b loc_0047fa

loc_0047de:
	bra.b loc_00482e

loc_0047e0:
	lea ($70,a5),a6
	btst #1,d0
	beq.b loc_0047ee
	moveq #1,d1
	bsr.b loc_0047fa

loc_0047ee:
	btst #0,d0
	beq.b loc_0047f8
	moveq #0,d1
	bsr.b loc_0047fa

loc_0047f8
	bra.b loc_00482e

loc_0047fa:
	tst.b (Dip_Join_in,a5)
	bne.b loc_004806
	tst.b (Active_Player,a5)
	bne.b loc_00482c

loc_004806:
	btst d1,(Active_Player,a5)
	bne.b loc_00482c
	move.b ($6,a6),d2
	andi.b #$ef,ccr
	sbcd.b d3,d2
	bcs.b loc_00482c
	move.b d2,(6,a6)
	bset.b d1,(Active_Player,a5)
	tst.b (Dip_EventMode,a5)
	beq.b loc_00482c
	move.b #3,(Active_Player,a5)

loc_00482c:
	rts

loc_00482e:
	tst.b (Active_Player,a5)
	beq.w loc_004902
	tst.b ($183,a5)
	bne.b loc_004854
	move.w #$100,d0
	jsr loc_001346
	clr.b ($181,a5)
	st.b ($183,a5)
	jsr loc_017366

loc_004854
	tst.b ($182,a5)
	bne.w loc_004902

loc_00485c:
	clr.b ($181,a5)
	clr.b ($182,a5)
	moveq #0,d0
	move.l d0,(0,a5)
	move.l d0,(4,a5)
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.w d0,(stageid,a5)
	move.b d0,($83,a5)
	move.b d0,($8d,a5)
	move.b d0,($8e,a5)
	move.b d0,($8f,a5)
	move.b d0,($bd,a5)
	move.b #0,($501,a5)
	move.b #1,($901,a5)
	btst.b #1,(Active_Player,a5)
	beq.b loc_0048b4
	move.b #2,($900,a5)
	addq.b #1,(-$7398,a5)

loc_0048b4:
	btst.b #0,(Active_Player,a5)
	beq.b loc_0048c6
	move.b #2,($500,a5)
	addq.b #1,(-$7398,a5)

loc_0048c6:
	move.b #1,($a7,a5)
	jsr loc_01b0e6
	move.w #$20,d0
	jsr loc_001346
	move.w #$80,d0
	movea.l #loc_007b5e,a0
	jsr loc_001302
	move.w #$a0,d0
	movea.l #loc_008b3c,a0
	jsr loc_001302
	jmp loc_001324

;----------------------------------------------
loc_004902:
	jsr loc_03330e
	jsr loc_0336d6
	jmp loc_020c4a

;==============================================
loc_004914:
	move.w #$150,d0
	tst.b d1
	beq.b loc_004920
	move.w #$180,d0

loc_004920:
	moveq #1,d1
	moveq #$f,d2

loc_004924:
	move.w d0,d3
	addi.w #0,d3
	move.w d3,(a1)
	move.w d1,(2,a1)
	move.w d0,d3
	addi.w #$10,d3
	move.w d3,(4,a1)
	move.w d1,(6,a1)
	move.w d0,d3
	addi.w #$20,d3
	move.w d3,(8,a1)
	move.w d1,($a,a1)
	addq.w #1,d0
	lea ($80,a1),a1
	dbra d2,loc_004924
	rts

;==============================================
loc_004958:
	move.w (8,a5),d0
	move.w loc_004964(pc,d0.w),d1
	jmp loc_004964(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_004964:
	dc.w loc_00496a-loc_004964
	dc.w loc_004abe-loc_004964
	dc.w loc_004afa-loc_004964

;==============================================
loc_00496a:
	move.w ($c,a5),d0
	move.w loc_00497c(pc,d0.w),d1
	jsr loc_00497c(pc,d1.w)
	jmp loc_020c4a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00497c:
	dc.w loc_004980-loc_00497c
	dc.w loc_004a4c-loc_00497c

;==============================================
loc_004980:
	addq.w #2,($c,a5)
	moveq #0,d0
	move.w d0,($80,a5)
	move.b d0,($ac,a5)
	move.b d0,($8f,a5)
	move.b d0,($8a,a5)
	move.b d0,($8b,a5)
	move.b d0,($182,a5)
	move.b d0,($b4,a5)
	move.b d0,($b8,a5)
	move.b d0,($ba,a5)
	move.b d0,($ab,a5)
	move.b d0,($104,a5)
	move.b d0,($bd,a5)
	move.b d0,($12d,a5)
	move.w d0,($138,a5)
	move.b d0,($168,a5)
	move.b d0,($130,a5)
	andi.w #$ffc0,($32,a5)
	move.w #$92a0,(palrampointer,a5)
	move.w #$92a0,($48,a5)
	move.l #$90c000,($e0,a5)
	jsr loc_01bdd6
	move.b #7,($be,a5)
	jsr loc_0202f6
	move.b #1,($55f,a5)
	move.b #1,($95f,a5)
	jsr loc_00a9c2
	bsr.w loc_004b3a
	jsr loc_01fc38
	jsr loc_01fc54
	jsr loc_01fc70
	move.b #1,($200,a5)
	move.b #1,($280,a5)
	move.b #1,($300,a5)
	move.w #3,($102,a5)
	move.b #$13,(clock_counter,a5)
	move.b #59,(Clock_frames,a5)
	jsr loc_01a5e8
	moveq #0,d0
	jmp loc_0039e0

;==============================================
loc_004a4c:
	addq.w #2,(8,a5)
	move.w #$4b0,($a,a5)
	moveq #0,d0
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	jsr loc_01faf0
	jsr loc_01fc26
	jsr loc_00442e
	jsr loc_01c3ac
	beq.b loc_004a98
	addq.b #1,(a4)
	move.w #$801,(2,a4)
	moveq #0,d0
	tst.b ($bf,a5)
	beq.b loc_004a90
	moveq #1,d0

loc_004a90:
	move.b d0,($3c,a4)
	clr.b ($31,a4)

loc_004a98:
	jsr loc_0276e2
	jsr loc_017462
	move.b #1,($401,a5)
	move.b #1,($801,a5)
	ori.w #$e,($32,a5)
	move.w #Mainpalette,(palrampointer,a5)
	rts

;==============================================
loc_004abe:
	subq.w #1,($a,a5)
	bmi.b loc_004ade
	move.w #$90,d1
	move.w d1,($450,a5)
	move.w d1,($850,a5)
	move.w d1,($452,a5)
	move.w d1,($852,a5)
	jmp loc_00950c

loc_004ade:
	addq.w #2,($8,a5)
	moveq #0,d0
	move.b d0,($401,a5)
	move.b d0,($801,a5)
	move.b #1,($10e,a5)
	move.w #$92a0,(palrampointer,a5)
	rts

;==============================================
loc_004afa:
	addq.w #2,(0,a5)
	moveq #0,d0
	move.l d0,(4,a5)
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	lea (p1memory,a5),a6
	jsr loc_00374e
	lea (p2memory,a5),a6
	jsr loc_00374e
	jsr loc_01bdd6
	jsr loc_01b0e6
	jmp loc_00320c

;==============================================
loc_004b3a:
	lea (-$7188,a5),a1
	moveq #0,d2
	lea (p2memory,a5),a6
	bsr.b loc_004b72
	lea (p1memory,a5),a6
	bsr.b loc_004b72
	cmp.b ($902,a5),d0
	bne.b loc_004b58
	move.b #1,($128,a6)

loc_004b58:
	cmpi.w #8,(Region,a5)
	bne.b loc_004b68
	cmpi.b #$18,d0
	bne.b loc_004b68
	moveq #$c,d0

loc_004b68:
	add.w d0,d0
	ext.w d0
	move.w d0,(stageid,a5)
	rts

;==============================================
loc_004b72:
	move.b ($101,a6),d2
	clr.b ($128,a6)
	bsr.w loc_004bd4
	cmp.b (2,a1,d2.w),d0
	bne.b loc_004b88
	bsr.w loc_004bd4

loc_004b88:
	move.b d0,(PL_ism_choice,a6)
	move.b d0,(2,a1,d2.w)
	bsr.b loc_004ba4
	cmp.b (a1,d2.w),d0
	bne.b loc_004b9a
	bsr.b loc_004ba4

loc_004b9a:
	move.b d0,($102,a6)
	move.b d0,(a1,d2.w)
	rts

;==============================================
;Get Characters for Demo Fight
loc_004ba4:
	jsr RNGFunction
	andi.w #$1f,d0
	move.b loc_004bb4(pc,d0.w),d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_004bb4:
	dc.b $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$16,$0b,$0c,$0d,$0e,$0f
	dc.b $10,$11,$18,$19,$1a,$1b,$16,$1c,$18,$19,$1a,$1b,$1c,$1d,$1d,$06

;==============================================
;get ISM
loc_004bd4:
	jsr RNGFunction
	andi.w #7,d0
	move.b loc_004be4(pc,d0.w),d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_004be4:
	dc.b $ff,$00,$01,$ff,$00,$01,$ff,$01

;==============================================
loc_004bec:
	lea $900000,a1
	moveq #$52,d0
	jsr loc_018cdc
	lea $901000,a1
	moveq #$53,d0
	jsr loc_018cdc
	lea $904000,a1
	move.w #$80,d0
	jsr loc_018f20
	lea $904400,a1
	move.w #$81,d0
	jsr loc_018f20
	lea $908000,a1
	moveq #$52,d0
	jsr loc_0190d2
	lea $908100,a1
	moveq #$53,d0
	jsr loc_0190d2
	cmpi.b #8,($6eb9,a5)
	bcs.b loc_004c6e
	moveq #0,d5
	move.w #$3700,d6
	moveq #7,d7

loc_004c54:
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w d6,(2,a4)
	move.b d5,($3c,a4)
	move.b d5,($a,a4)
	addq.b #1,d6
	dbra d7,loc_004c54

loc_004c6e:
	rts

;==============================================
loc_004c70:
	jsr loc_01c3ac
	beq.b loc_004c8a
	addq.b #1,(a4)
	move.w #$300,(2,a4)
	move.w (Region,a5),d0
	move.b loc_004c8c+1(pc,d0.w),(3,a4)

loc_004c8a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_004c8c:
	dc.b $00,$4f,$00,$50,$00,$51,$00,$52,$00,$53,$00,$54,$00,$55

;==============================================
loc_004c9a:
	move.w (4,a5),d0
	move.w loc_004ca6(pc,d0.w),d1
	jmp loc_004ca6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_004ca6:
	dc.w loc_004cac-loc_004ca6
	dc.w loc_004ce8-loc_004ca6
	dc.w loc_004d2e-loc_004ca6

;==============================================
loc_004cac:
	addq.w #2,(4,a5)
	moveq #0,d0
	move.w d0,(6,a5)
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.w d0,($128,a5)
	move.w d0,(-$715a,a5)
	move.b d0,$618021
	move.b #0,($a,a5)
	jsr loc_01fcaa
	jsr loc_00389a
	moveq #0,d0

loc_004ce8:
	move.b $618021,($b,a5)
	addq.w #1,($6,a5)
	move.b (-$718a,a5),d0
	andi.w #7,d0
	move.w loc_004d26(pc,d0.w),d1
	jsr loc_004d26(pc,d1.w)
	bsr.w loc_0050e2
	jsr loc_03330e
	jsr loc_0335e0
	jsr loc_0336d6
	jsr loc_033522
	jmp loc_020c4a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_004d26:
	dc.w loc_004d4a-loc_004d26
	dc.w loc_004d66-loc_004d26
	dc.w loc_004d4a-loc_004d26
	dc.w loc_004d76-loc_004d26

;==============================================
loc_004d2e:
	addq.w #2,(0,a5)
	moveq #0,d0
	move.l d0,(4,a5)
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	rts

;==============================================
loc_004d4a:
	bsr.w loc_004d98
	move.w (-$7184,a5),d0
	move.w loc_004d86(pc,d0.w),d1
	jsr loc_004d86(pc,d1.w)
	move.w (-$7180,a5),d0
	move.w loc_004d86(pc,d0.w),d1
	jmp loc_004d86(pc,d1.w)

loc_004d66:
	bsr.w loc_005062
	move.w (-$7184,a5),d0
	move.w loc_004d86(pc,d0.w),d1
	jmp loc_004d86(pc,d1.w)

loc_004d76:
	bsr.w loc_0050a2
	move.w (-$7184,a5),d0
	move.w loc_004d86(pc,d0.w),d1
	jmp loc_004d86(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_004d86:
	dc.w loc_005260-loc_004d86;4d86
	dc.w loc_005598-loc_004d86;4d88
	dc.w loc_005786-loc_004d86;4d8a
	dc.w loc_005afc-loc_004d86;4d8c

	dc.w loc_005e2a-loc_004d86;4d8e
	dc.w loc_006338-loc_004d86;4d90
	dc.w loc_0064f2-loc_004d86;4d92
	dc.w loc_00685e-loc_004d86;4d94

	dc.w loc_006962-loc_004d86;4d96

;==============================================
loc_004d98:
	move.w (-$715a,a5),d0
	move.b loc_004dfe(pc,d0.w),d1
	cmp.b ($b,a5),d1
	bhi.b loc_004dec
	addi.w #$c,(-$715a,a5)
	move.b loc_004dfe+1(pc,d0.w),($a,a5)
	move.w loc_004dfe+2(pc,d0.w),d1
	bmi.b loc_004dd2
	move.w d1,(-$7184,a5)
	move.w loc_004dfe+4(pc,d0.w),(-$7182,a5)
	move.w loc_004dfe+6(pc,d0.w),($dc,a5)
	moveq #0,d1
	move.l d1,(-$717c,a5)
	move.l d1,(-$7178,a5)

loc_004dd2:
	move.w loc_004dfe+8(pc,d0.w),d1
	bmi.b loc_004dec
	move.w d1,(-$7180,a5)
	move.w loc_004dfe+$a(pc,d0.w),(-$717e,a5)
	moveq #0,d1
	move.l d1,(-$7174,a5)
	move.l d1,(-$7170,a5)

loc_004dec:
	cmpi.w #$1f,(6,a5)
	bne.b loc_004dfc
	moveq #$16,d0
	jmp loc_0039e0

loc_004dfc:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_004dfe:
	dc.w $0000,$0006,$0000,$0000,$000c,$0000
	dc.w $0102,$ffff,$0000,$0000,$ffff,$0000
	dc.w $0200,$0002,$0000,$0c0d,$ffff,$0000
	dc.w $0402,$ffff,$0000,$0000,$ffff,$0000
	dc.w $0500,$0002,$0000,$0709,$ffff,$0000
	dc.w $0702,$ffff,$0000,$0000,$ffff,$0000
	dc.w $0800,$000e,$0000,$0000,$ffff,$0000
	dc.w $0900,$0000,$0000,$0800,$ffff,$0000
	dc.w $0a00,$0000,$0002,$1100,$ffff,$0000
	dc.w $0b02,$ffff,$0000,$0000,$ffff,$0000
	dc.w $0c00,$000e,$0001,$0000,$ffff,$0000
	dc.w $0d00,$0000,$0000,$0b00,$ffff,$0000
	dc.w $0e00,$0000,$0002,$0500,$ffff,$0000
	dc.w $0f02,$ffff,$0000,$0000,$ffff,$0000
	dc.w $1000,$000e,$0002,$0000,$ffff,$0000
	dc.w $1100,$0000,$0000,$0600,$ffff,$0000
	dc.w $1200,$0000,$0002,$0e00,$ffff,$0000
	dc.w $1302,$ffff,$0000,$0000,$ffff,$0000
	dc.w $1400,$0006,$0000,$0200,$ffff,$0000
	dc.w $1602,$ffff,$0000,$0000,$ffff,$0000
	dc.w $1700,$ffff,$0000,$0000,$ffff,$0000
	dc.w $1802,$ffff,$0000,$0000,$ffff,$0000
	dc.w $1900,$0006,$0000,$0500,$ffff,$0000
	dc.w $1b02,$ffff,$0000,$0000,$ffff,$0000
	dc.w $1c00,$ffff,$0000,$0000,$ffff,$0000
	dc.w $1d02,$ffff,$0000,$0000,$ffff,$0000
	dc.w $1e00,$0004,$0006,$0000,$ffff,$0000
	dc.w $1f02,$ffff,$0000,$0000,$000a,$0000
	dc.w $2000,$0006,$0002,$0300,$ffff,$0000
	dc.w $2102,$ffff,$0000,$0000,$ffff,$0000
	dc.w $2200,$0004,$000a,$0000,$ffff,$0000
	dc.w $2300,$0006,$0002,$0301,$ffff,$0000
	dc.w $2400,$0004,$000c,$0000,$ffff,$0000
	dc.w $2500,$0004,$0008,$0000,$ffff,$0000
	dc.w $2600,$0006,$0002,$0302,$ffff,$0000
	dc.w $2702,$ffff,$0000,$0000,$000a,$0002
	dc.w $2800,$0006,$0002,$0500,$ffff,$0000
	dc.w $2900,$0004,$0004,$0000,$ffff,$0000
	dc.w $2a02,$ffff,$0000,$0000,$ffff,$0000
	dc.w $2b00,$0004,$000e,$0000,$ffff,$0000
	dc.w $2c00,$0006,$0002,$0501,$ffff,$0000
	dc.w $2d00,$0004,$0002,$0000,$ffff,$0000
	dc.w $2e00,$0006,$0002,$0502,$ffff,$0000
	dc.w $2f00,$0004,$0000,$0000,$ffff,$0000
	dc.w $3000,$0008,$0000,$0000,$ffff,$0000
	dc.w $3100,$0006,$0000,$0400,$ffff,$0000
	dc.w $3400,$0008,$0002,$0000,$ffff,$0000
	dc.w $3500,$0006,$0000,$0100,$ffff,$0000
	dc.w $3800,$0008,$0004,$0000,$ffff,$0000
	dc.w $3900,$0010,$0000,$0000,$ffff,$0000
	dc.w $ff00,$ffff,$0000,$0000,$ffff,$0000

;==============================================
loc_005062:
	move.w (-$715a,a5),d0
	move.w loc_005092(pc,d0.w),d1
	cmp.w (6,a5),d1
	bhi.b loc_005090
	move.b loc_005092+3(pc,d0.w),($a,a5)
	move.w loc_005092+4(pc,d0.w),(-$7184,a5)
	move.w loc_005092+6(pc,d0.w),(-$7182,a5)
	moveq #0,d1
	move.l d1,(-$717c,a5)
	move.l d1,(-$7178,a5)
	addq.w #8,(-$715a,a5)

loc_005090:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_005092:
	dc.w $0001,$0000,$0010,$0002,$7fff,$0000,$ffff,$0000

;==============================================
loc_0050a2:
	move.w (-$715a,a5),d0
	move.w loc_0050d2(pc,d0.w),d1
	cmp.w ($6,a5),d1
	bhi.b loc_0050d0
	move.b loc_0050d2+3(pc,d0.w),($a,a5)
	move.w loc_0050d2+4(pc,d0.w),(-$7184,a5)
	move.w loc_0050d2+6(pc,d0.w),(-$7182,a5)
	moveq #0,d1
	move.l d1,(-$717c,a5)
	move.l d1,(-$7178,a5)
	addq.w #8,(-$715a,a5)

loc_0050d0:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0050d2:
	dc.w $0001,$0000,$0010,$0004,$7fff,$0000,$ffff,$0000

;==============================================
loc_0050e2:
	moveq #0,d0
	move.b ($a,a5),d0
	move.w loc_0050f0(pc,d0.w),d1
	jmp loc_0050f0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0050f0:
	dc.w loc_0050f4-loc_0050f0
	dc.w loc_0051aa-loc_0050f0

;==============================================
loc_0050f4:
	move.w (-$716c,a5),($32,a5)
	move.w (-$716a,a5),($3a,a5)
	move.w #$9000,(gfxram8x8,a5)
	move.w #$9040,(gfxram16x16,a5)
	move.w #$9080,(gfxram32x32,a5)
	move.w (-$7168,a5),(rasterram,a5)
	move.w (-$7166,a5),(palrampointer,a5)
	move.w (-$7164,a5),d0
	beq.b loc_00512c
	move.w d0,($48,a5)
	clr.w (-$7164,a5)

loc_00512c:
	move.w (-$7128,a5),d0
	move.w d0,($210,a5)
	add.w (-$7118,a5),d0
	andi.w #$1ff,d0
	move.w d0,($22,a5)
	move.w (-$7124,a5),d1
	move.w d1,($214,a5)
	add.w (-$7116,a5),d1
	andi.w #$1ff,d1
	move.w d1,($24,a5)
	move.w (-$70f8,a5),d0
	move.w d0,($290,a5)
	add.w (-$70e8,a5),d0
	andi.w #$3ff,d0
	move.w d0,($26,a5)
	move.w (-$70f4,a5),d1
	move.w d1,($294,a5)
	add.w (-$70e6,a5),d1
	andi.w #$3ff,d1
	move.w d1,($28,a5)
	move.w d1,($2e,a5)
	move.w (-$70c8,a5),d0
	move.w d0,($310,a5)
	add.w (-$70b8,a5),d0
	andi.w #$7ff,d0
	move.w d0,($2a,a5)
	move.w (-$70c4,a5),d1
	move.w d1,($314,a5)
	add.w (-$70b6,a5),d1
	andi.w #$7ff,d1
	move.w d1,($2c,a5)
	rts

;==============================================
loc_0051aa:
	move.w (-$7162,a5),($32,a5)
	move.w (-$7160,a5),($3a,a5)
	move.w #$9100,(gfxram8x8,a5)
	move.w #$9140,(gfxram16x16,a5)
	move.w #$9180,(gfxram32x32,a5)
	move.w #$90f8,(rasterram,a5)
	move.w (-$715e,a5),(palrampointer,a5)
	move.w (-$715c,a5),d0
	beq.b loc_0051e2
	move.w d0,($48,a5)
	clr.w (-$715c,a5)

loc_0051e2:
	move.w (-$7110,a5),d0
	move.w d0,($210,a5)
	add.w (-$7100,a5),d0
	andi.w #$1ff,d0
	move.w d0,($22,a5)
	move.w (-$710c,a5),d1
	move.w d1,($214,a5)
	add.w (-$70fe,a5),d1
	andi.w #$1ff,d1
	move.w d1,($24,a5)
	move.w (-$70e0,a5),d0
	move.w d0,($290,a5)
	add.w (-$70d0,a5),d0
	andi.w #$3ff,d0
	move.w d0,($26,a5)
	move.w (-$70dc,a5),d1
	move.w d1,($294,a5)
	add.w (-$70ce,a5),d1
	andi.w #$3ff,d1
	move.w d1,($28,a5)
	move.w d1,($2e,a5)
	move.w (-$70b0,a5),d0
	move.w d0,($310,a5)
	add.w (-$70a0,a5),d0
	andi.w #$7ff,d0
	move.w d0,($2a,a5)
	move.w (-$70ac,a5),d1
	move.w d1,($314,a5)
	add.w (-$709e,a5),d1
	andi.w #$7ff,d1
	move.w d1,($2c,a5)
	rts

;==============================================
loc_005260:
	move.w (-$7182,a5),d0
	move.w loc_00526c(pc,d0.w),d1
	jmp loc_00526c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00526c:
	dc.w loc_005270-loc_00526c
	dc.w loc_0053d4-loc_00526c

;==============================================
loc_005270:
	move.b (-$717c,a5),d0
	move.w loc_00527c(pc,d0.w),d1
	jmp loc_00527c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00527c:
	dc.w loc_005280-loc_00527c
	dc.w loc_005376-loc_00527c

;==============================================
loc_005280:
	move.b (-$717b,a5),d0
	move.w loc_00528c(pc,d0.w),d1
	jmp loc_00528c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00528c:
	dc.w loc_005290-loc_00528c
	dc.w loc_0052a2-loc_00528c


;==============================================
loc_005290:
	addq.b #2,(-$717b,a5)
	move.w #$92a0,(-$7166,a5)
	move.w #$92a0,(-$7164,a5)
	rts

;==============================================
loc_0052a2:
	addq.b #2,(-$717c,a5)
	bsr.w loc_007ad2
	bsr.w loc_007ae4
	moveq #0,d0
	move.l d0,($14,a5)
	move.b d0,(-$717b,a5)
	move.l d0,(-$7128,a5)
	move.l d0,(-$7124,a5)
	move.l #$1400000,(-$70f8,a5)
	move.l d0,(-$70f4,a5)
	move.l #$5000000,(-$70c8,a5)
	move.l d0,(-$70c4,a5)
	move.w d0,(-$7118,a5)
	move.w d0,(-$7116,a5)
	move.w d0,(-$70e8,a5)
	move.w d0,(-$70e6,a5)
	move.w d0,(-$70b8,a5)
	move.w d0,(-$70b6,a5)
	move.w #$90e0,(-$7168,a5)
	move.b ($dc,a5),(-$7097,a5)
	move.b #0,(-$7098,a5)
	moveq #0,d0
	moveq #6,d7
	bsr.w loc_005540
	moveq #$10,d0
	moveq #0,d2
	moveq #0,d3
	lea $907700,a1
	bsr.w loc_00737e
	moveq #0,d0
	bsr.w loc_007478
	lea loc_35be14,a0
	lea $90c000,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_35c214,a0
	lea $90c020,a1
	moveq #1,d7
	jsr loc_01b7ce
	moveq #0,d0
	bsr.w loc_007b40
	move.b #0,(-$712b,a5)
	bsr.w loc_0078aa
	moveq #0,d0
	move.l d0,(-$7158,a5)
	move.l d0,(-$7154,a5)
	move.l #$f,(-$7150,a5)
	move.l #$80000000,(-$714c,a5)
	bra.w loc_007668

;==============================================
loc_005376:
	bsr.w loc_0078a4
	moveq #0,d0
	move.b (-$717b,a5),d0
	move.w loc_00538e(pc,d0.w),d1
	jsr loc_00538e(pc,d1.w)
	subq.w #2,(-$70f8,a5)
	rts 

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00538e:
	dc.w loc_005396-loc_00538e
	dc.w loc_0053ac-loc_00538e
	dc.w loc_0053c0-loc_00538e
	dc.w loc_0053d2-loc_00538e

;==============================================
loc_005396:
	addq.b #2,(-$717b,a5)
	move.w #$1b0e,(-$716c,a5)
	move.w #$2461,(-$716a,a5)
	move.w #$91e0,(-$7166,a5)

loc_0053ac:
	cmpi.b #$3f,($17,a5)
	bne.b loc_0053be
	addq.b #2,(-$717b,a5)
	move.w #$ff00,(-$7130,a5)

loc_0053be:
	rts

;==============================================
loc_0053c0:
	bsr.w loc_007748
	bne.b loc_0053d0
	addq.b #2,(-$717b,a5)
	move.w #Mainpalette,(palrampointer,a5)

loc_0053d0:
	rts

;==============================================
loc_0053d2:
	rts

;==============================================
loc_0053d4:
	move.b (-$717c,a5),d0
	move.w loc_0053e0(pc,d0.w),d1
	jmp loc_0053e0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0053e0:
	dc.w loc_0053e4-loc_0053e0
	dc.w loc_0054da-loc_0053e0

;==============================================
loc_0053e4:
	move.b (-$717b,a5),d0
	move.w loc_0053f0(pc,d0.w),d1
	jmp loc_0053f0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0053f0:
	dc.w loc_0053f4-loc_0053f0
	dc.w loc_005406-loc_0053f0

;==============================================
loc_0053f4:
	addq.b #2,(-$717b,a5)
	move.w #$92a0,(-$7166,a5)
	move.w #$92a0,(-$7164,a5)
	rts

;==============================================
loc_005406:
	addq.b #2,(-$717c,a5)
	bsr.w loc_007ad2
	bsr.w loc_007ae4
	moveq #0,d0
	move.l d0,($14,a5)
	move.b d0,(-$717b,a5)
	move.l d0,(-$7128,a5)
	move.l d0,(-$7124,a5)
	move.l d0,(-$70f8,a5)
	move.l #$400000,(-$70f4,a5)
	move.l #$6800000,(-$70c8,a5)
	move.l d0,(-$70c4,a5)
	move.w d0,(-$7118,a5)
	move.w d0,(-$7116,a5)
	move.w d0,(-$70e8,a5)
	move.w d0,(-$70e6,a5)
	move.w d0,(-$70b8,a5)
	move.w d0,(-$70b6,a5)
	move.w #$90e0,(-$7168,a5)
	move.b ($dc,a5),(-$7097,a5)
	move.b #0,(-$7098,a5)
	moveq #6,d0
	moveq #6,d7
	bsr.w loc_005540
	moveq #$12,d0
	moveq #0,d2
	moveq #0,d3
	lea $90700c,a1
	bsr.w loc_00739c
	moveq #0,d0
	bsr.w loc_007478
	lea loc_35be14,a0
	lea $90c000,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_35c254,a0
	lea $90c020,a1
	moveq #1,d7
	jsr loc_01b7ce
	moveq #0,d0
	bsr.w loc_007b40
	move.b #$1d,(-$712b,a5)
	bsr.w loc_0078aa
	moveq #0,d0
	move.l d0,(-$7158,a5)
	move.l d0,(-$7154,a5)
	move.l #$ff,(-$7150,a5)
	move.l #$80000000,(-$714c,a5)
	bra.w loc_007668

;==============================================
loc_0054da:
	bsr.w loc_0078a4
	moveq #0,d0
	move.b (-$717b,a5),d0
	move.w loc_0054f2(pc,d0.w),d1
	jsr loc_0054f2(pc,d1.w)
	subq.w #2,(-$70f4,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0054f2:
	dc.w loc_0054fa-loc_0054f2
	dc.w loc_005516-loc_0054f2
	dc.w loc_005530-loc_0054f2
	dc.w loc_00553e-loc_0054f2

;==============================================
loc_0054fa:
	addq.b #2,(-$717b,a5)
	move.w #$1b0e,(-$716c,a5)
	move.w #$2461,(-$716a,a5)
	move.w #$91e0,(-$7166,a5)
	move.w #$ff80,(-$7130,a5)

loc_005516:
	bsr.w loc_007748
	bne.b loc_00552e
	addq.b #2,(-$717b,a5)
	move.w #$90c0,(-$7166,a5)
	cmpi.b #$3f,($17,a5)
	beq.b loc_005538

loc_00552e:
	rts

loc_005530:
	cmpi.b #$3f,($17,a5)
	bne.b loc_00553c

loc_005538:
	addq.b #2,(-$717b,a5)

loc_00553c:
	rts

;==============================================
loc_00553e:
	rts

;==============================================
loc_005540:
	cmp.b ($6eb9,a5),d7
	bhi.b loc_005566
	subq.w #1,d7
	lsl.w #2,d0
	lea loc_005568(pc,d0.w),a1

loc_00554e:
	movem.w (a1)+,d0-d1
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w d0,(2,a4)
	move.b d1,($3c,a4)
	dbra d7,loc_00554e

loc_005566:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_005568:
	dc.l $30000000,$30000001,$30010000,$30010001
	dc.l $30020000,$30020001,$30030000,$30030001
	dc.l $30040000,$30040001,$30050000,$30050001

;==============================================
loc_005598:
	move.b (-$717c,a5),d0
	move.w loc_0055a4(pc,d0.w),d1
	jmp loc_0055a4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0055a4:
	dc.w loc_0055a8-loc_0055a4
	dc.w loc_005668-loc_0055a4

;==============================================
loc_0055a8:
	move.b (-$717b,a5),d0
	move.w loc_0055b4(pc,d0.w),d1
	jmp loc_0055b4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0055b4:
	dc.w loc_0055b8-loc_0055b4
	dc.w loc_0055ca-loc_0055b4

;==============================================
loc_0055b8:
	addq.b #2,(-$717b,a5)
	move.w #$92a0,(-$7166,a5)
	move.w #$92a0,(-$7164,a5)
	rts

;==============================================
loc_0055ca:
	addq.b #2,(-$717c,a5)
	bsr.w loc_007ad2
	bsr.w loc_007ae4
	moveq #0,d0
	move.l d0,($14,a5)
	move.b d0,(-$717b,a5)
	move.l d0,(-$7128,a5)
	move.l d0,(-$7124,a5)
	move.l d0,(-$70f8,a5)
	move.l d0,(-$70f4,a5)
	move.l d0,(-$70c8,a5)
	move.l #$2000000,(-$70c4,a5)
	move.w d0,(-$7118,a5)
	move.w d0,(-$7116,a5)
	move.w d0,(-$70e8,a5)
	move.w d0,(-$70e6,a5)
	move.w d0,(-$70b8,a5)
	move.w d0,(-$70b6,a5)
	move.w #$90e0,(-$7168,a5)
	move.b d0,(-$7178,a5)
	jsr loc_01c2c8
	beq.b loc_00562e
	addq.b #1,(a4)
	move.w #$3100,(2,a4)

loc_00562e:
	moveq #2,d0
	bsr.w loc_0073c0
	moveq #0,d0
	bsr.w loc_007478
	lea loc_35c294,a0
	lea $90c020,a1
	moveq #1,d7
	jsr loc_01b7ce
	moveq #0,d0
	bsr.w loc_007b40
	lea loc_364914,a0
	lea $90cfe0,a1
	moveq #0,d7
	jmp loc_01b7ce

;==============================================
loc_005668:
	addq.b #1,(-$7178,a5)
	andi.b #7,(-$7178,a5)
	bne.b loc_005694
	jsr loc_01c2c8
	beq.b loc_005694
	addq.b #1,(a4)
	move.w #$3101,(2,a4)
	move.b (-$7177,a5),d0
	move.b d0,($3c,a4)
	bsr.w loc_005760
	move.b d0,(-$7177,a5)

loc_005694:
	lea (-$7128,a5),a4
	moveq #0,d0
	move.b (-$717b,a5),d0
	move.w loc_0056b4(pc,d0.w),d1
	jsr loc_0056b4(pc,d1.w)
	move.w (-$7124,a5),d0
	andi.w #$1ff,d0
	move.w d0,(-$70f4,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0056b4:
	dc.w loc_0056be-loc_0056b4
	dc.w loc_0056d4-loc_0056b4
	dc.w loc_005718-loc_0056b4
	dc.w loc_005746-loc_0056b4
	dc.w loc_005758-loc_0056b4

;==============================================
loc_0056be:
	addq.b #2,(-$717b,a5)
	move.w #$270e,(-$716c,a5)
	move.w #$2641,(-$716a,a5)
	move.w #$90c0,(-$7166,a5)

loc_0056d4:
	addq.b #2,(-$717b,a5)
	move.b ($dc,a5),d0
	move.b ($dd,a5),($dc,a5)
	move.b d0,(-$7177,a5)
	move.b d0,($17,a5)
	move.b d0,(-$7097,a5)
	move.b #0,(-$7098,a5)
	move.l #0,(4,a4)
	move.w #$22e8,($a,a4)
	move.w #$fc83,($e,a4)
	moveq #$14,d0
	moveq #0,d2
	moveq #0,d3
	lea $906000,a1
	bra.w loc_00739c

;==============================================
loc_005718:
	move.w ($a,a4),d0
	ext.l d0
	asl.l #8,d0
	sub.l d0,($4,a4)
	move.w ($e,a4),d0
	add.w d0,($a,a4)
	cmpi.w #$ff40,($4,a4)
	bgt.b loc_005744
	addq.b #2,(-$717b,a5)
	move.b #$b,(-$7176,a5)
	move.w #$ff40,($4,a4)

loc_005744:
	rts

;==============================================
loc_005746:
	subq.b #1,(-$7176,a5)
	bne.b loc_005756
	addq.b #2,(-$717b,a5)
	move.w #$fe80,(4,a4)

loc_005756:
	rts

;==============================================
loc_005758:
	move.b #2,(-$717b,a5)
	rts

;==============================================
loc_005760:
	move.b loc_005766(pc,d0.w),d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_005766:
	dc.b $01,$04,$0c,$09,$0b,$08,$03,$06,$07,$0a,$02,$05,$0f,$19,$0d,$10
	dc.b $11,$0e,$00,$00,$00,$00,$1b,$00,$1c,$18,$1d,$1a,$16,$00,$00,$00

;==============================================
loc_005786:
	move.b (-$717c,a5),d0
	move.w loc_005792(pc,d0.w),d1
	jmp loc_005792(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_005792:
	dc.w loc_005796-loc_005792
	dc.w loc_005966-loc_005792

;==============================================
loc_005796:
	move.b (-$717b,a5),d0
	move.w loc_0057a2(pc,d0.w),d1
	jmp loc_0057a2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0057a2:
	dc.w loc_0057a6-loc_0057a2
	dc.w loc_0057b8-loc_0057a2


;==============================================
loc_0057a6:
	addq.b #2,(-$717b,a5)
	move.w #$92a0,(-$7166,a5)
	move.w #$92a0,(-$7164,a5)
	rts

;==============================================
loc_0057b8:
	addq.b #2,(-$717c,a5)
	bsr.w loc_007ad2
	bsr.w loc_007ae4
	moveq #0,d0
	move.l d0,($14,a5)
	move.b d0,(-$717b,a5)
	move.w d0,(-$7118,a5)
	move.w d0,(-$7116,a5)
	move.w d0,(-$70e8,a5)
	move.w d0,(-$70e6,a5)
	move.w d0,(-$70b8,a5)
	move.w d0,(-$70b6,a5)
	move.l d0,($204,a5)
	move.l d0,($284,a5)
	move.l d0,($304,a5)
	move.l d0,($384,a5)
	bsr.w loc_005a2c
	cmpi.b #$e,($6eb9,a5)
	bcs.w loc_005924
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3206,(2,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3207,(2,a4)
	move.b #0,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3207,(2,a4)
	move.b #1,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3203,(2,a4)
	move.b #0,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3203,(2,a4)
	move.b #1,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3204,(2,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3205,(2,a4)
	move.b #0,($3c,a4)
	move.w a4,d0
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3205,(2,a4)
	move.b #$10,($3c,a4)
	move.w a4,d1
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3205,(2,a4)
	move.b #1,($3c,a4)
	move.w a4,d2
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3205,(2,a4)
	move.b #$11,($3c,a4)
	move.w a4,d3
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3202,(2,a4)
	lea (a4),a6
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3200,(2,a4)
	move.w a4,($36,a6)
	movea.w d0,a1
	move.w a4,($36,a1)
	movea.w d1,a1
	move.w a4,($36,a1)
	movea.w d2,a1
	move.w a4,($36,a1)
	movea.w d3,a1
	move.w a4,($36,a1)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3202,(2,a4)
	lea (a4),a6
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3201,(2,a4)
	move.w a4,($36,a6)

loc_005924:
	lea loc_35be34,a0
	lea $90c0c0,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_35c2d4,a0
	lea $90c0e0,a1
	moveq #1,d7
	jsr loc_01b7ce
	moveq #0,d0
	bsr.w loc_007b40
	lea loc_364934,a0
	lea $90cfe0,a1
	moveq #0,d7
	jmp loc_01b7ce

;==============================================
loc_005966:
	move.b (-$717b,a5),d0
	move.w loc_005972(pc,d0.w),d1
	jmp loc_005972(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_005972:
	dc.w loc_00597a-loc_005972
	dc.w loc_00598a-loc_005972
	dc.w loc_0059ce-loc_005972
	dc.w loc_005a2a-loc_005972

;==============================================
loc_00597a:
	addq.b #2,(-$717b,a5)
	move.b #2,(-$7177,a5)
	move.w #$90c0,(-$7166,a5)

loc_00598a:
	subq.b #1,(-$7177,a5)
	bne.b loc_0059cc
	addq.b #2,(-$717b,a5)
	move.b #4,(-$7177,a5)
	move.w #$2d0a,(-$716c,a5)
	move.w #$4621,(-$716a,a5)
	move.b #1,($15,a5)
	moveq #0,d0
	move.w #$600,(-$70c8,a5)
	move.w #$700,(-$70c4,a5)
	move.w d0,(-$70e8,a5)
	move.w #$200,(-$70e6,a5)
	move.w d0,(-$70b8,a5)
	move.w d0,(-$70b6,a5)

loc_0059cc
	rts

;==============================================
loc_0059ce:
	subq.b #1,(-$7177,a5)
	bne.b loc_005a24
	addq.b #2,(-$717b,a5)
	ori.w #4,(-$716c,a5)
	move.b #2,($15,a5)
	moveq #0,d0
	lea (-$70f8,a5),a0
	move.w d0,(2,a0)
	move.w d0,(6,a0)
	move.w d0,($12,a0)
	move.b ($17,a5),d0
	add.w d0,d0
	move.w loc_005a26(pc,d0.w),(a0)
	move.w #$300,(4,a0)
	move.b ($dc,a5),(-$7097,a5)
	move.b #0,(-$7098,a5)
	moveq #$10,d0
	moveq #0,d2
	move.b ($17,a5),d3
	lea $904600,a1
	bra.w loc_00737e

loc_005a24:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_005a26:
	dc.w $0090,$0170

;==============================================
loc_005a2a:
	rts

;==============================================
loc_005a2c:
	bsr.b loc_005aa0
	jsr loc_01fc38
	jsr loc_01fc54
	jsr loc_01fc70
	jsr loc_01fbe4
	jsr loc_01fc02
	jsr loc_017462
	move.w ($32,a5),(-$716c,a5)
	move.w ($3a,a5),(-$716a,a5)
	move.w (rasterram,a5),(-$7168,a5)
	move.w (-$7176,a5),d0
	lea ($200,a5),a0
	lea (-$7128,a5),a1
	bsr.b loc_005a84
	lea ($280,a5),a0
	lea (-$70f8,a5),a1
	bsr.b loc_005a84
	lea ($300,a5),a0
	lea (-$70c8,a5),a1

loc_005a84:
	move.l ($10,a0),(a1)
	move.l ($14,a0),(4,a1)
	move.w ($58,a0),($10,a1)
	move.w ($5a,a0),($12,a1)
	add.w d0,(4,a1)
	rts

;==============================================
loc_005aa0:
	move.w (-$7182,a5),d0
	move.b d0,($16,a5)
	move.w loc_005aec(pc,d0.w),(-$7176,a5)
	add.w d0,d0
	move.w loc_005acc(pc,d0.w),($dc,a5)
	move.b loc_005acc+2(pc,d0.w),($17,a5)
	move.b loc_005acc+3(pc,d0.w),d0
	move.w d0,(stageid,a5)
	move.w #2,($102,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_005acc:
	dc.w $0100,$0002,$1d0d,$013a,$1b07,$0136,$190c,$0132
	dc.w $160a,$0014,$1806,$0030,$1c08,$0138,$1a10,$0034

loc_005aec:
	dc.w $fff8,$ffe0,$ffe8,$ffe0,$ffe0,$ffe0,$0000,$0008

;==============================================
loc_005afc:
	move.b (-$717c,a5),d0
	move.w loc_005b08(pc,d0.w),d1
	jmp loc_005b08(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_005b08:
	dc.w loc_005b0c-loc_005b08
	dc.w loc_005c5e-loc_005b08

;==============================================
loc_005b0c:
	move.b (-$717b,a5),d0
	move.w loc_005b18(pc,d0.w),d1
	jmp loc_005b18(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_005b18:
	dc.w loc_005b1c-loc_005b18
	dc.w loc_005b2e-loc_005b18

;==============================================
loc_005b1c:
	addq.b #2,(-$717b,a5)
	move.w #$92a0,(-$7166,a5)
	move.w #$92a0,(-$7164,a5)
	rts

;==============================================
loc_005b2e:
	addq.b #2,(-$717c,a5)
	bsr.w loc_007ad2
	bsr.w loc_007ae4
	moveq #0,d0
	move.l d0,($14,a5)
	move.b d0,(-$717b,a5)
	move.l d0,(-$7128,a5)
	move.l d0,(-$7124,a5)
	move.l #$400000,(-$70f8,a5)
	move.l d0,(-$70f4,a5)
	move.l d0,(-$70c8,a5)
	move.l #$2000000,(-$70c4,a5)
	move.w d0,(-$7118,a5)
	move.w d0,(-$7116,a5)
	move.w d0,(-$70e8,a5)
	move.w d0,(-$70e6,a5)
	move.w d0,(-$70b8,a5)
	move.w d0,(-$70b6,a5)
	move.w #$90e0,(-$7168,a5)
	move.b ($dc,a5),d0
	move.b d0,d1
	andi.b #1,d0
	move.b d0,($17,a5)
	andi.b #6,d1
	move.b d1,($16,a5)
	cmpi.b #6,($6eb9,a5)
	bcs.b loc_005c12
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3300,($2,a4)
	clr.b ($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3301,($2,a4)
	clr.b ($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3302,($2,a4)
	clr.b ($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3300,($2,a4)
	move.b #1,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3301,($2,a4)
	move.b #1,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3302,($2,a4)
	move.b #1,($3c,a4)

loc_005c12:
	bsr.w loc_005cce
	moveq #0,d0
	bsr.w loc_007478
	lea loc_35c3d4,a0
	lea $90c000,a1
	moveq #1,d7
	jsr loc_01b7ce
	lea loc_35fa74,a0
	lea $90c040,a1
	moveq #0,d7
	jsr loc_01b7ce
	moveq #0,d0
	bsr.w loc_007b40
	lea loc_364954,a0
	lea $90cfe0,a1
	moveq #0,d7
	jmp loc_01b7ce

;==============================================
loc_005c5e:
	bsr.w loc_005d8a
	moveq #0,d0
	move.b (-$717b,a5),d0
	move.w loc_005c70(pc,d0.w),d1
	jmp loc_005c70(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_005c70:
	dc.w loc_005c78-loc_005c70
	dc.w loc_005ca6-loc_005c70
	dc.w loc_005ca6-loc_005c70
	dc.w loc_005cba-loc_005c70

;==============================================
loc_005c78:
	addq.b #2,(-$717b,a5)
	move.b #7,(-$7178,a5)
	move.w #$2d0e,(-$716c,a5)
	move.w #$4621,(-$716a,a5)
	move.w #$90c0,(-$7166,a5)
	move.b ($dd,a5),($15,a5)
	tst.w (-$7182,a5)
	beq.b loc_005ca6
	addq.b #4,(-$717b,a5)
	bra.b loc_005cba

loc_005ca6:
	subq.b #1,(-$7178,a5)
	bne.b loc_005cba
	addq.b #2,(-$717b,a5)
	move.b #7,(-$7178,a5)
	addq.b #1,($15,a5)

loc_005cba:
	moveq #0,d0
	move.b ($15,a5),d0
	move.w d0,d1
	lsl.w #6,d0
	lsl.w #3,d1
	add.w d1,d0
	move.w d0,(-$70f4,a5)
	rts

;==============================================
loc_005cce:
	moveq #0,d0
	move.b ($16,a5),d0
	move.w loc_005cdc(pc,d0.w),d1
	jmp loc_005cdc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_005cdc:
	dc.w loc_005ce2-loc_005cdc
	dc.w loc_005cfe-loc_005cdc
	dc.w loc_005d24-loc_005cdc

;==============================================
loc_005ce2:
	moveq #$1a,d0
	moveq #0,d1
	moveq #0,d2
	moveq #0,d3
	lea $907108,a1
	bsr.w loc_0074fc
	move.b #0,(-$712b,a5)
	bra.w loc_005da4

;==============================================
loc_005cfe:
	moveq #$1a,d0
	moveq #1,d1
	moveq #0,d2
	moveq #0,d3
	lea $907008,a1
	bsr.w loc_0074fc
	lea loc_363c34,a0
	lea $90c800,a1
	moveq #0,d7
	jmp loc_01b7ce

;==============================================
loc_005d24:
	moveq #$1a,d0
	moveq #2,d1
	moveq #0,d2
	moveq #0,d3
	lea $907108,a1
	bsr.w loc_0074fc
	moveq #$1a,d0
	moveq #3,d1
	moveq #0,d2
	moveq #0,d3
	lea $906108,a1
	bsr.w loc_0074fc
	moveq #$1a,d0
	moveq #4,d1
	moveq #0,d2
	moveq #0,d3
	lea $905108,a1
	bsr.w loc_0074fc
	moveq #$1a,d0
	moveq #5,d1
	moveq #0,d2
	moveq #0,d3
	lea $904108,a1
	bsr.w loc_0074fc
	lea loc_346ff4,a0
	lea $90c840,a1
	moveq #$1d,d7
	jsr loc_01b7ce
	move.b #0,(-$712b,a5)
	bra.w loc_005e02

;==============================================
loc_005d8a:
	moveq #0,d0
	move.b ($16,a5),d0
	move.w loc_005d98(pc,d0.w),d1
	jmp loc_005d98(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_005d98:
	dc.w loc_005d9e-loc_005d98
	dc.w loc_005dde-loc_005d98
	dc.w loc_005dfc-loc_005d98

;==============================================
loc_005d9e:
	subq.b #1,(-$712c,a5)
	bne.b loc_005dcc

loc_005da4:
	moveq #0,d0
	move.b (-$712b,a5),d0
	move.w loc_005dce(pc,d0.w),(-$712c,a5)
	move.w loc_005dce+2(pc,d0.w),d0
	lea loc_363574,a0
	lea (a0,d0.w),a0
	lea $90c800,a1
	moveq #0,d7
	jmp loc_01b7ce

loc_005dcc:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_005dce:
	dc.w $0204,$0000,$0208,$0020,$020c,$0040,$0200,$0060

;==============================================
loc_005dde:
	lea $90e640,a0
	moveq #$2f,d6

loc_005de6:
	jsr RNGFunction
	andi.w #$7f,d0
	addi.w #$80,d0
	move.w d0,(a0)+
	dbra d6,loc_005de6
	rts

;==============================================
loc_005dfc:
	subq.b #1,(-$712c,a5)
	bne.b loc_005e18

loc_005e02:
	moveq #0,d0
	lea (-$70f8,a5),a0
	move.b (-$712b,a5),d0
	move.w loc_005e1a(pc,d0.w),(-$712c,a5)
	move.w loc_005e1a+2(pc,d0.w),($12,a0)

loc_005e18:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_005e1a:
	dc.w $0104,$0000,$0108,$0100,$010c,$0200,$0100,$0300

;==============================================
loc_005e2a:
	move.w (-$7182,a5),d0
	move.w loc_005e36(pc,d0.w),d1
	jmp loc_005e36(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_005e36:
	dc.w loc_005e3c-loc_005e36
	dc.w loc_006062-loc_005e36
	dc.w loc_006214-loc_005e36

;==============================================
loc_005e3c:
	move.b (-$717c,a5),d0
	move.w loc_005e48(pc,d0.w),d1
	jmp loc_005e48(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_005e48:
	dc.w loc_005e4c-loc_005e48
	dc.w loc_005fb8-loc_005e48

;==============================================
loc_005e4c:
	move.b (-$717b,a5),d0
	move.w loc_005e58(pc,d0.w),d1
	jmp loc_005e58(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_005e58:
	dc.w loc_005e5c-loc_005e58
	dc.w loc_005e6e-loc_005e58

;==============================================
loc_005e5c:
	addq.b #2,(-$717b,a5)
	move.w #$92a0,(-$7166,a5)
	move.w #$92a0,(-$7164,a5)
	rts

;==============================================
loc_005e6e:
	addq.b #2,(-$717c,a5)
	bsr.w loc_007ad2
	bsr.w loc_007ae4
	moveq #0,d0
	move.l d0,($14,a5)
	move.b d0,(-$717b,a5)
	move.l d0,(-$7128,a5)
	move.l d0,(-$7124,a5)
	move.l d0,(-$70f8,a5)
	move.l d0,(-$70f4,a5)
	move.l d0,(-$70c8,a5)
	move.l #$2000000,(-$70c4,a5)
	move.w d0,(-$7118,a5)
	move.w d0,(-$7116,a5)
	move.w d0,(-$70e8,a5)
	move.w d0,(-$70e6,a5)
	move.w d0,(-$70b8,a5)
	move.w d0,(-$70b6,a5)
	move.w #$90e0,(-$7168,a5)
	move.b #$1f,($17,a5)
	cmpi.b #6,($6eb9,a5)
	bcs.b loc_005f20
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3400,(2,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3401,(2,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3402,(2,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3403,(2,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3404,(2,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3405,(2,a4)

loc_005f20:
	moveq #0,d0
	moveq #0,d1
	lea $902000,a1
	bsr.w loc_007590
	moveq #1,d0
	bsr.w loc_007414
	moveq #0,d0
	bsr.w loc_007478
	movea.l loc_339838,a0
	lea ($20,a0),a0
	lea $90c020,a1
	moveq #0,d7
	jsr loc_01b7ce
	movea.l loc_33979c,a0
	lea ($e0,a0),a0
	lea $90c0e0,a1
	moveq #5,d7
	jsr loc_01b7ce
	moveq #0,d0
	bsr.w loc_007b40
	lea loc_3629f4,a0
	lea $90c400,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_345bd4,a0
	move.w (a0),d0
	lea (a0,d0.w),a0
	lea $90c800,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_349cb4,a0
	move.w (a0),d0
	lea (a0,d0.w),a0
	lea $90cfe0,a1
	moveq #0,d7
	jmp loc_01b7ce

;==============================================
loc_005fb8:
	move.b (-$717b,a5),d0
	move.w loc_005fc4(pc,d0.w),d1
	jmp loc_005fc4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_005fc4:
	dc.w loc_005fca-loc_005fc4
	dc.w loc_005fee-loc_005fc4
	dc.w loc_006048-loc_005fc4

;==============================================
loc_005fca:
	addq.b #2,(-$717b,a5)
	move.b #$2a,(-$7177,a5)
	move.w #$1b0e,(-$716c,a5)
	move.w #$2461,(-$716a,a5)
	move.w #$90c0,(-$7166,a5)
	move.w #$400,(-$7176,a5)
	bra.b loc_006030

loc_005fee:
	subq.b #1,(-$7177,a5)
	bne.b loc_006014
	addq.b #2,(-$717b,a5)
	move.b #$20,($17,a5)
	moveq #0,d0
	move.w d0,(-$70f8,a5)
	move.w #$200,(-$70f4,a5)
	move.w d0,(-$70e8,a5)
	move.w d0,(-$70e6,a5)
	bra.b loc_006048

loc_006014:
	subq.b #1,(-$7176,a5)
	bne.b loc_006048
	move.b #4,(-$7176,a5)
	addq.b #1,(-$7175,a5)
	cmpi.b #6,(-$7175,a5)
	bcs.b loc_006030
	clr.b (-$7175,a5)

loc_006030:
	moveq #0,d0
	move.b (-$7175,a5),d0
	lsl.w #2,d0
	lea (-$70f8,a5),a0
	move.w loc_00604a(pc,d0.w),($10,a0)
	move.w loc_00604a+2(pc,d0.w),($12,a0)

loc_006048:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00604a:
	dc.w $0080,$0040,$0080,$ffc0,$0000,$0140
	dc.w $0000,$00c0,$0180,$0140,$0180,$00c0

;==============================================
loc_006062:
	move.b (-$717c,a5),d0
	move.w loc_00606e(pc,d0.w),d1
	jmp loc_00606e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00606e:
	dc.w loc_006072-loc_00606e
	dc.w loc_006194-loc_00606e

;==============================================
loc_006072:
	move.b (-$717b,a5),d0
	move.w loc_00607e(pc,d0.w),d1
	jmp loc_00607e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00607e:
	dc.w loc_006082-loc_00607e
	dc.w loc_006094-loc_00607e

;==============================================
loc_006082:
	addq.b #2,(-$717b,a5)
	move.w #$92a0,(-$7166,a5)
	move.w #$92a0,(-$7164,a5)
	rts

;==============================================
loc_006094:
	addq.b #2,(-$717c,a5)
	bsr.w loc_007ad2
	bsr.w loc_007ae4
	moveq #0,d0
	move.l d0,($14,a5)
	move.b d0,(-$717b,a5)
	move.l d0,(-$7128,a5)
	move.l d0,(-$7124,a5)
	move.l d0,(-$70f8,a5)
	move.l d0,(-$70f4,a5)
	move.l #$3000000,(-$70c8,a5)
	move.l #$1000000,(-$70c4,a5)
	move.w d0,(-$7118,a5)
	move.w d0,(-$7116,a5)
	move.w d0,(-$70e8,a5)
	move.w d0,(-$70e6,a5)
	move.w d0,(-$70b8,a5)
	move.w d0,(-$70b6,a5)
	move.w #$90e0,(-$7168,a5)
	move.b #$c0,($17,a5)
	cmpi.b #2,($6eb9,a5)
	bcs.b loc_006112
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3406,(2,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3407,(2,a4)

loc_006112:
	moveq #1,d0
	moveq #0,d1
	lea $902000,a1
	bsr.w loc_007590
	moveq #0,d0
	bsr.w loc_007478
	movea.l loc_33977c,a0
	lea ($a0,a0),a0
	lea $90c0a0,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_360774,a0
	lea $90c0c0,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_366b14,a0
	lea $90c1e0,a1
	moveq #0,d7
	jsr loc_01b7ce
	moveq #0,d0
	bsr.w loc_007b40
	lea loc_3629f4,a0
	lea $90c400,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_366594,a0
	lea $90cfe0,a1
	moveq #0,d7
	jmp loc_01b7ce

;==============================================
loc_006194:
	move.b (-$717b,a5),d0
	move.w loc_0061a0(pc,d0.w),d1
	jmp loc_0061a0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0061a0:
	dc.w loc_0061a6-loc_0061a0
	dc.w loc_0061c6-loc_0061a0
	dc.w loc_006202-loc_0061a0

;==============================================
loc_0061a6:
	addq.b #2,(-$717b,a5)
	move.b #$2e,(-$7177,a5)
	move.w #$1e0e,(-$716c,a5)
	move.w #$4261,(-$716a,a5)
	move.w #$90c0,(-$7166,a5)
	moveq #0,d0
	bra.b loc_0061e6

loc_0061c6:
	subq.b #1,(-$7177,a5)
	bne.b loc_0061d4
	addq.b #2,(-$717b,a5)
	moveq #8,d0
	bra.b loc_0061e6

loc_0061d4:
	cmpi.b #8,(-$7177,a5)
	bcc.b loc_006202
	move.b (-$7177,a5),d0
	andi.w #1,d0
	lsl.w #3,d0

loc_0061e6:
	lea (-$7128,a5),a1
	lea (-$70c8,a5),a3
	move.w loc_006204(pc,d0.w),(a1)
	move.w loc_006204+2(pc,d0.w),(4,a1)
	move.w loc_006204+4(pc,d0.w),(a3)
	move.w loc_006204+6(pc,d0.w),(4,a3)

loc_006202
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_006204:
	dc.w $0000,$0000,$0300,$0100
	dc.w $0000,$0100,$0200,$0000

;==============================================
loc_006214:
	move.b (-$717c,a5),d0
	move.w loc_006220(pc,d0.w),d1
	jmp loc_006220(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_006220:
	dc.w loc_006224-loc_006220
	dc.w loc_00630e-loc_006220

;==============================================
loc_006224:
	move.b (-$717b,a5),d0
	move.w loc_006230(pc,d0.w),d1
	jmp loc_006230(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_006230:
	dc.w loc_006234-loc_006230
	dc.w loc_006246-loc_006230

;==============================================
loc_006234:
	addq.b #2,(-$717b,a5)
	move.w #$92a0,(-$7166,a5)
	move.w #$92a0,(-$7164,a5)
	rts

;==============================================
loc_006246:
	addq.b #2,(-$717c,a5)
	bsr.w loc_007ad2
	bsr.w loc_007ae4
	moveq #0,d0
	move.l d0,($14,a5)
	move.b d0,(-$717b,a5)
	move.l d0,(-$7128,a5)
	move.l d0,(-$7124,a5)
	move.l d0,(-$70f8,a5)
	move.l d0,(-$70f4,a5)
	move.l #$5000000,(-$70c8,a5)
	move.l d0,(-$70c4,a5)
	move.w d0,(-$7118,a5)
	move.w d0,(-$7116,a5)
	move.w d0,(-$70e8,a5)
	move.w d0,(-$70e6,a5)
	move.w d0,(-$70b8,a5)
	move.w d0,(-$70b6,a5)
	move.w #$90e0,(-$7168,a5)
	move.b d0,($17,a5)
	jsr loc_01c2c8
	beq.b loc_0062aa
	addq.b #1,(a4)
	move.w #$3408,(2,a4)

loc_0062aa:
	moveq #0,d0
	moveq #0,d1
	lea $902000,a1
	bsr.w loc_0075be
	moveq #0,d0
	bsr.w loc_007478
	movea.l loc_339774,a0
	lea ($100,a0),a0
	lea $90c000,a1
	moveq #0,d7
	jsr loc_01b7ce
	moveq #0,d0
	bsr.w loc_007b40
	lea loc_3629f4,a0
	lea $90c400,a1
	moveq #0,d7
	jsr loc_01b7ce
	move.b #0,(-$712b,a5)
	bra.w loc_0078aa

loc_0062fa:
	lea loc_366594,a0
	lea $90cfe0,a1
	moveq #0,d7
	jmp loc_01b7ce

;==============================================
loc_00630e:
	move.b (-$7177,a5),d0
	move.w loc_00631a(pc,d0.w),d1
	jmp loc_00631a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00631a:
	dc.w loc_00631e-loc_00631a
	dc.w loc_006334-loc_00631a

;==============================================
loc_00631e:
	addq.b #2,(-$717b,a5)
	move.w #$1e0e,(-$716c,a5)
	move.w #$4261,(-$716a,a5)
	move.w #$90c0,(-$7166,a5)

loc_006334:
	bra.w loc_0078a4

;==============================================
loc_006338:
	move.b (-$7174,a5),d0
	move.w loc_006344(pc,d0.w),d1
	jmp loc_006344(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_006344:
	dc.w loc_006348-loc_006344
	dc.w loc_0064ca-loc_006344

;==============================================
loc_006348:
	move.b (-$7173,a5),d0
	move.w loc_006354(pc,d0.w),d1
	jmp loc_006354(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_006354:
	dc.w loc_006358-loc_006354
	dc.w loc_00636a-loc_006354

;==============================================
loc_006358:
	addq.b #2,(-$7173,a5)
	move.w #$92a0,(-$715e,a5)
	move.w #$92a0,(-$715c,a5)
	rts

;==============================================
loc_00636a:
	addq.b #2,(-$7174,a5)
	bsr.w loc_007ade
	bsr.w loc_007b02
	moveq #0,d0
	move.l d0,($10,a5)
	move.b d0,(-$7173,a5)
	move.l d0,(-$7110,a5)
	move.l d0,(-$710c,a5)
	move.l d0,(-$70e0,a5)
	move.l d0,(-$70dc,a5)
	move.l d0,(-$70b0,a5)
	move.l #$2000000,(-$70ac,a5)
	move.w d0,(-$7100,a5)
	move.w d0,(-$70fe,a5)
	move.w d0,(-$70d0,a5)
	move.w d0,(-$70ce,a5)
	move.w d0,(-$70a0,a5)
	move.w d0,(-$709e,a5)
	move.b #2,(-$7098,a5)
	cmpi.b #$a,($6eba,a5)
	bcs.b loc_00643e
	moveq #4,d0
	moveq #3,d1
	tst.w (-$717e,a5)
	beq.b loc_0063d0
	moveq #$f,d0
	moveq #$10,d1

loc_0063d0:
	jsr loc_01c318
	addq.b #1,(a4)
	move.w #$2000,(2,a4)
	move.b d0,($3c,a4)
	jsr loc_01c318
	addq.b #1,(a4)
	move.w #$2001,(2,a4)
	move.b d1,($3c,a4)
	moveq #2,d6

loc_0063f6:
	jsr loc_01c318
	addq.b #1,(a4)
	move.w #$2002,(2,a4)
	move.b d6,($3c,a4)
	dbra d6,loc_0063f6
	moveq #3,d6
	move.l #$4030f10,d5

loc_006414
	jsr loc_01c318
	addq.b #1,(a4)
	move.w #$2003,(2,a4)
	move.b d6,($a,a4)
	move.b d5,($3c,a4)
	ror.l #8,d5
	dbra d6,loc_006414
	jsr loc_01c318
	addq.b #1,(a4)
	move.w #$2004,(2,a4)

loc_00643e:
	moveq #$16,d0
	move.b #4,(-$7097,a5)
	moveq #0,d2
	moveq #1,d3
	lea $917004,a1
	bsr.w loc_00737e
	moveq #$16,d0
	move.b #3,(-$7097,a5)
	moveq #4,d2
	moveq #0,d3
	lea $917184,a1
	bsr.w loc_00737e
	moveq #$16,d0
	move.b #$f,(-$7097,a5)
	moveq #8,d2
	moveq #1,d3
	lea $917304,a1
	bsr.w loc_00737e
	moveq #$16,d0
	move.b #$10,(-$7097,a5)
	moveq #$c,d2
	moveq #0,d3
	lea $917484,a1
	bsr.w loc_00737e
	moveq #0,d0
	bsr.w loc_00749a
	lea loc_35fa94,a0
	lea $91c000,a1
	moveq #0,d7
	jsr loc_01b7ce
	moveq #2,d0
	bsr.w loc_007b40
	lea loc_364974,a0
	lea $91cfe0,a1
	moveq #0,d7
	jmp loc_01b7ce

;==============================================
loc_0064ca:
	move.b (-$7173,a5),d0
	move.w loc_0064d6(pc,d0.w),d1
	jmp loc_0064d6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0064d6:
	dc.w loc_0064da-loc_0064d6
	dc.w loc_0064f0-loc_0064d6

;==============================================
loc_0064da
	addq.b #2,(-$7173,a5)
	move.w #$2d0e,(-$7162,a5)
	move.w #$4621,(-$7160,a5)
	move.w #$91c0,(-$715e,a5)

loc_0064f0:
	rts

;==============================================
loc_0064f2:
	move.b (-$7174,a5),d0
	move.w loc_0064fe(pc,d0.w),d1
	jmp loc_0064fe(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0064fe:
	dc.w loc_006502-loc_0064fe
	dc.w loc_0066b8-loc_0064fe

;==============================================
loc_006502:
	move.b (-$7173,a5),d0
	move.w loc_00650e(pc,d0.w),d1
	jmp loc_00650e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00650e:
	dc.w loc_006512-loc_00650e
	dc.w loc_006524-loc_00650e

;==============================================
loc_006512:
	addq.b #2,(-$7173,a5)
	move.w #$92a0,(-$715e,a5)
	move.w #$92a0,(-$715c,a5)
	rts

;==============================================
loc_006524:
	addq.b #2,(-$7174,a5)
	bsr.w loc_007ade
	bsr.w loc_007b02
	moveq #0,d0
	move.l d0,($10,a5)
	move.b d0,(-$7173,a5)
	move.l d0,(-$7110,a5)
	move.l d0,(-$710c,a5)
	move.l #$2100000,(-$70e0,a5)
	move.l #$1000000,(-$70dc,a5)
	move.l #$6800000,(-$70b0,a5)
	move.l d0,(-$70ac,a5)
	move.w d0,(-$7100,a5)
	move.w d0,(-$70fe,a5)
	move.w d0,(-$70d0,a5)
	move.w d0,(-$70ce,a5)
	move.w d0,(-$70a0,a5)
	move.w d0,(-$709e,a5)
	move.w d0,($12,a5)
	cmpi.b #$10,($6eb9,a5)
	bcs.w loc_006604
	jsr loc_01c318
	addq.b #1,(a4)
	move.w #$2105,(2,a4)
	move.b #0,($3c,a4)
	jsr loc_01c318
	addq.b #1,(a4)
	move.w #$2105,(2,a4)
	move.b #1,($3c,a4)
	jsr loc_01c318
	addq.b #1,(a4)
	move.w #$2102,(2,a4)
	jsr loc_01c318
	addq.b #1,(a4)
	move.w #$2101,(2,a4)
	jsr loc_01c318
	addq.b #1,(a4)
	move.w #$2100,(2,a4)
	moveq #9,d6
	lea (-$70e0,a5),a6

loc_0065dc:
	jsr loc_01c318
	addq.b #1,(a4)
	move.w #$2104,(2,a4)
	move.b d6,($3c,a4)
	move.l a6,($60,a4)
	dbra d6,loc_0065dc
	jsr loc_01c318
	addq.b #1,(a4)
	move.w #$2103,(2,a4)

loc_006604:
	moveq #1,d0
	bsr.w loc_0073e2
	moveq #0,d0
	bsr.w loc_007436
	moveq #0,d0
	bsr.w loc_00749a
	lea loc_35be74,a0
	lea $91c000,a1
	moveq #3,d7
	jsr loc_01b7ce
	lea loc_35c314,a0
	lea $91c080,a1
	moveq #5,d7
	jsr loc_01b7ce
	lea loc_35be54,a0
	lea $91c140,a1
	moveq #0,d7
	jsr loc_01b7ce
	moveq #2,d0
	bsr.w loc_007b40
	lea loc_3401d4,a0
	lea $91c480,a1
	moveq #9,d7
	jsr loc_01b7ce
	lea loc_363c54,a0
	lea $91c800,a1
	moveq #3,d7
	jsr loc_01b7ce
	lea loc_34a034,a0
	lea $91cc80,a1
	moveq #1,d7
	jsr loc_01b7ce
	move.b #1,(-$7129,a5)
	bsr.w loc_0079bc
	moveq #0,d0
	move.l d0,(-$7148,a5)
	move.l d0,(-$7144,a5)
	move.l d0,(-$7140,a5)
	move.l #$80000030,(-$713c,a5)
	bra.w loc_007602

;==============================================
loc_0066b8:
	move.b (-$7173,a5),d0
	move.w loc_0066c4(pc,d0.w),d1
	jmp loc_0066c4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0066c4:
	dc.w loc_0066d4-loc_0066c4
	dc.w loc_0066ea-loc_0066c4
	dc.w loc_006700-loc_0066c4
	dc.w loc_006744-loc_0066c4
	dc.w loc_006764-loc_0066c4
	dc.w loc_00679c-loc_0066c4
	dc.w loc_0067d6-loc_0066c4
	dc.w loc_006842-loc_0066c4

;==============================================
loc_0066d4:
	addq.b #2,(-$7173,a5)
	move.w #$270e,(-$7162,a5)
	move.w #$2641,(-$7160,a5)
	move.w #$91c0,(-$715e,a5)

loc_0066ea:
	cmpi.b #7,($b,a5)
	bcs.b loc_0066fc
	addq.b #2,(-$7173,a5)
	move.w #$fe80,(-$70d8,a5)

loc_0066fc:
	bra.w loc_0079b6

;==============================================
loc_006700:
	lea (-$70e0,a5),a0
	move.w (8,a0),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,(a0)
	tst.w (a0)
	bgt.b loc_006720
	addq.b #2,(-$7173,a5)
	clr.l (a0)
	ori.w #$3ff,($12,a5)
	bra.b loc_006740

loc_006720:
	move.b ($81,a5),d0
	andi.w #7,d0
	bne.b loc_006740
	jsr RNGFunction
	andi.w #$f,d0
	moveq #0,d1
	bset d0,d1
	andi.w #$3ff,d1
	or.w d1,($12,a5)

loc_006740:
	bra.w loc_0079b6

;==============================================
loc_006744:
	cmpi.b #$18,($b,a5)
	bcs.b loc_006760
	addq.b #2,(-$7173,a5)
	ori.w #$8000,($12,a5)
	move.b #$1c,(-$7129,a5)
	bra.w loc_0079bc

loc_006760:
	bra.w loc_0079b6

;==============================================
loc_006764:
	cmpi.b #$ff,(-$7129,a5)
	bne.b loc_006798
	addq.b #2,(-$7173,a5)
	move.l #$6000000,(-$70b0,a5)
	move.l #$1000000,(-$70ac,a5)
	clr.w (-$7134,a5)
	move.w #$100,(-$712e,a5)
	move.l #$30,(-$713c,a5)
	move.w #$92c0,(-$715e,a5)

loc_006798:
	bra.w loc_0079b6

;==============================================
loc_00679c:
	bsr.w loc_0076e2
	bne.b loc_0067d4
	addq.b #2,(-$7173,a5)
	clr.b (-$716f,a5)
	move.w #$91c0,(-$715e,a5)
	move.w #$2d2d,(-$7106,a5)
	move.w #$fd2e,(-$7102,a5)
	move.w #$12d2,(-$70d6,a5)
	move.w #$fed3,(-$70d2,a5)
	move.w #$2d2d,(-$70a6,a5)
	move.w #$fd2e,(-$70a2,a5)

loc_0067d4:
	rts

;==============================================
loc_0067d6:
	btst.b #0,(-$716f,a5)
	bne.b loc_0067f6
	move.w #$140,d1
	lea (-$7110,a5),a4
	bsr.w loc_006844
	bhi.b loc_0067f6
	bset.b #0,(-$716f,a5)
	move.w d1,(4,a4)

loc_0067f6:
	btst.b #1,(-$716f,a5)
	bne.b loc_006816
	move.w #$1a0,d1
	lea (-$70e0,a5),a4
	bsr.w loc_006844
	bhi.b loc_006816
	bset.b #1,(-$716f,a5)
	move.w d1,(4,a4)

loc_006816:
	btst.b #2,(-$716f,a5)
	bne.b loc_006836
	move.w #$280,d1
	lea (-$70b0,a5),a4
	bsr.w loc_006844
	bhi.b loc_006836
	bset.b #2,(-$716f,a5)
	move.w d1,(4,a4)

loc_006836:
	cmpi.b #7,(-$716f,a5)
	bne.b loc_006842
	addq.b #2,(-$7173,a5)

loc_006842:
	rts

;==============================================
loc_006844:
	move.w ($a,a4),d0
	ext.l d0
	asl.l #8,d0
	add.l d0,(4,a4)
	move.w ($e,a4),d0
	add.w d0,($a,a4)
	cmp.w (4,a4),d1
	rts

;==============================================
loc_00685e:
	move.b (-$717c,a5),d0
	move.w loc_00686a(pc,d0.w),d1
	jmp loc_00686a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00686a:
	dc.w loc_00686e-loc_00686a
	dc.w loc_00693a-loc_00686a

;==============================================
loc_00686e:
	move.b (-$717b,a5),d0
	move.w loc_00687a(pc,d0.w),d1
	jmp loc_00687a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00687a:
	dc.w loc_00687e-loc_00687a
	dc.w loc_006890-loc_00687a

;==============================================
loc_00687e:
	addq.b #2,(-$717b,a5)
	move.w #$92a0,(-$7166,a5)
	move.w #$92a0,(-$7164,a5)
	rts

;==============================================
loc_006890:
	addq.b #2,(-$717c,a5)
	bsr.w loc_007ad2
	bsr.w loc_007ae4
	moveq #0,d0
	move.l d0,($14,a5)
	move.b d0,(-$717b,a5)
	move.l d0,(-$7128,a5)
	move.l d0,(-$7124,a5)
	move.l d0,(-$70f8,a5)
	move.l d0,(-$70f4,a5)
	move.l d0,(-$70c8,a5)
	move.l #$2000000,(-$70c4,a5)
	move.w d0,(-$7118,a5)
	move.w d0,(-$7116,a5)
	move.w d0,(-$70e8,a5)
	move.w d0,(-$70e6,a5)
	move.w d0,(-$70b8,a5)
	move.w d0,(-$70b6,a5)
	move.w #$90e0,(-$7168,a5)
	jsr loc_01c2c8
	beq.b loc_0068f8
	addq.b #1,(a4)
	move.b #$35,(2,a4)
	move.w (-$7182,a5),d0
	move.b d0,(3,a4)

loc_0068f8:
	moveq #0,d0
	bsr.w loc_007478
	move.w #$4e,d0
	add.w (-$7182,a5),d0
	lsl.w #5,d0
	lea loc_35f114,a0
	lea (a0,d0.w),a0
	lea $90c000,a1
	moveq #0,d7
	jsr loc_01b7ce
	moveq #0,d0
	bsr.w loc_007b40
	lea loc_35fa94,a0
	lea $90cfe0,a1
	moveq #0,d7
	jmp loc_01b7ce

;==============================================
loc_00693a:
	move.b (-$7177,a5),d0
	move.w loc_006946(pc,d0.w),d1
	jmp loc_006946(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_006946:
	dc.w loc_00694a-loc_006946
	dc.w loc_006960-loc_006946

;==============================================
loc_00694a:
	addq.b #2,(-$717b,a5)
	move.w #$1e0e,(-$716c,a5)
	move.w #$4261,(-$716a,a5)
	move.w #$90c0,(-$7166,a5)

loc_006960:
	rts

;==============================================
loc_006962:
	move.w (-$7182,a5),d0
	move.w loc_00696e(pc,d0.w),d1
	jmp loc_00696e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00696e:
	dc.w loc_006974-loc_00696e
	dc.w loc_006d14-loc_00696e
	dc.w loc_007008-loc_00696e

;==============================================
loc_006974:
	move.b (-$717c,a5),d0
	move.w loc_006980(pc,d0.w),d1
	jmp loc_006980(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_006980:
	dc.w loc_006984-loc_006980
	dc.w loc_006bd0-loc_006980

;==============================================
loc_006984:
	move.b (-$717b,a5),d0
	move.w loc_006990(pc,d0.w),d1
	jmp loc_006990(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_006990:
	dc.w loc_006994-loc_006990
	dc.w loc_0069a6-loc_006990

;==============================================
loc_006994:
	addq.b #2,(-$717b,a5)
	move.w #$92a0,(-$7166,a5)
	move.w #$92a0,(-$7164,a5)

loc_0069a4:
	rts

;==============================================
loc_0069a6:
	addq.b #2,(-$717c,a5)
	bsr.w loc_007ad2
	bsr.w loc_007ae4
	moveq #0,d0
	move.l d0,($14,a5)
	move.b d0,(-$717b,a5)
	move.l d0,(-$7128,a5)
	move.l d0,(-$7124,a5)
	move.l d0,(-$70f8,a5)
	move.l d0,(-$70f4,a5)
	move.l d0,(-$70c8,a5)
	move.l d0,(-$70c4,a5)
	move.w d0,(-$7118,a5)
	move.w d0,(-$7116,a5)
	move.w d0,(-$70e8,a5)
	move.w d0,(-$70e6,a5)
	move.w d0,(-$70b8,a5)
	move.w d0,(-$70b6,a5)
	move.w #$90e0,(-$7168,a5)
	tst.b ($bf,a5)
	beq.b loc_006a08
	jsr loc_01c2c8
	beq.b loc_006a08
	addq.b #1,(a4)
	move.w #$3708,(2,a4)

loc_006a08:
	cmpi.b #8,($6eb9,a5)
	bcs.w loc_006ae2
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3700,(2,a4)
	move.b #1,($a,a4)
	move.b #0,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3701,(2,a4)
	move.b #1,($a,a4)
	move.b #0,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3702,(2,a4)
	move.b #1,($a,a4)
	move.b #0,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3703,(2,a4)
	move.b #1,($a,a4)
	move.b #0,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3704,(2,a4)
	move.b #1,($a,a4)
	move.b #0,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3705,(2,a4)
	move.b #1,($a,a4)
	move.b #0,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3706,(2,a4)
	move.b #1,($a,a4)
	move.b #0,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3707,(2,a4)
	move.b #1,($a,a4)
	move.b #0,($3c,a4)

loc_006ae2:
	moveq #0,d0
	bsr.w loc_0073c0
	moveq #0,d0
	bsr.w loc_007414
	moveq #0,d0
	bsr.w loc_007478
	lea loc_35fa54,a0
	lea $90c020,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_35bc74,a0
	lea $90c040,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_35bcf4,a0
	lea $90c060,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_35bd74,a0
	lea $90c080,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_35bdf4,a0
	lea $90c100,a1
	moveq #0,d7
	jsr loc_01b7ce
	moveq #0,d0
	bsr.w loc_007b40
	lea loc_362854,a0
	lea $90c400,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_363b34,a0
	lea $90c800,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_363bb4,a0
	lea $90c820,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_364894,a0
	lea $90cc00,a1
	moveq #0,d7
	jsr loc_01b7ce
	move.l #$11e,(-$7158,a5)
	move.l #1,(-$7154,a5)
	move.l #3,(-$7150,a5)
	move.l #1,(-$714c,a5)
	rts

;==============================================
loc_006bd0:
	move.b (-$717b,a5),d0
	move.w loc_006bdc(pc,d0.w),d1
	jmp loc_006bdc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_006bdc:
	dc.w loc_006be4-loc_006bdc
	dc.w loc_006c00-loc_006bdc
	dc.w loc_006cbe-loc_006bdc
	dc.w loc_006d02-loc_006bdc

;==============================================
loc_006be4:
	addq.b #2,(-$717b,a5)
	move.w #$1e0e,(-$716c,a5)
	move.w #$4261,(-$716a,a5)
	move.w #$90c0,(-$7166,a5)
	move.b #0,(-$7177,a5)

loc_006c00:
	moveq #$39,d0
	add.b (-$7177,a5),d0
	cmp.b ($b,a5),d0
	bhi.w loc_006cbc
	addq.b #2,(-$717b,a5)
	move.w #$91e0,(-$7166,a5)
	move.w #$9280,(-$7164,a5)
	move.b (-$7177,a5),d0
	bset.b d0,($14,a5)
	move.w #$ff00,d1
	cmpi.b #2,d0
	bne.w loc_006cb4
	lea loc_35bbf4,a0
	lea $90c020,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_3628b4,a0
	lea $90c400,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_363b94,a0
	lea $90c800,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_363c14,a0
	lea $90c820,a1
	moveq #0,d7
	jsr loc_01b7ce
	moveq #3,d0
	tst.b ($bf,a5)
	bne.b loc_006c98
	move.b (game_unlock,a5),d1
	beq.b loc_006c98
	move.b d1,d0
	add.b d1,d0
	add.b d1,d0
	addq.w #7,d0

loc_006c98:
	lsl.w #5,d0
	lea loc_364894,a0
	lea (a0,d0.w),a0
	lea $90cc00,a1
	moveq #0,d7
	jsr loc_01b7ce
	moveq #-$20,d1

loc_006cb4:
	move.w d1,(-$7130,a5)
	bra.w loc_007668

loc_006cbc:
	rts

;==============================================
loc_006cbe:
	bsr.w loc_007748
	bne.b loc_006d00
	move.w #$90c0,(-$7166,a5)
	move.w #$90c0,(-$7164,a5)
	cmpi.b #2,(-$7177,a5)
	bne.b loc_006cf8
	addq.b #2,(-$717b,a5)
	move.b #$ff,(-$7178,a5)
	move.b #$f,($17,a5)
	jsr loc_003d1c
	bsr.w loc_007a98
	jmp loc_00442e

loc_006cf8:
	subq.b #2,(-$717b,a5)
	addq.b #1,(-$7177,a5)

loc_006d00:
	rts

;==============================================
loc_006d02:
	subq.b #1,(-$7178,a5)
	bne.b loc_006d12
	moveq #0,d0
	addq.w #2,(4,a5)
	move.w d0,(6,a5)

loc_006d12:
	rts

;==============================================
loc_006d14:
	move.b (-$717c,a5),d0
	move.w loc_006d20(pc,d0.w),d1
	jmp loc_006d20(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_006d20:
	dc.w loc_006d24-loc_006d20
	dc.w loc_006f60-loc_006d20

;==============================================
loc_006d24:
	move.b (-$717b,a5),d0
	move.w loc_006d30(pc,d0.w),d1
	jmp loc_006d30(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_006d30:
	dc.w loc_006d34-loc_006d30
	dc.w loc_006d46-loc_006d30

;==============================================
loc_006d34:
	addq.b #2,(-$717b,a5)
	move.w #$92a0,(-$7166,a5)
	move.w #$92a0,(-$7164,a5)
	rts

;==============================================
loc_006d46:
	addq.b #2,(-$717c,a5)
	bsr.w loc_007ad2
	bsr.w loc_007ae4
	moveq #0,d0
	move.l d0,($14,a5)
	move.b d0,(-$717b,a5)
	move.l d0,(-$7128,a5)
	move.l d0,(-$7124,a5)
	move.l d0,(-$70f8,a5)
	move.l d0,(-$70f4,a5)
	move.l d0,(-$70c8,a5)
	move.l d0,(-$70c4,a5)
	move.w d0,(-$7118,a5)
	move.w d0,(-$7116,a5)
	move.w d0,(-$70e8,a5)
	move.w d0,(-$70e6,a5)
	move.w d0,(-$70b8,a5)
	move.w d0,(-$70b6,a5)
	move.w #$90e0,(-$7168,a5)
	tst.b ($bf,a5)
	beq.b loc_006da8
	jsr loc_01c2c8
	beq.b loc_006da8
	addq.b #1,(a4)
	move.w #$3708,(2,a4)

loc_006da8:
	cmpi.b #$14,($6eb9,a5)
	bcs.w loc_006e3a
	move.w #$3700,d5
	bsr.w loc_006f06
	move.w #$3701,d5
	bsr.w loc_006f06
	move.w #$3702,d5
	bsr.w loc_006f06
	move.w #$3703,d5
	bsr.w loc_006f06
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3704,(2,a4)
	move.b #2,($a,a4)
	move.b #0,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3705,(2,a4)
	move.b #2,($a,a4)
	move.b #0,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3706,(2,a4)
	move.b #2,($a,a4)
	move.b #0,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3707,(2,a4)
	move.b #2,($a,a4)
	move.b #0,($3c,a4)

loc_006e3a:
	moveq #0,d0
	bsr.w loc_0073c0
	moveq #0,d0
	bsr.w loc_007414
	moveq #0,d0
	bsr.w loc_007478
	lea loc_35bb94,a0
	lea $90c020,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_35bc14,a0
	lea $90c040,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_35bc94,a0
	lea $90c060,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_35bd14,a0
	lea $90c080,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_35bd94,a0
	lea $90c100,a1
	moveq #0,d7
	jsr loc_01b7ce
	moveq #0,d0
	bsr.w loc_007b40
	lea loc_362854,a0
	lea $90c400,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_363b34,a0
	lea $90c800,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_363bb4,a0
	lea $90c820,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_364894,a0
	lea $90cc00,a1
	moveq #0,d7
	jmp loc_01b7ce

;==============================================
loc_006f06:
	bsr.w loc_00733a
	addq.b #1,(a4)
	move.w d5,(2,a4)
	move.b #2,($a,a4)
	move.b #0,($3c,a4)
	addq.b #1,(a3)
	move.w d5,(2,a3)
	move.b #2,($a,a3)
	move.b #1,($3c,a3)
	move.w a4,($36,a3)
	addq.b #1,(a2)
	move.w d5,(2,a2)
	move.b #2,($a,a2)
	move.b #2,($3c,a2)
	move.w a3,($36,a2)
	addq.b #1,(a1)
	move.w d5,(2,a1)
	move.b #2,($a,a1)
	move.b #3,($3c,a1)
	move.w a2,($36,a1)
	rts

;==============================================
loc_006f60:
	move.b (-$717b,a5),d0
	move.w loc_006f6c(pc,d0.w),d1
	jmp loc_006f6c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_006f6c:
	dc.w loc_006f72-loc_006f6c
	dc.w loc_006f88-loc_006f6c
	dc.w loc_006ff6-loc_006f6c

;==============================================
loc_006f72:
	addq.b #2,(-$717b,a5)
	move.w #$1e0e,(-$716c,a5)
	move.w #$4261,(-$716a,a5)
	move.w #$90c0,(-$7166,a5)

loc_006f88:
	cmpi.b #$f,($14,a5)
	bne.b loc_006fb6
	addq.b #2,(-$717b,a5)
	move.b #$ff,(-$7178,a5)
	move.w #$90c0,(-$7166,a5)
	move.b #$f,($17,a5)
	jsr loc_003d1c
	bsr.w loc_007a98
	jmp loc_00442e

loc_006fb6
	cmpi.b #$f,($15,a5)
	bne.b loc_006fc8
	move.b #5,(-$7177,a5)
	clr.b ($15,a5)

loc_006fc8
	cmpi.b #$f,($16,a5)
	bne.b loc_006fd4
	clr.b ($16,a5)

loc_006fd4:
	moveq #0,d0
	move.b (-$7177,a5),d0
	beq.b loc_006fea
	subq.b #1,d0
	move.b d0,(-$7177,a5)
	add.w d0,d0
	move.w loc_006fec(pc,d0.w),(-$7166,a5)

loc_006fea:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_006fec:
	dc.w $90c0,$9280,$9260,$92a0,$9280

;==============================================
loc_006ff6:
	subq.b #1,(-$7178,a5)
	bne.b loc_007006
	moveq #0,d0
	addq.w #2,(4,a5)
	move.w d0,(6,a5)

loc_007006:
	rts

;==============================================
loc_007008:
	move.b (-$717c,a5),d0
	move.w loc_007014(pc,d0.w),d1
	jmp loc_007014(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_007014:
	dc.w loc_007018-loc_007014
	dc.w loc_00717a-loc_007014

;==============================================
loc_007018:
	move.b (-$717b,a5),d0
	move.w loc_007024(pc,d0.w),d1
	jmp loc_007024(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_007024:
	dc.w loc_007028-loc_007024
	dc.w loc_00703a-loc_007024

;==============================================
loc_007028:
	addq.b #2,(-$717b,a5)
	move.w #$92a0,(-$7166,a5)
	move.w #$92a0,(-$7164,a5)
	rts

;==============================================
loc_00703a:
	addq.b #2,(-$717c,a5)
	bsr.w loc_007ad2
	bsr.w loc_007ae4
	moveq #0,d0
	move.l d0,($14,a5)
	move.b d0,(-$717b,a5)
	move.l d0,(-$7128,a5)
	move.l d0,(-$7124,a5)
	move.l d0,(-$70f8,a5)
	move.l d0,(-$70f4,a5)
	move.l d0,(-$70c8,a5)
	move.l d0,(-$70c4,a5)
	move.w d0,(-$7118,a5)
	move.w d0,(-$7116,a5)
	move.w d0,(-$70e8,a5)
	move.w d0,(-$70e6,a5)
	move.w d0,(-$70b8,a5)
	move.w d0,(-$70b6,a5)
	move.w #$90e0,(-$7168,a5)
	moveq #6,d6
	tst.b ($89,a5)
	beq.b loc_007090
	moveq #$b,d6

loc_007090:
	cmp.b ($6eb9,a5),d6
	bhi.b loc_0070ae
	subq.w #1,d6

loc_007098:
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3709,(2,a4)
	move.b d6,($3c,a4)
	dbra d6,loc_007098

loc_0070ae:
	moveq #0,d0
	bsr.w loc_0073c0
	moveq #0,d0
	bsr.w loc_007414
	moveq #0,d0
	bsr.w loc_007478
	lea loc_35bb94,a0
	lea $90c020,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_35bc14,a0
	lea $90c040,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_35bc94,a0
	lea $90c060,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_35bd14,a0
	lea $90c080,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_35bd94,a0
	lea $90c100,a1
	moveq #0,d7
	jsr loc_01b7ce
	moveq #0,d0
	bsr.w loc_007b40
	lea loc_362854,a0
	lea $90c400,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_363b34,a0
	lea $90c800,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_363bb4,a0
	lea $90c820,a1
	moveq #0,d7
	jsr loc_01b7ce
	lea loc_364894,a0
	lea $90cc00,a1
	moveq #0,d7
	jmp loc_01b7ce

;==============================================
loc_00717a:
	move.b (-$717b,a5),d0
	move.w loc_007186(pc,d0.w),d1
	jmp loc_007186(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_007186:
	dc.w loc_007190-loc_007186
	dc.w loc_0071a6-loc_007186
	dc.w loc_00724a-loc_007186
	dc.w loc_007274-loc_007186
	dc.w loc_007328-loc_007186

;==============================================
loc_007190:
	addq.b #2,(-$717b,a5)
	move.w #$1e0e,(-$716c,a5)
	move.w #$4261,(-$716a,a5)
	move.w #$90c0,(-$7166,a5)

loc_0071a6:
	moveq #$3f,d0
	tst.b ($89,a5)
	beq.b loc_0071b2
	move.w #$7ff,d0

loc_0071b2:
	cmp.w ($14,a5),d0
	bne.w loc_007248
	addq.b #2,(-$717b,a5)
	move.b #8,(-$7177,a5)
	clr.w ($14,a5)
	cmpi.b #5,($6eb9,a5)
	bcs.w loc_007248
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3700,(2,a4)
	move.b #$3,($a,a4)
	move.b #$0,($3c,a4)
	jsr loc_01c2c8
	addq.b #$1,(a4)
	move.w #$3701,(2,a4)
	move.b #$3,($a,a4)
	move.b #$0,($3c,a4)
	jsr loc_01c2c8
	addq.b #$1,(a4)
	move.w #$3702,(2,a4)
	move.b #$3,($a,a4)
	move.b #$0,($3c,a4)
	jsr loc_01c2c8
	addq.b #$1,(a4)
	move.w #$3703,(2,a4)
	move.b #$3,($a,a4)
	move.b #$0,($3c,a4)
	jsr loc_01c2c8
	addq.b #$1,(a4)
	move.w #$370a,(2,a4)

loc_007248:
	rts

;==============================================
loc_00724a:
	subq.b #1,(-$7177,a5)
	bne.b loc_007254
	addq.b #2,(-$717b,a5)

loc_007254:
	moveq #0,d0
	move.b (-$7177,a5),d0
	add.w d0,d0
	move.w loc_007264(pc,d0.w),(-$7166,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_007264
	dc.w $90c0,$9280,$9260,$92a0,$9280,$9260,$92a0,$9280

;==============================================
loc_007274:
	tst.b ($14,a5)
	beq.w loc_007326
	addq.b #2,(-$717b,a5)
	move.b #-1,(-$7178,a5)
	clr.b ($14,a5)
	tst.b ($bf,a5)
	beq.b loc_0072a0
	jsr loc_01c2c8
	beq.b loc_0072a0
	addq.b #1,(a4)
	move.w #$3708,(2,a4)

loc_0072a0:
	cmpi.b #4,($6eb9,a5)
	bcs.b loc_007310
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3704,(2,a4)
	move.b #3,($a,a4)
	move.b #0,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3705,(2,a4)
	move.b #3,($a,a4)
	move.b #0,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3706,(2,a4)
	move.b #3,($a,a4)
	move.b #0,($3c,a4)
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.w #$3707,(2,a4)
	move.b #3,($a,a4)
	move.b #0,($3c,a4)

loc_007310:
	move.b #$f,($17,a5)
	jsr loc_003d1c
	bsr.w loc_007a98
	jmp loc_00442e

loc_007326:
	rts

;==============================================
loc_007328:
	subq.b #1,(-$7178,a5)
	bne.b loc_007338
	moveq #0,d0
	addq.w #2,(4,a5)
	move.w d0,(6,a5)

loc_007338:
	rts

;==============================================
loc_00733a:
	jsr loc_01c2c8
	lea (a4),a1
	jsr loc_01c2c8
	lea (a4),a2
	jsr loc_01c2c8
	lea (a4),a3
	jsr loc_01c2c8
	cmpa.l a4,a1
	bcc.b loc_00735e
	dc.w $c949;exg.l a4,a1

loc_00735e:
	cmpa.l a4,a2
	bcc.b loc_007364
	dc.w $c94a;exg.l a4,a2

loc_007364:
	cmpa.l a4,a3
	bcc.b loc_00736a
	dc.w $c94b;exg.l a4,a3

loc_00736a:
	cmpa.l a3,a1
	bcc.b loc_007370
	dc.w $c749;exg.l a3,a1

loc_007370:
	cmpa.l a3,a2
	bcc.b loc_007376
	dc.w $c74a;exg.l a3,a2

loc_007376:
	cmpa.l a2,a1
	bcc.b loc_00737c
	dc.w $c549;exg.l a2,a1

loc_00737c:
	rts

;==============================================
loc_00737e:
	add.b ($bb,a5),d0
	move.b (-$7097,a5),d1
	move.w d2,d5
	andi.w #1,d3
	lsl.w #5,d3
	bsr.w loc_0074fc
	move.b (-$7097,a5),d0
	move.w d5,d1
	bra.w loc_007830

;==============================================
loc_00739c:
	cmpi.w #8,(Region,a5)
	bne.b loc_0073a6
	addq.w #1,d0

loc_0073a6:
	move.b (-$7097,a5),d1
	move.w d2,d5
	andi.w #1,d3
	lsl.w #5,d3
	bsr.w loc_0074fc
	move.b (-$7097,a5),d0
	move.w d5,d1
	bra.w loc_00786c

;==============================================
loc_0073c0
	andi.w #$ff,d0
	lsl.w #2,d0
	lea $900000,a1
	lea loc_007404(pc,d0.w),a4
	moveq #3,d7

loc_0073d2:
	moveq #0,d0
	move.b (a4)+,d0
	jsr loc_018cdc
	dbra d7,loc_0073d2
	rts

;==============================================
loc_0073e2
	andi.w #$ff,d0
	lsl.w #2,d0
	lea $910000,a1
	lea loc_007404(pc,d0.w),a4
	moveq #3,d7

loc_0073f4:
	moveq #0,d0
	move.b (a4)+,d0
	jsr loc_018cdc
	dbra d7,loc_0073f4
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_007404:
	dc.w $0000,$5253,$4e4f,$0000,$5454,$0000,$0000,$0000

;==============================================
loc_007414:
	andi.w #$ff,d0
	lsl.w #4,d0
	lea $904000,a1
	lea loc_007458(pc,d0.w),a4
	moveq #$f,d7

loc_007426:
	moveq #0,d0
	move.b (a4)+,d0
	jsr loc_018f20
	dbra d7,loc_007426
	rts

;==============================================
loc_007436:
	andi.w #$ff,d0
	lsl.w #4,d0
	lea $914000,a1
	lea loc_007458(pc,d0.w),a4
	moveq #$f,d7

loc_007448:
	moveq #0,d0
	move.b (a4)+,d0
	jsr loc_018f20
	dbra d7,loc_007448
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_007458:
	dc.w $0000,$0000,$0000,$0000,$8889,$0000,$8081,$0000
	dc.w $0000,$0000,$0000,$0000,$8e8f,$9000,$8c8d,$0000

;==============================================
loc_007478:
	andi.w #$ff,d0
	lsl.w #6,d0
	lea $908000,a1
	lea loc_0074bc(pc,d0.w),a4
	moveq #$3f,d7

loc_00748a:
	moveq #0,d0
	move.b (a4)+,d0
	jsr loc_0190d2
	dbra d7,loc_00748a
	rts


;==============================================
loc_00749a
	andi.w #$ff,d0
	lsl.w #6,d0
	lea $918000,a1
	lea loc_0074bc(pc,d0.w),a4
	moveq #$3f,d7

loc_0074ac:
	moveq #0,d0
	move.b (a4)+,d0
	jsr loc_0190d2
	dbra d7,loc_0074ac
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0074bc:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$8384,$4e4e,$0000,$0000,$8586
	dc.w $494a,$4b4c,$4d00,$8780,$5253,$4344,$4546,$4748

;==============================================
loc_0074fc:
	andi.w #$ff,d1
	add.w d0,d0
	lsl.w #3,d1
	lea loc_3b3344,a0
	add.w (a0,d0.w),d1
	movea.l (4,a0,d1.w),a0
	move.w (a0)+,d7
	move.l (a0)+,d7
	tst.w d3
	beq.b loc_007522
	move.w d7,d1
	lsl.w #6,d1
	bsr.w loc_00757e

loc_007522:
	lea (a1),a2
	swap d7
	move.w d7,d6

loc_007528:
	movem.w (a0)+,d0-d1
	addi.w #$6c00,d0
	move.b d1,d4
	add.b d2,d1
	eor.b d3,d4
	andi.b #$1f,d1
	andi.b #$60,d4
	or.b d4,d1
	movem.w d0-d1,(a2)
	lea (4,a2),a2
	move.w a2,d0
	andi.w #$3f,d0
	bne.b loc_007568
	lea (-4,a2),a2
	move.l a2,d0
	move.w d0,d1
	addi.w #$1000,d1
	andi.w #$cfc0,d0
	andi.w #$3000,d1
	or.w d1,d0
	movea.l d0,a2

loc_007568:
	dbra d6,loc_007528
	moveq #$40,d1
	tst.w d3
	beq.b loc_007574
	neg.w d1

loc_007574:
	bsr.b loc_00757e
	swap d7
	dbra d7,loc_007522
	rts

loc_00757e:
	move.l a1,d0
	add.w d0,d1
	andi.w #$f000,d0
	andi.w #$ffc,d1
	or.w d1,d0
	movea.l d0,a1
	rts

;==============================================
loc_007590:
	addi.w #$10,d0
	swap d0
	move.w d1,d0
	move.l d0,d1
	move.l d0,d2
	move.l d0,d3
	move.l d0,d4
	move.l d0,d5
	move.l d0,d6
	movea.l d0,a2
	moveq #$2f,d7

loc_0075a8:
	movem.l d0-d6/a2,(a1)
	lea ($60,a1),a1
	movem.l d0-d6/a2,(a1)
	lea ($20,a1),a1
	dbra d7,loc_0075a8
	rts

;==============================================
loc_0075be:
	addi.w #$10,d0
	swap d0
	move.w d1,d0
	move.l d0,d1
	move.l d0,d2
	move.l d0,d3
	move.l d0,d4
	move.l d0,d5
	move.l d0,d6
	movea.l d0,a2
	bsr.b loc_0075da
	lea ($800,a1),a1

loc_0075da:
	moveq #$f,d7

loc_0075dc:
	movem.l d0-d6/a2,(a1)
	lea ($20,a1),a1
	movem.l d0-d6/a2,(a1)
	lea ($20,a1),a1
	movem.l d0-d6/a2,(a1)
	lea ($20,a1),a1
	movem.l d0-d6/a2,(a1)
	lea ($20,a1),a1
	dbra d7,loc_0075dc
	rts

;==============================================
loc_007602:
	clr.w (-$7134,a5)
	move.l #$f000f000,d0
	move.l #$f000f000,d1
	move.l #$f000f000,d2
	move.l #$f000f000,d3
	move.l (-$7148,a5),d4
	lea $91c400,a0
	lea $92c400,a1
	bsr.w loc_0076bc
	move.l (-$7144,a5),d4
	lea $91c800,a0
	lea $92c800,a1
	bsr.b loc_0076bc
	move.l (-$7140,a5),d4
	lea $91cc00,a0
	lea $92cc00,a1
	bsr.b loc_0076bc
	move.l (-$713c,a5),d4
	lea $91d000,a0
	lea $92d000,a1
	bra.b loc_0076bc

;==============================================
loc_007668:
	move.w #$fff,(-$7136,a5)
	moveq #-1,d0
	moveq #-1,d1
	moveq #-1,d2
	moveq #-1,d3
	move.l (-$7158,a5),d4
	lea $90c400,a0
	lea $91e400,a1
	bsr.b loc_0076bc
	move.l (-$7154,a5),d4
	lea $90c800,a0
	lea $91e800,a1
	bsr.b loc_0076bc
	move.l (-$7150,a5),d4
	lea $90cc00,a0
	lea $91ec00,a1
	bsr.b loc_0076bc
	move.l (-$714c,a5),d4
	lea $90d000,a0
	lea $91f000,a1

loc_0076bc:
	moveq #$1f,d7

loc_0076be:
	btst.l d7,d4
	beq.b loc_0076cc
	movem.l d0-d3,-(a1)
	movem.l d0-d3,-(a1)
	bra.b loc_0076dc

loc_0076cc:
	move.l -(a0),-(a1)
	move.l -(a0),-(a1)
	move.l -(a0),-(a1)
	move.l -(a0),-(a1)
	move.l -(a0),-(a1)
	move.l -(a0),-(a1)
	move.l -(a0),-(a1)
	move.l -(a0),-(a1)

loc_0076dc:
	dbra d7,loc_0076be
	rts

;==============================================
loc_0076e2:
	move.w (-$712e,a5),d4
	move.w d4,(-$7132,a5)
	add.w d4,(-$7134,a5)
	move.b (-$7134,a5),(-$7138,a5)
	move.l (-$7148,a5),d4
	lea $91c400,a0
	lea $92c400,a1
	bsr.w loc_0077a8
	move.l (-$7144,a5),d4
	lea $91c800,a0
	lea $92c800,a1
	bsr.w loc_0077a8
	move.l (-$7140,a5),d4
	lea $91cc00,a0
	lea $92cc00,a1
	bsr.b loc_0077a8
	move.l (-$713c,a5),d4
	lea $91d000,a0
	lea $92d000,a1
	bsr.b loc_0077a8
	cmpi.b #$f,(-$7134,a5)
	rts

;==============================================
loc_007748:
	move.w (-$7130,a5),d4
	move.w d4,(-$7132,a5)
	add.w d4,(-$7136,a5)
	move.b (-$7136,a5),(-$7138,a5)
	move.l (-$7158,a5),d4
	lea $90c400,a0
	lea $91e400,a1
	bsr.b loc_0077a8
	move.l (-$7154,a5),d4
	lea $90c800,a0
	lea $91e800,a1
	bsr.b loc_0077a8
	move.l (-$7150,a5),d4
	lea $90cc00,a0
	lea $91ec00,a1
	bsr.b loc_0077a8
	move.l (-$714c,a5),d4
	lea $90d000,a0
	lea $91f000,a1
	bsr.b loc_0077a8
	tst.b (-$7136,a5)
	rts

;==============================================
loc_0077a8:
	moveq #$1f,d7

loc_0077aa:
	btst.l d7,d4
	bne.b loc_0077b8
	lea (-$20,a0),a0
	lea (-$20,a1),a1
	bra.b loc_007814

loc_0077b8:
	swap d7
	move.w #$f,d7

loc_0077be:
	move.w -(a1),d0
	move.w d0,d1
	andi.w #$f00,d1
	move.w d0,d2
	andi.w #$f0,d2
	move.w d0,d3
	andi.w #$f,d3
	move.w -(a0),d5
	swap d0
	move.w #0,d0
	move.b (-$7138,a5),d0
	move.w d5,d6
	andi.w #$f,d6
	bsr.b loc_00781a
	move.w d6,d3
	lsl.w #4,d0
	move.w d5,d6
	andi.w #$f0,d6
	bsr.b loc_00781a
	move.w d6,d2
	lsl.w #4,d0
	move.w d5,d6
	andi.w #$f00,d6
	bsr.b loc_00781a
	move.w d6,d1
	swap d0
	andi.w #$f000,d0
	or.w d1,d0
	or.w d2,d0
	or.w d3,d0
	move.w d0,(a1)
	dbra d7,loc_0077be
	swap d7

loc_007814:
	dbra d7,loc_0077aa
	rts

;==============================================
loc_00781a:
	tst.w (-$7132,a5)
	bmi.b loc_007828
	cmp.w d6,d0
	bcc.b loc_00782e
	move.w d0,d6
	bra.b loc_00782e

loc_007828:
	cmp.w d6,d0
	bls.b loc_00782e
	move.w d0,d6

loc_00782e:
	rts

;==============================================
loc_007830:;VsPortraitDemo
	andi.w #$1f,d0
	add.w d0,d0
	lea loc_34cdd4,a0
	move.w (a0,d0.w),d0
	lea (a0,d0.w),a0
	lea ($100,a0),a0
	andi.w #$1f,d1
	lsl.w #5,d1
	lea $90c800,a1
	tst.b (-$7098,a5)
	beq.b loc_007860
	lea $91c800,a1

loc_007860:
	lea (a1,d1.w),a1
	moveq #3,d7
	jmp loc_01b7ce

;==============================================
loc_00786c:
	andi.w #$1f,d0
	lsl.w #2,d0
	lea loc_351f14,a0
	movea.l (a0,d0.w),a0
	lea ($200,a0),a0
	andi.w #$1f,d1
	lsl.w #5,d1
	lea $90c800,a1
	tst.b (-$7098,a5)
	beq.b loc_007898
	lea $91c800,a1

loc_007898:
	lea (a1,d1.w),a1
	moveq #7,d7
	jmp loc_01b7ce

;==============================================
loc_0078a4:
	subq.b #1,(-$712c,a5)
	bne.b loc_0078d4

loc_0078aa:
	moveq #0,d0
	move.b (-$712b,a5),d0
	lsl.w #2,d0
	move.w loc_0078d6(pc,d0.w),(-$712c,a5)
	move.w loc_0078d6+2(pc,d0.w),d0
	lea loc_364d14,a0
	lea (a0,d0.w),a0
	lea $90cfe0,a1
	moveq #0,d7
	jmp loc_01b7ce

loc_0078d4:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0078d6:
	dc.w $0201,$1880,$0202,$18a0,$0203,$18c0,$0204,$18e0
	dc.w $0205,$1900,$0206,$1920,$0207,$1940,$0208,$1960
	dc.w $0209,$1980,$020a,$19a0,$020b,$19c0,$020c,$19e0
	dc.w $020d,$1a00,$020e,$1a20,$020f,$1a40,$0210,$1a60
	dc.w $0211,$1a80,$0212,$1aa0,$0213,$1ac0,$0214,$1ae0
	dc.w $0215,$1b00,$0216,$1b20,$0217,$1b40,$0218,$1b60
	dc.w $0219,$1b80,$021a,$1ba0,$021b,$1bc0,$0200,$1be0
	dc.w $021d,$1e00,$021e,$1e20,$021f,$1e40,$0220,$1e60
	dc.w $0221,$1e80,$0222,$1ea0,$0223,$1ec0,$0224,$1ee0
	dc.w $0225,$1f00,$0226,$1f20,$0227,$1f40,$0228,$1f60
	dc.w $0229,$1f80,$022a,$1fa0,$022b,$1fc0,$022c,$1fe0
	dc.w $022d,$2000,$022e,$2020,$022f,$2040,$0230,$2060
	dc.w $0231,$2080,$0232,$20a0,$0233,$20c0,$0234,$20e0
	dc.w $0235,$2100,$0236,$2120,$0237,$2140,$021c,$2160

;==============================================
loc_0079b6:
	subq.b #1,(-$712a,a5)
	bne.b loc_0079e6

loc_0079bc:
	moveq #0,d0
	move.b (-$7129,a5),d0
	lsl.w #2,d0
	move.w loc_0079e8(pc,d0.w),(-$712a,a5)
	move.w loc_0079e8+2(pc,d0.w),d0
	lea loc_364d14,a0
	lea (a0,d0.w),a0
	lea $91cfe0,a1
	moveq #0,d7
	jmp loc_01b7ce

loc_0079e6:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0079e8:
	dc.w $0201,$1880,$0202,$18a0,$0203,$18c0,$0204,$18e0
	dc.w $0205,$1900,$0206,$1920,$0207,$1940,$0208,$1960
	dc.w $0209,$1980,$020a,$19a0,$020b,$19c0,$020c,$19e0
	dc.w $020d,$1a00,$020e,$1a20,$020f,$1a40,$0210,$1a60
	dc.w $0211,$1a80,$0212,$1aa0,$0213,$1ac0,$0214,$1ae0
	dc.w $0215,$1b00,$0216,$1b20,$0217,$1b40,$0218,$1b60
	dc.w $0219,$1b80,$021a,$1ba0,$021b,$1bc0,$0200,$1be0
	dc.w $021d,$1c00,$021e,$1c20,$021f,$1c40,$0220,$1c60
	dc.w $0221,$1c80,$0222,$1ca0,$0223,$1cc0,$0224,$1ce0
	dc.w $0225,$1d00,$0226,$1d20,$0227,$1d40,$0228,$1d60
	dc.w $0229,$1d80,$022a,$1da0,$022b,$1dc0,$ffff,$1de0

;==============================================
;Copywrite text
loc_007a98:
	moveq #$58,d0
	add.w (Region,a5),d0
	jsr loc_01c3ac
	beq.b loc_007ad0
	addq.b #1,(a4)
	move.w #$800,(2,a4)
	move.b d0,($3c,a4)
	clr.b ($31,a4)
	addq.w #1,d0
	jsr loc_01c3ac
	beq.b loc_007ad0
	addq.b #1,(a4)
	move.w #$800,(2,a4)
	move.b d0,($3c,a4)
	clr.b ($31,a4)

loc_007ad0:
	rts

;==============================================
loc_007ad2:;demo
	jsr loc_01c0ba
	jmp loc_01c126

;==============================================
loc_007ade:;demo
	jmp loc_01c0f0

;==============================================
loc_007ae4:
	jsr loc_01b19c
	jsr loc_01b1ae
	jsr loc_01b1c0
	lea $90f800,a0
	move.w #$5f,d4
	bra.b loc_007b1e

;==============================================
loc_007b02:
	jsr loc_01b1d2
	jsr loc_01b1e4
	jsr loc_01b1f6
	lea $910000,a0
	move.w #$1f,d4

loc_007b1e:
	move.l #$c000c0,d0
	move.l d0,d1
	move.l d0,d2
	move.l d0,d3

loc_007b2a:
	movem.l d0-d3,-(a0)
	movem.l d0-d3,-(a0)
	movem.l d0-d3,-(a0)
	movem.l d0-d3,-(a0)
	dbra d4,loc_007b2a
	rts

;==============================================
loc_007b40:
	lea loc_33bc54,a0
	lea $90c3e0,a1
	tst.b d0
	beq.b loc_007b56
	lea $91c3e0,a1

loc_007b56:
	moveq #0,d7
	jmp loc_01b7ce

;==============================================
loc_007b5e:
	moveq #0,d0
	move.w d0,($71bc,a5)
	move.w d0,($71c0,a5)
	lea ($79c2,a5),a0
	move.w a0,($71b8,a5)
	lea (p1memory,a5),a6
	bsr.w loc_007b90
	lea (p2memory,a5),a6
	bsr.w loc_007b90
	jsr loc_01ffc8
	moveq #1,d0
	jsr loc_001370
	bra.b loc_007b5e

loc_007b90:
	tst.b ($100,a6)
	bne.b loc_007ba4
	moveq #0,d0
	move.b ($104,a6),d0
	move.w loc_007ba6(pc,d0.w),d1
	jmp loc_007ba6(pc,d1.w)

loc_007ba4:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_007ba6:
	dc.w loc_007bb2-loc_007ba6
	dc.w loc_007d3e-loc_007ba6
	dc.w loc_007e56-loc_007ba6
	dc.w loc_0080c4-loc_007ba6
	dc.w loc_0083a8-loc_007ba6
	dc.w loc_0083b6-loc_007ba6

;==============================================
loc_007bb2:
	move.b ($104,a5),d1
	or.b ($14a,a5),d1
	or.b ($106,a5),d1
	bne.w loc_007f32
	tst.b (Dip_Join_in,a5)
	beq.w loc_00843c
	move.b ($105,a6),d0
	move.w loc_007bd6(pc,d0.w),d1
	jmp loc_007bd6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_007bd6:
	dc.w loc_007bda-loc_007bd6
	dc.w loc_007c6c-loc_007bd6

;==============================================
loc_007bda:
	lea ($70,a5),a4
	moveq #0,d0
	tst.b ($9d,a5)
	bne.w loc_007c36
	tst.b ($9e,a5)
	beq.b loc_007bf8
	move.b ($101,a6),d0
	lsl.w #3,d0
	lea (a4,d0.w),a4

loc_007bf8:
	move.b (6,a4),d1
	or.b ($9c,a5),d1
	bne.w loc_007c2c
	addq.b #2,($105,a6)
	move.b (1,a4),d1
	bne.b loc_007c1a
	moveq #2,d0
	add.b (2,a4),d0
	jmp loc_01ffa0

loc_007c1a:
	move.b (2,a4),d0
	sub.b d1,d0
	addi.b #$f,d0
	ext.w d0
	jmp loc_01ffa0

loc_007c2c:
	addq.b #2,($104,a6)
	clr.b ($105,a6)
	rts

loc_007c36:
	tst.b ($9e,a5)
	beq.b loc_007c46
	move.b ($101,a6),d0
	lsl.w #3,d0
	lea (a4,d0.w),a4

loc_007c46:
	move.b (6,a4),d1
	moveq #1,d3
	add.b ($9d,a5),d3
	andi.b #$ef,ccr
	sbcd.b d3,d1
	bcc.b loc_007c2c
	addq.b #2,($105,a6)
	moveq #4,d0
	tst.b (6,a4)
	beq.b loc_007c66
	moveq #$10,d0

loc_007c66:
	jmp loc_01ffa0

loc_007c6c:
	lea ($70,a5),a4
	moveq #0,d0
	tst.b ($9d,a5)
	bne.w loc_007ce0
	tst.b ($9e,a5)
	beq.b loc_007c8a
	move.b ($101,a6),d0
	lsl.w #3,d0
	lea (a4,d0.w),a4

loc_007c8a:
	move.b (6,a4),d1
	or.b ($9c,a5),d1
	bne.b loc_007c2c
	move.b (1,a4),d1
	beq.b loc_007cac
	move.b (2,a4),d0
	sub.b d1,d0
	addi.b #$f,d0
	ext.w d0
	jmp loc_01ffa0

loc_007cac:
	move.b ($80,a5),d0
	andi.w #$3f,d0
	bne.b loc_007cde
	moveq #2,d0
	add.b (2,a4),d0
	btst.b #6,($80,a5)
	beq.b loc_007cd8
	lea (p1memory,a5),a0
	tst.b ($101,a6)
	bne.b loc_007cd2
	lea (p2memory,a5),a0

loc_007cd2:
	moveq #0,d0
	move.b ($118,a0),d0

loc_007cd8:
	jmp loc_01ffa0

loc_007cde:
	rts

loc_007ce0
	tst.b ($9e,a5)
	beq.b loc_007cf0
	move.b ($101,a6),d0
	lsl.b #3,d0
	lea (a4,d0.w),a4

loc_007cf0:
	move.b (6,a4),d1
	moveq #1,d3
	add.b ($9d,a5),d3
	andi.b #$ef,ccr
	sbcd.b d3,d1
	bcc.w loc_007c2c
	moveq #$10,d0
	tst.b (6,a4)
	bne.b loc_007d36
	move.b ($80,a5),d0
	andi.w #$3f,d0
	bne.b loc_007d3c
	moveq #4,d0
	btst.b #6,($80,a5)
	beq.b loc_007d36
	lea (p1memory,a5),a0
	btst.b #0,($101,a6)
	bne.b loc_007d30
	lea (p1memory,a5),a0

loc_007d30:
	moveq #0,d0
	move.b ($118,a0),d0

loc_007d36:
	jmp loc_01ffa0

loc_007d3c:
	rts

;==============================================
loc_007d3e:
	move.b ($104,a5),d1
	or.b ($14a,a5),d1
	or.b ($106,a5),d1
	or.b ($8f,a5),d1
	or.b ($8c,a5),d1
	bne.w loc_007f32
	tst.b (Dip_Join_in,a5)
	beq.w loc_00843c
	lea ($70,a5),a4
	moveq #0,d0
	tst.b ($9e,a5)
	beq.b loc_007d74
	move.b ($101,a6),d0
	lsl.w #3,d0
	lea (a4,d0.w),a4

loc_007d74
	tst.b ($9c,a5)
	bne.b loc_007d8c
	move.b (6,a4),d1
	moveq #1,d3
	add.b ($9d,a5),d3
	andi.b #$ef,ccr
	sbcd.b d3,d1
	bcs.b loc_007d98

loc_007d8c:
	move.b ($105,a6),d0
	move.w loc_007d9e(pc,d0.w),d1
	jmp loc_007d9e(pc,d1.w)

loc_007d98:
	clr.w ($104,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_007d9e:
	dc.w loc_007da2-loc_007d9e
	dc.w loc_007db6-loc_007d9e

;==============================================
loc_007da2:
	addq.b #2,($105,a6)
	moveq #1,d0
	tst.b ($9c,a5)
	bne.b loc_007db0
	moveq #$c,d0

loc_007db0:
	jmp loc_01ffa0

loc_007db6:
	bsr.w loc_007e30
	bsr.w loc_008322
	beq.w loc_007e54
	tst.b ($9c,a5)
	bne.b loc_007de0
	move.b (6,a4),d1
	moveq #1,d3
	add.b ($9d,a5),d3
	andi.b #$ef,ccr
	sbcd.b d3,d1
	bcs.w loc_007e54
	move.b d1,(6,a4)

loc_007de0:
	addq.b #1,(-$7398,a5)
	moveq #0,d0
	move.b #4,($104,a6)
	move.b d0,($105,a6)
	move.l d0,($110,a6)
	move.b d0,($145,a6)
	move.b d0,($149,a6)
	move.b d0,($146,a6)
	move.b d0,($147,a6)
	move.b d0,($148,a6)
	move.b d0,($119,a6)
	move.b d0,($162,a6)
	move.l d0,($140,a6)
	move.b d0,($15c,a6)
	move.b #0,($160,a6)
	tst.b ($101,a6)
	beq.w loc_007e56
	move.b #1,($160,a6)
	bra.w loc_007e56

loc_007e30:
	move.b ($80,a5),d0
	andi.w #$3f,d0
	bne.b loc_007e54
	moveq #$c,d0
	tst.b ($9c,a5)
	beq.b loc_007e4e
	moveq #1,d0
	btst.b #6,($80,a5)
	beq.b loc_007e4e
	moveq #0,d0

loc_007e4e
	jmp loc_01ffa0

loc_007e54
	rts

;==============================================
loc_007e56:
	move.b ($106,a5),d1
	or.b ($14a,a5),d1
	bne.w loc_0081ee
	move.b ($105,a6),d0
	move.w loc_007e6e(pc,d0.w),d1
	jmp loc_007e6e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_007e6e:
	dc.w loc_007e72-loc_007e6e
	dc.w loc_007f04-loc_007e6e

;==============================================
loc_007e72:
	move.b ($8f,a5),d0
	or.b ($8c,a5),d0
	or.b ($8a,a5),d0
	bne.w loc_007f32
	tst.b ($b8,a5)
	bne.w loc_007ee8
	tst.b ($ab,a5)
	bne.w loc_007efa
	moveq #1,d0
	jsr loc_033f06
	beq.b loc_007ee6
	move.b #1,($8a,a5)
	move.b #1,($8c,a5)
	move.b #1,($8b,a5)
	addq.b #2,($105,a6)
	moveq #0,d0
	move.b d0,($181,a5)
	move.b d0,($182,a5)
	move.l a6,(-$7096,a5)
	lea (p1memory,a5),a6
	jsr loc_00374e
	lea (p2memory,a5),a6
	jsr loc_00374e
	jsr loc_01c15c
	movea.l (-$7096,a5),a6
	moveq #$10,d0
	jmp loc_0039e0

loc_007ee6:
	rts

loc_007ee8:
	cmpi.b #3,(Active_Player,a5)
	beq.b loc_007ef6
	jsr loc_02057c

loc_007ef6
	st.b ($b8,a5)

loc_007efa:
	bsr.w loc_007f38
	jmp loc_01ffc2

;==============================================
loc_007f04:
	tst.b ($8b,a5)
	bpl.b loc_007f32
	bsr.w loc_007f38
	moveq #0,d0
	move.w #2,(0,a5)
	move.w d0,(2,a5)
	move.l d0,(4,a5)
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.b d0,($8a,a5)

loc_007f32:
	jmp loc_01ffc2

;==============================================
loc_007f38:
	moveq #0,d0
	move.b #6,($104,a6)
	move.b d0,($105,a6)
	move.w d0,($106,a6)
	move.w d0,($108,a6)
	move.w d0,($10a,a6)
	move.w d0,($10c,a6)
	move.w d0,($10e,a6)
	move.b #2,($100,a6)
	move.b #2,($118,a6)
	move.b d0,($125,a6)
	move.b d0,($126,a6)
	move.b d0,($128,a6)
	move.b d0,($130,a6)
	move.b d0,($163,a6)
	move.w d0,($114,a6)
	move.b d0,($15d,a6)
	move.b d0,($131,a6)
	move.b d0,($15a,a6)
	move.b d0,($15e,a6)
	move.b d0,($14b,a6)
	move.b d0,($15f,a6)
	move.b ($160,a6),($102,a6)
	move.b ($162,a6),(PL_ism_choice,a6)
	move.w #$90,($154,a6)
	lea (p2memory,a5),a1
	tst.b ($101,a6)
	beq.b loc_007fb4
	lea (p1memory,a5),a1

loc_007fb4:
	tst.b ($100,a1)
	beq.b loc_007fe2
	cmpi.b #6,($104,a1)
	bne.b loc_007fe2
	cmpi.b #$63,($119,a1)
	beq.b loc_007fe2
	moveq #1,d0
	movea.l #loc_01bbfc,a0
	lsl.w #2,d0
	lea (a0,d0.w),a0
	lea ($114,a1),a1
	jsr loc_01bb28

loc_007fe2:
	moveq #0,d0
	lea (a6),a4
	jsr loc_01bf80
	move.b ($101,a6),d2
	bset.b d2,(Active_Player,a5)
	bset.b d2,($8d,a5)
	bsr.w loc_008018
	move.b #1,($ad,a5)
	clr.b ($147,a5)
	move.l ($134,a6),d0
	clr.l ($134,a6)
	addq.w #1,($1fa,a5)
	jmp loc_002b36

;==============================================
loc_008018:
	tst.b ($bf,a5)
	bne.w loc_0080c2
	move.b ($101,a6),d0
	btst d0,(Active_Player,a5)
	beq.w loc_0080c2
	tst.b ($168,a5)
	bne.w loc_0080c2
	move.w ($11a,a6),d3
	andi.w #$7700,d3
	beq.w loc_0080c2
	cmpi.w #$7700,d3
	bne.b loc_008056
	cmpi.b #4,(game_unlock,a5)
	bne.b loc_0080c2
	st.b ($15f,a6)
	bra.w loc_0080c2

loc_008056
	cmpi.w #$700,d3
	bne.b loc_008072
	cmpi.b #4,(game_unlock,a5)
	bne.b loc_0080c2
	st.b ($14b,a6)
	move.b #$ff,($149,a6)
	bra.w loc_0080c2

loc_008072
	cmpi.w #$1100,d3
	bne.b loc_00808a
	cmpi.b #3,(game_unlock,a5)
	bcs.b loc_0080c2
	move.b #1,($131,a6)
	bra.w loc_0080c2

loc_00808a:
	cmpi.w #$2200,d3
	bne.b loc_0080ae
	cmpi.b #3,(game_unlock,a5)
	bcs.b loc_0080c2
	tst.b (Dip_1PRounds,a5)
	beq.b loc_0080c2
	tst.b (Dip_2PRounds,a5)
	beq.b loc_0080c2
	move.b #1,($15a,a6)
	bra.w loc_0080c2

loc_0080ae
	cmpi.w #$4400,d3
	bne.b loc_0080c2
	cmpi.b #2,(game_unlock,a5)
	bcs.b loc_0080c2
	move.b #1,($15e,a6)

loc_0080c2
	rts

;==============================================
loc_0080c4:
	move.b ($101,a6),d0
	bset.b d0,($8e,a5)
	tst.b ($14a,a5)
	bne.w loc_0081ee
	tst.b ($106,a5)
	bne.w loc_0081ee
	tst.b ($11f,a5)
	beq.w loc_0081ee
	move.b ($105,a6),d0
	move.w loc_0080f0(pc,d0.w),d1
	jmp loc_0080f0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0080f0:
	dc.w loc_0080f4-loc_0080f0
	dc.w loc_008134-loc_0080f0

;==============================================
loc_0080f4:
	addq.b #2,($105,a6)
	moveq #0,d0
	lea ($70,a5),a4
	tst.b ($9e,a5)
	beq.b loc_008110
	move.b ($101,a6),d0
	ext.w d0
	lsl.w #3,d0
	lea (a4,d0.w),a4

loc_008110:
	move.b (6,a4),($103,a6)
	move.b (1,a4),($12f,a6)
	move.b #$7f,($10a,a6)
	move.b #9,($10c,a6)
	move.b #1,($10e,a6)
	jmp loc_01ffc2

;==============================================
loc_008134:
	bsr.w loc_00823c
	bsr.w loc_008284
	bsr.w loc_0082fe
	beq.w loc_0081b8
	tst.b ($9c,a5)
	bne.b loc_00815e
	move.b (6,a4),d0
	moveq #1,d3
	andi.b #$ef,ccr
	sbcd.b d3,d0
	bcs.w loc_0081b8
	move.b d0,(6,a4)

loc_00815e:
	move.b ($101,a6),d0
	bclr.b d0,($8e,a5)
	move.b #4,($104,a6)
	clr.b ($105,a6)
	move.b #$7f,($10a,a6)
	move.b #1,($10e,a6)
	move.b #1,($145,a6)
	cmpi.b #$63,($119,a6)
	beq.b loc_0081a6
	addq.b #1,($119,a6)
	moveq #1,d0
	movea.l #loc_01bbfc,a0
	lsl.w #2,d0
	lea (a0,d0.w),a0
	lea ($114,a6),a1
	jsr loc_01bb28

loc_0081a6
	andi.l #$ff,($110,a6)
	addq.b #1,(-$7398,a5)
	moveq #0,d0
	bra.w loc_007e56

loc_0081b8
	tst.b ($8c,a5)
	bne.w loc_007f32
	tst.b ($8f,a5)
	bne.w loc_007f32
	tst.b ($bd,a5)
	bne.w loc_007f32
	subq.b #1,($10e,a6)
	bpl.b loc_008222
	move.b #1,($10e,a6)
	subq.b #1,($10a,a6)
	bne.b loc_008222
	move.b #$7f,($10a,a6)
	subq.b #1,($10c,a6)
	bpl.b loc_008222

loc_0081ee:
	addq.b #2,($104,a6)
	moveq #0,d0
	move.b d0,($105,a6)
	move.b d0,($106,a6)
	move.b d0,($107,a6)
	move.b d0,($10a,a6)
	move.b d0,($10c,a6)
	move.b d0,($119,a6)
	move.b d0,($14b,a6)
	move.b ($101,a6),d0
	bclr.b d0,($8e,a5)
	move.l ($134,a6),d0
	jmp loc_01ffc2

loc_008222:
	move.b (6,a4),($103,a6)
	move.b (1,a4),($12f,a6)
	moveq #$e,d0
	jsr loc_01ffa0
	bra.w loc_008358
	rts

;==============================================
loc_00823c:
	tst.b ($8c,a5)
	bne.b loc_008282
	tst.b ($8f,a5)
	bne.b loc_008282
	tst.b ($bd,a5)
	bne.b loc_008282
	move.w ($11c,a6),d0
	not.w d0
	and.w ($11a,a6),d0
	andi.w #$7700,d0
	beq.b loc_008282
	tst.b ($10c,a6)
	bne.b loc_008272
	move.b #0,($10e,a6)
	move.b #1,($10a,a6)
	bra.b loc_008282

loc_008272:
	subq.b #1,($10c,a6)
	move.b #$7f,($10a,a6)
	move.b #1,($10e,a6)

loc_008282:
	rts

;==============================================
loc_008284:
	lea.l ($70,a5),a4
	moveq #0,d0
	tst.b ($9e,a5)
	beq.b loc_00829c
	move.b ($101,a6),d0
	ext.w d0
	lsl.w #3,d0
	lea.l (a4,d0.w),a4

loc_00829c:
	move.b (6,a4),d0
	cmp.b ($103,a6),d0
	bgt.b loc_0082b0
	move.b (1,a4),d0
	cmp.b ($12f,a6),d0
	ble.b loc_0082d6

loc_0082b0:
	move.b (6,a4),($103,a6)
	move.b (1,a4),($12f,a6)
	cmpi.b #3,($8e,a5)
	beq.b loc_0082d8
	move.b #$7f,($10a,a6)
	move.b #9,($10c,a6)
	move.b #1,($10e,a6)

loc_0082d6:
	rts

loc_0082d8:
	move.b #$7f,($50a,a5)
	move.b #9,($50c,a5)
	move.b #1,($50e,a5)
	move.b #$7f,($90a,a5)
	move.b #9,($90c,a5)
	move.b #1,($90e,a5)
	rts

;==============================================
loc_0082fe:
	tst.b ($9c,a5)
	bne.b loc_008322
	moveq #0,d0
	lea.l ($70,a5),a4
	tst.b ($9e,a5)
	beq.b loc_00831c
	move.b ($101,a6),d0
	ext.w d0
	lsl.w #3,d0
	lea.l (a4,d0.w),a4

loc_00831c:
	tst.b (6,a4)
	beq.b loc_008354

loc_008322:
	tst.b ($106,a5)
	bne.b loc_008354
	tst.b ($8c,a5)
	bne.w loc_008354
	tst.b ($8f,a5)
	bne.w loc_008354
	moveq #0,d1
	tst.b ($101,a6)
	beq.b loc_008342
	moveq #1,d1

loc_008342:
	move.b ($61,a5),d0
	not.b d0
	and.b ($60,a5),d0
	btst.l d1,d0
	beq.b loc_008354
	moveq #1,d0
	rts

loc_008354:
	moveq #0,d0
	rts

;==============================================
loc_008358:
	tst.b ($bd,a5)
	bne.w loc_0083a6
	move.w #$2010,d1
	moveq #$1f,d3
	move.w #$e0bc,d0
	tst.b ($101,a6)
	beq.b loc_008384
	move.w #$e194,d0
	bra.b loc_008384

loc_008376:
	move.w #$e0a4,d0
	tst.b ($101,a6)
	beq.b loc_008384
	move.w #$e1ac,d0

loc_008384:
	movea.w ($71b8,a5),a1
	moveq #0,d2
	move.b ($10c,a6),d2
	addi.w #$76f5,d2
	movem.w d0-d3,(a1)
	lea.l (8,a1),a1
	move.w a1,($71b8,a5)
	addq.w #1,($71bc,a5)
	addq.w #1,($71c0,a5)

loc_0083a6:
	rts

;==============================================
loc_0083a8:
	tst.b ($bd,a5)
	bne.w loc_007f32
	jmp loc_00844e

;==============================================
loc_0083b6:
	tst.b ($106,a5)
	bne.w loc_007f32
	move.b ($105,a6),d0
	move.w loc_0083ca(pc,d0.w),d1
	jmp loc_0083ca(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0083ca:
	dc.w loc_0083d2-loc_0083ca
	dc.w loc_0083e4-loc_0083ca
	dc.w loc_008404-loc_0083ca
	dc.w loc_00842e-loc_0083ca

;==============================================
loc_0083d2:
	addq.b #2,($105,a6)
	move.b #$5a,($10a,a6)
	moveq #$f,d0
	jmp loc_01ffa0

;==============================================
loc_0083e4:
	move.w ($11c,a6),d0
	not.w d0
	and.w ($11a,a6),d0
	andi.w #$7700,d0
	bne.b loc_0083fa
	subq.b #1,($10a,a6)
	bne.b loc_008426

loc_0083fa:
	addq.b #2,($105,a6)
	move.b #$1e,($10a,a6)

loc_008404:
	subq.b #1,($10a,a6)
	bpl.b loc_008426
	addq.b #2,($105,a6)
	moveq #0,d0
	move.l d0,($110,a6)
	move.b d0,($119,a6)
	move.b ($101,a6),d0
	bclr.b d0,(Active_Player,a5)
	jmp loc_01ffc2

loc_008426:
	moveq #$f,d0
	jmp loc_01ffa0

;==============================================
loc_00842e:
	tst.b ($b8,a5)
	bne.w loc_007f32
	move.l d0,($104,a6)
	rts

;==============================================
loc_00843c:
	moveq #$1b,d0
	tst.w (Region,a5)
	beq.w loc_008448
	moveq #$20,d0

loc_008448:
	jmp loc_01ffa0

;==============================================
loc_00844e:
	move.b ($105,a6),d0
	move.w loc_00845a(pc,d0.w),d1
	jmp loc_00845a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00845a:
	dc.w loc_008462-loc_00845a
	dc.w loc_0084c0-loc_00845a
	dc.w loc_008550-loc_00845a
	dc.w loc_008570-loc_00845a

;==============================================
loc_008462:
	addq.b #2,($105,a6)
	clr.b ($16f,a6)
	move.l #$30302d,($168,a6)
	move.w #$960,($10e,a6)
	move.w #$258,($10a,a6)
	move.b #$f0,($10c,a6)
	bsr.w loc_0088dc
	bsr.w loc_008588
	bsr.w loc_00863a
	move.w (-$5c44,a5),d2
	add.w d2,d2
	move.b ($16c,a6),d0
	move.b ($16d,a6),d1
	add.b d1,d0
	cmp.b d2,d0
	bcc.w loc_008570
	move.b ($16c,a6),d0
	cmp.b d0,d1
	bcc.b loc_0084b0
	move.b d1,d0

loc_0084b0:
	move.b d0,($16e,a6)
	movea.w ($71b8,a5),a4
	bsr.w loc_008742
	bra.w loc_0086ea

;==============================================
loc_0084c0:
	bsr.w loc_0087ce
	move.b ($16c,a6),d0
	move.b ($16d,a6),d1
	cmp.b d0,d1
	bcc.b loc_0084d2
	move.b d1,d0

loc_0084d2:
	move.b d0,($16e,a6)
	cmpi.b #4,($16f,a6)
	beq.b loc_0084f6
	subq.w #1,($10e,a6)
	bmi.b loc_0084f6
	subq.w #1,($10a,a6)
	bmi.b loc_0084f6
	movea.w ($71b8,a5),a4
	bsr.w loc_008742
	bra.w loc_0086ea

loc_0084f6:
	addq.b #2,($105,a6)
	move.b #$3c,($10a,a6)
	move.b #$2d,($16b,a6)
	bsr.w loc_0088a6
	lea.l (-$5c52,a5),a0
	tst.b ($162,a6)
	bmi.b loc_008522
	lea.l ($1d0,a0),a0
	tst.b ($162,a6)
	beq.b loc_008522
	lea.l ($1d0,a0),a0

loc_008522:
	moveq #0,d0
	move.b ($16c,a6),d0
	cmp.w (-$5c44,a5),d0
	bcc.b loc_008536
	lsl.w #4,d0
	move.l ($168,a6),(4,a0,d0.w)

loc_008536
	lea.l ($570,a0),a0
	moveq #0,d0
	move.b ($16d,a6),d0
	cmp.w (-$5c44,a5),d0
	bcc.b loc_00854e
	lsl.w #4,d0
	move.l ($168,a6),(4,a0,d0.w)

loc_00854e:
	rts

;==============================================
loc_008550:
	subq.b #1,($10a,a6)
	bpl.b loc_00855a
	addq.b #2,($105,a6)

loc_00855a:
	btst.b #0,($81,a5)
	beq.b loc_00856e
	movea.w ($71b8,a5),a4
	bsr.w loc_008742
	bra.w loc_0086ea

loc_00856e:
	rts

;==============================================
loc_008570:
	addq.b #2,($104,a6)
	moveq #0,d0
	move.b d0,($105,a6)
	move.w d0,($10a,a6)
	move.l d0,($10c,a6)
	move.w d0,($16c,a6)
	rts

;==============================================
loc_008588:
	lea.l (-$5c42,a5),a3
	tst.b ($162,a6)
	bmi.b loc_0085a0
	lea.l ($1d0,a3),a3
	tst.b ($162,a6)
	beq.b loc_0085a0
	lea.l ($1d0,a3),a3

loc_0085a0:
	moveq #$1b,d1
	move.b ($160,a6),d0
	lea.l ($1b0,a3),a0

loc_0085aa:
	cmp.b (8,a0),d0
	beq.b loc_0085ba
	lea.l (-$10,a0),a0
	dbra d1,loc_0085aa
	moveq #$1c,d1

loc_0085ba:
	move.l ($164,a6),d0
	cmp.l (a0),d0
	bcc.b loc_0085c8
	moveq #$1c,d1
	lea.l ($1c0,a3),a0

loc_0085c8:
	subq.w #1,d1
	bmi.b loc_0085f8
	cmpi.b #$1b,d1
	beq.b loc_00860a
	lea.l (-$10,a0),a1

loc_0085d6:
	cmp.l (a1),d0
	bcs.b loc_0085f8
	move.l (a1),(a0)
	move.l (4,a1),(4,a0)
	move.l (8,a1),(8,a0)
	move.b ($c,a1),($c,a0)
	movea.l a1,a0
	lea.l (-$10,a1),a1
	dbra d1,loc_0085d6

loc_0085f8:
	move.l ($164,a6),(a0)
	move.l #$2000f2d,(4,a0)
	move.l ($160,a6),(8,a0)

loc_00860a:
	addq.w #2,d1
	move.b d1,($16c,a6)
	move.b d1,($c,a0)
	lea.l (p1memory,a5),a4
	tst.b ($101,a6)
	bne.b loc_008622
	lea.l (p2memory,a5),a4

loc_008622:
	move.b ($16c,a4),d2
	beq.b loc_008638
	cmp.b d1,d2
	bcs.b loc_008638
	cmpi.b #6,d2
	beq.b loc_008638
	addq.b #1,d2
	move.b d2,($16c,a4)

loc_008638:
	rts

;==============================================
loc_00863a:
	lea.l (-$56d2,a5),a3
	tst.b ($162,a6)
	bmi.b loc_008652
	lea.l ($1d0,a3),a3
	tst.b ($162,a6)
	beq.b loc_008652
	lea.l ($1d0,a3),a3

loc_008652:
	moveq #$1b,d1
	move.b ($160,a6),d0
	lea.l ($1b0,a3),a0

loc_00865c:
	cmp.b (8,a0),d0
	beq.b loc_00866c
	lea.l (-$10,a0),a0
	dbra d1,loc_00865c
	moveq #$1c,d1

loc_00866c:
	move.b ($163,a6),d0
	cmp.b ($b,a0),d0
	bcc.b loc_00867c
	moveq #$1c,d1
	lea.l ($1c0,a3),a0

loc_00867c:
	subq.w #1,d1
	bmi.b loc_0086a8
	cmpi.b #$1b,d1
	beq.b loc_0086ba
	lea.l (-$10,a0),a1

loc_00868a:
	cmp.b ($b,a1),d0
	bcs.b loc_0086a8
	move.l (a1),(a0)
	move.l (4,a1),(4,a0)
	move.l (8,a1),(8,a0)
	movea.l a1,a0
	lea.l (-$10,a1),a1
	dbra d1,loc_00868a

loc_0086a8:
	move.l #$2000f2d,(4,a0)
	move.l ($164,a6),(a0)
	move.l ($160,a6),(8,a0)

loc_0086ba:
	addq.w #2,d1
	move.b d1,($16d,a6)
	move.b d1,($c,a0)
	lea.l (p1memory,a5),a4
	tst.b ($101,a6)
	bne.b loc_0086d2
	lea.l (p2memory,a5),a4

loc_0086d2:
	move.b ($16d,a4),d2
	beq.b loc_0086e8
	cmp.b d1,d2
	bcs.b loc_0086e8
	cmpi.b #6,d2
	beq.b loc_0086e8
	addq.b #1,d2
	move.b d2,($16d,a4)

loc_0086e8:
	rts

;==============================================
loc_0086ea:
	lea.l ($168,a6),a0
	lea.l loc_00896c(pc),a1
	moveq #3,d6
	move.w #$e080,d0
	tst.b ($101,a6)
	beq.b loc_008702
	move.w #$e170,d0

loc_008702:
	move.w #$2010,d1
	cmpi.b #$a,($16e,a6)
	bcs.b loc_008712
	addi.w #$d,d0

loc_008712:
	moveq #0,d3
	move.b (a0)+,d3
	lsl.w #2,d3
	move.w (a1,d3.w),d2
	move.w (2,a1,d3.w),d3
	addi.w #$6c00,d2
	movem.w d0-d3,(a4)
	lea.l (8,a4),a4
	addi.w #$10,d0
	dbra d6,loc_008712
	move.w a4,($71b8,a5)
	addq.w #4,($71bc,a5)
	addq.w #4,($71c0,a5)
	rts

;==============================================
loc_008742:
	move.w #$e060,d0
	tst.b ($101,a6)
	beq.b loc_008750
	move.w #$e150,d0

loc_008750:
	move.w #$2010,d1
	move.b ($16e,a6),d2
	ext.w d2
	lsl.w #2,d2
	lea.l loc_0088f4(pc),a0
	lea.l (a0,d2.w),a0
	move.w (a0)+,d2
	addi.w #$6c00,d2
	move.w #$1f,d3
	movem.w d0-d3,(a4)
	lea.l (8,a4),a4
	cmpi.b #$a,($16e,a6)
	bcc.b loc_00879e
	move.w (a0)+,d2
	addi.w #$6c00,d2
	addi.w #$d,d0
	movem.w d0-d3,(a4)
	lea.l (8,a4),a4
	move.w a4,($71b8,a5)
	addq.w #2,($71bc,a5)
	addq.w #2,($71c0,a5)
	rts

loc_00879e:
	move.w (a0)+,d2
	addi.w #$6c00,d2
	addi.w #$d,d0
	movem.w d0-d3,(a4)
	lea.l (8,a4),a4
	move.w #$6f3f,d2
	addi.w #$d,d0
	movem.w d0-d3,(a4)
	lea.l (8,a4),a4
	move.w a4,($71b8,a5)
	addq.w #3,($71bc,a5)
	addq.w #3,($71c0,a5)
	rts

;==============================================
loc_0087ce:
	move.w ($11a,a6),d0
	beq.w loc_00889e
	move.w #$258,($10a,a6)
	addi.b #$10,($10c,a6)
	bcc.w loc_00889c
	lea.l ($168,a6),a1
	move.b ($16f,a6),d1
	ext.w d1
	lea.l (a1,d1.w),a1
	move.w d0,d1
	andi.w #$7700,d1
	beq.b loc_00885a
	cmpi.b #$2f,(a1)
	bne.b loc_00881c

loc_008802:
	move.b #$2d,(a1)+
	addq.b #1,($16f,a6)
	cmpi.b #4,($16f,a6)
	bne.b loc_008802
	move.b #$2d,($16b,a6)
	bra.w loc_00889c

loc_00881c:
	cmpi.b #$2e,(a1)
	bne.b loc_008842
	move.b #$30,(a1)
	cmpi.b #3,($16f,a6)
	bne.b loc_008832
	move.b #$2d,(a1)

loc_008832:
	subq.b #1,($16f,a6)
	bpl.b loc_00889c
	clr.b ($16f,a6)
	move.b #$2e,(a1)
	bra.b loc_00889c

loc_008842:
	move.b (a1),(1,a1)
	addq.b #1,($16f,a6)
	cmpi.b #3,($16f,a6)
	bne.b loc_00889c
	move.b #$2f,(1,a1)
	bra.b loc_00889c

loc_00885a:
	btst #1,d0
	beq.b loc_00887e
	subq.b #1,(a1)
	bpl.b loc_00886a
	move.b #$2f,(a1)
	bra.b loc_00889c

loc_00886a:
	cmpi.b #3,($16f,a6)
	bne.b loc_00889c
	cmpi.b #$2e,(a1)
	bcc.b loc_00889c
	move.b #$2f,(a1)
	bra.b loc_00889c

loc_00887e:
	btst #0,d0
	beq.b loc_00889c
	addq.b #1,(a1)
	cmpi.b #$2f,(a1)
	bls.b loc_00889c
	move.b #0,(a1)
	cmpi.b #3,($16f,a6)
	bne.b loc_00889c
	move.b #$2e,(a1)

loc_00889c:
	rts

loc_00889e:
	move.b #$f0,($10c,a6)
	rts

;==============================================
loc_0088a6:
	lea.l ($168,a6),a0
	moveq #3,d1

loc_0088ac:
	cmpi.b #$2e,(a0)+
	bcs.b loc_0088b8
	move.b #$2d,(-$1,a0)

loc_0088b8:
	dbra d1,loc_0088ac
	lea.l loc_008a3c(pc),a0
	move.l ($168,a6),d0
	moveq #$1f,d1

loc_0088c6:
	cmp.l (a0),d0
	beq.b loc_0088d4
	lea.l (8,a0),a0
	dbra d1,loc_0088c6
	bra.b loc_0088da

loc_0088d4:
	move.l (4,a0),($168,a6)

loc_0088da:
	rts

;==============================================
loc_0088dc:
	lea.l (-$5c42,a5),a0
	moveq #0,d0
	move.w #$ad,d1

loc_0088e6:
	move.b d0,($c,a0)
	lea.l ($10,a0),a0
	dbra d1,loc_0088e6
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0088f4:
	dc.w $0020,$0020,$0351,$033c,$0352,$033d
	dc.w $0353,$033e,$0354,$033f,$0355,$033f
	dc.w $0356,$033f,$0357,$033f,$0358,$033f
	dc.w $0359,$033f,$0351,$0350,$0351,$0351
	dc.w $0351,$0352,$0351,$0353,$0351,$0354
	dc.w $0351,$0355,$0351,$0356,$0351,$0357
	dc.w $0351,$0358,$0351,$0359,$0352,$0350
	dc.w $0352,$0351,$0352,$0352,$0352,$0353
	dc.w $0352,$0354,$0352,$0355,$0352,$0356
	dc.w $0352,$0357,$0352,$0358,$0352,$0359

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00896c:
	dc.w $035a,$001f,$035b,$001f,$035c,$001f,$035d,$001f
	dc.w $035e,$001f,$035f,$001f,$0360,$001f,$0361,$001f
	dc.w $0362,$001f,$0363,$001f,$0364,$001f,$0365,$001f
	dc.w $0366,$001f,$0367,$001f,$0368,$001f,$0369,$001f
	dc.w $036a,$001f,$036b,$001f,$036c,$001f,$036d,$001f
	dc.w $036e,$001f,$036f,$001f,$0370,$001f,$0371,$001f
	dc.w $0372,$001f,$0373,$001f,$0350,$001f,$0351,$001f
	dc.w $0352,$001f,$0353,$001f,$0354,$001f,$0355,$001f
	dc.w $0356,$001f,$0357,$001f,$0358,$001f,$0359,$001f
	dc.w $0374,$001f,$038b,$001f,$0399,$001f,$037f,$001f
	dc.w $037e,$001f,$0387,$001f,$0377,$001f,$0379,$001f
	dc.w $0384,$001f,$0020,$001f,$038d,$001f,$038e,$001f
	dc.w $0389,$001f,$0020,$001f,$0020,$001f,$0020,$001f


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_008a3c:
	dc.l $2d2d2d2d,$020e0c2d,$002d2d2d,$020f122d
	dc.l $00002d2d,$150c0f2d,$0000002d,$02000f2d
	dc.l $1204172d,$02070c2d,$0012122d,$0e070a2d
	dc.l $0f08122d,$1613112d,$0f04042d,$0f0e0d2d
	dc.l $0811002d,$12080d2d,$0a0a0a2d,$0711032d
	dc.l $0413002d,$070a032d,$0f0b0e2d,$080d012d
	dc.l $0f0b1a2d,$1311002d,$0308042d,$0d08122d
	dc.l $0708152d,$0d0e062d,$2020202d,$020a182d
	dc.l $00070e2d,$0608142d,$00071a2d,$0700022d
	dc.l $00140c2d,$0f0d032d,$0514022d,$0d040e2d
	dc.l $05140a2d,$0c0e1c2d,$0c0d0a2d,$0e010d2d
	dc.l $0e0c0a2d,$120b112d,$1a0c0a2d,$030d002d
	dc.l $0e0c042d,$0c0b022d,$1a0c042d,$0c00172d
	dc.l $0a00162d,$130b032d,$0a06012d,$0a190e2d
	dc.l $1b1a222d,$0e06132d,$1b0e222d,$0a1c0e2d
	dc.l $130b032d,$0a00162d,$0c080d2d,$0304012d

;==============================================
loc_008b3c:
	moveq #0,d0
	move.w d0,($22,a5)
	move.w d0,($24,a5)
	move.w d0,($26,a5)
	move.w d0,($28,a5)
	move.w d0,($2a,a5)
	move.w d0,($2c,a5)
	move.b #$3c,(-$708d,a5)
	move.b d0,($181,a5)
	move.b d0,($182,a5)
	move.b d0,($e8,a5)
	move.b d0,($e9,a5)
	move.w #$100,d0
	jsr loc_001346
	st.b ($a9,a5)
	moveq #1,d0
	jsr loc_001370

loc_008b82:
	st.b ($84,a5)
	addq.b #1,($81,a5)
	bsr.b loc_008ba8
	jsr loc_01b096
	jsr loc_033746
	bsr.w loc_008cbe
	jsr loc_00182e
	bsr.w loc_008c28
	bra.b loc_008b82

loc_008ba8:
	clr.b ($134,a5)
	tst.b ($118,a5)
	beq.b loc_008bbc
	st.b ($134,a5)
	clr.b ($118,a5)
	bra.b loc_008be0

loc_008bbc:
	tst.b ($12d,a5)
	beq.b loc_008be0
	move.b (Dev_Turbo,a5),d0
	andi.w #$f,d0
	lsl.w #2,d0
	move.l TurboPatternTable(pc,d0.w),d0
	move.b ($81,a5),d1
	andi.w #$1f,d1
	btst.l d1,d0
	beq.b loc_008be0
	st.b ($118,a5)

loc_008be0:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Frameskip Patterns
TurboPatternTable:
	dc.l %00000000000000000000000000000000;$00000000 Normal
	dc.l %00000000000000001000000000000000;$00008000
	dc.l %00000010000000000000001000000000;$02000200
	dc.l %00000000100000001000000010000000;$00808080
	dc.l %00001000000010000000100000001000;$08080808
	dc.l %00001000001000001000010000100001;$08208421
	dc.l %00010000100001000001000010000100;$10841084 Turbo 1
	dc.l %00100001000100001000100001000100;$21108844
	dc.l %00100010001000100010001000100010;$22222222 Turbo 2
	dc.l %01000100100010001001000100100010;$44889122
	dc.l %10010010010001001001001001000100;$92449244
	dc.l %01001001001001001010010010010010;$4924a492
	dc.l %00101001001010010010100100101001;$29292929
	dc.l %01001010010100101010010100101001;$4a52a529
	dc.l %01010101010101010101010101010101;$55555555
	dc.l %01010101010101010101010101010101;$55555555

;==============================================
loc_008c22:
	clr.b ($e7,a5)
	rts

;==============================================
loc_008c28:
	tst.b ($84,a5)
	beq.b loc_008c4e
	tst.b ($118,a5)
	bne.b loc_008c4e
	subq.b #1,(-$708d,a5)
	bne.b loc_008c46
	move.b #$3c,(-$708d,a5)
	jsr loc_002aec

loc_008c46:
	moveq #1,d0
	jmp loc_001370

loc_008c4e:
	move.b CPSinput02,d1
	not.b d1
	move.b d1,($60,a5)
	move.w (INP_P1,a5),(INP_P1_repeat,a5)
	move.w (INP_P2,a5),(INP_P2_repeat,a5)
	move.b $804011,d3
	not.b d3
	move.b d3,d4
	lsl.b #4,d3
	andi.b #$70,d3
	andi.b #$30,d4
	andi.b #$40,d1
	or.b d1,d4
	move.b $804001,d0
	not.b d0
	move.b d0,d1
	andi.b #$f,d0
	andi.b #$f0,d1
	lsr.b #4,d1
	or.b d3,d1
	move.b d0,($59,a5)
	move.b d1,(INP_P1,a5)
	move.b CPSinput00,d0
	not.b d0
	move.b d0,d1
	andi.b #$f,d0
	andi.b #$f0,d1
	lsr.b #4,d1
	or.b d4,d1
	move.b d0,($5d,a5)
	move.b d1,(INP_P2,a5)
	rts

;==============================================
loc_008cbe:
	move.w (0,a5),d0
	move.w loc_008cca(pc,d0.w),d0
	jmp loc_008cca(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_008cca:
	dc.w loc_008cce-loc_008cca
	dc.w loc_008f80-loc_008cca

;==============================================
loc_008cce:
	addq.w #2,(0,a5)
	jsr loc_01bdd6
	moveq #0,d0
	move.b #1,($8f,a5)
	move.b d0,($bd,a5)
	move.b d0,($8a,a5)
	move.b d0,($8b,a5)
	move.b d0,($ac,a5)
	move.b d0,($ad,a5)
	move.b d0,($b4,a5)
	move.l d0,($b0,a5)
	move.b d0,($12d,a5)
	move.b d0,($b8,a5)
	move.b d0,($ba,a5)
	move.b d0,($104,a5)
	move.b d0,($147,a5)
	move.b d0,($168,a5)
	move.b d0,($15d,a5)
	st.b ($130,a5)
	move.b (Active_Player,a5),($8d,a5)
	move.b d0,($d7,a5)
	move.b d0,($16d,a5)
	move.b ($d4,a5),($16a,a5)
	move.b ($d5,a5),($16b,a5)
	move.b ($d6,a5),($16c,a5)
	move.b #$1c,($cd,a5)
	move.w d0,(-$7090,a5)
	move.b ($502,a5),(-$7092,a5)
	move.b ($902,a5),(-$7091,a5)
	tst.b ($bf,a5)
	beq.b loc_008d5c
	clr.b (game_unlock,a5)

loc_008d5c:
	move.w #$92a0,(palrampointer,a5)
	move.w #$92a0,($48,a5)
	move.l #$90c000,($e0,a5)
	move.b (Dip_Difficulty,a5),($be,a5)
	move.b (Dip_1PRounds,a5),d0
	addq.b #1,d0
	move.b d0,($108,a5)
	move.b (Dip_Continue,a5),($11f,a5)
	move.w #9,($14c,a5)
	tst.b ($bf,a5)
	beq.b loc_008d98
	move.w #7,($14c,a5)

loc_008d98:
	jsr RNGFunction
	andi.b #$f,d0
	move.b d0,d1
	lsl.b #2,d1
	add.b d1,d0
	add.b d0,d0
	move.b d0,($121,a5)
	jsr RNGFunction
	andi.b #$f,d0
	move.b d0,d1
	lsl.b #2,d1
	add.b d1,d0
	add.b d0,d0
	move.b d0,($122,a5)
	jsr RNGFunction
	andi.b #3,d0
	move.b d0,d1
	lsl.b #3,d0
	sub.b d1,d0
	lsl.w #2,d0
	move.b d0,($15e,a5)
	moveq #0,d1
	lea.l (p1memory,a5),a6
	moveq #0,d0
	move.w (INP_P1,a5),d2
	bsr.w loc_008e9c
	lea.l (p2memory,a5),a6
	moveq #1,d0
	move.w (INP_P2,a5),d2
	bsr.w loc_008e9c
	btst.b #0,(Active_Player,a5)
	beq.b Set_CharSelect_P2
	move.b #0,(p1_charid,a5)
	move.b #0,($560,a5)
	move.b #2,($500,a5)
	move.b #6,($504,a5)
	clr.b ($525,a5)
	clr.b ($54a,a5)
	addq.w #1,($1fa,a5)
	jsr loc_002b36
	btst.b #0,($60,a5)
	beq.b Set_CharSelect_P2
	addq.b #1,(-$7395,a5)

Set_CharSelect_P2:
	btst.b #1,(Active_Player,a5)
	beq.b Char_PlayersSet
	move.b #1,($902,a5)
	move.b #1,($960,a5)
	move.b #2,($900,a5)
	move.b #6,($904,a5)
	clr.b ($925,a5)
	clr.b ($94a,a5)
	addq.w #1,($1fa,a5)
	jsr loc_002b36
	btst.b #1,($60,a5)
	beq.b Char_PlayersSet
	addq.b #1,(-$7395,a5)

Char_PlayersSet:
	moveq #0,d0
	move.b (Dip_Game_Turbo,a5),d0
	lea.l Turbo_Options(pc),a0
	move.b (a0,d0.w),(Dev_Turbo,a5)
	bsr.w loc_008f38
	jsr loc_0088dc
	jsr loc_0202f6
	jmp loc_01b0e6

loc_008e9a:
	rts

;==============================================
loc_008e9c:
	move.b #1,(a6)
	move.b d0,(2,a6)
	move.b d0,($101,a6)
	move.b #2,($118,a6)
	move.b #1,($125,a6)
	move.b d1,($128,a6)
	move.b d1,($130,a6)
	move.b d1,($163,a6)
	move.b d1,($145,a6)
	move.b d1,($149,a6)
	move.b d1,($146,a6)
	move.b d1,($147,a6)
	move.b d1,($148,a6)
	move.b d1,($119,a6)
	move.b d1,(PL_ism_choice,a6)
	move.b d1,($162,a6)
	move.b d1,($15b,a6)
	move.b d1,($15d,a6)
	move.b d1,($131,a6)
	move.b d1,($15a,a6)
	move.b d1,($15e,a6)
	move.b d1,($14b,a6)
	move.b d1,($15f,a6)
	move.l d1,($140,a6)
	move.b d1,($15c,a6)
	move.w #$90,($154,a6)
	move.w d2,($11a,a6)
	tst.b ($83,a5)
	bne.b loc_008e9a
	btst d0,(Active_Player,a5)
	beq.b loc_008e9a
	andi.w #$7700,d2
	cmpi.w #$7000,d2
	bne.b loc_008f32
	cmpi.b #4,(game_unlock,a5)
	bne.b loc_008f32
	move.b #1,($168,a5)

loc_008f32:
	jmp loc_008018

;==============================================
loc_008f38:
	moveq #0,d7
	tst.b ($bf,a5)
	bne.w loc_008f7e
	tst.b ($168,a5)
	beq.b loc_008f7e
	move.b d7,($147,a5)
	move.b d7,($15d,a5)
	move.b d7,($531,a5)
	move.b d7,($55a,a5)
	move.b d7,($55e,a5)
	move.b d7,($54b,a5)
	move.b d7,($55f,a5)
	move.b d7,($931,a5)
	move.b d7,($95a,a5)
	move.b d7,($95e,a5)
	move.b d7,($94b,a5)
	move.b d7,($95f,a5)
	move.w #5,($14c,a5)

loc_008f7e:
	rts

;==============================================
loc_008f80:
	move.w (4,a5),d0
	move.w loc_008f8c(pc,d0.w),d1
	jmp loc_008f8c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_008f8c:
	dc.w loc_008f9a-loc_008f8c;00
	dc.w loc_008fc8-loc_008f8c;02
	dc.w loc_008fe0-loc_008f8c;04 Intro
	dc.w loc_008fce-loc_008f8c;06 Game Over Start
	dc.w loc_008fd4-loc_008f8c;08 Game Over
	dc.w loc_008fda-loc_008f8c;0a Credits
	dc.w loc_00a7fe-loc_008f8c;0c High Score

;==============================================
loc_008f9a:
	addq.w #2,(4,a5)
	move.b #1,($ab,a5)
	moveq #0,d0
	move.b d0,($124,a5)
	move.b d0,($12d,a5)
	move.b d0,($13f,a5)
	move.b d0,($401,a5)
	move.b d0,($801,a5)
	move.b d0,($c01,a5)
	move.b d0,($1001,a5)
	jmp loc_01bdd0

;==============================================
loc_008fc8:
	jmp loc_01df54

;==============================================
loc_008fce:
	jmp loc_00ac18

;==============================================
loc_008fd4:
	jmp loc_00ae1e

;==============================================
loc_008fda:
	jmp Credits_PRG

;==============================================
loc_008fe0:
	move.w (8,a5),d0
	move.w loc_008fec(pc,d0.w),d1
	jmp loc_008fec(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_008fec:
	dc.w loc_008ff6-loc_008fec
	dc.w loc_009428-loc_008fec
	dc.w loc_009444-loc_008fec
	dc.w loc_009500-loc_008fec
	dc.w loc_00a5d4-loc_008fec

;==============================================
loc_008ff6:
	addq.w #2,(8,a5)
	moveq #0,d0
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	st.b ($10e,a5)
	move.b d0,($10f,a5)
	move.b #1,($8f,a5)
	st.b ($bd,a5)
	move.b d0,($12d,a5)
	move.b d0,($b8,a5)
	move.b d0,($105,a5)
	move.b d0,($107,a5)
	move.w d0,($102,a5)
	move.b d0,($10d,a5)
	move.b d0,($10b,a5)
	move.b d0,($12a,a5)
	move.b d0,($12c,a5)
	move.b d0,($124,a5)
	move.b d0,($162,a5)
	move.b d0,($11c,a5)
	move.b d0,($11d,a5)
	move.b d0,($11e,a5)
	move.b d0,($15f,a5)
	move.b d0,($143,a5)
	move.b d0,($125,a5)
	move.b d0,($170,a5)
	move.b d0,($163,a5)
	move.b d0,($140,a5)
	move.b d0,($146,a5)
	move.b d0,($141,a5)
	move.b d0,($13f,a5)
	move.b d0,($15d,a5)
	move.b d0,($123,a5)
	move.b d0,($13e,a5)
	move.b d0,($110,a5)
	move.b d0,($178,a5)
	move.b d0,($149,a5)
	tst.b ($8c,a5)
	bne.b loc_0090a0
	move.w #Mainpalette,(palrampointer,a5)
	move.w #$90c0,($48,a5)

loc_0090a0:
	move.l #$90c000,($e0,a5)
	move.b (Dip_1PRounds,a5),d0
	addq.b #1,d0
	move.b d0,($108,a5)
	move.b (Dip_Continue,a5),($11f,a5)
	move.w ($174,a5),(stageid,a5)
	move.w #9,($14c,a5)
	tst.b ($bf,a5)
	beq.b loc_0090d0
	move.w #7,($14c,a5)

loc_0090d0:
	move.b #$63,(clock_counter,a5)
	bsr.w Set_TimerSpeed
	bsr.w loc_009178
	tst.b ($168,a5)
	bne.w loc_009142
	lea.l (p1memory,a5),a0
	lea.l (p2memory,a5),a1
	cmpi.b #3,($ac,a5)
	bne.b loc_00911a
	move.b (Dip_2PRounds,a5),d0
	addq.b #1,d0
	move.b d0,($108,a5)
	move.l #$ff,d0
	and.l d0,($110,a0)
	and.l d0,($110,a1)
	moveq #0,d0
	st.b ($141,a5)
	move.b d0,($137,a5)
	bra.b loc_009142

loc_00911a:
	btst.b #0,($ac,a5)
	bne.b loc_009124
	exg.l a0,a1

loc_009124:
	tst.b ($14b,a0)
	beq.b loc_009142
	st.b ($15d,a5)
	clr.b ($137,a5)
	clr.b ($11f,a5)
	move.b #1,($108,a5)
	move.w #$1a,($14c,a5)

loc_009142:
	jsr loc_00d1b6
	move.b ($ac,a5),d0
	move.b d0,($b9,a5)
	cmpi.b #3,d0
	bne.b loc_00915c
	move.b #1,($110,a5)

loc_00915c:
	bsr.w loc_0091d8
	jsr loc_00bbf0
	jsr loc_009426(pc)
	nop
	jsr loc_02031c
	jmp loc_01bdd0

;==============================================
loc_009178:
	moveq #0,d0
	lea.l (p1memory,a5),a0
	bsr.b loc_009190
	lea.l (p2memory,a5),a0
	bsr.b loc_009190
	lea.l (p3memory,a5),a0
	bsr.b loc_009190
	lea.l (p4memory,a5),a0

loc_009190:
	move.b d0,($ab,a0)
	move.b d0,($126,a0)
	move.w d0,($114,a0)
	move.l d0,($12a,a0)
	move.w d0,($11e,a0)
	move.b d0,($15d,a0)
	move.b #1,($159,a0)
	move.b #1,($124,a0)
	cmpi.b #$a,($102,a0)
	bne.b loc_0091d6
	tst.b ($125,a0)
	beq.b loc_0091d6
	tst.b ($168,a5)
	beq.b loc_0091d0
	cmpa.l #$ff8c00,a0
	bne.b loc_0091d6

loc_0091d0:
	move.b #1,($15d,a0)

loc_0091d6:
	rts

;==============================================
;Boss Fight Check?
loc_0091d8:
	moveq #0,d0
	move.b ($13f,a5),d0
	move.w loc_0091e6(pc,d0.w),d0
	jmp loc_0091e6(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0091e6:
	dc.w loc_0091f6-loc_0091e6
	dc.w loc_009292-loc_0091e6
	dc.w loc_0091f6-loc_0091e6
	dc.w loc_009292-loc_0091e6
	dc.w loc_0091f6-loc_0091e6
	dc.w loc_0091f6-loc_0091e6
	dc.w loc_0091f6-loc_0091e6
	dc.w loc_009292-loc_0091e6

;==============================================
loc_0091f6:
	clr.w ($138,a5)
	jsr loc_01bf44
	move.b #$1,(p1memory,a5)
	move.b #$1,(p2memory,a5)
	clr.b (p3memory,a5)
	clr.b (p4memory,a5)
	clr.b ($d59,a5)
	clr.b ($1159,a5)
	clr.b ($d24,a5)
	clr.b ($1124,a5)
	move.w #$8800,($438,a5)
	move.w #$8400,($838,a5)
	move.w #$8400,($156,a5)
	move.w #$8800,($158,a5)
	tst.b ($525,a5)
	beq.b loc_009266
	clr.b ($528,a5)
	move.b ($502,a5),d0
	cmp.b ($902,a5),d0
	bne.b loc_009266
	move.b ($532,a5),d0
	cmp.b ($932,a5),d0
	bne.b loc_009266
	tst.b ($928,a5)
	bne.b loc_009266
	move.b #1,($528,a5)

loc_009266:
	tst.b ($925,a5)
	beq.b loc_009290
	clr.b ($928,a5)
	move.b ($502,a5),d0
	cmp.b ($902,a5),d0
	bne.b loc_009290
	move.b ($532,a5),d0
	cmp.b ($932,a5),d0
	bne.b loc_009290
	tst.b ($528,a5)
	bne.b loc_009290
	move.b #1,($928,a5)

loc_009290:
	rts

;==============================================
loc_009292:
	tst.b ($168,a5)
	bne.w loc_009350
	btst.b #1,($ac,a5)
	bne.w loc_0092cc
	move.w #2,($138,a5)
	move.b #1,(p1memory,a5)
	clr.b (p2memory,a5)
	lea.l (p1memory,a5),a0
	move.w a0,($156,a5)
	move.w #$8c00,($158,a5)
	clr.b ($959,a5)
	clr.b ($924,a5)
	bra.b loc_0092f2

loc_0092cc:
	move.w #4,($138,a5)
	clr.b (p1memory,a5)
	move.b #1,(p2memory,a5)
	lea.l (p2memory,a5),a0
	move.w a0,($158,a5)
	move.w #$8c00,($156,a5)
	clr.b ($559,a5)
	clr.b ($524,a5)

loc_0092f2:
	move.w a0,($c38,a5)
	move.w a0,($1038,a5)
	move.w #$8c00,($38,a0)
	lea.l (p3memory,a5),a1
	move.b #2,($101,a1)
	bsr.b loc_009316
	lea.l (p4memory,a5),a1
	move.b #3,($101,a1)

loc_009316:
	move.b #1,(a1)
	clr.b (1,a1)
	move.b #0,(2,a1)
	move.b #1,($125,a1)
	clr.b ($128,a1)
	move.b ($102,a1),d0
	cmp.b ($102,a0),d0
	bne.b loc_00934e
	move.b ($132,a1),d0
	cmp.b ($132,a0),d0
	bne.b loc_00934e
	tst.b ($128,a0)
	bne.b loc_00934e
	move.b #1,($128,a1)

loc_00934e:
	rts

loc_009350:
	move.w #$6,($138,a5)
	move.w #$5,($14c,a5)
	move.b #$1,(p1memory,a5)
	move.b #$1,(p2memory,a5)
	moveq #0,d0
	move.b d0,($559,a5)
	move.b d0,($959,a5)
	move.b d0,($d59,a5)
	move.b d0,($1159,a5)
	move.b d0,($524,a5)
	move.b d0,($924,a5)
	move.b d0,($d24,a5)
	move.b d0,($1124,a5)
	move.l d0,(p4memory,a5)
	move.w #$8400,($c38,a5)
	move.w #$8c00,($438,a5)
	move.w #$8c00,($838,a5)
	move.w #$8400,($156,a5)
	move.w #$8c00,($158,a5)
	btst.b #0,($ac,a5)
	bne.b loc_0093c0
	move.w #$8800,($158,a5)
	move.w #$8c00,($156,a5)

loc_0093c0:
	clr.b ($c01,a5)
	move.b #0,($c02,a5)
	move.b #2,($d01,a5)
	move.b #1,(p3memory,a5)
	move.b #1,($d25,a5)
	clr.b ($d28,a5)
	move.b ($d02,a5),d0
	cmp.b ($502,a5),d0
	bne.b loc_009400
	move.b ($532,a5),d0
	cmp.b ($d32,a5),d0
	bne.b loc_009400
	tst.b ($528,a5)
	bne.b loc_009400
	move.b #1,($d28,a5)

loc_009400:
	move.b ($d02,a5),d0
	cmp.b ($902,a5),d0
	bne.b loc_009424
	move.b ($932,a5),d0
	cmp.b ($d32,a5),d0
	bne.b loc_009424
	move.b ($928,a5),d0
	cmp.b ($d28,a5),d0
	bne.b loc_009424
	move.b #1,($d28,a5)

loc_009424:
	rts

;==============================================
loc_009426:
	rts

;==============================================
loc_009428:
	move.w ($c,a5),d0
	move.w loc_009434(pc,d0.w),d1
	jmp loc_009434(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_009434:
	dc.w loc_009438-loc_009434
	dc.w loc_00943e-loc_009434

;==============================================
loc_009438:
	jmp loc_01f428

loc_00943e:
	jmp loc_01ec32

;==============================================
loc_009444:
	move.w ($c,a5),d0
	move.w loc_009450(pc,d0.w),d1
	jmp loc_009450(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_009450:
	dc.w loc_009456-loc_009450
	dc.w loc_00945c-loc_009450
	dc.w loc_0094ae-loc_009450

;===============================================
loc_009456:
	jmp loc_01f0ea

loc_00945c:
	tst.b ($5e0f,a5)
	beq.b loc_0094a2
	addq.w #2,($c,a5)
	st.b ($125,a5)
	move.l #$90c000,($e0,a5)
	jsr loc_01bdd0
	jsr loc_01ff52
	jsr loc_01a5e8
	jsr loc_017462
	jsr loc_01fae2
	tst.b ($178,a5)
	bne.b loc_0094a2
	move.l #$cc0000,d0
	jsr loc_00322e

loc_0094a2:
	jsr loc_03330e
	jmp loc_020c4a

loc_0094ae:
	tst.b ($8c,a5)
	bne.b loc_0094de
	addq.w #2,($8,a5)
	moveq #0,d0

loc_0094ba:
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.b d0,($15f,a5)
	move.b d0,($134,a5)
	addq.b #1,($b4,a5)
	move.b #1,($134,a5)
	jsr loc_00b008

loc_0094de:
	jsr loc_017462
	jsr loc_0335e0
	jmp loc_020c4a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0094f0:
	dc.w loc_0095a0-loc_0094f0
	dc.w loc_009730-loc_0094f0
	dc.w loc_009a4a-loc_0094f0
	dc.w loc_009bbe-loc_0094f0
	dc.w loc_00a04e-loc_0094f0
	dc.w loc_00a1ae-loc_0094f0
	dc.w loc_00a31e-loc_0094f0
	dc.w loc_00a436-loc_0094f0

;==============================================
loc_009500:
	move.w ($c,a5),d0
	move.w loc_0094f0(pc,d0.w),d1
	jsr loc_0094f0(pc,d1.w)

loc_00950c:
	tst.b ($10f,a5)
	bne.w loc_00959e
	moveq #0,d0
	tst.b ($11c,a5)
	beq.b loc_009530
	moveq #1,d0
	subq.b #1,($11d,a5)
	bne.b loc_009530
	subq.b #1,($11c,a5)
	move.b ($11e,a5),($11d,a5)
	moveq #0,d0

loc_009530:
	move.b d0,($15c,a5)
	tst.b ($134,a5)
	bne.b loc_00953e
	addq.b #1,($b4,a5)

loc_00953e:
	jsr loc_02040a
	jsr loc_033696
	jsr loc_00b718
	jsr loc_0276e2
	jsr loc_02f64a
	jsr loc_00b220
	jsr loc_00b34e
	jsr loc_017462
	jsr loc_032e9c
	jsr loc_0249cc
	jsr loc_03330e
	jsr loc_033522
	jsr loc_0336d6
	jsr loc_0335e0
	jsr loc_022dae
	jmp loc_020c4a

loc_00959e:
	rts

;==============================================
loc_0095a0:
	addq.w #2,($c,a5)
	moveq #0,d0
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	st.b ($10e,a5)
	move.b #1,($10f,a5)
	move.b #1,($8f,a5)
	move.b d0,($bd,a5)
	move.b d0,($10c,a5)
	move.b d0,($10b,a5)
	move.b d0,($107,a5)
	move.b d0,($126,a5)
	move.b d0,($12c,a5)
	move.b d0,($124,a5)
	move.b d0,($162,a5)
	move.b d0,($170,a5)
	move.b d0,($135,a5)
	move.b d0,($15a,a5)
	move.b d0,($10d,a5)
	move.w d0,($13a,a5)
	move.w d0,($13c,a5)
	move.b d0,($12a,a5)
	move.b d0,($144,a5)
	move.b d0,($123,a5)
	move.b d0,($13e,a5)
	move.b d0,($11c,a5)
	move.b d0,($11d,a5)
	move.b d0,($11e,a5)
	move.w d0,(-$703e,a5)
	move.w d0,(-$703c,a5)
	move.w d0,(-$703a,a5)
	move.w d0,(-$7038,a5)
	move.b d0,($146,a5)
	move.b d0,($145,a5)
	move.b #$ff,($132,a5)
	move.b #$ff,($133,a5)
	ori.w #$e,($32,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.w #$90c0,($48,a5)
	move.l #$90c000,($e0,a5)
	move.b #1,($401,a5)
	move.b #1,($801,a5)
	move.b d0,($514,a5)
	move.b d0,($914,a5)
	move.b d0,($d14,a5)
	move.b d0,($1114,a5)
	move.b d0,($4ab,a5)
	move.b d0,($8ab,a5)
	move.b d0,($cab,a5)
	move.b d0,($10ab,a5)
	lea.l (p1memory,a5),a0
	move.l ($110,a0),($13c,a0)
	lea.l (p2memory,a5),a0
	move.l ($110,a0),($13c,a0)
	bsr.w loc_009e94
	move.b ($108,a5),d0
	move.w d0,d1
	tst.b ($125,a0)
	bne.b loc_0096b8
	tst.b ($15a,a0)
	beq.b loc_0096b8
	moveq #1,d0
	tst.w ($102,a5)
	bne.b loc_0096b8
	move.b ($108,a5),($126,a1)
	subq.b #1,($126,a1)

loc_0096b8:
	tst.b ($125,a1)
	bne.b loc_0096d6
	tst.b ($15a,a1)
	beq.b loc_0096d6
	moveq #1,d1
	tst.w ($102,a5)
	bne.b loc_0096d6
	move.b ($108,a5),($126,a0)
	subq.b #1,($126,a0)

loc_0096d6:
	add.w d1,d0
	subq.w #1,d0
	cmp.w ($102,a5),d0
	bne.b loc_009714
	st.b ($143,a5)
	moveq #$1e,d0
	jsr loc_0039e0
	moveq #0,d1
	move.b ($108,a5),d1
	subq.w #1,d1
	lea.l (p1memory,a5),a0
	bsr.w loc_00a9a0
	lea.l (p2memory,a5),a0
	bsr.w loc_00a9a0
	lea.l (p3memory,a5),a0
	bsr.w loc_00a9a0
	lea.l (p4memory,a5),a0
	bsr.w loc_00a9a0

loc_009714:
	jmp loc_02033c


;==============================================
loc_00971a:
	st.b ($8a,a5)
	st.b ($10e,a5)
	st.b ($bd,a5)
	clr.b ($10f,a5)
	jmp loc_01bdc0

;----------------------------------------------
loc_009730:
	cmpi.b #1,($8a,a5)
	beq.b loc_00971a
	tst.b ($8b,a5)
	bne.b loc_00974a
	move.b ($13f,a5),d0
	move.w loc_00974c(pc,d0.w),d1
	jmp loc_00974c(pc,d1.w)

loc_00974a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00974c:
	dc.w loc_00975c-loc_00974c
	dc.w loc_00978c-loc_00974c
	dc.w loc_009848-loc_00974c
	dc.w loc_00975c-loc_00974c
	dc.w loc_00990a-loc_00974c
	dc.w loc_00990a-loc_00974c
	dc.w loc_00990a-loc_00974c
	dc.w loc_0099dc-loc_00974c

;==============================================
loc_00975c:
	addq.w #2,($c,a5)
	moveq #0,d0
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.b d0,($10f,a5)
	move.b d0,($8f,a5)
	move.b d0,($bd,a5)
	ori.w #$e,($32,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.l #$90c000,($e0,a5)
	rts

;==============================================
loc_00978c:
	move.w ($10,a5),d0
	move.w loc_009798(pc,d0.w),d1
	jmp loc_009798(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_009798:
	dc.w loc_00979e-loc_009798
	dc.w loc_009832-loc_009798
	dc.w loc_009838-loc_009798

;==============================================
loc_00979e:
	addq.w #2,($10,a5)
	moveq #0,d0
	move.b d0,($10f,a5)
	move.b d0,($8f,a5)
	move.b d0,($bd,a5)
	ori.w #$e,($32,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.l #$90c000,($e0,a5)
	lea.l (p1memory,a5),a0
	lea.l (p2memory,a5),a1
	btst.b #0,($ac,a5)
	bne.b loc_0097d6
	exg.l a0,a1

loc_0097d6
	btst.b #5,($149,a0)
	bne.w loc_00975c
	bset.b #5,($149,a0)
	clr.b (1,a1)
	move.b #$1e,($d02,a5)
	move.b #$1f,($1102,a5)
	move.b #0,($d32,a5)
	move.b #0,($1132,a5)
	st.b ($159,a0)
	st.b ($d59,a5)
	st.b ($1159,a5)
	moveq #0,d0
	move.b ($102,a0),d0
	movea.l #loc_00d6ca,a0
	move.b (a0,d0.w),($146,a5)
	bmi.w loc_00975c
	moveq #$1a,d0
	jsr loc_0039e0
	jmp loc_01fb16

loc_009832:
	jmp loc_00d39e

loc_009838:
	move.l #$1b40000,d0
	jsr loc_00322e
	bra.w loc_00975c

;==============================================
loc_009848:
	move.w ($10,a5),d0
	move.w loc_009854(pc,d0.w),d1
	jmp loc_009854(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_009854:
	dc.w loc_00985c-loc_009854
	dc.w loc_0098dc-loc_009854
	dc.w loc_0098f4-loc_009854
	dc.w loc_0098fa-loc_009854

;==============================================
loc_00985c:
	addq.w #2,($10,a5)
	moveq #0,d0
	move.b d0,($10f,a5)
	move.b d0,($8f,a5)
	move.b d0,($bd,a5)
	ori.w #$e,($32,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.l #$90c000,($e0,a5)
	lea.l (p1memory,a5),a0
	lea.l (p2memory,a5),a1
	btst.b #0,($ac,a5)
	bne.b loc_009894
	exg.l a0,a1

loc_009894:
	btst.b #5,($149,a0)
	bne.w loc_00975c
	bset.b #5,($149,a0)
	move.b #$15,($102,a1)
	move.b #0,($132,a1)
	st.b ($159,a0)
	st.b ($159,a1)
	moveq #0,d0
	move.b ($102,a0),d0
	movea.l #loc_00d6ca,a0
	move.b (a0,d0.w),($146,a5)
	bmi.w loc_00975c
	moveq #$1a,d0
	jsr loc_0039e0
	jmp loc_01fb16

;==============================================
loc_0098dc:
	move.b ($524,a5),d0
	or.b ($924,a5),d0
	or.b ($d24,a5),d0
	or.b ($1124,a5),d0
	bne.b loc_0098f2
	addq.w #2,($10,a5)

loc_0098f2:
	rts

;==============================================
loc_0098f4:
	jmp loc_00d39e

;==============================================
loc_0098fa:
	move.l #$1b40000,d0
	jsr loc_00322e
	bra.w loc_00975c

;==============================================
loc_00990a:
	move.w ($10,a5),d0
	move.w loc_009916(pc,d0.w),d1
	jmp loc_009916(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_009916:
	dc.w loc_00991e-loc_009916
	dc.w loc_0099ae-loc_009916
	dc.w loc_0099c6-loc_009916
	dc.w loc_0099cc-loc_009916

;==============================================
loc_00991e:
	move.b ($13f,a5),d0
	lea.l (p1memory,a5),a6
	btst.b #0,($ac,a5)
	bne.b loc_009932
	lea.l (p2memory,a5),a6

loc_009932:
	moveq #1,d1
	cmpi.b #8,d0
	beq.b loc_009944
	moveq #3,d1
	cmpi.b #$a,d0
	beq.b loc_009944
	moveq #6,d1

loc_009944:
	btst d1,($149,a6)
	bne.w loc_00975c
	bset.b d1,($149,a6)
	st.b ($559,a5)
	st.b ($959,a5)
	addq.w #2,($10,a5)
	moveq #0,d0
	move.b d0,($10f,a5)
	move.b d0,($8f,a5)
	move.b d0,($bd,a5)
	ori.w #$e,($32,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.l #$90c000,($e0,a5)
	moveq #0,d0
	move.b ($13f,a5),d0
	subq.w #8,d0
	lsl.w #4,d0
	add.b ($102,a6),d0
	movea.l #loc_00d62a,a0
	move.b (a0,d0.w),($146,a5)
	bmi.w loc_00975c
	moveq #$1a,d0
	cmpi.b #$c,($13f,a5)
	bne.b loc_0099a8
	moveq #$1c,d0

loc_0099a8:
	jmp loc_0039e0

;==============================================
loc_0099ae:
	move.b ($524,a5),d0
	or.b ($924,a5),d0
	or.b ($d24,a5),d0
	or.b ($1124,a5),d0
	bne.b loc_0099c4
	addq.w #2,($10,a5)

loc_0099c4:
	rts

;==============================================
loc_0099c6:
	jmp loc_00d39e

;==============================================
loc_0099cc:
	move.l #$1b40000,d0
	jsr loc_00322e
	bra.w loc_00975c

;==============================================
loc_0099dc:
	move.w ($10,a5),d0
	move.w loc_0099e8(pc,d0.w),d1
	jmp loc_0099e8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0099e8:
	dc.w loc_0099ec-loc_0099e8
	dc.w loc_009a46-loc_0099e8

;==============================================
loc_0099ec:
	addq.w #2,($10,a5)
	moveq #0,d0
	move.b d0,($10f,a5)
	move.b d0,($8f,a5)
	move.b d0,($bd,a5)
	ori.w #$e,($32,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.l #$90c000,($e0,a5)
	lea.l (p1memory,a5),a0
	lea.l (p2memory,a5),a1
	btst.b #0,($ac,a5)
	bne.b loc_009a24
	exg.l a0,a1

loc_009a24:
	clr.b (1,a1)
	move.b #$1e,($d02,a5)
	move.b #$1f,($1102,a5)
	move.b #0,($d32,a5)
	move.b #0,($1132,a5)
	jmp loc_01fb16

;==============================================
loc_009a46:
	bra.w loc_00975c

;==============================================
loc_009a4a:
	cmpi.b #1,($8a,a5)
	beq.w loc_00971a
	tst.b ($8b,a5)
	bne.b loc_009a66
	move.w ($10,a5),d0
	move.w loc_009a68(pc,d0.w),d1
	jmp loc_009a68(pc,d1.w)

loc_009a66:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_009a68:
	dc.w loc_009a6e-loc_009a68
	dc.w loc_009ad6-loc_009a68
	dc.w loc_009af6-loc_009a68

;==============================================
loc_009a6e:
	cmpi.w #$20e,($404,a5)
	beq.b loc_009ad4
	cmpi.w #$20e,($804,a5)
	beq.b loc_009ad4
	cmpi.w #$20e,($c04,a5)
	beq.b loc_009ad4
	cmpi.w #$20e,($1004,a5)
	beq.b loc_009ad4
	addq.w #2,($10,a5)
	moveq #0,d0
	move.b d0,($10f,a5)
	move.b d0,($8f,a5)
	move.b d0,($bd,a5)
	move.b d0,($12c,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.l #$90c000,($e0,a5)
	moveq #0,d0
	jsr loc_07cc1a
	tst.b ($bf,a5)
	beq.b loc_009ad4
	tst.b ($86,a5)
	beq.b loc_009ad4
	jsr loc_01c2c8
	beq.b loc_009ad4
	move.l #$1002e00,(a4)

loc_009ad4:
	rts

;==============================================
loc_009ad6:
	cmpi.b #3,($12c,a5)
	bne.b loc_009af2
	cmpi.b #8,($6eb8,a5)
	bcs.b loc_009af2
	addq.w #2,($10,a5)
	moveq #2,d0
	jsr loc_07cc1a

loc_009af2:
	bra.w loc_009b78

;==============================================
loc_009af6:
	cmpi.b #6,($12c,a5)
	bne.w loc_009b78
	cmpi.b #2,($6eb8,a5)
	bcs.w loc_009b78
	addq.w #2,($c,a5)
	moveq #0,d0
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.b d0,($10e,a5)
	move.b d0,($12c,a5)
	move.b #1,($12d,a5)
	move.w #$9280,($48,a5)
	move.b #1,($200,a5)
	move.b #1,($280,a5)
	move.b #1,($300,a5)
	move.b d0,($559,a5)
	move.b d0,($959,a5)
	move.b d0,($d59,a5)
	move.b d0,($1159,a5)
	move.b d0,($524,a5)
	move.b d0,($924,a5)
	move.b d0,($d24,a5)
	move.b d0,($1124,a5)
	jsr loc_07e4aa
	jsr loc_01fb16
	tst.w ($102,a5)
	bne.b loc_009b78
	moveq #0,d0
	jsr loc_0039e0

loc_009b78:
	tst.w ($102,a5)
	bne.w loc_009bbc
	lea.l (p1memory,a5),a6
	bsr.b loc_009b96
	lea.l (p2memory,a5),a6
	bsr.b loc_009b96
	lea.l (p3memory,a5),a6
	bsr.b loc_009b96
	lea.l (p4memory,a5),a6

loc_009b96:
	tst.b (a6)
	beq.b loc_009bbc
	tst.b ($f0,a6)
	bne.b loc_009bbc
	move.w ($11e,a6),d0
	addq.w #2,d0
	cmpi.w #$90,d0
	bcs.b loc_009bb8
	bne.b loc_009bb4
	jsr loc_003800

loc_009bb4:
	move.w #$90,d0

loc_009bb8:
	move.w d0,($11e,a6)

loc_009bbc:
	rts

;==============================================
loc_009bbe:
	cmpi.b #1,($8a,a5)
	bne.b loc_009be2
	st.b ($8a,a5)
	st.b ($10e,a5)
	st.b ($bd,a5)
	clr.b ($10f,a5)
	moveq #0,d0
	move.b d0,($12d,a5)
	jmp loc_01bdc0

;==============================================
loc_009be2:
	tst.b ($8b,a5)
	bne.w loc_009c98
	bsr.w loc_009ed0
	move.b d0,($10c,a5)
	bne.b loc_009c1c
	move.b ($125,a5),d0
	or.b ($124,a5),d0
	bne.b loc_009c1c
	subq.b #1,(Clock_frames,a5)
	bne.b loc_009c1c
	bsr.w Set_TimerSpeed
	subq.b #1,(clock_counter,a5)
	bpl.b loc_009c1c
	move.b #0,(clock_counter,a5)
	st.b ($10d,a5)
	bsr.w loc_00a846

loc_009c1c:
	move.b ($10c,a5),d0
	beq.w loc_009c98
	cmpi.b #3,d0
	bne.b loc_009c36
	clr.b ($124,a5)
	move.b #1,($15a,a5)
	bra.b loc_009c3e

loc_009c36:
	bsr.w loc_009e94
	bsr.w loc_009c9a

loc_009c3e:
	bsr.w loc_009fdc
	bsr.w loc_009f40
	tst.b ($10d,a5)
	bne.b loc_009c5e
	move.b #$3c,($11c,a5)
	move.b #3,($11d,a5)
	move.b #3,($11e,a5)

loc_009c5e:
	addq.w #2,($c,a5)
	moveq #0,d0
	move.l d0,($10,a5)
	move.b #1,($10e,a5)
	move.b #1,($8f,a5)
	st.b ($bd,a5)
	move.b #1,($107,a5)
	move.b d0,($12d,a5)
	move.b d0,($4ab,a5)
	move.b d0,($8ab,a5)
	move.b d0,($cab,a5)
	move.b d0,($10ab,a5)
	jsr loc_0205be

loc_009c98:
	rts

;==============================================
loc_009c9a:
	cmpi.w #6,($138,a5)
	beq.w loc_009da6
	btst.b #0,($10c,a5)
	bne.b loc_009cae
	exg.l a0,a1

loc_009cae:
	move.w a0,($13a,a5)
	move.w a1,($13c,a5)
	move.b ($102,a0),($132,a5)
	move.b ($102,a1),($133,a5)
	clr.b ($161,a5)
	cmpi.w #$90,($50,a0)
	bne.b loc_009cd2
	st.b ($161,a5)

loc_009cd2:
	tst.b ($125,a1)
	bne.b loc_009cdc
	st.b ($145,a1)

loc_009cdc:
	addq.b #1,($126,a0)
	move.b ($108,a5),d1
	cmp.b ($126,a0),d1
	bne.w loc_009da4
	st.b ($105,a5)
	clr.b ($120,a5)
	tst.b ($15d,a5)
	bne.b loc_009d0c
	subq.b #1,d1
	ext.w d1
	cmp.w ($102,a5),d1
	bne.b loc_009d0c
	st.b ($120,a5)
	addq.b #1,($137,a5)

loc_009d0c:
	tst.b ($141,a5)
	beq.b loc_009d4a
	move.b ($130,a0),d0
	cmpi.b #$63,d0
	bcc.b loc_009d1e
	addq.b #1,d0

loc_009d1e:
	move.b d0,($130,a0)
	move.b d0,($163,a0)
	clr.b ($130,a1)
	tst.b ($ce,a5)
	beq.b loc_009d48
	move.b ($101,a0),d0
	cmp.b ($130,a5),d0
	beq.b loc_009d48
	move.b ($d4,a5),($16a,a5)
	clr.b ($16d,a5)
	clr.b ($d7,a5)

loc_009d48:
	bra.b loc_009da4

loc_009d4a:
	tst.b ($125,a0)
	bne.b loc_009da4
	move.w ($50,a0),($154,a0)
	move.b ($16d,a5),d0
	cmpi.b #$63,d0
	bcc.b loc_009d62
	addq.b #1,d0

loc_009d62:
	move.b d0,($16d,a5)
	move.l ($140,a0),d2
	move.b ($102,a1),d0
	jsr loc_00bbc8
	bset d0,d2
	tst.w ($138,a5)
	beq.b loc_009d88
	move.b ($1102,a5),d0
	jsr loc_00bbc8
	bset d0,d2

loc_009d88:
	move.l d2,($140,a0)
	tst.b ($163,a5)
	bne.b loc_009da4
	move.w ($114,a5),d0
	cmp.w ($14c,a5),d0
	bne.b loc_009da4
	st.b ($14a,a5)
	st.b ($bd,a5)

loc_009da4:
	rts

loc_009da6:
	lea.l (p1memory,a5),a0
	lea.l (p2memory,a5),a2
	lea.l (p3memory,a5),a1
	btst.b #0,($10c,a5)
	bne.b loc_009dbc
	exg.l a0,a1

loc_009dbc:
	move.w a0,($13a,a5)
	move.w a1,($13c,a5)
	move.b ($102,a0),($132,a5)
	move.b ($102,a1),($133,a5)
	btst.b #0,($144,a5)
	beq.b loc_009dde
	move.b ($102,a2),($132,a5)

loc_009dde:
	clr.b ($161,a5)
	btst.b #1,($101,a1)
	bne.b loc_009e00
	st.b ($145,a1)
	st.b ($145,a2)
	cmpi.w #$90,($50,a0)
	bne.b loc_009e14
	st.b ($161,a5)
	bra.b loc_009e14

loc_009e00:
	cmpi.w #$90,($50,a0)
	bne.b loc_009e14
	cmpi.w #$90,($50,a2)
	bne.b loc_009e14
	st.b ($161,a5)

loc_009e14:
	addq.b #1,($126,a0)
	btst.b #1,($101,a0)
	bne.b loc_009e24
	addq.b #1,($126,a2)

loc_009e24:
	move.b ($108,a5),d1
	cmp.b ($126,a0),d1
	bne.b loc_009e92
	st.b ($105,a5)
	clr.b ($120,a5)
	subq.b #1,d1
	ext.w d1
	cmp.w ($102,a5),d1
	bne.b loc_009e48
	st.b ($120,a5)
	addq.b #1,($137,a5)

loc_009e48:
	btst.b #1,($101,a0)
	bne.w loc_009e92
	move.b ($16d,a5),d0
	cmpi.b #$63,d0
	bcc.b loc_009e5e
	addq.b #1,d0

loc_009e5e:
	move.b d0,($16d,a5)
	move.l ($540,a5),d2
	move.b ($d02,a5),d0
	jsr loc_00bbc8
	bset d0,d2
	move.l d2,($540,a5)
	move.l d2,($940,a5)
	tst.b ($163,a5)
	bne.b loc_009e92
	move.w ($114,a5),d0
	cmp.w ($14c,a5),d0
	bne.b loc_009e92
	st.b ($14a,a5)
	st.b ($bd,a5)
	
loc_009e92:
	rts

;==============================================
loc_009e94:
	move.w ($138,a5),d0
	move.w loc_009ea0(pc,d0.w),d0
	jmp loc_009ea0(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_009ea0:
	dc.w loc_009ea8-loc_009ea0
	dc.w loc_009eb2-loc_009ea0
	dc.w loc_009ebc-loc_009ea0
	dc.w loc_009ec6-loc_009ea0

;==============================================
loc_009ea8:
	lea.l (p1memory,a5),a0
	lea.l (p2memory,a5),a1
	rts

loc_009eb2:
	lea.l (p1memory,a5),a0
	lea.l (p3memory,a5),a1
	rts

loc_009ebc:
	lea.l (p2memory,a5),a0
	lea.l (p3memory,a5),a1
	rts

loc_009ec6:
	lea.l (p1memory,a5),a0
	lea.l (p3memory,a5),a1
	rts

;==============================================
loc_009ed0
	moveq #0,d0
	move.w ($138,a5),d1
	move.w loc_009ede(pc,d1.w),d1
	jmp loc_009ede(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_009ede:
	dc.w loc_009ee6-loc_009ede
	dc.w loc_009ef8-loc_009ede
	dc.w loc_009f10-loc_009ede
	dc.w loc_009f28-loc_009ede

;==============================================
loc_009ee6:
	tst.w ($850,a5)
	bpl.b loc_009eee
	addq.b #1,d0

loc_009eee:
	tst.w ($450,a5)
	bpl.b loc_009ef6
	addq.b #2,d0

loc_009ef6:
	rts

;==============================================
loc_009ef8:
	tst.w ($c50,a5)
	bpl.b loc_009f06
	tst.w ($1050,a5)
	bpl.b loc_009f06
	addq.b #1,d0

loc_009f06:
	tst.w ($450,a5)
	bpl.b loc_009f0e
	addq.b #2,d0

loc_009f0e:
	rts

;==============================================
loc_009f10:
	tst.w ($c50,a5)
	bpl.b loc_009f1e
	tst.w ($1050,a5)
	bpl.b loc_009f1e
	addq.b #1,d0

loc_009f1e:
	tst.w ($850,a5)
	bpl.b loc_009f26
	addq.b #2,d0

loc_009f26:
	rts

;==============================================
loc_009f28:
	tst.w ($c50,a5)
	bpl.b loc_009f30
	addq.b #1,d0

loc_009f30:
	tst.w ($450,a5)
	bpl.b loc_009f3e
	tst.w ($850,a5)
	bpl.b loc_009f3e
	addq.b #2,d0

loc_009f3e:
	rts

;==============================================
loc_009f40:
	tst.b ($105,a5)
	bne.b loc_009f58
	tst.b ($15d,a5)
	bne.w loc_009faa
	tst.b ($143,a5)
	bne.w loc_009faa
	rts

loc_009f58:
	tst.b ($14a,a5)
	bne.w loc_009fda
	tst.b (Dip_EventMode,a5)
	bne.w loc_009faa
	movea.w ($13a,a5),a0
	movea.w ($13c,a5),a1
	cmpi.w #6,($138,a5)
	beq.w loc_009f9e
	clr.b ($500,a5)
	clr.b ($900,a5)
	move.b ($101,a1),d0
	bclr.b d0,($ac,a5)
	clr.b ($15b,a1)
	tst.b ($125,a0)
	bne.w loc_009faa
	move.b #2,($100,a0)
	rts

loc_009f9e
	btst.b #1,($101,a0)
	bne.w loc_009faa
	rts

loc_009faa:
	moveq #0,d0
	move.b d0,($ac,a5)
	move.b #1,($b8,a5)
	move.b d0,($500,a5)
	move.b d0,($900,a5)
	move.b d0,($54a,a5)
	move.b d0,($94a,a5)
	move.b d0,($55b,a5)
	move.b d0,($95b,a5)
	move.b #2,($518,a5)
	move.b #2,($918,a5)

loc_009fda:
	rts

;==============================================
loc_009fdc:
	tst.w ($138,a5)
	bne.b loc_00a04c
	tst.b ($15d,a5)
	bne.b loc_00a04c
	tst.b ($141,a5)
	bne.b loc_00a04c
	move.w ($14c,a5),d0
	cmp.w ($114,a5),d0
	bne.b loc_00a04c
	lea.l (p1memory,a5),a6
	lea.l (p2memory,a5),a1
	btst.b #0,($ac,a5)
	bne.b loc_00a00a
	exg.l a1,a6

loc_00a00a:
	move.b ($102,a1),d0
	cmp.b (-$7075,a5),d0
	bne.b loc_00a04c
	clr.b ($149,a5)
	tst.b ($14a,a5)
	bne.b loc_00a04c
	tst.b ($105,a5)
	bne.b loc_00a03e
	tst.b ($143,a5)
	beq.b loc_00a04c
	move.w a1,($13a,a5)
	move.w a6,($13c,a5)
	move.b ($102,a1),($132,a5)
	move.b ($102,a6),($133,a5)

loc_00a03e:
	move.b #2,($149,a5)
	st.b ($14a,a5)
	st.b ($bd,a5)

loc_00a04c:
	rts

;==============================================
loc_00a04e:
	move.w ($10,a5),d0
	move.w loc_00a05a(pc,d0.w),d1
	jmp loc_00a05a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00a05a
	dc.w loc_00a060-loc_00a05a
	dc.w loc_00a0d6-loc_00a05a
	dc.w loc_00a0e8-loc_00a05a

;==============================================
loc_00a060:
	tst.b ($124,a5)
	bne.w loc_00ab9a
	addq.w #2,($10,a5)
	move.w #$97,($12,a5)
	moveq #6,d0
	jsr loc_07cc1a
	tst.b ($15a,a5)
	bne.b loc_00a096
	tst.b ($10d,a5)
	bne.b loc_00a096
	movea.w ($13a,a5),a6
	move.w ($138,a5),d0
	move.w loc_00a09a(pc,d0.w),d0
	jsr loc_00a09a(pc,d0.w)

loc_00a096:
	bra.w loc_00ab2a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00a09a:
	dc.w loc_00a0a2-loc_00a09a
	dc.w loc_00a0aa-loc_00a09a
	dc.w loc_00a0aa-loc_00a09a
	dc.w loc_00a0c0-loc_00a09a

;==============================================
loc_00a0a2:
	ori.b #$80,($b4,a6)
	rts

loc_00a0aa:
	btst.b #1,($101,a6)
	beq.b loc_00a0a2
	ori.b #$80,($cb4,a5)
	ori.b #$80,($10b4,a5)
	rts

loc_00a0c0:
	btst.b #1,($101,a6)
	bne.b loc_00a0a2
	ori.b #$80,($4b4,a5)
	ori.b #$80,($8b4,a5)
	rts

;==============================================
loc_00a0d6:
	subq.w #1,($12,a5)
	bpl.b loc_00a0e6
	addq.w #2,($10,a5)
	move.b #$ff,($107,a5)

loc_00a0e6:
	rts

;==============================================
loc_00a0e8:
	cmpi.b #4,($12c,a5)
	bne.b loc_00a0fe
	move.w ($138,a5),d0
	move.w loc_00a100(pc,d0.w),d0
	cmp.b ($10b,a5),d0
	beq.b loc_00a108

loc_00a0fe:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00a100:
	dc.w $0003,$000d,$000e,$0007

;==============================================
loc_00a108:
	movea.w ($13a,a5),a6
	moveq #0,d0
	move.b ($108,a5),d0
	add.b d0,d0
	subq.b #1,d0
	cmp.w ($102,a5),d0
	beq.b loc_00a122
	tst.b ($105,a5)
	beq.b loc_00a12e

loc_00a122:
	move.l #$da0000,d0
	jsr loc_00322e

loc_00a12e:
	bsr.w loc_00aad0
	bne.b loc_00a14e
	tst.b ($14a,a5)
	bne.b loc_00a14e
	tst.b (Dip_EventMode,a5)
	bne.b loc_00a14e
	tst.b ($b8,a5)
	bne.b loc_00a14e
	clr.b ($8f,a5)
	clr.b ($bd,a5)

loc_00a14e:
	tst.b ($15a,a5)
	bne.b loc_00a18c
	cmpi.w #6,($138,a5)
	bne.b loc_00a166
	btst.b #1,($101,a6)
	bne.b loc_00a18c
	bra.b loc_00a16c

loc_00a166:
	tst.b ($125,a6)
	bne.b loc_00a18c

loc_00a16c:
	addq.w #2,($c,a5)
	moveq #0,d0
	move.w d0,($e,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	tst.b ($15d,a5)
	beq.b loc_00a18a
	move.w #2,($10,a5)

loc_00a18a:
	rts

loc_00a18c:
	addq.w #2,($c,a5)
	moveq #0,d0
	move.w d0,($e,a5)
	move.w #8,($10,a5)
	move.w #$b4,($12,a5)
	move.l d0,($14,a5)
	move.b #7,($12c,a5)
	rts

;==============================================
loc_00a1ae:
	cmpi.b #1,($8a,a5)
	beq.w loc_00971a
	tst.b ($8b,a5)
	bne.b loc_00a1ca
	move.w ($10,a5),d0
	move.w loc_00a1cc(pc,d0.w),d1
	jmp loc_00a1cc(pc,d1.w)

loc_00a1ca:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00a1cc:
	dc.w loc_00a1d6-loc_00a1cc
	dc.w loc_00a29a-loc_00a1cc
	dc.w loc_00a2ac-loc_00a1cc
	dc.w loc_00a2e4-loc_00a1cc
	dc.w loc_00a2ea-loc_00a1cc

;==============================================
loc_00a1d6:
	move.w #8,($10,a5)
	move.w #$b4,($12,a5)
	movea.w ($13a,a5),a6
	tst.b ($110,a5)
	bne.w loc_00a274
	moveq #0,d6
	move.w ($50,a6),d6
	cmpi.w #6,($138,a5)
	bne.b loc_00a20e
	add.w ($850,a5),d6
	asr.w #1,d6
	btst.b #0,($ac,a5)
	bne.b loc_00a20e
	lea.l (p2memory,a5),a6

loc_00a20e:
	tst.w d6
	bpl.b loc_00a214
	moveq #0,d6

loc_00a214:
	cmpi.w #$90,d6
	bne.b loc_00a21e
	move.w #$12c,d6

loc_00a21e:
	move.w d6,d0
	jsr Hex_to_Decimal
	move.w (-$5d28,a5),(-$708a,a5)
	jsr loc_00b076
	move.w d6,d0
	move.w d3,(-$7088,a5)
	jsr loc_00bb2a
	move.w d6,(-$708c,a5)
	tst.b ($120,a5)
	beq.b loc_00a24a
	add.w d2,d0

loc_00a24a:
	jsr Hex_to_Decimal
	move.l (-$5d2a,a5),d0
	lsl.l #8,d0
	movea.l a6,a0
	jsr loc_01bb44
	move.l ($110,a6),($138,a6)
	lea.l ($140,a6),a0
	lea.l ($13c,a6),a1
	sbcd -(a0),-(a1)
	sbcd -(a0),-(a1)
	sbcd -(a0),-(a1)
	sbcd -(a0),-(a1)

loc_00a274:
	move.b ($115,a6),d0
	cmpi.w #6,($138,a5)
	bne.b loc_00a28e
	move.b ($515,a5),d0
	move.b ($915,a5),d1
	cmp.b d0,d1
	bcs.b loc_00a28e
	move.b d1,d0

loc_00a28e:
	move.b d0,(-$7086,a5)
	moveq #4,d0
	jmp loc_07cc1a

;==============================================
loc_00a29a:
	addq.w #2,($10,a5)
	move.w #$b4,($12,a5)
	moveq #4,d0
	jmp loc_07cc1a

;==============================================
loc_00a2ac:
	movea.w ($13a,a5),a6
	move.w ($154,a6),d6
	jsr loc_00af50
	bne.b loc_00a2d6
	move.b ($b4,a5),d0
	andi.b #1,d0
	bne.b loc_00a2d4
	cmp.w ($50,a6),d6
	beq.b loc_00a2d6
	addq.w #1,($50,a6)
	addq.w #1,($52,a6)

loc_00a2d4:
	rts

loc_00a2d6:
	addq.w #2,($10,a5)
	move.w d6,($50,a6)
	move.w d6,($52,a6)
	rts

;==============================================
loc_00a2e4:
	addq.w #2,($10,a5)
	rts

;==============================================
loc_00a2ea:
	cmpi.b #7,($12c,a5)
	beq.b loc_00a30a
	jsr loc_00af50
	beq.b loc_00a308
	cmpi.b #5,($12c,a5)
	bcc.b loc_00a308
	move.b #5,($12c,a5)

loc_00a308:
	rts

loc_00a30a:
	addq.w #2,($c,a5)
	moveq #0,d0
	move.w d0,($e,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	rts

;==============================================
loc_00a31e:
	cmpi.b #1,($8a,a5)
	beq.w loc_00971a
	tst.b ($8b,a5)
	bne.b loc_00a34a
	tst.b ($105,a5)
	beq.w loc_00a35c
	tst.b ($b8,a5)
	bne.w loc_00a35c
	move.b ($13f,a5),d0
	move.w loc_00a34c(pc,d0.w),d1
	jmp loc_00a34c(pc,d1.w)

loc_00a34a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00a34c:
	dc.w loc_00a35c-loc_00a34c
	dc.w loc_00a35c-loc_00a34c
	dc.w loc_00a35c-loc_00a34c
	dc.w loc_00a35c-loc_00a34c
	dc.w loc_00a380-loc_00a34c
	dc.w loc_00a380-loc_00a34c
	dc.w loc_00a35c-loc_00a34c
	dc.w loc_00a35c-loc_00a34c

;==============================================
loc_00a35c:
	addq.w #2,($c,a5)
	moveq #0,d0
	move.w d0,($e,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.b #1,($12a,a5)
	move.b #1,($10f,a5)
	jmp loc_01bdc0

;==============================================
loc_00a380:
	move.w ($10,a5),d0
	move.w loc_00a38c(pc,d0.w),d1
	jmp loc_00a38c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00a38c:
	dc.w loc_00a394-loc_00a38c
	dc.w loc_00a414-loc_00a38c
	dc.w loc_00a420-loc_00a38c
	dc.w loc_00a426-loc_00a38c

;==============================================
loc_00a394:
	move.b ($13f,a5),d0
	lea.l (p1memory,a5),a6
	btst.b #0,($ac,a5)
	bne.b loc_00a3a8
	lea.l (p2memory,a5),a6

loc_00a3a8:
	moveq #2,d1
	cmpi.b #8,d0
	beq.b loc_00a3b2
	moveq #4,d1

loc_00a3b2
	btst d1,($149,a6)
	bne.b loc_00a35c
	bset.b d1,($149,a6)
	addq.w #2,($10,a5)
	moveq #0,d0
	move.b d0,($10f,a5)
	move.b d0,($8f,a5)
	move.b d0,($bd,a5)
	ori.w #$e,($32,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.l #$90c000,($e0,a5)
	moveq #0,d0
	move.b ($13f,a5),d0
	subq.w #8,d0
	lsl.w #4,d0
	add.b ($102,a6),d0
	movea.l #loc_00d68a,a0
	move.b (a0,d0.w),($146,a5)
	bmi.w loc_00a35c
	moveq #$1a,d0
	jsr loc_0039e0
	jsr loc_01c192
	jmp loc_01c15c

;==============================================
loc_00a414:
	subq.w #1,($12,a5)
	bpl.b loc_00a41e
	addq.w #2,($10,a5)

loc_00a41e:
	rts

;==============================================
loc_00a420:
	jmp loc_00d39e

;==============================================
loc_00a426:
	move.l #$2220000,d0
	jsr loc_00322e
	bra.w loc_00a35c

;==============================================
loc_00a436:
	moveq #0,d0
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.b #1,($10f,a5)
	move.b #1,($8f,a5)
	move.b d0,($10e,a5)
	move.b d0,($10b,a5)
	move.b d0,($15c,a5)
	move.b d0,($401,a5)
	move.b d0,($801,a5)
	move.b d0,($c01,a5)
	move.b d0,($1001,a5)
	move.b #$63,(clock_counter,a5)
	bsr.w Set_TimerSpeed
	bsr.w loc_00aaa6
	lea.l (p1memory,a5),a0
	bsr.w loc_00a5be
	lea.l (p2memory,a5),a0
	bsr.w loc_00a5be
	tst.b ($14a,a5)
	bne.w loc_00a8e6
	tst.b ($105,a5)
	bne.b loc_00a4dc
	tst.b ($15d,a5)
	bne.w loc_00a55e
	tst.b ($143,a5)
	bne.w loc_00a55e
	move.w #$92a0,(palrampointer,a5)
	move.w #$92a0,($48,a5)
	jsr loc_01bdd0
	addq.w #1,($102,a5)
	jsr loc_01fae2
	jsr loc_017462
	jsr loc_01ff52
	jsr loc_01a5e8
	jmp loc_020c4a

loc_00a4dc:
	addq.w #2,(8,a5)
	move.b #1,($10f,a5)
	movea.w ($13a,a5),a0
	movea.w ($13c,a5),a1
	bsr.w loc_00ab80
	tst.b (Dip_EventMode,a5)
	bne.w loc_00a522
	cmpi.w #6,($138,a5)
	beq.w loc_00a5a6
	jsr loc_00ba66
	movea.w ($13a,a5),a0
	movea.w ($13c,a5),a1
	tst.b ($125,a0)
	bne.w loc_00a522
	move.b #1,($125,a1)
	rts

loc_00a522:
	moveq #0,d1
	move.w #8,(8,a5)
	move.l d1,($c,a5)
	move.l d1,($10,a5)
	move.l d1,($14,a5)
	move.b #1,($10f,a5)
	move.b d1,($137,a5)
	move.b #1,($525,a5)
	move.b #1,($925,a5)
	move.b d1,($401,a5)
	move.b d1,($801,a5)
	move.b d1,($c01,a5)
	move.b d1,($1001,a5)
	rts

loc_00a55e:
	jsr loc_01bdc0
	moveq #0,d1
	addq.w #2,(4,a5)
	move.l d1,(8,a5)
	move.l d1,($c,a5)
	move.l d1,($10,a5)
	move.l d1,($14,a5)
	move.b #1,($10f,a5)
	move.b d1,($137,a5)
	move.w d1,($138,a5)
	move.b #1,($525,a5)
	move.b #1,($925,a5)
	move.b d1,($401,a5)
	move.b d1,($801,a5)
	move.b d1,($c01,a5)
	move.b d1,($1001,a5)
	rts

loc_00a5a6:
	movea.w ($13a,a5),a0
	movea.w ($13c,a5),a1
	btst.b #1,($101,a0)
	bne.w loc_00a522
	jmp loc_00bacc

loc_00a5be:
	tst.b ($141,a5)
	bne.b loc_00a5d0
	tst.b ($125,a0)
	bne.b loc_00a5d0
	move.l ($110,a0),($164,a0)

loc_00a5d0:
	rts

loc_00a5d2:
	rts

;==============================================
loc_00a5d4:
	move.w ($c,a5),d0
	move.w loc_00a5fe(pc,d0.w),d1
	jsr loc_00a5fe(pc,d1.w)
	jsr loc_03330e
	jsr loc_0335e0
	jsr loc_033522
	jsr loc_0336d6
	jmp loc_020c4a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00a5fe:
	dc.w loc_00a60c-loc_00a5fe
	dc.w loc_00a6c4-loc_00a5fe
	dc.w loc_00a6d4-loc_00a5fe
	dc.w loc_00a6f4-loc_00a5fe
	dc.w loc_00a714-loc_00a5fe
	dc.w loc_00a76e-loc_00a5fe
	dc.w loc_00a788-loc_00a5fe

;==============================================
loc_00a60c:
	addq.w #2,($c,a5)
	move.w #$3c,($e,a5)
	moveq #0,d0
	move.b d0,($10f,a5)
	move.b d0,($15f,a5)
	move.b d0,($401,a5)
	move.b d0,($801,a5)
	move.b d0,($c01,a5)
	move.b d0,($1001,a5)
	move.b #1,($8f,a5)
	st.b ($bd,a5)
	move.b #1,($125,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.w #$90c0,($48,a5)
	move.l #$90c000,($e0,a5)
	jsr loc_01bdc0
	movea.w ($13a,a5),a6
	move.b ($102,a6),d0
	jsr loc_00b624
	tst.b ($125,a6)
	bne.b loc_00a68a
	move.b ($130,a6),d0
	andi.b #3,d0
	cmpi.b #3,d0
	bne.b loc_00a68a
	jsr RNGFunction
	andi.w #3,d0
	move.w d0,($176,a5)

loc_00a68a:
	moveq #$c,d0
	jsr loc_0039e0
	tst.b ($b8,a5)
	bne.b loc_00a69e
	jsr loc_003cc8

loc_00a69e
	tst.b ($15d,a5)
	bne.b loc_00a6b0
	tst.b ($b8,a5)
	bne.b loc_00a6ba
	tst.b ($163,a5)
	bpl.b loc_00a6ba

loc_00a6b0
	move.w #$8,($c,a5)
	clr.w ($e,a5)

loc_00a6ba
	bsr.w loc_00ab0c
	jmp loc_00b55a

;==============================================
loc_00a6c4:
	addq.w #2,($c,a5)
	jsr loc_00d07e
	jmp loc_08bbb0

;==============================================
loc_00a6d4:
	addq.w #2,($c,a5)
	move.w #$168,($e,a5)
	move.b #1,($8f,a5)
	tst.b ($ac,a5)
	beq.b loc_00a6f2
	clr.b ($8f,a5)
	clr.b ($bd,a5)

loc_00a6f2
	rts

;==============================================
loc_00a6f4:
	tst.b ($8a,a5)
	bne.b loc_00a712
	jsr loc_00af70
	bne.b loc_00a708
	subq.w #1,($e,a5)
	bpl.b loc_00a712

loc_00a708:
	addq.w #2,($c,a5)
	move.b #1,($160,a5)

loc_00a712:
	rts

;==============================================
loc_00a714:
	tst.b ($8a,a5)
	bne.b loc_00a728
	jsr loc_00af70
	bne.b loc_00a72a
	subq.w #1,($e,a5)
	bmi.b loc_00a72a

loc_00a728:
	rts

loc_00a72a
	move.b #8,($12c,a5)
	tst.b ($b8,a5)
	beq.b loc_00a75e
	move.w #6,(4,a5)
	moveq #0,d0
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.b d0,($15f,a5)
	move.w d0,($138,a5)
	move.b #1,($8f,a5)
	rts

loc_00a75e:
	addq.w #2,($c,a5)
	move.b #1,($8f,a5)
	clr.b ($15f,a5)
	rts

;==============================================
loc_00a76e:
	moveq #0,d0
	jsr loc_033f06
	beq.b loc_00a786
	addq.w #2,($c,a5)
	st.b ($8c,a5)
	jmp loc_01c15c

loc_00a786:
	rts


;==============================================
loc_00a788:
	tst.b ($5e0f,a5)
	beq.b loc_00a798
	jsr loc_01bdd0
	bra.w loc_00a79a

loc_00a798:
	rts

loc_00a79a
	moveq #0,d0
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.b #1,($a9,a5)
	move.b #1,($8f,a5)
	st.b ($bd,a5)
	move.b d0,($401,a5)
	move.b d0,($801,a5)
	move.b d0,($c01,a5)
	move.b d0,($1001,a5)
	rts

loc_00a7ce:
	move.w #2,(4,a5)
	move.w #6,(8,a5)
	moveq #0,d0
	move.w d0,($a,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.b #1,($10f,a5)
	move.b #1,($8f,a5)
	move.b d0,($bd,a5)
	rts

;==============================================
loc_00a7fe:
	moveq #0,d0
	move.l d0,(0,a5)
	move.l d0,(4,a5)
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.b d0,($181,a5)
	move.b d0,($182,a5)
	move.w #$100,d0
	jsr loc_001346
	jsr loc_01b0e6
	move.w #$40,d0
	movea.l #loc_004036,a0
	jsr loc_001302
	jmp loc_001324

;==============================================
loc_00a846:
	move.w ($138,a5),d0
	move.w loc_00a852(pc,d0.w),d1
	jmp loc_00a852(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00a852:
	dc.w loc_00a85a-loc_00a852
	dc.w loc_00a872-loc_00a852
	dc.w loc_00a890-loc_00a852
	dc.w loc_00a8ae-loc_00a852

;==============================================
loc_00a85a:
	moveq #1,d1
	move.w ($450,a5),d0
	cmp.w ($850,a5),d0
	beq.w loc_00a8cc
	bgt.w loc_00a8c6
	moveq #2,d1
	bra.w loc_00a8c6

;==============================================
loc_00a872:
	moveq #1,d1
	move.w ($450,a5),d0
	add.w d0,d0
	sub.w ($c50,a5),d0
	cmp.w ($1050,a5),d0
	beq.w loc_00a8cc
	bgt.w loc_00a8c6
	moveq #2,d1
	bra.w loc_00a8c6

;==============================================
loc_00a890:
	moveq #1,d1
	move.w ($850,a5),d0
	add.w d0,d0
	sub.w ($c50,a5),d0
	cmp.w ($1050,a5),d0
	beq.w loc_00a8cc
	bgt.w loc_00a8c6
	moveq #2,d1
	bra.w loc_00a8c6

;==============================================
loc_00a8ae:
	moveq #1,d1
	move.w ($450,a5),d0
	add.w ($850,a5),d0
	sub.w ($c50,a5),d0
	cmp.w ($c50,a5),d0
	beq.b loc_00a8cc
	bgt.b loc_00a8c6
	moveq #2,d1

loc_00a8c6
	move.b d1,($10c,a5)
	rts

loc_00a8cc:
	move.b #3,($10c,a5)
	rts

;==============================================
Set_TimerSpeed:
	move.b (Dip_Timer_Speed,a5),d1
	ext.w d1
	move.b Clock_frame_counts(pc,d1.w),(Clock_frames,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
Clock_frame_counts:
	dc.b 74,59,44,29

;==============================================
loc_00a8e6:
	moveq #0,d0
	move.w #$a,($4,a5)
	move.l d0,($8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.b #1,($10f,a5)
	move.b #1,($8f,a5)
	move.b d0,($bd,a5)
	move.b d0,($ac,a5)
	move.b d0,($b8,a5)
	move.b #1,($106,a5)
	move.b d0,($181,a5)
	move.b d0,($182,a5)
	move.b d0,($124,a5)
	move.b d0,($162,a5)
	move.b ($132,a5),($1c6,a5)
	move.b #1,($401,a5)
	move.b #1,($801,a5)
	move.b d0,($500,a5)
	move.b d0,($900,a5)
	move.b d0,($55b,a5)
	move.b d0,($95b,a5)
	tst.b ($168,a5)
	beq.b loc_00a962
	move.b #4,($149,a5)
	move.b d0,($401,a5)
	move.b d0,($801,a5)

loc_00a962:
	tst.b ($15d,a5)
	beq.b loc_00a976
	move.b #6,($149,a5)
	move.b d0,($401,a5)
	move.b d0,($801,a5)

loc_00a976:
	tst.b ($ce,a5)
	beq.b loc_00a990
	tst.b ($cf,a5)
	bmi.b loc_00a990
	addq.b #1,($d0,a5)
	addq.b #1,(-$7397,a5)
	jsr loc_002bcc

loc_00a990:
	jsr loc_00389a
	move.w #$100,d0
	jmp loc_001346

;==============================================
loc_00a9a0
	move.b d1,($126,a0)
	move.w d1,d0
	subq.w #1,d0
	bmi.b loc_00a9be
	lea.l ($12a,a0),a0

loc_00a9ae:
	tst.b (a0)
	bne.b loc_00a9b6
	move.b #4,(a0)

loc_00a9b6:
	lea.l (1,a0),a0
	dbra d0,loc_00a9ae

loc_00a9be:
	rts

loc_00a9c0:
	rts

;==============================================
loc_00a9c2:
	moveq #0,d0
	move.b d0,($8a,a5)
	move.b d0,($8b,a5)
	move.b d0,($ac,a5)
	move.b d0,($ad,a5)
	move.b d0,($b4,a5)
	move.b d0,($b8,a5)
	move.b d0,($ba,a5)
	move.b d0,($ab,a5)
	move.b d0,($104,a5)
	move.b d0,($bd,a5)
	move.b d0,(Active_Player,a5)
	move.b d0,($8d,a5)
	move.b d0,($ac,a5)
	move.b d0,($12d,a5)
	move.b d0,(Dev_Turbo,a5)
	move.b d0,($105,a5)
	move.b d0,($107,a5)
	move.b d0,($10d,a5)
	move.b d0,($10b,a5)
	move.b d0,($10f,a5)
	move.b d0,($12a,a5)
	move.b d0,($12c,a5)
	move.b d0,($124,a5)
	move.b d0,($162,a5)
	move.b d0,($11c,a5)
	move.b d0,($11d,a5)
	move.b d0,($11e,a5)
	move.b d0,($141,a5)
	move.b d0,($123,a5)
	move.b d0,($13e,a5)
	move.b d0,($125,a5)
	move.b d0,($170,a5)
	move.b d0,($143,a5)
	move.b d0,($178,a5)
	move.b d0,($163,a5)
	move.b d0,($140,a5)
	move.b d0,($146,a5)
	move.b d0,($13f,a5)
	move.b d0,($15d,a5)
	st.b ($bd,a5)
	move.b #1,($8f,a5)
	st.b ($130,a5)
	move.b (Dip_Continue,a5),($11f,a5)
	move.w #9,($14c,a5)
	move.w #8,($114,a5)
	moveq #0,d1
	moveq #0,d2
	lea.l (p1memory,a5),a6
	moveq #0,d0
	bsr.w loc_008e9c
	lea.l (p2memory,a5),a6
	moveq #1,d0
	bsr.w loc_008e9c
	bsr.w loc_009178
	bsr.w loc_0091d8
	jmp loc_02031c

;==============================================
loc_00aaa6:
	rts

;==============================================
loc_00aaa8:
	lea.l (p1memory,a5),a6
	bsr.b loc_00aabe
	lea.l (p2memory,a5),a6
	bsr.b loc_00aabe
	lea.l (p3memory,a5),a6
	bsr.b loc_00aabe
	lea.l (p4memory,a5),a6

loc_00aabe:
	tst.b (a6)
	beq.b loc_00aace
	tst.w ($50,a6)
	bpl.b loc_00aace
	jmp loc_003d8a

loc_00aace:
	rts

;==============================================
loc_00aad0:
	tst.b ($ce,a5)
	beq.b loc_00ab08
	tst.b ($d7,a5)
	bne.b loc_00ab08
	movea.w ($13a,a5),a0
	tst.b ($125,a0)
	bne.b loc_00ab08
	tst.b ($141,a5)
	bne.b loc_00aaf8
	move.b ($16a,a5),d0
	cmp.b ($16d,a5),d0
	beq.b loc_00ab04
	bra.b loc_00ab08

loc_00aaf8:
	move.b ($16b,a5),d0
	cmp.b ($130,a0),d0
	beq.b loc_00ab04
	bra.b loc_00ab08

loc_00ab04:
	moveq #1,d0
	rts

loc_00ab08:
	moveq #0,d0
	rts

;==============================================
loc_00ab0c
	bsr.b loc_00aad0
	beq.b loc_00ab28
	st.b ($d7,a5)
	tst.b ($cf,a5)
	bmi.b loc_00ab08
	addq.b #1,($d0,a5)
	addq.b #1,(-$7397,a5)
	jmp loc_002bcc

loc_00ab28:
	rts

;==============================================
loc_00ab2a:
	tst.b ($15d,a5)
	beq.b loc_00ab7e
	tst.b ($105,a5)
	beq.b loc_00ab7e
	tst.b ($15a,a5)
	bne.b loc_00ab7e
	movea.w ($13a,a5),a6
	tst.b ($125,a6)
	bne.b loc_00ab7e
	jsr loc_00b180
	lea.l (-$7084,a5),a4
	move.b d0,(a4)+
	move.b d1,(a4)+
	move.b d4,(a4)+
	move.b d2,(a4)+
	move.w d3,(a4)+
	move.w d3,d0
	lsr.w #4,d0
	move.w d0,d1
	lsl.w #2,d1
	add.w d1,d0
	add.w d0,d0
	andi.w #$000f,d3
	add.w d0,d3
	add.w ($50,a6),d3
	cmpi.w #$90,d3
	bcs.b loc_00ab7a
	move.w #$90,d3

loc_00ab7a:
	move.w d3,($154,a6)

loc_00ab7e:
	rts

;==============================================
loc_00ab80:
	tst.b ($141,a5)
	bne.b loc_00ab94
	tst.b ($125,a0)
	bne.b loc_00ab94
	tst.b ($120,a5)
	beq.b loc_00ab94
	rts

loc_00ab94:
	clr.b ($137,a5)
	rts

;==============================================
loc_00ab9a:
	subq.b #1,($124,a5)
	bne.b loc_00abac
	move.l #$20000ff,d0
	jmp loc_00321a

loc_00abac:
	rts

;==============================================
loc_00abae:
	clr.b (-$708e,a5)
	tst.b ($85,a5)
	beq.b loc_00abec
	btst.b #2,($1c0,a5)
	beq.b loc_00abec
	st.b (-$708e,a5)
	btst.b #0,(Active_Player,a5)
	beq.b loc_00abd8
	move.b ($525,a5),(-$7090,a5)
	move.b #1,($525,a5)

loc_00abd8:
	btst.b #1,(Active_Player,a5)
	beq.b loc_00abec
	move.b ($925,a5),(-$708f,a5)
	move.b #1,($925,a5)

loc_00abec:
	rts

;==============================================
loc_00abee:
	tst.b (-$708e,a5)
	beq.b loc_00ac10
	btst.b #0,(Active_Player,a5)
	beq.b loc_00ac02
	move.b (-$7090,a5),($525,a5)

loc_00ac02:
	btst.b #1,(Active_Player,a5)
	beq.b loc_00ac10
	move.b (-$708f,a5),($925,a5)

loc_00ac10:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
Turbo_Options:
	dc.b $00,$06,$08
	dc.b $00,$06,$08

;==============================================
loc_00ac18:
	move.w (8,a5),d0
	move.w loc_00ac36(pc,d0.w),d1
	jsr loc_00ac36(pc,d1.w)
	jsr loc_03330e
	jsr loc_0335e0
	jmp loc_020c4a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00ac36:
	dc. loc_00ac40-loc_00ac36
	dc. loc_00aca2-loc_00ac36
	dc. loc_00acd2-loc_00ac36
	dc. loc_00acf4-loc_00ac36
	dc. loc_00ad0c-loc_00ac36

;==============================================
loc_00ac40:
	addq.w #2,(8,a5)
	move.b #1,($8f,a5)
	st.b ($bd,a5)
	move.b #1,($125,a5)
	moveq #0,d0
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.b d0,($15f,a5)
	move.b d0,($10f,a5)
	move.w #whiteflash,(palrampointer,a5)
	move.w #whiteflash,($48,a5)
	tst.b ($ce,a5)
	beq.b loc_00ac98
	tst.b ($141,a5)
	bne.b loc_00ac98
	tst.b ($d7,a5)
	bne.b loc_00ac98
	move.b ($16a,a5),d0
	subq.b #1,d0
	cmp.b ($16d,a5),d0
	beq.b loc_00ac98
	move.b d0,($16a,a5)

loc_00ac98:
	jsr loc_0088dc
	bra.w loc_00b5d0

;==============================================
loc_00aca2:
	addq.w #2,(8,a5)
	move.w #3,($a,a5)
	bsr.w loc_00ad4c
	move.w a0,(-$6026,a5)
	jsr loc_01bdc0
	tst.b ($11f,a5)
	beq.b loc_00acd0
	moveq #$e,d0
	jsr loc_0039e0
	moveq #0,d0
	jsr loc_08548a

loc_00acd0:
	rts

;==============================================
loc_00acd2:
	subq.w #1,($a,a5)
	bpl.b loc_00acf2
	addq.w #2,(8,a5)
	moveq #0,d0
	move.b d0,($8f,a5)
	move.b d0,($bd,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.w #$90c0,($48,a5)

loc_00acf2:
	rts

;==============================================
loc_00acf4:
	bsr.b loc_00ad4c
	move.w a0,(-$6026,a5)
	tst.b ($b8,a5)
	bmi.w loc_00ad82
	tst.b ($8e,a5)
	beq.w loc_00ad92
	rts

;==============================================
loc_00ad0c:
	subq.b #1,($e,a5)
	bpl.b loc_00ad4a
	moveq #0,d0
	move.w #0,(4,a5)
	move.w d0,(6,a5)
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.b d0,($15f,a5)
	move.b d0,($b8,a5)
	move.b d0,($bd,a5)
	move.b d0,($10f,a5)
	move.b #1,($8f,a5)
	jmp loc_01bdd0

loc_00ad4a:
	rts

;==============================================
loc_00ad4c:
	lea.l (p1memory,a5),a0
	cmpi.b #3,($8e,a5)
	beq.b loc_00ad66
	btst.b #0,($8e,a5)
	bne.b loc_00ad80
	lea.l (p2memory,a5),a0
	bra.b loc_00ad80

loc_00ad66:
	move.b ($10c,a0),d0
	cmp.b ($90c,a5),d0
	bgt.b loc_00ad80
	blt.b loc_00ad7c
	move.b ($10a,a0),d0
	cmp.b ($90a,a5),d0
	bge.b loc_00ad80

loc_00ad7c:
	lea.l (p2memory,a5),a0

loc_00ad80:
	rts

;==============================================
loc_00ad82
	addq.w #2,(8,a5)
	move.b #$3c,($a,a5)
	st.b ($15f,a5)
	rts

loc_00ad92
	moveq #0,d0
	move.w #8,($4,a5)
	move.w d0,($6,a5)
	move.l d0,($8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.b d0,($b8,a5)
	move.b d0,($bd,a5)
	move.b #1,($125,a5)
	move.b #1,($15f,a5)
	move.b d0,($10f,a5)
	move.b #1,($8f,a5)
	move.b d0,($106,a5)
	move.b #1,($104,a5)
	move.w #Mainpalette,(palrampointer,a5)
	rts

;==============================================
loc_00adde:
	bsr.b loc_00ad92
	st.b ($104,a5)
	move.w #$92a0,(palrampointer,a5)
	move.w #$92a0,($48,a5)
	jsr loc_01bdd0
	move.w #$270e,($32,a5)
	move.w #$2641,($3a,a5)
	move.w #0,($26,a5)
	move.w #$300,($28,a5)
	lea.l $904000,a1
	moveq #0,d0
	moveq #0,d1
	jmp loc_01baa8

;==============================================
loc_00ae1e:
	move.w (8,a5),d0
	move.w loc_00ae3c(pc,d0.w),d1
	jsr loc_00ae3c(pc,d1.w)
	jsr loc_03330e
	jsr loc_0335e0
	jmp loc_020c4a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00ae3c:
	dc.w loc_00ae48-loc_00ae3c
	dc.w loc_00ae84-loc_00ae3c
	dc.w loc_00ae9c-loc_00ae3c
	dc.w loc_00aeb8-loc_00ae3c
	dc.w loc_00aece-loc_00ae3c
	dc.w loc_00aede-loc_00ae3c

;==============================================
loc_00ae48:
	addq.w #2,($8,a5)
	move.w #$1f,($a,a5)
	moveq #0,d0
	move.b d0,($15f,a5)
	move.b d0,($10f,a5)
	move.b #1,($125,a5)
	move.w #Mainpalette,(palrampointer,a5)
	jsr loc_01bdc0
	moveq #$12,d0
	jsr loc_0039e0
	moveq #2,d0
	jsr loc_08548a
	jmp loc_01743e

;==============================================
loc_00ae84:
	subq.w #1,($a,a5)
	bpl.b loc_00ae9a
	addq.w #2,(8,a5)
	move.w #$1f,($a,a5)
	jmp loc_00353e

loc_00ae9a:
	rts

;==============================================
loc_00ae9c:
	subq.w #1,($a,a5)
	bpl.b loc_00aeb6
	addq.w #2,(8,a5)
	st.b ($15f,a5)
	move.w #$1f,($a,a5)
	jmp loc_003c44

loc_00aeb6:
	rts

;==============================================
loc_00aeb8:
	subq.w #1,($a,a5)
	bpl.b loc_00aecc
	addq.w #2,(8,a5)
	clr.b ($15f,a5)
	move.w #$78,($a,a5)

loc_00aecc:
	rts

;==============================================
loc_00aece:
	bsr.w loc_00afbe
	bne.b loc_00aeda
	subq.w #1,($a,a5)
	bpl.b loc_00aecc

loc_00aeda:
	addq.w #2,(8,a5)

loc_00aede:
	tst.b (Active_Player,a5)
	bne.b loc_00aecc
	move.w #$c,(4,a5)
	moveq #0,d0
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	addq.b #1,(-$7396,a5)
	move.w #$80,d0
	jsr loc_001346
	jsr loc_01c00a
	jsr loc_01bdd0
	jsr loc_0172da
	jmp loc_01b0e6

loc_00af22:
	move.b ($61,a5),d1
	not.b d1
	and.b ($60,a5),d1
	btst.b #0,($ac,a5)
	beq.b loc_00af3a
	btst #0,d1
	bne.b loc_00af4c

loc_00af3a:
	btst.b #1,($ac,a5)
	beq.b loc_00af48
	btst #1,d1
	bne.b loc_00af4c

loc_00af48:
	moveq #0,d0
	rts

loc_00af4c:
	moveq #1,d0
	rts

;==============================================
loc_00af50:
	moveq #0,d0
	moveq #0,d1
	btst.b #0,($ac,a5)
	beq.b loc_00af60
	bsr.w loc_00afc4

loc_00af60:
	btst.b #1,($ac,a5)
	beq.b loc_00af6c
	bsr.w loc_00afe6

loc_00af6c:
	tst.w d0
	rts


;==============================================
loc_00af70:
	tst.b ($ac,a5)
	bne.b loc_00af50

loc_00af76:
	moveq #0,d0
	moveq #0,d1
	btst.b #0,(Active_Player,a5)
	beq.b loc_00af86
	bsr.w loc_00afc4

loc_00af86:
	btst.b #1,(Active_Player,a5)
	beq.b loc_00af92
	bsr.w loc_00afe6

loc_00af92
	tst.w d0
	rts

;==============================================
loc_00af96:
	cmpi.b #3,($ac,a5)
	bne.b loc_00af50
	moveq #0,d0
	moveq #0,d1
	btst.b #0,($10c,a5)
	beq.b loc_00afae
	bsr.w loc_00afc4

loc_00afae
	btst.b #1,($10c,a5)
	beq.b loc_00afba
	bsr.w loc_00afe6

loc_00afba
	tst.w d0
	rts

;==============================================
loc_00afbe:
	moveq #0,d0
	moveq #0,d1
	bsr.b loc_00afe6

loc_00afc4:
	move.w (INP_P1_repeat,a5),d1
	not.w d1
	and.w (INP_P1,a5),d1
	andi.w #$7700,d1
	or.w d1,d0
	move.b ($61,a5),d1
	not.b d1
	and.b ($60,a5),d1
	andi.w #1,d1
	or.w d1,d0
	rts

loc_00afe6:
	move.w (INP_P2_repeat,a5),d1
	not.w d1
	and.w (INP_P2,a5),d1
	andi.w #$7700,d1
	or.w d1,d0
	move.b ($61,a5),d1
	not.b d1
	and.b ($60,a5),d1
	andi.w #2,d1
	or.w d1,d0
	rts

;==============================================
loc_00b008:
	lea.l (p1memory,a5),a0
	bsr.b loc_00b012
	lea.l (p2memory,a5),a0

loc_00b012:
	moveq #2,d2
	tst.w (Region,a5)
	bne.w loc_00b06e
	tst.b ($bf,a5)
	bne.w loc_00b06e
	move.b ($101,a0),d0
	btst d0,($ac,a5)
	beq.w loc_00b06e
	btst d0,($60,a5)
	beq.w loc_00b06e
	moveq #$18,d2
	move.b ($11a,a0),d1
	andi.b #$77,d1
	beq.b loc_00b06e
	moveq #$19,d2
	btst #0,d1
	bne.b loc_00b06e
	moveq #$1d,d2
	btst #1,d1
	bne.b loc_00b06e
	moveq #$1f,d2
	btst #2,d1
	bne.b loc_00b06e
	moveq #$1e,d2
	btst #4,d1
	bne.b loc_00b06e
	moveq #$1a,d2
	btst #5,d1
	bne.b loc_00b06e
	moveq #$1c,d2

loc_00b06e:
	move.b d2,($118,a0)
	rts
	rts

;==============================================
loc_00b076:
	moveq #0,d0
	move.b (clock_counter,a5),d0
	moveq #0,d2
	move.b loc_00b0a2(pc,d0.w),d2
	move.w loc_00b08a(pc,d2.w),d2
	jmp loc_00b08a(pc,d2.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00b08a:
	dc.w loc_00b106-loc_00b08a
	dc.w loc_00b10a-loc_00b08a
	dc.w loc_00b110-loc_00b08a
	dc.w loc_00b11a-loc_00b08a
	dc.w loc_00b120-loc_00b08a
	dc.w loc_00b12a-loc_00b08a
	dc.w loc_00b130-loc_00b08a
	dc.w loc_00b13c-loc_00b08a
	dc.w loc_00b146-loc_00b08a
	dc.w loc_00b152-loc_00b08a
	dc.w loc_00b162-loc_00b08a
	dc.w loc_00b16e-loc_00b08a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00b0a2:
	dc.b $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$02,$06,$06,$06,$06,$06,$06,$06,$06,$06,$06
	dc.b $08,$08,$08,$08,$08,$0a,$0a,$0a,$0a,$0a,$0c,$0c,$0c,$0c,$0c,$0e
	dc.b $10,$12,$14,$16

;==============================================
loc_00b106:
	moveq #1,d3
	rts

;==============================================
loc_00b10a:
	add.w d6,d6
	moveq #2,d3
	rts

;==============================================
loc_00b110:
	move.w d6,d2
	add.w d6,d6
	add.w d2,d6
	moveq #3,d3
	rts

;==============================================
loc_00b11a:
	lsl.w #2,d6
	moveq #4,d3
	rts

;==============================================
loc_00b120:
	move.w d6,d2
	lsl.w #2,d6
	add.w d2,d6
	moveq #5,d3
	rts

;==============================================
loc_00b12a:
	lsl.w #3,d6
	moveq #8,d3
	rts

;==============================================
loc_00b130:
	move.w d6,d2
	lsl.w #2,d6
	add.w d2,d6
	add.w d6,d6
	moveq #$10,d3
	rts

;==============================================
loc_00b13c:
	move.w d6,d2
	lsl.w #4,d6
	sub.w d2,d6
	moveq #$15,d3
	rts

;==============================================
loc_00b146:
	move.w d6,d2
	lsl.w #2,d6
	add.w d2,d6
	lsl.w #2,d6
	moveq #$20,d3
	rts

;==============================================
loc_00b152:
	move.w d6,d1
	move.w d6,d2
	add.w d1,d1
	add.w d1,d6
	lsl.w #3,d6
	add.w d2,d6
	moveq #$25,d3
	rts

;==============================================
loc_00b162:
	move.w d6,d2
	lsl.w #4,d6
	sub.w d2,d6
	add.w d6,d6
	moveq #$30,d3
	rts

;==============================================
loc_00b16e:
	move.w d6,d1
	move.w d6,d2
	add.w d1,d1
	add.w d1,d6
	lsl.w #3,d6
	add.w d2,d6
	add.w d6,d6
	moveq #$50,d3
	rts

;==============================================
loc_00b180:
	lea.l loc_00bf22(pc),a1
	move.w ($114,a5),d0
	move.b (a1,d0.w),d0
	ext.w d0
	lsl.w #5,d0
	lea.l loc_00bf3e(pc),a1
	lea.l (a1,d0.w),a1
	jsr RNGFunction
	andi.w #$1f,d0
	move.b (a1,d0.w),d1
	lea.l loc_00bdc8(pc),a1
	move.w ($114,a5),d0
	add.w d0,d0
	move.w (a1,d0.w),d0
	lea.l (a1,d0.w),a1
	moveq #0,d0
	move.b (clock_counter,a5),d0
	move.b (a1,d0.w),d0
	andi.b #$ef,ccr
	abcd.b d1,d0
	lea.l loc_00bf02(pc),a1
	move.b ($b4,a6),d1
	tst.b ($10d,a5)
	beq.b loc_00b1d8
	moveq #3,d1

loc_00b1d8:
	move.w d1,d4
	andi.w #$f,d1
	move.b (a1,d1.w),d1
	lea.l loc_00bf12(pc),a1
	moveq #0,d2
	move.b ($115,a6),d2
	cmpi.b #$f,d2
	bcs.b loc_00b1f4
	moveq #$f,d2

loc_00b1f4:
	move.b (a1,d2.w),d2
	move.w d0,(-$6028,a5)
	move.w d1,(-$602a,a5)
	bsr.b loc_00b20e
	move.w d2,(-$602a,a5)
	bsr.b loc_00b20e
	move.w (-$6028,a5),d3
	rts

;==============================================
loc_00b20e:
	lea.l (-$6028,a5),a0
	lea.l (-$6026,a5),a1
	andi.b #$ef,ccr
	abcd.b -(a0),-(a1)
	abcd.b -(a0),-(a1)
	rts

;==============================================
loc_00b220:
	move.w ($138,a5),d0
	move.w loc_00b22c(pc,d0.w),d1
	jmp loc_00b22c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00b22c:
	dc.w loc_00b234-loc_00b22c
	dc.w loc_00b23c-loc_00b22c
	dc.w loc_00b248-loc_00b22c
	dc.w loc_00b254-loc_00b22c

;==============================================
loc_00b234:
	bsr.w loc_00b260
	bra.w loc_00b296

;==============================================
loc_00b23c:
	bsr.w loc_00b260
	bsr.w loc_00b2cc
	bra.w loc_00b302

;==============================================
loc_00b248:
	bsr.w loc_00b296
	bsr.w loc_00b2cc
	bra.w loc_00b302

;==============================================
loc_00b254:
	bsr.w loc_00b260
	bsr.w loc_00b296
	bra.w loc_00b2cc

;==============================================
loc_00b260:
	lea.l (p1memory,a5),a0
	tst.b ($ab,a0)
	bne.b loc_00b280
	move.b ($8ab,a5),d0
	or.b ($cab,a5),d0
	or.b ($10ab,a5),d0
	beq.b loc_00b280
	tst.b ($245,a0)
	bne.w loc_00b34c

loc_00b280:
	lea.l (-$7036,a5),a1
	move.w (-$703e,a5),d0
	addq.w #8,d0
	andi.w #$3ff,d0
	move.w d0,(-$703e,a5)
	bra.w loc_00b334

;==============================================
loc_00b296:
	lea.l (p2memory,a5),a0
	tst.b ($ab,a0)
	bne.b loc_00b2b6
	move.b ($4ab,a5),d0
	or.b ($cab,a5),d0
	or.b ($10ab,a5),d0
	beq.b loc_00b2b6
	tst.b ($245,a0)
	bne.w loc_00b34c

loc_00b2b6:
	lea.l (-$6c36,a5),a1
	move.w (-$703c,a5),d0
	addq.w #8,d0
	andi.w #$3ff,d0
	move.w d0,(-$703c,a5)
	bra.w loc_00b334

;==============================================
loc_00b2cc:
	lea.l (p3memory,a5),a0
	tst.b ($ab,a0)
	bne.b loc_00b2ec
	move.b ($4ab,a5),d0
	or.b ($8ab,a5),d0
	or.b ($10ab,a5),d0
	beq.b loc_00b2ec
	tst.b ($245,a0)
	bne.w loc_00b34c

loc_00b2ec:
	lea.l (-$6836,a5),a1
	move.w (-$703a,a5),d0
	addq.w #8,d0
	andi.w #$3ff,d0
	move.w d0,(-$703a,a5)
	bra.w loc_00b334

;==============================================
loc_00b302:
	lea.l (p4memory,a5),a0
	tst.b ($ab,a0)
	bne.b loc_00b322
	move.b ($4ab,a5),d0
	or.b ($8ab,a5),d0
	or.b ($cab,a5),d0
	beq.b loc_00b322
	tst.b ($245,a0)
	bne.w loc_00b34c

loc_00b322:
	lea.l (-$6436,a5),a1
	move.w (-$7038,a5),d0
	addq.w #8,d0
	andi.w #$3ff,d0
	move.w d0,(-$7038,a5)

loc_00b334:
	move.l ($1c,a0),(a1,d0.w)
	move.b ($b,a0),(a1,d0.w)
	move.w ($10,a0),(4,a1,d0.w)
	move.w ($14,a0),(6,a1,d0.w)

loc_00b34c:
	rts

;==============================================
loc_00b34e:
	tst.b ($107,a5)
	beq.b loc_00b36a
	move.b ($4ab,a5),d0
	or.b ($8ab,a5),d0
	or.b ($cab,a5),d0
	or.b ($10ab,a5),d0
	move.b d0,($125,a5)
	bra.b loc_00b3b0

loc_00b36a:
	move.b ($4ab,a5),d0
	or.b ($8ab,a5),d0
	or.b ($cab,a5),d0
	or.b ($10ab,a5),d0
	move.b d0,($125,a5)
	beq.b loc_00b3b0
	btst #7,d0
	bmi.b loc_00b38a
	st.b ($126,a5)

loc_00b38a:
	tst.b ($126,a5)
	bne.b loc_00b3be
	st.b ($126,a5)
	bsr.w loc_00b3c0
	tst.b ($83,a5)
	beq.b loc_00b3be
	lea.l $90c360,a1
	move.l #$f000f000,d6
	moveq #0,d7
	bra.w loc_00b5f6

loc_00b3b0:
	tst.b ($126,a5)
	beq.b loc_00b3be
	clr.b ($126,a5)
	bra.w loc_00b5d0

loc_00b3be:
	rts

;==============================================
loc_00b3c0:
	move.l #$3fff3fff,d6
	move.w ($138,a5),d0
	move.w loc_00b3ee(pc,d0.w),d0
	jsr loc_00b3ee(pc,d0.w)
	lea.l $90c2a0,a1
	moveq #3,d7
	bsr.w loc_00b4f4
	lea.l $90c340,a1
	moveq #3,d7
	bsr.w loc_00b4f4
	bra.w loc_00b4c8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00b3ee:
	dc.w loc_00b3f6-loc_00b3ee
	dc.w loc_00b428-loc_00b3ee
	dc.w loc_00b45e-loc_00b3ee
	dc.w loc_00b494-loc_00b3ee

;==============================================
loc_00b3f6:
	lea.l $90c1e0,a1
	moveq #5,d7
	bsr.w loc_00b4f4
	tst.b ($4ab,a5)
	bne.b loc_00b414
	lea.l $90c000,a1
	moveq #4,d7
	bra.w loc_00b4f4


loc_00b414:
	tst.b ($8ab,a5)
	bne.b loc_00b426
	lea.l $90c0a0,a1
	moveq #4,d7
	bra.w loc_00b4f4

loc_00b426:
	rts

;==============================================
loc_00b428:
	lea.l $90c1e0,a1
	moveq #5,d7
	bsr.w loc_00b4f4
	move.b ($cab,a5),d0
	or.b ($10ab,a5),d0
	bne.b loc_00b44a
	lea.l $90c0a0,a1
	moveq #9,d7
	bra.w loc_00b4f4

loc_00b44a:
	tst.b ($4ab,a5)
	bne.b loc_00b45c
	lea.l $90c000,a1
	moveq #4,d7
	bra.w loc_00b4f4

loc_00b45c:
	rts

;==============================================
loc_00b45e:
	lea.l $90c1e0,a1
	moveq #5,d7
	bsr.w loc_00b4f4
	move.b ($cab,a5),d0
	or.b ($10ab,a5),d0
	bne.b loc_00b480
	lea.l $90c0a0,a1
	moveq #9,d7
	bra.w loc_00b4f4

loc_00b480:
	tst.b ($8ab,a5)
	bne.b loc_00b492
	lea.l $90c000,a1
	moveq #4,d7
	bra.w loc_00b4f4

loc_00b492:
	rts

;==============================================
loc_00b494:
	lea.l $90c1e0,a1
	moveq #5,d7
	bsr.b loc_00b4f4
	tst.b ($cab,a5)
	bne.b loc_00b4b0
	lea.l $90c140,a1
	moveq #4,d7
	bra.w loc_00b4f4

loc_00b4b0:
	move.b ($4ab,a5),d0
	or.b ($8ab,a5),d0
	bne.b loc_00b4c6
	lea.l $90c000,a1
	moveq #9,d7
	bra.w loc_00b4f4

loc_00b4c6:
	rts

;==============================================
loc_00b4c8:
	move.l #$3fff3fff,d6
	lea.l $90c1e0,a1
	moveq #5,d7
	bsr.b loc_00b4f4
	lea.l $90c400,a1
	bsr.b loc_00b4f2
	lea.l $90c800,a1
	bsr.b loc_00b4f2
	lea.l $90cc00,a1
	moveq #$1e,d7
	bra.b loc_00b4f4

loc_00b4f2:
	moveq #$1f,d7

loc_00b4f4:
	movem.l (a1),d0-d3
	and.l d6,d0
	and.l d6,d1
	and.l d6,d2
	and.l d6,d3
	movem.l d0-d3,(a1)
	lea.l ($10,a1),a1
	movem.l (a1),d0-d3
	and.l d6,d0
	and.l d6,d1
	and.l d6,d2
	and.l d6,d3
	movem.l d0-d3,(a1)
	lea.l ($10,a1),a1
	dbra d7,loc_00b4f4
	rts

;==============================================
loc_00b522
	move.l #$a000a000,d6
	move.l #$0fff0fff,d5
	lea.l $90c000,a1
	moveq #$1d,d7
	bsr.w loc_00b592
	bra.w loc_00b57a

loc_00b53e:
	move.l #$a000a000,d6
	move.l #$0fff0fff,d5
	lea.l $90c000,a1
	moveq #$1c,d7
	bsr.w loc_00b592
	bra.w loc_00b57a

;==============================================
loc_00b55a:
	move.l #$a000a000,d6
	move.l #$0fff0fff,d5
	lea.l $90c2a0,a1
	moveq #3,d7
	bsr.b loc_00b592
	lea.l $90c1e0,a1
	moveq #5,d7
	bsr.b loc_00b592

loc_00b57a:
	lea.l $90c400,a1
	bsr.b loc_00b590
	lea.l $90c800,a1
	bsr.b loc_00b590
	lea.l $90cc00,a1

loc_00b590:
	moveq #$1f,d7

loc_00b592
	movem.l (a1),d0-d3
	and.l d5,d0
	and.l d5,d1
	and.l d5,d2
	and.l d5,d3
	or.l d6,d0
	or.l d6,d1
	or.l d6,d2
	or.l d6,d3
	movem.l d0-d3,(a1)
	lea.l ($10,a1),a1
	movem.l (a1),d0-d3
	and.l d5,d0
	and.l d5,d1
	and.l d5,d2
	and.l d5,d3
	or.l d6,d0
	or.l d6,d1
	or.l d6,d2
	or.l d6,d3
	movem.l d0-d3,(a1)
	lea.l ($10,a1),a1
	dbra d7,loc_00b592
	rts

;==============================================
loc_00b5d0:
	move.l #$f000f000,d6
	lea.l $90c000,a1
	bsr.b loc_00b5f4
	lea.l $90c400,a1
	bsr.b loc_00b5f4
	lea.l $90c800,a1
	bsr.b loc_00b5f4
	lea.l $90cc00,a1

loc_00b5f4:
	moveq #$1f,d7

loc_00b5f6:
	movem.l (a1),d0-d3
	or.l d6,d0
	or.l d6,d1
	or.l d6,d2
	or.l d6,d3
	movem.l d0-d3,(a1)
	lea.l ($10,a1),a1
	movem.l (a1),d0-d3
	or.l d6,d0
	or.l d6,d1
	or.l d6,d2
	or.l d6,d3
	movem.l d0-d3,(a1)
	lea.l ($10,a1),a1
	dbra d7,loc_00b5f6
	rts

;==============================================;
;Set Character Select Screen Color based on Character
;==============================================;
loc_00b624:
	andi.w #$1f,d0
	move.b loc_00b632(pc,d0.w),d0
	move.w d0,($176,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00b632:
	dc.b $00,$00,$00,$01;Ryu,Ken,Gki,Nsh
	dc.b $03,$01,$02,$00;Chn,Adn,Sdm,Guy
	dc.b $01,$03,$04,$01;Brd,Rse,Dic,Sag
	dc.b $00,$03,$01,$02;Dan,Sak,Rol,Sim
	dc.b $00,$02,$00,$02;Zan,Gen,???,Gen
	dc.b $00,$04,$03,$00;???,Box,Cam,???
	dc.b $02,$02,$03,$02;EHD,Blk,Rmk,Cdy
	dc.b $02,$03,$04,$04;Clw,Kar,Jli,Jni

;==============================================
loc_00b652:
	st.b ($124,a5)
	move.b #$b,($12b,a5)
	clr.b ($401,a5)
	clr.b ($801,a5)
	clr.b ($c01,a5)
	clr.b ($1001,a5)
	move.w #$ffff,d0
	bra.w loc_00b710

;==============================================
loc_00b674:
	cmpi.b #$ff,($124,a5)
	bne.b loc_00b680
	clr.b ($124,a5)

loc_00b680:
	move.b #1,($401,a5)
	move.b #1,($801,a5)
	move.b #1,($c01,a5)
	move.b #1,($1001,a5)
	rts

;==============================================
loc_00b69a:
	st.b ($124,a5)
	move.b #$b,($12b,a5)
	moveq #0,d0
	move.b ($101,a6),d0
	add.w d0,d0
	move.w loc_00b6b4(pc,d0.w),d0
	jmp loc_00b6b4(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00b6b4:
	dc.w loc_00b6ba-loc_00b6b4
	dc.w loc_00b6c0-loc_00b6b4
	dc.w loc_00b6c6-loc_00b6b4

;==============================================
loc_00b6ba:
	clr.b ($401,a5)
	rts

;==============================================
loc_00b6c0:
	clr.b ($801,a5)
	rts

;==============================================
loc_00b6c6:
	clr.b ($c01,a5)
	clr.b ($1001,a5)
	rts

;==============================================
loc_00b6d0:
	cmpi.b #$ff,($124,a5)
	bne.b loc_00b6dc
	clr.b ($124,a5)

loc_00b6dc:
	moveq #0,d0
	move.b ($101,a6),d0
	add.w d0,d0
	move.w loc_00b6ec(pc,d0.w),d0
	jmp loc_00b6ec(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00b6ec:
	dc.w loc_00b6f2-loc_00b6ec
	dc.w loc_00b6fa-loc_00b6ec
	dc.w loc_00b702-loc_00b6ec

;==============================================
loc_00b6f2:
	move.b #1,($401,a5)
	rts

;==============================================
loc_00b6fa:
	move.b #1,($801,a5)
	rts

;==============================================
loc_00b702:
	move.b #1,($c01,a5)
	move.b #1,($1001,a5)
	rts

;==============================================
loc_00b710:
	move.w d0,$90cfe0
	rts

;==============================================
loc_00b718:
	move.b ($66e,a5),d0
	or.b ($a6e,a5),d0
	or.b ($e6e,a5),d0
	or.b ($126e,a5),d0
	beq.w loc_00b776
	tst.b ($170,a5)
	bne.b loc_00b756
	tst.b ($124,a5)
	bne.w loc_00b776
	st.b ($124,a5)
	move.b #$b,($12b,a5)
	move.b d0,($170,a5)
	move.b #$f,($171,a5)
	move.w #$f00f,$90cfe0

loc_00b756:
	subq.b #1,($171,a5)
	bpl.b loc_00b776
	moveq #0,d0
	move.b d0,($124,a5)
	move.b d0,($170,a5)
	move.b d0,($66e,a5)
	move.b d0,($a6e,a5)
	move.b d0,($e6e,a5)
	move.b d0,($126e,a5)

loc_00b776:
	rts

loc_00b

;===============================================
loc_00b778:
	tst.b ($168,a5)
	bne.w loc_00b94c
	lea.l (p1memory,a5),a0
	lea.l (p2memory,a5),a1
	cmpi.b #3,($ac,a5)
	bne.b loc_00b7b4
	cmpi.b #3,($8d,a5)
	bne.b loc_00b7a2
	tst.b ($131,a5)
	bne.b loc_00b7ac
	exg.l a0,a1
	bra.b loc_00b7ac

loc_00b7a2:
	btst.b #0,($8d,a5)
	beq.b loc_00b7ac
	exg.l a0,a1

loc_00b7ac:
	move.b ($101,a0),($130,a5)
	bra.b loc_00b7ee

loc_00b7b4:
	btst.b #0,($ac,a5)
	bne.b loc_00b7be
	exg.l a0,a1

loc_00b7be:
	bsr.w loc_00b8b6
	moveq #-$1,d0
	move.l ($140,a0),d2
	lea.l (-$707e,a5),a2

loc_00b7cc:
	addq.w #1,d0
	move.b (a2,d0.w),d1
	cmp.w ($14c,a5),d0
	bcc.b loc_00b7dc
	btst.l d1,d2
	bne.b loc_00b7cc

loc_00b7dc:
	move.w d0,($114,a5)
	move.b d1,($102,a1)
	lea.l (-$705e,a5),a2
	move.b (a2,d0.w),($132,a1)

loc_00b7ee:
	move.b ($102,a1),d0

loc_00b7f2:
	move.w (stageid,a5),($172,a5)
	move.b d0,d1
	bsr.w loc_00bb90
	add.w d0,d0
	move.w d0,($174,a5)
	clr.b ($111,a5)
	tst.b ($bf,a5)
	bne.b loc_00b86c
	tst.b ($168,a5)
	beq.b loc_00b824
	cmpi.w #5,($114,a5)
	bne.b loc_00b86c
	move.w #$14,($174,a5)
	rts

loc_00b824:
	cmpi.b #3,($ac,a5)
	beq.b loc_00b86c
	tst.b ($14b,a0)
	beq.b loc_00b842
	cmpi.w #$1a,($114,a5)
	bne.b loc_00b86c
	move.w #$14,($174,a5)
	rts

loc_00b842:
	moveq #0,d0
	move.b ($102,a0),d0
	cmpi.w #8,($114,a5)
	beq.b loc_00b85c
	addi.w #$20,d0
	cmpi.w #9,($114,a5)
	bne.b loc_00b86c

loc_00b85c:
	move.b loc_00b86e(pc,d0.w),d0
	bmi.b loc_00b86c
	add.w d0,d0
	move.w d0,($174,a5)
	st.b ($111,a5)

loc_00b86c:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00b86e:
	dc.b $0a,$ff,$ff,$0a,$0a,$ff,$ff,$ff,$0a,$ff,$ff,$0a,$0a,$0a,$ff,$ff
	dc.b $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$0a,$0a,$ff,$ff,$0a,$ff,$ff
	dc.b $0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a
	dc.b $0a,$0a,$ff,$0a,$ff,$0a,$0a,$ff,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a

;==============================================
loc_00b8ae:
	move.w #$24,($174,a5)
	rts

;==============================================
loc_00b8b6:
	tst.b ($14b,a0)
	bne.b loc_00b914
	move.b ($101,a0),($130,a5)
	lea.l loc_00c09e(pc),a2
	tst.b ($bf,a5)
	beq.b loc_00b8d0
	lea.l loc_00d07e(pc),a2

loc_00b8d0:
	moveq #0,d0
	moveq #0,d1
	move.b ($121,a5),d0
	move.b ($102,a0),d1
	add.w d1,d1
	move.w (a2,d1.w),d1
	add.w d1,d0
	move.l (a2,d0.w),(-$707e,a5)
	move.l (4,a2,d0.w),(-$707a,a5)
	move.w (8,a2,d0.w),(-$7076,a5)
	moveq #0,d0
	move.b ($122,a5),d0
	lea.l loc_00bffe(pc),a2
	move.l (a2,d0.w),(-$705e,a5)
	move.l (4,a2,d0.w),(-$705a,a5)
	move.w (8,a2,d0.w),(-$7056,a5)
	rts

loc_00b914:
	move.w #$1a,($14c,a5)
	move.b ($101,a0),($130,a5)
	lea.l (-$707e,a5),a2
	lea.l SurvivalModeList(pc),a3
	moveq #$1a,d1

loc_00b92a:
	move.b (a3)+,(a2)+
	dbra d1,loc_00b92a
	lea.l (-$705e,a5),a2
	lea.l loc_00bd58(pc),a3
	moveq #0,d0
	move.b ($15e,a5),d0
	lea.l (a3,d0.w),a3
	moveq #$1a,d1

loc_00b944:
	move.b (a3)+,(a2)+
	dbra d1,loc_00b944
	rts

;==============================================
loc_00b94c:
	move.w #5,($14c,a5)
	lea.l (p1memory,a5),a0
	lea.l (p2memory,a5),a1
	cmpi.b #3,($ac,a5)
	bne.b loc_00b980
	cmpi.b #3,($8d,a5)
	bne.b loc_00b974
	tst.b ($131,a5)
	bne.b loc_00b98e
	exg.l a0,a1
	bra.b loc_00b98e

loc_00b974:
	btst.b #0,($8d,a5)
	beq.b loc_00b98e
	exg.l a0,a1
	bra.b loc_00b98e

loc_00b980
	btst.b #0,($ac,a5)
	bne.b loc_00b98a
	exg.l a0,a1

loc_00b98a:
	bsr.w loc_00ba10

loc_00b98e:
	move.b ($132,a0),($132,a1)
	move.b ($162,a0),($162,a1)
	move.l ($540,a5),d2
	or.l ($940,a5),d2
	move.l d2,($540,a5)
	move.l d2,($940,a5)
	bsr.w loc_00b9de
	moveq #-1,d0
	lea.l (-$707e,a5),a2

loc_00b9b4:
	addq.w #1,d0
	move.b (a2,d0.w),d1
	cmp.w ($14c,a5),d0
	bcc.b loc_00b9c4
	btst.l d1,d2
	bne.b loc_00b9b4

loc_00b9c4:
	move.w d0,($114,a5)
	move.b d1,($d02,a5)
	lea.l (-$705e,a5),a2
	move.b (a2,d0.w),($d32,a5)
	move.b ($d02,a5),d0
	bra.w loc_00b7f2

loc_00b9de:
	move.l #$502151c,(-$707e,a5)
	move.l #$b0a0000,(-$707a,a5)
	move.l #$1ff0000,(-$705e,a5)
	move.l #0,(-$705a,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00ba00:
	dc.w $0000,$0000,$00ff,$ffff,$0101,$0101,$01ff,$ffff

;==============================================
loc_00ba10:
	jsr RNGFunction
	andi.w #$20,d0
	add.b ($102,a0),d0
	move.b Dramatic_Partners(pc,d0.w),(PL_charid,a1)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Dramatic Mode Partners
Dramatic_Partners:
;Player2 List
	dc.b Ken_id;		Ryu
	dc.b Ryu_id;		Ken
	dc.b Gen_id;		Akm
	dc.b Chun_id;		Nsh
	dc.b Nash_id;		Chn
	dc.b Sagat_id;		Adn
	dc.b Ehonda_id;		Sdm
	dc.b Cody_id;		Guy
	dc.b Boxer_id;		Brd
	dc.b Dhalsim_id;	Rse
	dc.b Cammy_id;		Dic
	dc.b Adon_id;		Sag
	dc.b Blanka_id;		Dan
	dc.b Karin_id;		Sak
	dc.b Claw_id;		Rol
	dc.b Rose_id;		Sim
	dc.b RMika_id;		Zan
	dc.b Akuma_id;		Gen
	dc.b Ryu_id;		0x12
	dc.b Akuma_id;		GenC
	dc.b Ryu_id;		0x14
	dc.b Birdie_id;		Box
	dc.b Dictator_id;	Cam
	dc.b Ryu_id;		0x17
	dc.b Sodom_id;		Ehd
	dc.b Dan_id;		Blk
	dc.b Zangief_id;	Rmk
	dc.b Guy_id;		Cdy
	dc.b Rolento_id;	Clw
	dc.b Sakura_id;		Kar
	dc.b Juni_id;		Jul
	dc.b Juli_id;		Jun

;Player1 List
	dc.b Ken_id;		Ryu
	dc.b Ryu_id;		Ken
	dc.b Gen_id;		Akm
	dc.b Chun_id;		Nsh
	dc.b Nash_id;		Chn
	dc.b Sagat_id;		Adn
	dc.b Ehonda_id;		Sdm
	dc.b Cody_id;		Guy
	dc.b Boxer_id;		Brd
	dc.b Dhalsim_id;	Rse
	dc.b Cammy_id;		Dic
	dc.b Adon_id;		Sag
	dc.b Blanka_id;		Dan
	dc.b Karin_id;		Sak
	dc.b Claw_id;		Rol
	dc.b Rose_id;		Sim
	dc.b RMika_id;		Zan
	dc.b Akuma_id;		Gen
	dc.b Ryu_id;		0x12
	dc.b Akuma_id;		GenC
	dc.b Ryu_id;		0x14
	dc.b Birdie_id;		Box
	dc.b Dictator_id;	Cam
	dc.b Ryu_id;		0x17
	dc.b Sodom_id;		Ehd
	dc.b Dan_id;		Blk
	dc.b Zangief_id;	Rmk
	dc.b Guy_id;		Cdy
	dc.b Rolento_id;	Clw
	dc.b Sakura_id;		Kar
	dc.b Juni_id;		Jul
	dc.b Juli_id;		Jun


;==============================================
;a0 = Winner Player Memory
;==============================================
loc_00ba66:
	tst.b (PL_cpucontrol,a0)
	bne.w loc_00baca
	move.l (pl_arcade_progress,a0),d2
	move.w #$ffff,($114,a5)
	bsr.w loc_00b8b6
	move.w ($114,a5),d0
	lea.l (-$707e,a5),a2

loc_00ba84:
	addq.w #1,d0
	move.b (a2,d0.w),d1
	cmp.w ($14c,a5),d0
	bcc.b loc_00ba94
	btst.l d1,d2
	bne.b loc_00ba84

loc_00ba94:
	move.w d0,($114,a5)
	cmp.w ($14c,a5),d0
	bhi.b loc_00baca
	tst.w ($138,a5)
	beq.b loc_00bab4
	lea.l (p2memory,a5),a1
	btst.b #0,($ac,a5)
	bne.b loc_00bab4
	lea.l (p1memory,a5),a1

loc_00bab4:
	move.b d1,($102,a1)
	lea.l (-$705e,a5),a2
	move.b (a2,d0.w),($132,a1)
	move.b ($102,a1),d0
	bra.w loc_00b7f2

loc_00baca:
	rts

;==============================================
loc_00bacc:
	btst.b #1,($101,a0)
	bne.w loc_00bb28
	move.l ($540,a5),d2
	or.l ($940,a5),d2
	move.l d2,($540,a5)
	move.l d2,($940,a5)
	move.w #$ffff,($114,a5)
	bsr.w loc_00b9de
	move.w ($114,a5),d0
	lea.l (-$707e,a5),a2

loc_00baf8
	addq.w #1,d0
	move.b (a2,d0.w),d1
	cmp.w ($14c,a5),d0
	bcc.b loc_00bb08
	btst.l d1,d2
	bne.b loc_00baf8

loc_00bb08:
	move.w d0,($114,a5)
	cmp.w ($14c,a5),d0
	bhi.b loc_00bb28
	move.b d1,($102,a1)
	lea.l (-$705e,a5),a2
	move.b (a2,d0.w),($132,a1)
	move.b ($d02,a5),d0
	bra.w loc_00b7f2

loc_00bb28:
	rts

;==============================================
loc_00bb2a:
	moveq #0,d6
	move.b ($137,a5),d6
	cmpi.b #8,d6
	bcs.b loc_00bb38
	moveq #8,d6

loc_00bb38:
	lsl.w #2,d6
	move.w loc_00bb44(pc,d6.w),d2
	move.w loc_00bb44+2(pc,d6.w),d6
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00bb44:
	dc.w $012c,$0300,$012c,$0300,$0190,$0400,$01f4,$0500
	dc.w $0258,$0600,$02bc,$0700,$0320,$0800,$0384,$0900
	dc.w $03e8,$1000

;==============================================
loc_00bb68:
	ext.w d0
	move.b loc_00bb70(pc,d0.w),d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00bb70:
	dc.b $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0a,$0b,$0c,$0d,$0e,$0f
	dc.b $10,$11,$00,$11,$00,$15,$16,$00,$18,$19,$1a,$1b,$1c,$1d,$1e,$1f

;==============================================
loc_00bb90:
	ext.w d0
	move.b loc_00bba8(pc,d0.w),d0
	cmpi.w #8,(Region,a5)
	bne.b loc_00bba6
	cmpi.b #$18,d0
	bne.b loc_00bba6
	moveq #$c,d0

loc_00bba6:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00bba8:
	dc.b $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$15,$0b,$0c,$0d,$0e,$0f
	dc.b $10,$11,$00,$11,$00,$15,$16,$00,$18,$19,$1a,$1b,$1c,$1d,$15,$15

;==============================================
loc_00bbc8:
	ext.w d0
	move.b loc_00bbd0(pc,d0.w),d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00bbd0:
	dc.b $00,$01,$02,$03,$04,$05,$06,$07,$08,$09,$0a,$0b,$0c,$0d,$0e,$0f
	dc.b $10,$11,$00,$11,$00,$15,$16,$00,$18,$19,$1a,$1b,$1c,$1d,$1e,$1f

;==============================================
loc_00bbf0:
	lea.l (p1memory,a5),a0
	bsr.b loc_00bc06
	lea.l (p2memory,a5),a0
	bsr.b loc_00bc06
	lea.l (p3memory,a5),a0
	bsr.b loc_00bc06
	lea.l (p4memory,a5),a0

loc_00bc06:
	move.b ($132,a0),($123,a0)
	moveq #0,d0
	move.b ($102,a0),d0
	tst.b ($168,a5)
	beq.b loc_00bc26
	btst.b #1,($101,a0)
	beq.b loc_00bc4a
	addi.w #$40,d0
	bra.b loc_00bc4a

loc_00bc26:
	tst.b ($15d,a5)
	beq.b loc_00bc38
	tst.b ($125,a0)
	beq.b loc_00bc4a
	addi.w #$40,d0
	bra.b loc_00bc4a

loc_00bc38:
	btst.b #1,($101,a0)
	bne.b loc_00bc46
	tst.b ($125,a0)
	beq.b loc_00bc4a

loc_00bc46:
	addi.w #$20,d0

loc_00bc4a:
	move.b loc_00bc56(pc,d0.w),d0
	beq.b loc_00bc54
	move.b d0,($123,a0)

loc_00bc54:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00bc56:
	dc.b $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$02,$02
	dc.b $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$02,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$02,$00,$00,$00,$00,$00,$00,$02,$00,$02,$02

;==============================================
loc_00bcb6:
	move.w #0,($22,a5)
	move.w #$100,($24,a5)
	move.w #0,($26,a5)
	move.w #$300,($28,a5)
	move.w #0,($2a,a5)
	move.w #$700,($2c,a5)
	move.w #$1b0e,($32,a5)
	move.w #$2461,($3a,a5)
	move.w #Mainpalette,(palrampointer,a5)
	moveq #$f,d0
	moveq #0,d1
	lea.l $900000,a1
	jsr loc_01ba92
	move.w #$86,d0
	lea.l $904000,a1
	jsr loc_018f20
	move.w #$87,d0
	lea.l $904400,a1
	jsr loc_018f20
	move.w #$81,d0
	lea.l $908000,a1
	jsr loc_0190d2
	move.w #$82,d0
	lea.l $908100,a1
	jmp loc_0190d2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
SurvivalModeList:
	dc.b $01,$03,$1a,$0f,$08,$04,$18,$0d,$07,$06,$1b,$10,$1e,$05
	dc.b $1d,$0c,$16,$09,$0e,$19,$00,$11,$02,$15,$1c,$0b,$0a,$00

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00bd58:
	dc.w $ff00,$01ff,$0001,$ff00,$01ff,$0001,$0000,$01ff
	dc.w $0001,$ff00,$01ff,$0000,$0000,$0000,$01ff,$0001
	dc.w $ff00,$01ff,$0001,$ff00,$00ff,$0001,$ff00,$01ff
	dc.w $0001,$ff00,$0000,$0000,$0001,$ff00,$01ff,$0001
	dc.w $ff00,$01ff,$0001,$ff00,$01ff,$0001,$ff00,$0100
	dc.w $0000,$0000,$0100,$ff01,$00ff,$0100,$ff01,$00ff
	dc.w $0000,$ff01,$00ff,$0100,$ff01,$0000,$0000,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00bdc8:
	dc.w $00d6,$00cc,$00c2,$00b8,$00ae,$00a4,$00a4,$009a,$009a
	dc.w $0090,$0090,$0086,$0086,$007c,$007c,$0072,$0072,$0068
	dc.w $0068,$005e,$005e,$0054,$0054,$004a,$004a,$0040,$0036

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00bdfe:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0505,$0505,$0505,$0505,$0505,$0505,$0505,$0505
	dc.w $0505,$0505,$1010,$1010,$1010,$1010,$1010,$1010,$1010
	dc.w $1010,$1010,$1010,$1515,$1515,$1515,$1515,$1515,$1515
	dc.w $1515,$1515,$1515,$1515,$2020,$2020,$2020,$2020,$2020
	dc.w $2020,$2020,$2020,$2020,$2020,$2525,$2525,$2525,$2525
	dc.w $2525,$2525,$2525,$2525,$2525,$2525,$3030,$3030,$3030
	dc.w $3030,$3030,$3030,$3030,$3030,$3030,$3030,$3535,$3535
	dc.w $3535,$3535,$3535,$3535,$3535,$3535,$3535,$3535,$4040
	dc.w $4040,$4040,$4040,$4040,$4040,$4040,$4040,$4040,$4040
	dc.w $4545,$4545,$4545,$4545,$4545,$4545,$4545,$4545,$4545
	dc.w $4545,$5050,$5050,$5050,$5050,$5050,$5050,$5050,$5050
	dc.w $5050,$5050,$5555,$5555,$5555,$5555,$5555,$5555,$5555
	dc.w $5555,$5555,$5555,$6060,$6060,$6060,$6060,$6060,$6060
	dc.w $6060,$6060,$6060,$6060

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00bf02:
	dc.w $0005,$1000,$0000,$0010,$3030,$1020,$3000,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00bf12:
	dc.w $1000,$0203,$0405,$0607,$0809,$1011,$1213,$1415

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00bf22:
	dc.w $0100,$0002,$0000,$0100,$0002,$0005,$0401
	dc.w $0000,$0200,$0001,$0000,$0301,$0104,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00bf3e:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0101,$0101,$0101,$0101,$0101,$0101,$0101,$0101
	dc.w $0000,$0000,$0000,$0000,$0101,$0101,$0101,$0101
	dc.w $0202,$0202,$0202,$0202,$0303,$0303,$0303,$0303
	dc.w $0000,$0001,$0101,$0101,$0202,$0202,$0303,$0303
	dc.w $0404,$0404,$0505,$0505,$0606,$0606,$0707,$0707
	dc.w $0000,$0101,$0202,$0303,$0404,$0505,$0606,$0707
	dc.w $0808,$0909,$1010,$1111,$1212,$1313,$1414,$1515
	dc.w $0001,$0203,$0405,$0607,$0809,$1011,$1213,$1415
	dc.w $1617,$1819,$2021,$2223,$2425,$2627,$2829,$3031
	dc.w $0000,$0000,$0000,$0000,$0101,$0101,$0101,$0101
	dc.w $0202,$0202,$0202,$0202,$0505,$0505,$1010,$1530

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00bffe:
	dc.w $ff00,$0100,$01ff,$0100,$0000,$ff00,$ff00,$0100
	dc.w $0101,$0000,$0000,$ff01,$0100,$ff01,$0000,$0000
	dc.w $00ff,$0100,$01ff,$0000,$0001,$0001,$ff00,$00ff
	dc.w $0000,$0001,$01ff,$0001,$00ff,$0000,$0001,$0100
	dc.w $ff00,$01ff,$0000,$0001,$0101,$ff00,$00ff,$0000
	dc.w $0001,$0101,$00ff,$00ff,$0000,$01ff,$0001,$0001
	dc.w $ff00,$0000,$01ff,$0100,$0001,$ff00,$0000,$0100
	dc.w $0001,$ff00,$ff01,$0000,$0100,$0100,$01ff,$00ff
	dc.w $0000,$0101,$ff00,$0001,$ff00,$0000,$0101,$0000
	dc.w $ff01,$0001,$0000,$0101,$00ff,$0001,$ff00,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00c09e:
	dc.w $0040,$00e0,$0180,$0220,$02c0,$0360,$0400,$04a0
	dc.w $0540,$05e0,$0680,$0720,$07c0,$0860,$0900,$09a0
	dc.w $0a40,$0ae0,$02c0,$0ae0,$0400,$0680,$0b80,$0040
	dc.w $0c20,$0cc0,$0d60,$0e00,$0ea0,$0f40,$0680,$0680
	dc.w $0705,$0c18,$090f,$020b,$010a,$0f10,$160d,$0903
	dc.w $060b,$010a,$0407,$100c,$0902,$0e0b,$010a,$161a
	dc.w $181c,$0908,$110b,$010a,$051c,$0706,$091a,$0b02
	dc.w $010a,$190c,$0d1b,$091c,$0b1d,$010a,$1a04,$0e08
	dc.w $090b,$1003,$010a,$1118,$061d,$090b,$1619,$010a
	dc.w $1c0f,$0302,$0905,$1d10,$010a,$1b0d,$0516,$091d
	dc.w $041c,$010a,$181d,$1a10,$090e,$1905,$010a,$0806
	dc.w $0411,$0907,$0d1b,$010a,$0c1b,$020f,$091d,$1a18
	dc.w $010a,$0d0e,$0819,$0916,$030f,$010a,$0611,$1904
	dc.w $091b,$1802,$010a,$0308,$110e,$090c,$070d,$010a
	dc.w $061c,$0b07,$1d16,$0503,$0d0a,$1802,$0c16,$1d1a
	dc.w $0908,$0d0a,$1004,$0e1a,$1d18,$0f19,$0d0a,$1607
	dc.w $1018,$1d06,$111b,$0d0a,$1a0b,$1606,$1d10,$031c
	dc.w $0d0a,$0e0c,$1a05,$1d03,$0802,$0d0a,$0c0e,$1809
	dc.w $1d08,$1904,$0d0a,$0b10,$060f,$1d19,$1b07,$0d0a
	dc.w $0216,$0511,$1d1b,$1c0b,$0d0a,$041a,$0903,$1d1c
	dc.w $020c,$0d0a,$0718,$0f08,$1d02,$040e,$0d0a,$1b06
	dc.w $1119,$1d04,$0710,$0d0a,$1c05,$031b,$1d07,$0b16
	dc.w $0d0a,$1909,$081c,$1d0b,$0c1a,$0d0a,$080f,$1902
	dc.w $1d0c,$0e18,$0d0a,$0311,$1b04,$1d0e,$1006,$0d0a
	dc.w $1a03,$101b,$050d,$0e00,$070a,$1b08,$1a10,$050f
	dc.w $0c11,$070a,$1006,$090c,$051b,$0818,$070a,$0e0c
	dc.w $1603,$051a,$0619,$070a,$0c00,$1906,$0510,$031c
	dc.w $070a,$0618,$1108,$050e,$0016,$070a,$0819,$010e
	dc.w $050c,$111d,$070a,$0311,$001a,$0508,$1801,$070a
	dc.w $001d,$180f,$0506,$1904,$070a,$1116,$1d0b,$0503
	dc.w $1c09,$070a,$1801,$1c1d,$0511,$160b,$070a,$1c09
	dc.w $0b04,$0519,$1d0d,$070a,$190b,$041c,$0516,$010f

;c29e
	dc.w $070a,$160d,$0f18,$0501,$041b,$070a,$1d04,$1b00
	dc.w $050d,$091a,$070a,$040f,$0e0d,$0509,$0b10,$070a
	dc.w $0f07,$1d10,$1605,$0d06,$0e0a,$1118,$010f,$1609
	dc.w $0c07,$0e0a,$0d1a,$050c,$160b,$1108,$0e0a,$0c1c
	dc.w $0b0d,$1610,$0f18,$0e0a,$0200,$0f11,$160d,$0619
	dc.w $0e0a,$0102,$110b,$160c,$071a,$0e0a,$0009,$0d05
	dc.w $1611,$081b,$0e0a,$1d10,$0c00,$160f,$181c,$0e0a
	dc.w $1c0b,$101a,$1606,$191d,$0e0a,$1b01,$091c,$1608
	dc.w $1a00,$0e0a,$1a05,$0218,$1619,$1b01,$0e0a,$191d
	dc.w $0007,$161b,$1c02,$0e0a,$181b,$1c06,$1601,$1d05
	dc.w $0e0a,$0719,$1a08,$161d,$0009,$0e0a,$0608,$1819
	dc.w $1602,$010b,$0e0a,$0806,$071b,$1609,$0210,$0e0a
	dc.w $0f02,$190d,$0806,$0c1d,$160a,$1000,$1811,$080b
	dc.w $0e1c,$160a,$0b1d,$0109,$0810,$071b,$160a,$061c
	dc.w $0d02,$080f,$051a,$160a,$001b,$1106,$080c,$1d19
	dc.w $160a,$021a,$090b,$080e,$1c18,$160a,$0919,$0210
	dc.w $0807,$1b01,$160a,$1118,$000f,$0805,$1a0d,$160a
	dc.w $0d01,$0605,$0800,$1911,$160a,$010d,$0b0c,$081d
	dc.w $1809,$160a,$1811,$100e,$081c,$0102,$160a,$1a09
	dc.w $0f07,$081b,$0d00,$160a,$190f,$0c1d,$081a,$1106
	dc.w $160a,$1b06,$0e1c,$0819,$090b,$160a,$1c0b,$071b
	dc.w $0818,$0210,$160a,$1d10,$051a,$0801,$000f,$160a
	dc.w $030c,$1900,$011c,$110b,$090a,$040d,$0008,$010e
	dc.w $070b,$090a,$0703,$0806,$010f,$040b,$090a,$1107
	dc.w $061a,$0110,$030b,$090a,$101a,$181c,$0111,$0b1d
	dc.w $090a,$0f1d,$1a0e,$0103,$0b1b,$090a,$0e1b,$1c0f
	dc.w $010b,$0c19,$090a,$1c19,$0e10,$010b,$0d00,$090a
	dc.w $1a00,$0f11,$0104,$1d08,$090a,$1808,$1003,$0107
	dc.w $1b06,$090a,$061c,$1104,$010c,$1918,$090a,$0818
	dc.w $0307,$010d,$001a,$090a,$0006,$040c,$0118,$081c
	dc.w $090a,$1b10,$070d,$011d,$060e,$090a,$190e,$0c1d
	dc.w $011b,$180f,$090a,$1d0f,$0d1b,$0119,$1a10,$090a

;c49e
	dc.w $0108,$181d,$0e07,$1610,$040a,$0209,$1a18,$0e03
	dc.w $1119,$040a,$1c0b,$100d,$0e02,$0f0c,$040a,$030d
	dc.w $190b,$0e1c,$001b,$040a,$081d,$0c09,$0e01,$051a
	dc.w $040a,$0718,$1b08,$0e16,$101d,$040a,$091a,$1d07
	dc.w $0e11,$1918,$040a,$0b1b,$0103,$0e0f,$0c0d,$040a
	dc.w $180c,$1c02,$0e00,$1b0b,$040a,$1d19,$0d1c,$0e05
	dc.w $1a09,$040a,$0d10,$0b01,$0e18,$1d08,$040a,$1a05
	dc.w $0916,$0e10,$1807,$040a,$0c0f,$0811,$0e19,$0d03
	dc.w $040a,$1b00,$070f,$0e0c,$0b02,$040a,$1911,$0300
	dc.w $0e1b,$091c,$040a,$1016,$0205,$0e1a,$0801,$040a
	dc.w $1b19,$000d,$1d03,$0c02,$110a,$160e,$0103,$1d1b
	dc.w $0604,$110a,$0f0b,$1a1b,$1d16,$1005,$110a,$0301
	dc.w $0816,$1d0f,$0018,$110a,$081a,$0d0f,$1d0c,$021c
	dc.w $110a,$0d08,$030c,$1d06,$0419,$110a,$1a0d,$1b06
	dc.w $1d10,$050e,$110a,$0103,$1610,$1d00,$180b,$110a
	dc.w $0e1b,$0f19,$1d0b,$1c01,$110a,$0b16,$0c0e,$1d02
	dc.w $191a,$110a,$190f,$0602,$1d1c,$0e08,$110a,$050c
	dc.w $0204,$1d19,$0b0d,$110a,$1806,$0405,$1d0e,$0103
	dc.w $110a,$1c10,$0518,$1d00,$1a1b,$110a,$0400,$181c
	dc.w $1d1a,$0816,$110a,$0205,$1c10,$1d08,$0d0f,$110a
	dc.w $0711,$060c,$1809,$1c16,$190a,$0500,$030d,$1804
	dc.w $1c16,$190a,$0402,$1d1b,$181c,$0016,$190a,$0906
	dc.w $0c1a,$181c,$0216,$190a,$0b03,$0d10,$1805,$0616
	dc.w $190a,$011d,$1b0b,$1807,$0316,$190a,$100c,$1a01
	dc.w $180e,$1d16,$190a,$1a0d,$1009,$180f,$0c16,$190a
	dc.w $1b1a,$0b04,$1811,$161c,$190a,$0d1b,$0105,$1800
	dc.w $161c,$190a,$0c10,$0907,$1816,$0d1c,$190a,$1d0b
	dc.w $040e,$1816,$1b1c,$190a,$0601,$050f,$1802,$1a1c
	dc.w $190a,$0309,$0711,$1806,$101c,$190a,$0204,$0e00
	dc.w $1803,$0b1c,$190a,$0005,$0f02,$181d,$011c,$190a
	dc.w $0f08,$1618,$070e,$0c04,$1c0a,$1905,$1b00,$0710
	dc.w $0816,$1c0a,$1102,$1a01,$0719,$051b,$1c0a,$1000

;c69e
	dc.w $1d03,$0711,$021a,$1c0a,$0b04,$1806,$070f,$001d
	dc.w $1c0a,$0e16,$0d0b,$070c,$0418,$1c0a,$031b,$010e
	dc.w $0708,$160d,$1c0a,$061a,$0310,$0705,$1b01,$1c0a
	dc.w $0d1d,$0619,$0702,$1a03,$1c0a,$180d,$0b11,$0700
	dc.w $1d06,$1c0a,$0103,$0e0f,$070d,$180b,$1c0a,$1d18
	dc.w $100c,$0704,$0d0e,$1c0a,$1b06,$1908,$0716,$0110
	dc.w $1c0a,$1a01,$1105,$071b,$0319,$1c0a,$040e,$0f02
	dc.w $071a,$0611,$1c0a,$1610,$0c04,$071d,$0b0f,$1c0a
	dc.w $180e,$0f11,$0208,$0c04,$0b00,$1a0f,$0c19,$021c
	dc.w $1003,$0b00,$0f0c,$101a,$0205,$1109,$0b00,$1910
	dc.w $1118,$0206,$0416,$0b00,$1011,$191b,$0207,$0301
	dc.w $0b00,$0c19,$1a1d,$020d,$0908,$0b00,$111a,$1816
	dc.w $0204,$191c,$0b00,$0e18,$1b01,$0203,$1a05,$0b00
	dc.w $0d1b,$1608,$0209,$1806,$0b00,$071d,$011c,$0204
	dc.w $0309,$0b00,$0616,$0805,$0209,$0403,$0b00,$0501
	dc.w $1c06,$0203,$0904,$0b00,$1c08,$051d,$020e,$1b07
	dc.w $0b00,$081c,$0607,$020f,$1d0d,$0b00,$0105,$070d
	dc.w $020c,$160e,$0b00,$1606,$0d0e,$0210,$010f,$0b00
	dc.w $0e01,$1110,$0c03,$0605,$000a,$0902,$160f,$0c04
	dc.w $0705,$000a,$0703,$1c19,$0c08,$0905,$000a,$0604
	dc.w $1d18,$0c0d,$0e05,$000a,$1b08,$0601,$0c1a,$0510
	dc.w $000a,$1a0d,$0702,$0c1b,$050f,$000a,$0d10,$0903
	dc.w $0c05,$1119,$000a,$080f,$0e04,$0c05,$1618,$000a
	dc.w $0419,$1108,$0c06,$1c01,$000a,$0318,$160d,$0c07
	dc.w $1d02,$000a,$021b,$1c1a,$0c09,$1003,$000a,$011a
	dc.w $1d1b,$0c0e,$0f04,$000a,$181d,$1006,$0c11,$1908
	dc.w $000a,$191c,$0f07,$0c16,$180d,$000a,$0f16,$1909
	dc.w $0c1c,$011a,$000a,$1011,$180e,$0c1d,$021b,$000a
	dc.w $0816,$060d,$041b,$051d,$0b0a,$0719,$0d10,$041a
	dc.w $061d,$0b0a,$050d,$0711,$0400,$1d16,$0b0a,$0d18
	dc.w $0816,$041d,$0719,$0b0a,$0d1c,$0919,$041d,$0818
	dc.w $0b0a,$020d,$0e18,$0401,$1d1c,$0b0a,$031b,$0d1c

;c89e
	dc.w $0402,$091d,$0b0a,$011a,$0f0d,$0403,$0e1d,$0b0a
	dc.w $1a00,$110d,$0405,$0f1b,$0b0a,$0001,$0d1b,$0406
	dc.w $101a,$0b0a,$1b0d,$101a,$0407,$1100,$0b0a,$0d02
	dc.w $1c00,$0408,$1601,$0b0a,$1803,$1b01,$0409,$191d
	dc.w $0b0a,$1c05,$1602,$040e,$181d,$0b0a,$1911,$1803
	dc.w $040f,$1d02,$0b0a,$1606,$1905,$041d,$1c03,$0b0a
	dc.w $191a,$0b1d,$180c,$0516,$000a,$0f10,$1b1d,$1806
	dc.w $1101,$000a,$1c19,$051d,$180f,$0304,$000a,$1a09
	dc.w $021d,$181b,$110c,$000a,$1b05,$1d0e,$1804,$0607
	dc.w $000a,$101c,$1d02,$180e,$1611,$000a,$0406,$1d1a
	dc.w $1803,$0c05,$000a,$0802,$1d1c,$1801,$0409,$000a
	dc.w $111d,$190f,$181a,$0710,$000a,$091d,$0816,$180c
	dc.w $1b03,$000a,$1b1d,$070c,$181c,$040b,$000a,$031d
	dc.w $0e05,$1816,$1906,$000a,$1d03,$0609,$1808,$0b0f
	dc.w $000a,$1d08,$0204,$1807,$1a09,$000a,$1d07,$0f1b
	dc.w $1802,$081c,$000a,$1d01,$0419,$180b,$160e,$000a
	dc.w $0400,$1811,$060b,$0507,$1b0a,$0109,$0219,$0608
	dc.w $0703,$1b0a,$0008,$1102,$0607,$0316,$1b0a,$1c01
	dc.w $1d0f,$0609,$0807,$1b0a,$0804,$001a,$0619,$071d
	dc.w $1b0a,$0d11,$1c0c,$0618,$1610,$1b0a,$0910,$0c07
	dc.w $061a,$0119,$1b0a,$0f05,$1a0b,$0600,$1004,$1b0a
	dc.w $1108,$190d,$0616,$1c02,$1b0a,$191d,$0418,$0603
	dc.w $0c09,$1b0a,$101c,$1619,$0605,$010f,$1b0a,$190b
	dc.w $0d03,$060f,$0011,$1b0a,$0216,$081a,$061d,$0418
	dc.w $1b0a,$0c05,$0709,$0610,$0d1c,$1b0a,$1d0d,$0b03
	dc.w $0605,$1901,$1b0a,$0318,$0f0b,$060c,$0211,$1b0a
	dc.w $1d1c,$0703,$0900,$020b,$080a,$101d,$0319,$090d
	dc.w $0b11,$080a,$0616,$1d1b,$090b,$0c0e,$080a,$0d07
	dc.w $001d,$0906,$1c02,$080a,$051a,$010c,$0918,$0e10
	dc.w $080a,$0103,$160d,$090e,$1104,$080a,$1b05,$1906
	dc.w $0902,$040c,$080a,$0c1c,$0b0e,$0901,$001d,$080a
	dc.w $1904,$1802,$0911,$0d1b,$080a,$030e,$0605,$091c

;ca9e
	dc.w $0716,$080a,$1a06,$0216,$091b,$1000,$080a,$0401
	dc.w $1a11,$090b,$1b19,$080a,$0e1b,$071c,$0910,$050d
	dc.w $080a,$1116,$0c01,$0900,$1a18,$080a,$1819,$1110
	dc.w $0916,$0b1a,$080a,$0702,$0006,$0903,$0c05,$080a
	dc.w $011d,$0507,$0e1b,$0600,$040a,$0f02,$180b,$0e05
	dc.w $0d16,$040a,$1a03,$0111,$0e1c,$0009,$040a,$0c1b
	dc.w $1d06,$0e0b,$1605,$040a,$081a,$1b02,$0e00,$180d
	dc.w $040a,$1b0c,$081d,$0e16,$050b,$040a,$0719,$0c01
	dc.w $0e11,$1a0f,$040a,$1802,$1603,$0e0d,$0908,$040a
	dc.w $060f,$050d,$0e01,$0702,$040a,$0716,$0900,$0e0c
	dc.w $191c,$040a,$1607,$0f18,$0e1d,$080c,$040a,$0503
	dc.w $061a,$0e11,$0119,$040a,$0b09,$001c,$0e02,$0f1b
	dc.w $040a,$110d,$1c19,$0e08,$1d03,$040a,$091a,$190c
	dc.w $0e18,$0711,$040a,$001c,$0f06,$0e0b,$0301,$040a
	dc.w $0109,$0e05,$0008,$0304,$020a,$0918,$1d0f,$0010
	dc.w $0504,$020a,$1601,$090e,$000d,$0704,$020a,$060f
	dc.w $160c,$000e,$0804,$020a,$181a,$011b,$0007,$041d
	dc.w $020a,$0e06,$101a,$001c,$040b,$020a,$0d10,$1b01
	dc.w $0004,$0b0f,$020a,$0316,$061c,$0004,$1908,$020a
	dc.w $190d,$0718,$000b,$0916,$020a,$051b,$0306,$0019
	dc.w $0110,$020a,$1b0c,$1c0b,$0003,$0e18,$020a,$0816
	dc.w $0f1a,$0006,$0d09,$020a,$0719,$0b16,$0005,$1d0e
	dc.w $020a,$0c1c,$1a0d,$0009,$0f1b,$020a,$1003,$1c1d
	dc.w $0018,$0c05,$020a,$1a18,$0c19,$001d,$0807,$020a
	dc.w $0005,$0b1a,$0f04,$030d,$1c0a,$080c,$1004,$0f1d
	dc.w $0d07,$1c0a,$0600,$031d,$0f0d,$1b0e,$1c0a,$0902
	dc.w $001b,$0f03,$0518,$1c0a,$0408,$1910,$0f1a,$0e00
	dc.w $1c0a,$1909,$0405,$0f07,$1d11,$1c0a,$0c06,$0b02
	dc.w $0f1a,$1108,$1c0a,$011b,$0307,$0f0e,$181a,$1c0a
	dc.w $050c,$090e,$0f08,$0604,$1c0a,$070b,$1d0d,$0f02
	dc.w $1019,$1c0a,$1a01,$1b09,$0f11,$0b1d,$1c0a,$180e
	dc.w $0d01,$0f1b,$0210,$1c0a,$0b18,$0c11,$0f07,$1902

;cc9e
	dc.w $1c0a,$0310,$1106,$0f19,$0105,$1c0a,$0e04,$0818
	dc.w $0f00,$0c09,$1c0a,$0d11,$190c,$0f06,$0901,$1c0a
	dc.w $0805,$1a11,$000c,$100b,$060a,$1902,$0805,$001b
	dc.w $0f01,$060a,$0711,$0310,$0008,$0b09,$060a,$160d
	dc.w $021a,$000c,$0111,$060a,$0e09,$0d02,$001a,$071c
	dc.w $060a,$0519,$1009,$0001,$0f1a,$060a,$1d10,$0203
	dc.w $000b,$1c05,$060a,$1116,$0519,$000d,$021d,$060a
	dc.w $1007,$1b01,$000f,$1a04,$060a,$0c0b,$160f,$0003
	dc.w $1107,$060a,$0d01,$0b0e,$001c,$0902,$060a,$0f0c
	dc.w $1d11,$0004,$1b10,$060a,$0116,$0304,$001d,$0819
	dc.w $060a,$091c,$0405,$000e,$161b,$060a,$1c04,$0f1d
	dc.w $0003,$0e08,$060a,$040d,$0c08,$0007,$0316,$060a
	dc.w $1d00,$0705,$0c0d,$1b11,$100a,$060f,$1c0d,$0c05
	dc.w $1a09,$100a,$181d,$0002,$0c11,$0306,$100a,$091c
	dc.w $0d0e,$0c1a,$0516,$100a,$0106,$1a00,$0c0f,$0b07
	dc.w $100a,$1c0f,$1d03,$0c09,$0005,$100a,$0401,$181b
	dc.w $0c16,$0b0e,$100a,$0f1a,$0305,$0c07,$1108,$100a
	dc.w $0e04,$011d,$0c0b,$0600,$100a,$0211,$0416,$0c08
	dc.w $0d0f,$100a,$1a07,$0b01,$0c1d,$0818,$100a,$030b
	dc.w $1618,$0c04,$0201,$100a,$0b09,$1b1c,$0c02,$0e0d
	dc.w $100a,$1603,$0508,$0c1c,$091d,$100a,$071b,$0e11
	dc.w $0c06,$1804,$100a,$1b08,$061a,$0c0d,$1c02,$100a
	dc.w $190e,$0b01,$1d04,$0218,$100a,$0f00,$0c1b,$1d16
	dc.w $031c,$100a,$0e19,$0803,$1d02,$040f,$100a,$1809
	dc.w $0002,$1d1c,$0c0b,$100a,$0401,$190d,$1d0f,$1b07
	dc.w $100a,$1606,$0319,$1d08,$0709,$100a,$1b02,$040d
	dc.w $1d07,$0c05,$100a,$0818,$0006,$1d19,$090e,$100a
	dc.w $0b16,$1b09,$1d06,$0511,$100a,$0c03,$1c07,$1d04
	dc.w $111b,$100a,$010b,$1800,$1d11,$0619,$100a,$0d07
	dc.w $0f16,$1d01,$080c,$100a,$091c,$0b11,$1d05,$0c06
	dc.w $100a,$0704,$020e,$1d00,$1603,$100a,$1c0f,$0318
	dc.w $1d08,$0716,$100a,$111b,$0805,$1d01,$1804,$100a

;ce9e
	dc.w $1d19,$1105,$080e,$0102,$070a,$1105,$0419,$0809
	dc.w $1006,$070a,$0011,$1c09,$080c,$0d1a,$070a,$0f1d
	dc.w $0c02,$0804,$0603,$070a,$1618,$000d,$0810,$0b0e
	dc.w $070a,$190c,$0118,$0806,$1a04,$070a,$0516,$091c
	dc.w $0811,$0319,$070a,$0c02,$1a00,$080e,$0509,$070a
	dc.w $091c,$0d16,$080b,$0111,$070a,$0b0f,$1d03,$0819
	dc.w $0e18,$070a,$100d,$1c02,$0803,$0e06,$070a,$0401
	dc.w $0310,$0816,$0205,$070a,$0100,$0f04,$0818,$060d
	dc.w $070a,$0d1a,$0b1d,$0806,$160f,$070a,$0304,$100f
	dc.w $0802,$1d09,$070a,$1a0b,$180e,$0800,$0c16,$070a
	dc.w $0902,$0618,$100d,$070b,$160a,$000f,$0206,$101a
	dc.w $030b,$160a,$0e00,$090d,$1004,$180b,$160a,$0607
	dc.w $0f00,$1019,$1a0b,$160a,$1d1a,$050f,$101b,$0b09
	dc.w $160a,$0c11,$0102,$1000,$0b19,$160a,$0106,$1d1b
	dc.w $100b,$0e04,$160a,$110d,$0705,$100b,$0400,$160a
	dc.w $050c,$031b,$1001,$0f02,$160a,$1802,$0c19,$1009
	dc.w $000f,$160a,$0d1d,$0e04,$1011,$0805,$160a,$0605
	dc.w $110c,$1008,$1d01,$160a,$0319,$1b1d,$100e,$041a
	dc.w $160a,$1b08,$0918,$100c,$0706,$160a,$1918,$1b05
	dc.w $1011,$1d0d,$160a,$040e,$081a,$1007,$0903,$160a
	dc.w $1804,$1c0c,$1903,$1101,$0d0a,$0e0b,$100c,$190f
	dc.w $0802,$0d0a,$051b,$060c,$1907,$1a00,$0d0a,$0900
	dc.w $1a0c,$191b,$0118,$0d0a,$1107,$0c06,$191c,$1809
	dc.w $0d0a,$030f,$0c16,$1902,$0b1a,$0d0a,$0f0c,$081a
	dc.w $1911,$0e16,$0d0a,$100c,$1b18,$190e,$0104,$0d0a
	dc.w $0c03,$0704,$1905,$180b,$0d0a,$0c16,$0005,$1911
	dc.w $031c,$0d0a,$1a04,$0e1c,$1901,$0f07,$0d0a,$0009
	dc.w $0c02,$1916,$0818,$0d0a,$1b03,$0509,$1910,$1611
	dc.w $0d0a,$1c0b,$041b,$1906,$0e10,$0d0a,$040c,$1107
	dc.w $191a,$0b01,$0d0a,$0610,$0308,$191b,$0902,$0d0a

;==============================================
loc_00d07e:
	clr.b ($160,a5)
	jsr loc_01c3ac
	beq.w loc_00d1b4
	addq.b #1,(a4)
	move.b #1,(2,a4)
	move.w #$39,($10,a4)
	move.w #$38,($14,a4)
	move.b #$10,($3a,a4)
	move.b #1,($3b,a4)
	tst.b ($d7,a5)
	bmi.b loc_00d116
	jsr RNGFunction
	tst.w ($92,a5)
	beq.b loc_00d0c4
	andi.w #$e,d0
	bra.b loc_00d0ec

loc_00d0c4:
	andi.w #$1e,d0
	btst #4,d0
	beq.b loc_00d0ec
	andi.w #$e,d0
	tst.b ($bf,a5)
	bne.b loc_00d0ec
	lea.l loc_00d194(pc),a1
	moveq #0,d1
	move.b ($133,a5),d1
	move.b (a1,d1.w),d1
	bmi.b loc_00d0ec
	add.w d1,d1
	move.w d1,d0

loc_00d0ec:
	lea.l loc_00d174(pc),a1
	move.w ($92,a5),d1
	add.w d1,d1
	movea.l (a1,d1.w),a1
	move.b ($132,a5),d1
	add.w d1,d1
	move.w (a1,d1.w),d1
	lea.l (a1,d1.w),a1
	move.w (a1,d0.w),d0
	lea.l (a1,d0.w),a1
	move.l a1,($36,a4)
	rts

loc_00d116:
	movea.l #loc_0dc9d4,a1
	adda.w (a1),a1
	move.l a1,($36,a4)
	move.b #1,($d7,a5)
	rts

;==============================================
loc_00d12a:
	clr.b ($160,a5)
	jsr loc_01c3ac
	beq.w loc_00d1b4
	move.l #$1000100,(a4)
	move.w #0,($10,a4)
	move.w #$58,($14,a4)
	move.b #0,($3a,a4)
	move.b #1,($3b,a4)
	lea.l loc_00d184(pc),a0
	move.w ($92,a5),d1
	add.w d1,d1
	movea.l (a0,d1.w),a0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	move.l a0,($36,a4)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00d174:
	dc.l EnglishWinQuotes,EnglishWinQuotes,EnglishWinQuotes,EnglishWinQuotes

loc_00d184:
	dc.l EnglishWinQuotes,loc_0d5c4c,loc_0d5c4c,loc_0d5c4c

loc_00d194:
	dc.b $08,$09,$0a,$0b,$0c,$0d,$0e,$0f,$10,$11,$12,$13,$14,$15,$16,$17
	dc.b $18,$19,$ff,$19,$ff,$12,$1a,$ff,$1b,$1c,$1d,$1e,$1f,$20,$12,$12

;==============================================
loc_00d1b4:
	rts

;==============================================
loc_00d1b6:
	tst.b ($bf,a5)
	bne.w loc_00d212
	tst.b ($141,a5)
	bne.w loc_00d212
	lea.l (p1memory,a5),a6
	lea.l (p2memory,a5),a1
	btst.b #0,($ac,a5)
	bne.b loc_00d1d8
	exg.l a1,a6

loc_00d1d8:
	tst.b ($15d,a5)
	beq.b loc_00d1ec
	cmpi.b #$1e,($102,a1)
	bne.w loc_00d212
	bra.w loc_00d220

loc_00d1ec:
	tst.b ($168,a5)
	bne.w loc_00d336
	cmpi.w #4,($114,a5)
	beq.w loc_00d342
	cmpi.w #8,($114,a5)
	beq.w loc_00d370
	cmpi.w #9,($114,a5)
	beq.w loc_00d274

loc_00d212:
	clr.b ($13f,a5)
	clr.b ($163,a5)
	clr.b ($178,a5)
	rts

;==============================================
loc_00d220:
	move.b #$e,($13f,a5)
	clr.b ($163,a5)
	clr.b ($178,a5)
	move.b #$1e,($d02,a5)
	move.b #$1f,($1102,a5)
	move.b #0,($d32,a5)
	move.b #0,($1132,a5)
	move.w #$2a,(stageid,a5)
	move.w #$2a,($174,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00d254:
	dc.w $ffff,$ffff,$1eff,$ffff,$151e,$ffff,$15ff,$151e
	dc.w $ffff,$ffff,$ffff,$1eff,$ff15,$15ff,$ff1e,$ffff

;==============================================
loc_00d274:
	move.b #$c,($13f,a5)
	clr.b ($163,a5)
	moveq #0,d0
	move.b ($102,a6),d0
	move.b loc_00d254(pc,d0.w),d1
	bpl.b loc_00d29c

loc_00d28a:
	btst.b #6,($149,a6)
	bne.w loc_00d334
	st.b ($178,a5)
	bra.w loc_00d334

loc_00d29c:
	move.l ($140,a6),d2
	btst.l d1,d2
	bne.b loc_00d28a
	move.b #4,($13f,a5)
	move.b #1,($163,a5)
	cmpi.b #$15,d1
	bne.b loc_00d2de
	st.b ($178,a5)
	move.w #$14,(stageid,a5)
	move.w #$14,($174,a5)
	btst.b #5,($149,a6)
	beq.b loc_00d320
	move.b d1,($102,a1)
	move.b #0,($132,a1)
	clr.b ($178,a5)
	bra.b loc_00d320

loc_00d2de:
	move.b #2,($13f,a5)
	cmpi.b #$1e,d1
	bne.w loc_00d212
	st.b ($178,a5)
	move.b #$1e,($d02,a5)
	move.b #$1f,($1102,a5)
	move.b #0,($d32,a5)
	move.b #0,($1132,a5)
	move.w #$2a,(stageid,a5)
	move.w #$2a,($174,a5)
	btst.b #5,($149,a6)
	beq.b loc_00d320
	clr.b ($178,a5)

loc_00d320:
	move.b ($102,a6),d0
	move.l #$2640f310,d1
	btst.l d0,d1
	beq.b loc_00d334
	move.b #$ff,($163,a5)

loc_00d334:
	rts

;==============================================
loc_00d336:
	move.b #6,($13f,a5)
	clr.b ($163,a5)
	rts

;==============================================
loc_00d342:
	move.b #8,($13f,a5)
	move.b #1,($163,a5)
	btst.b #1,($149,a6)
	bne.b loc_00d35a
	st.b ($178,a5)

loc_00d35a:
	move.b ($102,a6),d0
	move.l #$e76bfffb,d1
	btst.l d0,d1
	beq.b loc_00d36e
	move.b #$ff,($163,a5)

loc_00d36e:
	rts

;==============================================
loc_00d370:
	move.b #$a,($13f,a5)
	move.b #1,($163,a5)
	btst.b #3,($149,a6)
	bne.b loc_00d388
	st.b ($178,a5)

loc_00d388:
	move.b ($102,a6),d0
	move.l #$3f4afb9b,d1
	btst.l d0,d1
	beq.b loc_00d39c
	move.b #$ff,($163,a5)

loc_00d39c:
	rts

;==============================================
loc_00d39e:
	move.w ($14,a5),d0
	move.w loc_00d3aa(pc,d0.w),d1
	jmp loc_00d3aa(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00d3aa:
	dc.w loc_00d3b6-loc_00d3aa
	dc.w loc_00d42e-loc_00d3aa
	dc.w loc_00d43a-loc_00d3aa
	dc.w loc_00d4fa-loc_00d3aa
	dc.w loc_00d51e-loc_00d3aa
	dc.w loc_00d544-loc_00d3aa

;==============================================
loc_00d3b6:
	addq.w #2,($14,a5)
	move.w #$17,($16,a5)
	moveq #0,d0
	move.b d0,($145,a5)
	move.w #$ffff,($112,a5)
	lea.l (p1memory,a5),a6
	btst.b #0,($ac,a5)
	bne.b loc_00d3dc
	lea.l (p2memory,a5),a6

loc_00d3dc:
	jsr loc_01c2c8
	beq.b loc_00d42c
	move.l #$1001212,(a4)
	move.w ($156,a5),($36,a4)
	jsr loc_01c2c8
	beq.b loc_00d42c
	move.l #$1001212,(a4)
	move.w ($158,a5),($36,a4)
	jsr loc_01c2c8
	beq.b loc_00d42c
	move.l #$1000e06,(a4)
	move.w ($156,a5),($38,a4)
	jsr loc_01c2c8
	beq.b loc_00d42c
	move.l #$1000e06,(a4)
	move.w ($158,a5),($38,a4)

loc_00d42c:
	rts

;==============================================
loc_00d42e:
	subq.w #1,($16,a5)
	bpl.b loc_00d438
	addq.w #2,($14,a5)

loc_00d438:
	rts

;==============================================
loc_00d43a:
	jsr loc_00af22
	bne.w loc_00d54e
	addq.w #2,($14,a5)
	move.w #$e0,($16,a5)
	lea.l loc_00d6ea(pc),a3
	moveq #0,d0
	moveq #0,d3
	move.b ($146,a5),d0
	add.w d0,d0
	move.w (a3,d0.w),d1
	lea.l (a3,d1.w),a3
	move.b ($145,a5),d3
	move.w (a3,d3.w),d0
	move.w d0,($112,a5)
	beq.w loc_00d54e
	lea.l loc_00d61a(pc),a1
	move.w ($92,a5),d1
	add.w d1,d1
	movea.l (a1,d1.w),a1
	andi.w #$3ff,d0
	subq.w #1,d0
	add.w d0,d0
	move.w (a1,d0.w),d0
	lea.l (a1,d0.w),a1
	jsr loc_01c3ac
	beq.b loc_00d4f4
	move.l #$1000100,(a4)
	move.l a1,($36,a4)
	clr.b ($3a,a4)
	move.b #3,($3b,a4)
	tst.w ($92,a5)
	beq.b loc_00d4ba
	move.b #1,($3b,a4)

loc_00d4ba:
	move.w #$d8,($14,a4)
	move.w (a3,d3.w),d1
	bpl.b loc_00d4cc
	move.w #$58,($14,a4)

loc_00d4cc:
	lea.l (p1memory,a5),a6
	btst.b #0,($ac,a5)
	bne.b loc_00d4dc
	lea.l (p2memory,a5),a6

loc_00d4dc:
	move.w #$70,($10,a4)
	rol.w #1,d1
	add.b ($101,a6),d1
	btst #0,d1
	beq.b loc_00d4f4
	move.w #$10,($10,a4)

loc_00d4f4:
	addq.b #2,($145,a5)
	rts

;==============================================
loc_00d4fa:
	jsr loc_00af22
	bne.w loc_00d54e
	jsr loc_00af50
	bne.b loc_00d512
	subq.w #1,($16,a5)
	bpl.b loc_00d51c

loc_00d512:
	addq.w #2,($14,a5)
	move.b #1,($160,a5)

loc_00d51c:
	rts

;==============================================
loc_00d51e:
	jsr loc_00af22
	bne.w loc_00d54e
	jsr loc_00af50
	bne.b loc_00d536
	subq.w #1,($16,a5)
	bpl.b loc_00d542

loc_00d536:
	move.w #4,($14,a5)
	move.b #2,($160,a5)

loc_00d542:
	rts

;==============================================
loc_00d544:
	subq.w #1,($16,a5)
	bmi.w loc_00d56a
	rts

;==============================================
loc_00d54e:
	move.w #$a,($14,a5)
	move.w #$f,($16,a5)
	st.b ($145,a5)
	move.b #2,($160,a5)
	clr.w ($112,a5)
	rts

;==============================================
loc_00d56a:
	addq.w #2,($10,a5)
	moveq #0,d0
	move.l d0,($14,a5)
	move.b d0,($146,a5)
	move.w d0,($112,a5)
	move.b d0,($160,a5)
	rts

;==============================================
loc_00d582:
	move.b (7,a6),d0
	move.w loc_00d58e(pc,d0.w),d1
	jmp loc_00d58e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00d58e:
	dc.w loc_00d592-loc_00d58e
	dc.w loc_00d5a4-loc_00d58e

;==============================================
loc_00d592:
	addq.b #2,(7,a6)
	move.b #$30,($3a,a6)
	moveq #0,d0
	jmp loc_02a708

;==============================================
loc_00d5a4:
	subq.b #1,($3a,a6)
	bne.b loc_00d5b6
	move.l #$2000000,(4,a6)
	clr.b ($124,a6)

loc_00d5b6:
	jmp loc_02a7ea

;==============================================
loc_00d5bc:
	move.b (7,a6),d0
	move.w loc_00d5c8(pc,d0.w),d1
	jmp loc_00d5c8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00d5c8:
	dc.w loc_00d5cc-loc_00d5c8
	dc.w loc_00d600-loc_00d5c8

;==============================================
loc_00d5cc:
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($102,a6),d0
	move.b loc_00d5e0(pc,d0.w),d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00d5e0:
	dc.b $22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22
	dc.b $22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22,$22

;==============================================
loc_00d600:
	tst.b ($33,a6)
	bpl.b loc_00d5b6
	move.l #$2000000,(4,a6)
	clr.b ($124,a6)
	moveq #0,d0
	jmp loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00d61a:
	dc.l EnglishWinQuotes,loc_0cde08,loc_0cde08,loc_0cde08

loc_00d62a:
	dc.w $0004,$090c,$1015,$191d,$2228,$2e32,$363c,$4046
	dc.w $4c50,$ff50,$ff2e,$55ff,$5b60,$666c,$7074,$2e2e
	dc.w $0206,$0a0e,$1217,$1b1f,$242a,$3034,$383e,$4248
	dc.w $4e52,$ff52,$ff30,$57ff,$5d62,$686d,$7176,$3030
	dc.w $0308,$0b0f,$1418,$1c21,$272d,$3135,$3b3f,$454b
	dc.w $4f54,$ff54,$ff31,$5aff,$5f65,$6b6f,$7379,$3131

loc_00d68a:
	dc.w $0105,$ff0d,$1116,$1a1e,$2329,$2f33,$373d,$4147
	dc.w $4d51,$ff51,$ff2f,$56ff,$5c61,$67ff,$ff75,$2f2f
	dc.w $ff07,$ffff,$ffff,$ff20,$252b,$ffff,$39ff,$4349
	dc.w $ff53,$ff53,$ffff,$58ff,$5e63,$696e,$7277,$ffff

loc_00d6ca:
	dc.w $ffff,$ffff,$13ff,$ffff,$262c,$ffff,$3aff,$444a
	dc.w $ffff,$ffff,$ffff,$59ff,$ff64,$6aff,$ff78,$ffff

;Rival Battle Text IDs
	include "RivalTextID.asm"

	include "testmenu/testmenu.asm"
	include "bank/bank01.asm"

;==============================================
loc_020016:
	move.w (a1)+,d6
	add.w (a1)+,d5
	add.w d6,d7
	subq.b #1,d6

loc_02001e:
	move.w (a1)+,d2
	addi.w #$6c00,d2
	move.w (a1)+,d3
	move.w (a1)+,d0
	add.w d4,d0
	movem.w d0-d3,(a4)
	lea.l ($8,a4),a4
	dbra d6,loc_02001e
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_020038:
	dc.w loc_020080-loc_020038
	dc.w loc_02008a-loc_020038
	dc.w loc_020094-loc_020038
	dc.w loc_02009e-loc_020038
	dc.w loc_0200a8-loc_020038
	dc.w loc_0200c4-loc_020038
	dc.w loc_0200e0-loc_020038
	dc.w loc_0200fc-loc_020038

	dc.w loc_020118-loc_020038
	dc.w loc_020134-loc_020038
	dc.w loc_020150-loc_020038
	dc.w loc_02016c-loc_020038
	dc.w loc_020188-loc_020038
	dc.w loc_020192-loc_020038
	dc.w loc_02019c-loc_020038
	dc.w loc_0201a6-loc_020038

	dc.w loc_0201b0-loc_020038
	dc.w loc_0201ba-loc_020038
	dc.w loc_0201d6-loc_020038
	dc.w loc_0201f2-loc_020038
	dc.w loc_02020e-loc_020038
	dc.w loc_02022a-loc_020038
	dc.w loc_020246-loc_020038
	dc.w loc_020262-loc_020038

	dc.w loc_02027e-loc_020038
	dc.w loc_020288-loc_020038
	dc.w loc_020292-loc_020038
	dc.w loc_02029c-loc_020038
	dc.w loc_0202a6-loc_020038
	dc.w loc_0202b0-loc_020038
	dc.w loc_0202ba-loc_020038
	dc.w loc_0202c4-loc_020038

	dc.w loc_0202ce-loc_020038
	dc.w loc_0202d8-loc_020038
	dc.w loc_0202e2-loc_020038
	dc.w loc_0202ec-loc_020038

loc_020080:
	dc.w $0001,$0001,$0020,$001f,$0038

loc_02008a:
	dc.w $0001,$0005,$0b1b,$041f,$0008

loc_020094:
	dc.w $0001,$0004,$0adc,$031f,$0010

loc_02009e:
	dc.w $0001,$0006,$0aea,$051f,$0000

loc_0200a8:
	dc.w $0004,$0006,$0b90,$021f,$0000,$0b97,$001f
	dc.w $0030,$0b94,$001f,$0040,$0b9f,$001f,$0050

loc_0200c4:
	dc.w $0004,$0006,$0b90,$021f,$0000,$0b98,$001f
	dc.w $0030,$0b94,$001f,$0040,$0b9f,$001f,$0050

loc_0200e0:
	dc.w $0004,$0006,$0b90,$021f,$0000,$0b99,$001f
	dc.w $0030,$0b94,$001f,$0040,$0b9f,$001f,$0050

loc_0200fc:
	dc.w $0004,$0006,$0b90,$021f,$0000,$0b9a,$001f
	dc.w $0030,$0b94,$001f,$0040,$0b9f,$001f,$0050

loc_020118:
	dc.w $0004,$0006,$0b90,$021f,$0000,$0b9b,$001f
	dc.w $0030,$0b94,$001f,$0040,$0b9f,$001f,$0050

loc_020134:
	dc.w $0004,$0006,$0b90,$021f,$0000,$0b9c,$001f
	dc.w $0030,$0b94,$001f,$0040,$0b9f,$001f,$0050

loc_020150:
	dc.w $0004,$0006,$0b90,$021f,$0000,$0b9d,$001f
	dc.w $0030,$0b94,$001f,$0040,$0b9f,$001f,$0050

loc_02016c:
	dc.w $0004,$0006,$0b90,$021f,$0000,$0b9e,$001f
	dc.w $0030,$0b94,$001f,$0040,$0b9f,$001f,$0050

loc_020188:
	dc.w $0001,$0006,$0b15,$051f,$0000

loc_020192:
	dc.w $0001,$0006,$0b20,$051f,$0000

loc_02019c:
	dc.w $0001,$0005,$0af0,$041f,$0000

loc_0201a6:
	dc.w $0001,$0005,$0b10,$041f,$0008

loc_0201b0:
	dc.w $0001,$0006,$0b00,$051f,$0008

loc_0201ba:
	dc.w $0004,$0007,$0b00,$011f,$0000,$0b07,$001f
	dc.w $0020,$0b03,$011f,$0030,$0b0f,$001f,$0050

loc_0201d6:
	dc.w $0004,$0007,$0b00,$011f,$0000,$0b08,$001f
	dc.w $0020,$0b03,$011f,$0030,$0b0f,$001f,$0050

loc_0201f2:
	dc.w $0004,$0007,$0b00,$011f,$0000,$0b09,$001f
	dc.w $0020,$0b03,$011f,$0030,$0b0f,$001f,$0050

loc_02020e:
	dc.w $0004,$0007,$0b00,$011f,$0000,$0b0a,$001f
	dc.w $0020,$0b03,$011f,$0030,$0b0f,$001f,$0050

loc_02022a:
	dc.w $0004,$0007,$0b00,$011f,$0000,$0b0b,$001f
	dc.w $0020,$0b03,$011f,$0030,$0b0f,$001f,$0050

loc_020246:
	dc.w $0004,$0007,$0b00,$011f,$0000,$0b0c,$001f
	dc.w $0020,$0b03,$011f,$0030,$0b0f,$001f,$0050

loc_020262:
	dc.w $0004,$0007,$0b00,$011f,$0000,$0b0d,$001f
	dc.w $0020,$0b03,$011f,$0030,$0b0f,$001f,$0050

loc_02027e:
	dc.w $0001,$0006,$0a0a,$051f,$0000

loc_020288:
	dc.w $0001,$0006,$0a5a,$051f,$0000

loc_020292:
	dc.w $0001,$0006,$0a2a,$051f,$0000

loc_02029c:
	dc.w $0001,$0005,$0a3b,$041f,$0008

loc_0202a6:
	dc.w $0001,$0006,$0a4a,$051f,$0000

loc_0202b0:
	dc.w $0001,$0005,$0a1b,$041f,$0008

loc_0202ba:
	dc.w $0001,$0006,$0a6a,$051f,$0000

loc_0202c4:
	dc.w $0001,$0006,$0a7a,$051f,$0000

loc_0202ce:
	dc.w $0001,$0006,$0a74,$051f,$0000

loc_0202d8:
	dc.w $0001,$0006,$062a,$051f,$0004

loc_0202e2:
	dc.w $0001,$0005,$063a,$041f,$0008

loc_0202ec:
	dc.w $0001,$0006,$064a,$051f,$0000

;==============================================
loc_0202f6:
	moveq #0,d0
	move.b ($be,a5),d0
	add.w d0,d0
	lea.l loc_020866(pc),a0
	move.w (a0,d0.w),d0
	move.w d0,($12e,a5)
	lsl.w #3,d0
	move.w d0,(-$5d14,a5)
	move.w #$780,(-$5d12,a5)
	clr.w (-$5d10,a5)

loc_02031a:
	rts

;==============================================
loc_02031c:
	tst.w ($138,a5)
	bne.w loc_0203ac
	cmpi.b #3,($ac,a5)
	beq.b loc_02036a
	bsr.w loc_0204a4
	bsr.w loc_020560
	bsr.w loc_020458
	bra.w loc_02050c

;==============================================
loc_02033c:
	move.w #$780,(-$5d12,a5)
	tst.w ($138,a5)
	bne.w loc_0203ac
	cmpi.b #3,($ac,a5)
	beq.b loc_02036a
	moveq #$10,d0
	tst.b ($525,a5)
	bne.b loc_02035e
	move.b d0,($527,a5)

loc_02035e:
	tst.b ($925,a5)
	bne.b loc_020368
	move.b d0,($927,a5)

loc_020368:
	rts

loc_02036a:
	move.b #$10,($527,a5)
	move.b #$10,($927,a5)
	jsr RNGFunction
	andi.w #$000f,d0
	move.b loc_02039c(pc,d0.w),d1
	move.b ($526,a5),d0
	cmp.b ($926,a5),d0
	beq.b loc_02039a
	bcc.b loc_020396
	add.b d1,($527,a5)
	bra.b loc_02039a

loc_020396:
	add.b d1,($927,a5)

loc_02039a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02039c:
	dc.b $03,$04,$04,$04,$04,$04,$04,$05
	dc.b $03,$04,$04,$04,$04,$04,$04,$05

;==============================================
loc_0203ac:
	move.w ($138,a5),d0
	move.w loc_0203b8(pc,d0.w),d1
	jmp loc_0203b8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0203b8:
	dc.w loc_0203c0-loc_0203b8
	dc.w loc_0203c2-loc_0203b8
	dc.w loc_0203dc-loc_0203b8
	dc.w loc_0203f6-loc_0203b8

;==============================================
loc_0203c0:
	rts

;==============================================
loc_0203c2:
	move.b #$18,($527,a5)
	move.w (-$5d14,a5),d0
	lsr.w #3,d0
	andi.w #$1f,d0
	move.b d0,($d27,a5)
	move.b d0,($1127,a5)
	rts

;==============================================
loc_0203dc:
	move.b #$18,($927,a5)
	move.w (-$5d14,a5),d0
	lsr.w #3,d0
	andi.w #$1f,d0
	move.b d0,($d27,a5)
	move.b d0,($1127,a5)
	rts

;==============================================
loc_0203f6:
	move.b #8,($527,a5)
	move.b #8,($927,a5)
	move.b #$1f,($d27,a5)
	rts

;==============================================
loc_02040a:
	cmpi.b #3,($ac,a5)
	beq.b loc_020456
	lea.l (p1memory,a5),a0
	lea.l (p2memory,a5),a1
	btst.b #0,($ac,a5)
	bne.b loc_020424
	exg.l a0,a1

loc_020424:
	move.b ($15f,a0),($f1,a1)
	move.b ($15f,a1),($f1,a0)
	tst.w ($138,a5)
	beq.b loc_020442
	move.b ($15f,a0),($cf1,a5)
	move.b ($15f,a0),($10f1,a5)

loc_020442:
	bsr.w loc_020722
	bsr.w loc_020490
	bsr.w loc_020560
	bsr.w loc_020458
	bra.w loc_02050c

loc_020456:
	rts

;==============================================
loc_020458:
	move.w (-$5d14,a5),d0
	lsr.w #3,d0
	move.w d0,($12e,a5)
	rts

loc_020464:
	moveq #0,d0
	move.b ($be,a5),d0
	add.w d0,d0
	lea.l loc_0209fa(pc),a0
	move.w (a0,d0.w),d1
	sub.w d1,(-$5d14,a5)
	jsr RNGFunction
	andi.w #$3e,d0
	lea.l loc_020a0a(pc),a0
	move.w (a0,d0.w),d1
	sub.w d1,(-$5d14,a5)
	rts

;==============================================
loc_020490:
	subq.w #1,(-$5d12,a5)
	bne.b loc_0204a2
	move.w #$780,(-$5d12,a5)
	moveq #8,d0
	bra.w loc_02055c

loc_0204a2:
	rts

;==============================================
loc_0204a4:
	tst.w (-$5d10,a5)
	beq.b loc_0204b0
	subq.w #1,(-$5d10,a5)
	bra.b loc_02050a

loc_0204b0:
	moveq #0,d0
	move.b ($be,a5),d0
	lsl.w #5,d0
	lea.l loc_020876(pc),a0
	lea.l (a0,d0.w),a0
	move.w ($114,a5),d0
	tst.b ($15d,a5)
	beq.b loc_0204d2
	lea.l loc_020976(pc),a1
	move.b (a1,d0.w),d0

loc_0204d2:
	move.w d0,d1
	add.w d0,d0
	move.w (a0,d0.w),d6
	lsl.w #3,d6
	cmpi.b #4,($be,a5)
	bcc.b loc_020500
	cmp.w (-$5d14,a5),d6
	bcc.b loc_0204ee
	move.w d6,(-$5d14,a5)

loc_0204ee:
	cmpi.w #7,d1
	bcc.b loc_020500
	cmpi.w #2,d1
	beq.b loc_020500
	cmpi.w #5,d1
	bne.b loc_02050a

loc_020500:
	cmp.w (-$5d14,a5),d6
	bcs.b loc_02050a
	move.w d6,(-$5d14,a5)

loc_02050a:
	rts

;==============================================
loc_02050c:
	lea.l (p1memory,a5),a0
	bsr.b loc_020522
	lea.l (p2memory,a5),a0
	bsr.b loc_020522
	lea.l (p3memory,a5),a0
	bsr.b loc_020522
	lea.l (p4memory,a5),a0

loc_020522:
	tst.b ($125,a0)
	beq.b loc_02055a
	tst.b (a0)
	beq.b loc_02055a
	movea.w ($38,a0),a1
	moveq #$1f,d0
	tst.b ($f1,a1)
	bne.b loc_020556
	cmpi.w #6,($138,a5)
	beq.b loc_020556
	move.w ($12e,a5),d0
	cmpi.w #2,($138,a5)
	beq.b loc_020554
	cmpi.w #4,($138,a5)
	bne.b loc_020556

loc_020554:
	lsr.b #1,d0

loc_020556:
	move.b d0,($127,a0)

loc_02055a:
	rts

;==============================================
loc_02055c:
	add.w d0,(-$5d14,a5)

loc_020560:
	move.w (-$5d14,a5),d0
	bpl.b loc_02056c
	clr.w (-$5d14,a5)
	bra.b loc_020578

loc_02056c:
	cmpi.w #$100,d0
	bcs.b loc_020578
	move.w #$ff,(-$5d14,a5)

loc_020578:
	moveq #0,d0
	rts

;==============================================
loc_02057c:
	tst.w (Region,a5)
	bne.b loc_02058c
	bsr.w loc_02031c
	move.w #1,(-$5d10,a5)

loc_02058c:
	moveq #$48,d1
	move.b ($119,a6),d0
	cmpi.b #$10,d0
	bcc.b loc_0205a4
	ext.w d0
	add.w d0,d0
	lea.l loc_02099a(pc),a0
	move.w (a0,d0.w),d1

loc_0205a4:
	sub.w d1,(-$5d14,a5)
	jsr RNGFunction
	andi.w #$3e,d0
	lea.l loc_0209ba(pc),a0
	move.w (a0,d0.w),d0
	bsr.b loc_02055c
	bra.b loc_020560

;==============================================
loc_0205be:
	cmpi.b #3,($ac,a5)
	beq.w loc_02031a
	moveq #$10,d0
	cmpi.b #$50,(clock_counter,a5)
	bcc.b loc_0205f2
	moveq #6,d0
	cmpi.b #$3c,(clock_counter,a5)
	bcc.b loc_0205f2
	moveq #4,d0
	cmpi.b #$28,(clock_counter,a5)
	bcc.b loc_0205f2
	moveq #6,d0
	cmpi.b #$14,(clock_counter,a5)
	bcc.b loc_0205f2
	moveq #$a,d0

loc_0205f2:
	bsr.w loc_02055c
	move.w ($13a,a5),d1
	beq.b loc_020632
	movea.w d1,a4
	tst.b ($125,a4)
	bne.b loc_020632
	moveq #$10,d0
	cmpi.w #$70,($50,a4)
	bcc.b loc_02062e
	moveq #$a,d0
	cmpi.w #$50,($50,a4)
	bcc.b loc_02062e
	moveq #8,d0
	cmpi.w #$30,($50,a4)
	bcc.b loc_02062e
	moveq #0,d0
	cmpi.w #$10,($50,a4)
	bcc.b loc_02062e
	moveq #-8,d0

loc_02062e:
	bsr.w loc_02055c

loc_020632:
	tst.b ($10d,a5)
	beq.w loc_020650
	moveq #2,d0
	move.w ($13a,a5),d1
	beq.b loc_02064c
	movea.w d1,a4
	tst.b ($125,a4)
	beq.b loc_02064c
	moveq #-8,d0

loc_02064c:
	bsr.w loc_02055c

loc_020650:
	bsr.w loc_020464
	bsr.w loc_020560
	bra.w loc_020458

;==============================================
loc_02065c:
	cmpi.b #3,($ac,a5)
	beq.w loc_02031a
	tst.b ($125,a6)
	bne.w loc_02031a
	moveq #1,d0
	bra.w loc_02055c

loc_020674:
	cmpi.b #3,($ac,a5)
	beq.w loc_02031a
	tst.b ($125,a6)
	bne.w loc_02031a
	moveq #1,d0
	bra.w loc_02055c

loc_02068c:
	move.b #1,($216,a6)
	cmpi.b #3,($ac,a5)
	beq.w loc_02031a
	tst.b ($125,a6)
	bne.w loc_02031a
	moveq #2,d0
	add.b ($82,a6),d0
	bra.w loc_02055c

loc_0206ae:
	cmpi.b #3,($ac,a5)
	beq.w loc_02031a
	tst.b ($125,a6)
	bne.w loc_02031a
	moveq #3,d0
	bra.w loc_02055c

loc_0206c6:
	cmpi.b #3,($ac,a5)
	beq.w loc_02031a
	tst.b ($125,a6)
	beq.w loc_02031a
	cmpi.b #2,($5e,a6)
	bcs.w loc_02031a
	movea.w ($38,a6),a4
	cmpi.w #$200,(4,a4)
	bne.w loc_02031a
	cmpi.b #$c,(6,a4)
	beq.w loc_020704
	cmpi.b #$a,(6,a4)
	bne.w loc_02031a

loc_020704:
	moveq #1,d0
	bra.w loc_02055c

loc_02070a:
	cmpi.b #3,($ac,a5)
	beq.w loc_02031a
	tst.b ($125,a6)
	beq.w loc_02031a
	moveq #1,d0
	bra.w loc_02055c

;==============================================
loc_020722:
	lea.l (p1memory,a5),a6
	bsr.w loc_02072e
	lea.l (p2memory,a5),a6

loc_02072e:
	moveq #0,d1
	cmpi.b #$50,(clock_counter,a5)
	bcc.b loc_02074e
	moveq #2,d1
	cmpi.b #$3c,(clock_counter,a5)
	bcc.b loc_02074e
	moveq #4,d1
	cmpi.b #$28,(clock_counter,a5)
	bcc.b loc_02074e
	moveq #6,d1

loc_02074e:
	moveq #0,d2
	cmpi.w #$70,($50,a6)
	bcc.b loc_02076e
	moveq #2,d2
	cmpi.w #$48,($50,a6)
	bcc.b loc_02076e
	moveq #4,d2
	cmpi.w #$20,($50,a6)
	bcc.b loc_02076e
	moveq #6,d2

loc_02076e:
	cmp.w d1,d2
	bcc.b loc_020774
	move.w d1,d2

loc_020774:
	move.b d2,($205,a6)
	rts

;==============================================
loc_02077a:
	moveq #$40,d0
	cmpi.w #2,(Region,a5)
	beq.w loc_020844
	cmpi.w #4,(Region,a5)
	beq.w loc_020844
	cmpi.w #8,(Region,a5)
	beq.w loc_020844
	cmpi.w #$c,(Region,a5)
	beq.w loc_020844
	tst.w ($138,a5)
	bne.w loc_020844
	tst.b ($55f,a5)
	bne.w loc_020844
	tst.b ($95f,a5)
	bne.w loc_020844
	moveq #0,d0
	lea.l loc_020a4a(pc),a0
	move.b ($be,a5),d0
	lsl.w #6,d0
	lea.l (a0,d0.w),a0
	move.w ($102,a5),d1
	cmpi.w #3,d1
	bcs.b loc_0207d8
	moveq #3,d1

loc_0207d8:
	lsl.w #4,d1
	lea.l (a0,d1.w),a0
	move.w ($114,a5),d0
	tst.b ($15d,a5)
	beq.b loc_0207f2
	lea.l loc_020976(pc),a1
	move.b (a1,d0.w),d0
	bra.b loc_0207fa

loc_0207f2:
	cmpi.w #8,d0
	bcs.b loc_0207fa
	moveq #7,d0

loc_0207fa:
	add.w d0,d0
	lea.l (a0,d0.w),a0
	lea.l (-$5d0e,a5),a1
	moveq #$40,d0
	moveq #$1f,d6

loc_020808:
	move.b d0,(a1)+
	dbra d6,loc_020808
	lea.l (-$5d0e,a5),a1
	moveq #0,d0
	move.b (a0)+,d0
	beq.b loc_020822
	subq.b #1,d0
	moveq #0,d1

loc_02081c:
	move.b d1,(a1)+
	dbra d0,loc_02081c

loc_020822:
	moveq #0,d0
	move.b (a0)+,d0
	beq.b loc_020832
	subq.b #1,d0
	moveq #$20,d1

loc_02082c:
	move.b d1,(a1)+
	dbra d0,loc_02082c

loc_020832:
	jsr RNGFunction
	andi.w #$1f,d0
	lea.l (-$5d0e,a5),a0
	move.b (a0,d0.w),d0

loc_020844:
	tst.b ($525,a5)
	beq.b loc_02084e
	move.b d0,($613,a5)

loc_02084e:
	tst.b ($925,a5)
	beq.b loc_020858
	move.b d0,($a13,a5)

loc_020858:
	move.b #$40,($e13,a5)
	move.b #$40,($1213,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_020866:
	dc.w $0005,$0007,$0007,$0009,$000e,$0013,$0017,$001f

loc_020876:
	dc.w $0005,$0006,$000a,$0007,$0008,$000c,$000a,$000f
	dc.w $0010,$0010,$0010,$0010,$0010,$0010,$0010,$0010
	dc.w $0007,$0009,$000e,$000c,$000f,$0013,$0012,$0015
	dc.w $0016,$0016,$0016,$0016,$0016,$0016,$0016,$0016
	dc.w $0007,$0009,$000f,$000c,$000f,$0014,$0012,$0017
	dc.w $0018,$0018,$0018,$0018,$0018,$0018,$0018,$0018
	dc.w $0009,$000b,$0011,$000f,$0011,$0017,$0015,$001a
	dc.w $001b,$001b,$001b,$001b,$001b,$001b,$001b,$001b
	dc.w $000e,$0011,$0017,$0015,$0017,$001c,$001a,$001f
	dc.w $001f,$001f,$001f,$001f,$001f,$001f,$001f,$001f
	dc.w $0013,$0015,$0019,$0019,$001b,$001d,$001f,$001f
	dc.w $001f,$001f,$001f,$001f,$001f,$001f,$001f,$001f
	dc.w $0017,$0019,$001d,$001d,$001f,$001f,$001f,$001f
	dc.w $001f,$001f,$001f,$001f,$001f,$001f,$001f,$001f
	dc.w $001f,$001f,$001f,$001f,$001f,$001f,$001f,$001f
	dc.w $001f,$001f,$001f,$001f,$001f,$001f,$001f,$001f

loc_020976:
	dc.w $0000,$0001,$0102,$0203
	dc.w $0304,$0405,$0506,$0607
	dc.w $0707,$0707,$0707,$0707
	dc.w $0707,$0707,$0707,$0707
	dc.w $0707,$0707

loc_02099a:
	dc.w $0018,$0020,$0018,$0010,$0030,$0020,$0020,$0010
	dc.w $0030,$0040,$0030,$0030,$0030,$0030,$0030,$0030

loc_0209ba:
	dc.w $0008,$0008,$0008,$0008,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$fff8
	dc.w $fff8,$fff8,$fff8,$fff8,$fff8,$fff0,$fff0,$ffe8

loc_0209fa:
	dc.w $0018,$0010,$000c,$0008,$0006,$0004,$0002,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_020a0a:
	dc.w $0008,$0004,$0004,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$fffc,$fffc
	dc.w $fffc,$fffc,$fffc,$fffc,$fff8,$fff8,$fff8,$fff8

loc_020a4a:
	dc.w $2000,$2000,$2000,$2000,$2000,$2000,$2000,$2000
	dc.w $2000,$2000,$2000,$2000,$2000,$2000,$2000,$2000
	dc.w $2000,$2000,$1f01,$2000,$2000,$1e02,$2000,$1d03
	dc.w $2000,$2000,$1e02,$2000,$2000,$1d03,$2000,$1c04
	dc.w $2000,$1f01,$1708,$1e02,$1c04,$140a,$1906,$120b
	dc.w $1f01,$1e02,$1509,$1d03,$1b05,$120b,$1906,$100c
	dc.w $1f01,$1d03,$140a,$1c04,$1a06,$110c,$1906,$0f0d
	dc.w $1f01,$1c04,$120b,$1a05,$1807,$0f0d,$1906,$0e0e
	dc.w $2000,$1f01,$1708,$1e02,$1c04,$140a,$1906,$120b
	dc.w $1f01,$1e02,$1509,$1d03,$1b05,$120b,$1906,$100c
	dc.w $1f01,$1d03,$140a,$1c04,$1a06,$110c,$1906,$0f0d
	dc.w $1f01,$1c04,$120b,$1a05,$1807,$0f0d,$1906,$0e0e
	dc.w $2000,$1f01,$1708,$1e02,$1c04,$140a,$1906,$120b
	dc.w $1f01,$1e02,$1509,$1d03,$1b05,$120b,$1906,$100c
	dc.w $1f01,$1d03,$140a,$1c04,$1a06,$110c,$1906,$0f0d
	dc.w $1f01,$1c04,$120b,$1a05,$1807,$0f0d,$1906,$0e0e
	dc.w $1e02,$1d03,$1608,$1c04,$1b05,$1409,$1907,$120a
	dc.w $1c03,$1b04,$1409,$1a05,$1906,$120a,$1708,$100b
	dc.w $1a04,$1905,$120a,$1806,$1707,$100b,$1509,$0e0c
	dc.w $1805,$1706,$100b,$1607,$1508,$0e0c,$130a,$0c0d
	dc.w $1805,$1706,$100b,$0e0c,$0c0d,$0a0e,$080f,$0610
	dc.w $1606,$1507,$0e0c,$0c0d,$0a0e,$080f,$0610,$0411
	dc.w $1407,$1308,$0c0d,$0a0e,$080f,$0610,$0411,$0212
	dc.w $1208,$1109,$0a0e,$080f,$0610,$0411,$0212,$0013
	dc.w $0018,$0016,$0014,$0012,$0010,$000e,$000c,$000a
	dc.w $0017,$0015,$0013,$0011,$000f,$000d,$000b,$0009
	dc.w $0016,$0014,$0012,$0010,$000e,$000c,$000a,$0008
	dc.w $0015,$0013,$0011,$000f,$000d,$000b,$0009,$0007
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

;==============================================
loc_020c4a:
	tst.b ($83,a5)
	bne.w loc_020d02
	tst.b ($118,a5)
	bne.w loc_020cfa
	tst.b ($95,a5)
	bne.w loc_020cfa
	moveq #0,d0
	moveq #0,d1
	moveq #0,d2
	moveq #0,d3
	lea.l ObjectRam,a2
	movem.l d0-d3,(a2)
	movem.l d0-d3,($10,a2)
	lea.l ($20,a2),a2
	move.w #$380,d7
	move.w d7,($11a,a5)
	bsr.w loc_020ebe
	bsr.w loc_022490
	bsr.w loc_020e52
	bsr.w loc_020e94
	bsr.w loc_020de4
	bsr.w loc_020e84
	bsr.w loc_0218aa
	bsr.w loc_020daa
	bsr.w loc_020dd4
	bsr.w loc_020e74
	bsr.w loc_020eae
	bsr.w loc_020e64
	bsr.w loc_02187c
	bsr.w loc_020e46
	bsr.w loc_020e3a
	bsr.w loc_020e2e
	bsr.w loc_020e22
	bsr.w loc_020e16
	bsr.w loc_020e0a
	bsr.w loc_020dfe
	bsr.w loc_0226f8
	bsr.w loc_021aec
	bsr.w loc_021b14
	bsr.w loc_021b3c
	sub.w d7,($11a,a5)
	move.l #$8000,(a2)+
	eori.b #1,($94,a5)
	st.b ($95,a5)

loc_020cfa:
	moveq #0,d1
	jmp loc_01be38

loc_020d02:
	tst.b ($118,a5)
	bne.b loc_020cfa
	tst.b ($95,a5)
	bne.b loc_020cfa
	moveq #0,d0
	moveq #0,d1
	moveq #0,d2
	moveq #0,d3
	lea.l ObjectRam,a2
	movem.l d0-d3,(a2)
	movem.l d0-d3,($10,a2)
	lea.l ($20,a2),a2
	move.w #$380,d7
	move.w d7,($11a,a5)
	bsr.w loc_020ee8
	bsr.w loc_022490
	bsr.w loc_020e52
	bsr.w loc_020e94
	bsr.w loc_020de4
	bsr.w loc_020e84
	bsr.w loc_0218aa
	bsr.w loc_020daa
	bsr.w loc_020dd4
	bsr.w loc_020e74
	bsr.w loc_020ed8
	bsr.w loc_020e64
	bsr.w loc_02187c
	bsr.w loc_020e46
	bsr.w loc_020e3a
	bsr.w loc_020e2e
	bsr.w loc_020e22
	bsr.w loc_020e16
	bsr.w loc_020e0a
	bsr.w loc_020dfe
	bsr.w loc_0226f8
	bsr.w loc_021aec
	bsr.w loc_021b14
	bsr.w loc_021b3c
	sub.w d7,($11a,a5)
	move.l #$00008000,(a2)+
	eori.b #1,($94,a5)
	st.b ($95,a5)
	bra.w loc_020cfa

;==============================================
loc_020daa:
	lea.l ($6ffe,a5),a3
	move.w ($138,a5),d0
	move.w loc_020dba(pc,d0.w),d1
	jmp loc_020dba(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_020dba:
	dc.w loc_020dc2-loc_020dba
	dc.w loc_020dc6-loc_020dba
	dc.w loc_020dc6-loc_020dba
	dc.w loc_020dc6-loc_020dba

;==============================================
loc_020dc2:
	moveq #1,d6
	bra.b loc_020dc8

loc_020dc6:
	moveq #2,d6

loc_020dc8:
	movea.w (a3)+,a4
	bsr.w loc_020f02
	dbra d6,loc_020dc8
	rts

;==============================================
loc_020dd4:
	moveq #0,d6
	move.b ($6ec7,a5),d6
	beq.b loc_020dfc
	subq.w #1,d6
	lea.l ($7036,a5),a3
	bra.b loc_020df2

loc_020de4:
	moveq #0,d6
	move.b ($6ec8,a5),d6
	beq.b loc_020dfc
	subq.w #1,d6
	lea.l ($7066,a5),a3

loc_020df2:
	movea.w -(a3),a4
	bsr.w loc_020f0c
	dbra d6,loc_020df2

loc_020dfc:
	rts

;==============================================
loc_020dfe:
	tst.b ($6ebf,a5)
	beq.b loc_020e62
	lea.l ($7076,a5),a3
	bra.b loc_020e5c

loc_020e0a:
	tst.b ($6ec0,a5)
	beq.b loc_020e62
	lea.l ($7078,a5),a3
	bra.b loc_020e5c

loc_020e16:
	tst.b ($6ec1,a5)
	beq.b loc_020e62
	lea.l ($707a,a5),a3
	bra.b loc_020e5c

loc_020e22:
	tst.b ($6ec2,a5)
	beq.b loc_020e62
	lea.l ($707c,a5),a3
	bra.b loc_020e5c

loc_020e2e:
	tst.b ($6ec3,a5)
	beq.b loc_020e62
	lea.l ($707e,a5),a3
	bra.b loc_020e5c

loc_020e3a:
	tst.b ($6ec4,a5)
	beq.b loc_020e62
	lea.l ($7080,a5),a3
	bra.b loc_020e5c

loc_020e46:
	tst.b ($6ec5,a5)
	beq.b loc_020e62
	lea.l ($7082,a5),a3
	bra.b loc_020e5c

loc_020e52:
	tst.b ($6ec6,a5)
	beq.b loc_020e62
	lea.l ($7084,a5),a3

loc_020e5c:
	movea.w -(a3),a6
	bra.w loc_0215a8

loc_020e62:
	rts

;==============================================
loc_020e64:
	moveq #0,d6
	move.b ($6ec9,a5),d6
	beq.b loc_020eac
	subq.w #1,d6
	lea.l ($70b6,a5),a3
	bra.b loc_020ea2

loc_020e74:
	moveq #0,d6
	move.b ($6eca,a5),d6
	beq.b loc_020eac
	subq.w #1,d6
	lea.l ($70f6,a5),a3
	bra.b loc_020ea2

loc_020e84:
	moveq #0,d6
	move.b ($6ecb,a5),d6
	beq.b loc_020eac
	subq.w #1,d6
	lea.l ($7136,a5),a3
	bra.b loc_020ea2

loc_020e94:
	moveq #0,d6
	move.b ($6ecc,a5),d6
	beq.b loc_020eac
	subq.w #1,d6
	lea.l ($7176,a5),a3

loc_020ea2:
	movea.w -(a3),a4
	bsr.w loc_020f0c
	dbra d6,loc_020ea2

loc_020eac:
	rts

;==============================================
loc_020eae:
	moveq #0,d6
	move.b ($6ecd,a5),d6
	beq.b loc_020ed6
	subq.w #1,d6
	lea.l ($7196,a5),a3
	bra.b loc_020ecc

loc_020ebe:
	moveq #0,d6
	move.b ($6ece,a5),d6
	beq.b loc_020ed6
	subq.w #1,d6
	lea.l ($71b6,a5),a3

loc_020ecc:
	movea.w -(a3),a6
	bsr.w loc_0215a8
	dbra d6,loc_020ecc

loc_020ed6:
	rts

;==============================================
loc_020ed8:
	moveq #0,d6
	move.b ($6ecd,a5),d6
	beq.b loc_020f00
	subq.w #1,d6
	lea.l ($7196,a5),a3
	bra.b loc_020ef6

loc_020ee8:
	moveq #0,d6
	move.b ($6ece,a5),d6
	beq.b loc_020f00
	subq.w #1,d6
	lea.l ($71b6,a5),a3

loc_020ef6:
	movea.w -(a3),a6
	bsr.w loc_020f6a
	dbra d6,loc_020ef6

loc_020f00:
	rts

;==============================================
loc_020f02:
	tst.b (a4)
	beq.b loc_020f68
	tst.b (1,a4)
	beq.b loc_020f68

loc_020f0c:
	tst.w ($2e,a4)
	beq.b loc_020f22
	movea.w ($2e,a4),a6
	tst.b (a6)
	beq.b loc_020f22
	tst.b (1,a6)
	beq.b loc_020f22
	bsr.b loc_020f6a

loc_020f22:
	tst.w ($2c,a4)
	beq.b loc_020f38
	movea.w ($2c,a4),a6
	tst.b (a6)
	beq.b loc_020f38
	tst.b (1,a6)
	beq.b loc_020f38
	bsr.b loc_020f6a

loc_020f38:
	lea.l (a4),a6
	bsr.b loc_020f6a
	tst.w ($2a,a4)
	beq.b loc_020f52
	movea.w ($2a,a4),a6
	tst.b (a6)
	beq.b loc_020f52
	tst.b (1,a6)
	beq.b loc_020f52
	bsr.b loc_020f6a

loc_020f52:
	tst.w ($28,a4)
	beq.b loc_020f68
	movea.w ($28,a4),a6
	tst.b (a6)
	beq.b loc_020f68
	tst.b (1,a6)
	beq.b loc_020f68
	bra.b loc_020f6a

loc_020f68
	rts

;==============================================
loc_020f6a:
	move.w ($14,a6),d2
	bsr.w loc_021b6e
	movea.l ($1c,a6),a0
	movea.l (4,a0),a0

loc_020f7a:
	move.w (a0)+,d0
	move.w loc_020f84(pc,d0.w),d0
	jmp loc_020f84(pc,d0.w)


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_020f84:
	dc.w loc_020f9a-loc_020f84
	dc.w loc_021012-loc_020f84
	dc.w loc_0210a0-loc_020f84
	dc.w loc_02113a-loc_020f84
	dc.w loc_0211f0-loc_020f84
	dc.w loc_021280-loc_020f84
	dc.w loc_021314-loc_020f84
	dc.w loc_0213a2-loc_020f84

	dc.w loc_02145a-loc_020f84
	dc.w loc_02150c-loc_020f84
	dc.w loc_02150e-loc_020f84

;==============================================
loc_020f9a:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_021010
	sub.w d5,d7
	subq.w #1,d5
	move.w (a0)+,d3
	move.b ($b,a6),d2
	lsl.b #5,d2
	andi.b #$60,d2
	or.b d2,d3
	move.b ($d,a6),d2
	tst.b ($c,a6)
	beq.b loc_020fcc
	bpl.b loc_020fc2
	add.b d3,d2

loc_020fc2
	andi.w #$0060,d3
	andi.w #$001f,d2
	or.w d2,d3

loc_020fcc:
	movea.l (a0)+,a1

loc_020fce:
	movem.w (a1)+,d0-d1
	btst #6,d3
	beq.b loc_020fde
	neg.w d1
	subi.w #$10,d1

loc_020fde:
	swap d4
	add.w d4,d1
	btst #5,d3
	beq.b loc_020fee
	neg.w d0
	subi.w #$10,d0

loc_020fee:
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($18,a6),d0
	or.w ($1a,a6),d1
	move.w (a0)+,d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_020fce

loc_021010:
	rts

;==============================================
loc_021012:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_02109e
	sub.w d5,d7
	move.w (a0)+,d5
	movea.l (a0)+,a1

loc_021020:
	movem.w (a1)+,d0-d1
	move.b ($b,a6),d3
	lsl.b #5,d3
	andi.b #$60,d3
	btst #6,d3
	beq.b loc_021044
	move.b (2,a0),d2
	andi.w #$f0,d2
	addi.w #$10,d2
	neg.w d1
	sub.w d2,d1

loc_021044:
	swap d4
	add.w d4,d1
	btst #5,d3
	beq.b loc_02105e
	move.b (2,a0),d2
	andi.w #$f,d2
	addq.w #1,d2
	lsl.w #4,d2
	neg.w d0
	sub.w d2,d0

loc_02105e:
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($18,a6),d0
	or.w ($1a,a6),d1
	move.l (a0)+,d2
	eor.b d3,d2
	move.b ($d,a6),d3
	tst.b ($c,a6)
	beq.b loc_02108e
	bpl.b loc_021084
	add.b d2,d3

loc_021084:
	andi.w #$ff60,d2
	andi.w #$1f,d3
	or.w d3,d2

loc_02108e
	move.w d2,d3
	swap d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_021020

loc_02109e:
	rts

;==============================================
loc_0210a0:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_021138
	sub.w d5,d7
	subq.w #1,d5
	move.w (a0)+,d3
	move.b ($b,a6),d2
	lsl.b #5,d2
	andi.b #$60,d2
	or.b d2,d3
	move.b ($d,a6),d2
	tst.b ($c,a6)
	beq.b loc_0210d2
	bpl.b loc_0210c8
	add.b d3,d2

loc_0210c8:
	andi.w #$60,d3
	andi.w #$1f,d2
	or.w d2,d3

loc_0210d2:
	movem.w (a0)+,d0-d1
	btst #6,d3
	beq.b loc_0210de
	neg.w d1

loc_0210de:
	swap d4
	add.w d1,d4
	btst #5,d3
	beq.b loc_0210ea
	neg.w d0

loc_0210ea:
	swap d4
	add.w d0,d4
	lea.l loc_0229ae(pc),a1

loc_0210f2:
	move.w (a0)+,d2
	movem.w (a1,d2.w),d0-d1
	btst #6,d3
	beq.b loc_021106
	neg.w d1
	subi.w #$10,d1

loc_021106:
	swap d4
	add.w d4,d1
	btst #5,d3
	beq.b loc_021116
	neg.w d0
	subi.w #$10,d0

loc_021116:
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($18,a6),d0
	or.w ($1a,a6),d1
	move.w (a0)+,d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_0210f2

loc_021138:
	rts

;==============================================
loc_02113a:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_0211ee
	sub.w d5,d7
	move.w (a0)+,d5
	movem.w (a0)+,d0-d1
	move.b ($b,a6),d3
	lsl.b #5,d3
	btst #6,d3
	beq.b loc_021158
	neg.w d1

loc_021158:
	swap d4
	add.w d1,d4
	btst #5,d3
	beq.b loc_021164
	neg.w d0

loc_021164:
	swap d4
	add.w d0,d4
	lea.l loc_0229ae(pc),a1

loc_02116c
	move.w (a0)+,d2
	movem.w (a1,d2.w),d0-d1
	move.b ($b,a6),d3
	lsl.b #5,d3
	andi.b #$60,d3
	btst #6,d3
	beq.b loc_021194
	move.b (2,a0),d2
	andi.w #$f0,d2
	addi.w #$10,d2
	neg.w d1
	sub.w d2,d1

loc_021194
	swap d4
	add.w d4,d1
	btst #5,d3
	beq.b loc_0211ae
	move.b (2,a0),d2
	andi.w #$f,d2
	addq.w #1,d2
	lsl.w #4,d2
	neg.w d0
	sub.w d2,d0

loc_0211ae:
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($18,a6),d0
	or.w ($1a,a6),d1
	move.l (a0)+,d2
	eor.b d3,d2
	move.b ($d,a6),d3
	tst.b ($c,a6)
	beq.b loc_0211de
	bpl.b loc_0211d4
	add.b d2,d3

loc_0211d4:
	andi.w #$ff60,d2
	andi.w #$1f,d3
	or.w d3,d2

loc_0211de:
	move.w d2,d3
	swap d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_02116c

loc_0211ee:
	rts

;==============================================
loc_0211f0:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_02127e
	sub.w d5,d7
	move.w (a0)+,d5

loc_0211fc:
	move.l (a0)+,d1
	move.l (a0)+,d0
	move.b ($b,a6),d3
	lsl.b #5,d3
	andi.b #$60,d3
	eor.b d3,d1
	btst #6,d3
	beq.b loc_021222
	move.w d1,d2
	andi.w #$f000,d2
	lsr.w #8,d2
	addi.w #$10,d2
	neg.w d0
	sub.w d2,d0

loc_021222:
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	ori.w #$2000,d0
	swap d0
	btst #5,d3
	beq.b loc_021246
	move.w d1,d2
	andi.w #$f00,d2
	lsr.w #4,d2
	addi.w #$10,d2
	neg.w d0
	sub.w d2,d0

loc_021246:
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	or.w ($18,a6),d0
	swap d0
	move.b ($d,a6),d3
	tst.b ($c,a6)
	beq.b loc_02126c
	bpl.b loc_021262
	add.b d1,d3

loc_021262:
	andi.w #$ff60,d1
	andi.w #$1f,d3
	or.w d3,d1

loc_02126c:
	addi.l #$6c000000,d1
	movem.l d0-d1,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_0211fc

loc_02127e:
	rts

;==============================================
loc_021280:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_021312
	sub.w d5,d7
	move.w (a0)+,d5
	move.w (a0)+,d3
	move.b ($b,a6),d2
	lsl.b #5,d2
	andi.b #$60,d2
	or.b d2,d3
	move.b ($d,a6),d2
	tst.b ($c,a6)
	beq.b loc_0212b2
	bpl.b loc_0212a8
	add.w d3,d2

loc_0212a8:
	andi.w #$ff60,d3
	andi.w #$1f,d2
	or.w d2,d3

loc_0212b2:
	movea.l (a0)+,a1

loc_0212b4:
	movem.w (a1)+,d0-d1
	btst.b #1,($b,a6)
	beq.b loc_0212d0
	move.w d3,d2
	andi.w #$f000,d2
	lsr.w #8,d2
	addi.w #$10,d2
	neg.w d1
	sub.w d2,d1

loc_0212d0
	swap d4

loc_0212d2:
	add.w d4,d1
	btst.b #0,($b,a6)
	beq.b loc_0212ec
	move.w d3,d2
	andi.w #$f00,d2
	lsr.w #4,d2
	addi.w #$10,d2
	neg.w d0
	sub.w d2,d0

loc_0212ec:
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($18,a6),d0
	ori.w #$2000,d1
	move.w (a0)+,d2
	addi.w #$6c00,d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_0212b4

loc_021312:
	rts

;==============================================
loc_021314:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_0213a0
	sub.w d5,d7
	move.w (a0)+,d5
	movea.l (a0)+,a1

loc_021322:
	movem.w (a1)+,d0-d1
	move.b ($b,a6),d3
	lsl.b #5,d3
	btst #6,d3
	beq.b loc_021342
	move.b (2,a0),d2
	andi.w #$f0,d2
	addi.w #$10,d2
	neg.w d1
	sub.w d2,d1

loc_021342:
	swap d4
	add.w d4,d1
	btst #5,d3
	beq.b loc_02135c
	move.b (2,a0),d2
	andi.w #$f,d2
	addq.w #1,d2
	lsl.w #4,d2
	neg.w d0
	sub.w d2,d0

loc_02135c:
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($18,a6),d0
	ori.w #$2000,d1
	move.l (a0)+,d2
	eor.b d3,d2
	move.b ($d,a6),d3
	tst.b ($c,a6)
	beq.b loc_02138c
	bpl.b loc_021382
	add.w d2,d3

loc_021382:
	andi.w #$ff60,d2
	andi.w #$1f,d3
	or.w d3,d2

loc_02138c:
	move.w d2,d3
	swap d2
	addi.w #$6c00,d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_021322

loc_0213a0:
	rts

;==============================================
loc_0213a2:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_021458
	sub.w d5,d7
	move.w (a0)+,d5
	move.w (a0)+,d3
	move.b ($b,a6),d2
	lsl.b #5,d2
	andi.b #$60,d2
	or.b d2,d3
	move.b ($d,a6),d2
	tst.b ($c,a6)
	beq.b loc_0213d4
	bpl.b loc_0213ca
	add.w d3,d2

loc_0213ca:
	andi.w #$ff60,d3
	andi.w #$1f,d2
	or.w d2,d3

loc_0213d4:
	movea.l (a0)+,a1

loc_0213d6:
	move.w d3,d2
	lsr.w #8,d2
	bsr.w loc_021c0a
	btst.b #1,($b,a6)
	beq.b loc_0213f6
	move.w d3,d2
	andi.w #$f000,d2
	lsr.w #8,d2
	addi.w #$10,d2
	neg.w d1
	sub.w d2,d1

loc_0213f6:
	swap d4
	add.w d4,d1
	btst.b #0,($b,a6)
	beq.b loc_021412
	move.w d3,d2
	andi.w #$f00,d2
	lsr.w #4,d2
	addi.w #$10,d2
	neg.w d0
	sub.w d2,d0

loc_021412:
	swap d4
	add.w d4,d0
	cmpi.w #$fdc0,d0
	blt.b loc_021422
	cmpi.w #$1c0,d0
	ble.b loc_021426

loc_021422:
	move.w #$1c0,d0

loc_021426:
	cmpi.w #$fcf0,d1
	blt.b loc_021432
	cmpi.w #$f0,d1
	ble.b loc_021436

loc_021432:
	move.w #$f0,d1

loc_021436:
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($18,a6),d0
	ori.w #$2000,d1
	move.w (a0)+,d2
	addi.w #$6c00,d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_0213d6

loc_021458:
	rts

;==============================================
loc_02145a:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_02150a
	sub.w d5,d7
	move.w (a0)+,d5
	movea.l (a0)+,a1

loc_021468:
	move.b (2,a0),d2
	bsr.w loc_021c0a
	move.b ($b,a6),d3
	lsl.b #5,d3
	btst #6,d3
	beq.b loc_02148c
	move.b (2,a0),d2
	andi.w #$f0,d2
	addi.w #$10,d2
	neg.w d1
	sub.w d2,d1

loc_02148c:
	swap d4
	add.w d4,d1
	btst #5,d3
	beq.b loc_0214a6
	move.b (2,a0),d2
	andi.w #$f,d2
	addq.w #1,d2
	lsl.w #4,d2
	neg.w d0
	sub.w d2,d0

loc_0214a6:
	swap d4
	add.w d4,d0
	cmpi.w #$fdc0,d0
	blt.b loc_0214b6
	cmpi.w #$1c0,d0
	ble.b loc_0214ba

loc_0214b6:
	move.w #$1c0,d0

loc_0214ba:
	cmpi.w #$fcf0,d1
	blt.b loc_0214c6
	cmpi.w #$f0,d1
	ble.b loc_0214ca

loc_0214c6:
	move.w #$f0,d1

loc_0214ca:
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($18,a6),d0
	ori.w #$2000,d1
	move.l (a0)+,d2
	eor.b d3,d2
	move.b ($d,a6),d3
	tst.b ($c,a6)
	beq.b loc_0214f6
	bpl.b loc_0214ec
	add.w d2,d3

loc_0214ec:
	andi.w #$ff60,d2
	andi.w #$1f,d3
	or.w d3,d2

loc_0214f6:
	move.w d2,d3
	swap d2
	addi.w #$6c00,d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_021468

loc_02150a:
	rts

;==============================================
loc_02150c:
	rts

;==============================================
loc_02150e:
	move.l a3,(-$5cde,a5)
	move.l d4,(-$5cda,a5)
	movea.l a0,a3
	tst.b ($b,a6)
	bne.w loc_021562
	subi.w #$31,d4
	bpl.b loc_021542
	not.w d4
	andi.w #$fff0,d4
	addi.w #$10,d4
	cmpi.w #$7f0,d4
	bhi.w loc_0215a2
	add.w d4,(-$5cd8,a5)
	lsr.w #2,d4
	lea.l (a3,d4.w),a3

loc_021542:
	tst.w (a3)
	bmi.w loc_0215a2
	movea.l (a3)+,a0
	move.l (-$5cda,a5),d4
	cmpi.w #$1bf,d4
	bhi.w loc_0215a2
	bsr.w loc_020f7a
	addi.w #$10,(-$5cd8,a5)
	bra.b loc_021542

loc_021562:
	subi.w #$1d0,d4
	bmi.b loc_021582
	andi.w #$fff0,d4
	addi.w #$10,d4
	cmpi.w #$7f0,d4
	bhi.w loc_0215a2
	sub.w d4,(-$5cd8,a5)
	lsr.w #2,d4
	lea.l (a3,d4.w),a3

loc_021582:
	tst.w (a3)
	bmi.w loc_0215a2
	movea.l (a3)+,a0
	move.l (-$5cda,a5),d4
	cmpi.w #$30,d4
	ble.w loc_0215a2
	bsr.w loc_020f7a
	subi.w #$10,(-$5cd8,a5)
	bra.b loc_021582

loc_0215a2:
	movea.l (-$5cde,a5),a3
	rts

;==============================================
loc_0215a8:
	bra.b loc_0215ac
	nop

;==============================================
loc_0215ac:
	move.w ($14,a6),d2
	bsr.w loc_021b6e
	movea.l ($1c,a6),a0
	movea.l (4,a0),a0
	move.w (a0)+,d0
	move.w loc_0215c6(pc,d0.w),d0
	jmp loc_0215c6(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0215c6:
	dc.w loc_0215de-loc_0215c6
	dc.w loc_02161a-loc_0215c6
	dc.w loc_021656-loc_0215c6
	dc.w loc_0216a4-loc_0215c6
	dc.w loc_0216f2-loc_0215c6
	dc.w loc_021732-loc_0215c6
	dc.w loc_021772-loc_0215c6
	dc.w loc_0217b2-loc_0215c6

	dc.w loc_021816-loc_0215c6
	dc.w loc_02187a-loc_0215c6
	dc.w loc_0211f0-loc_0215c6
	dc.w loc_021280-loc_0215c6


;==============================================
loc_0215de:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_021618
	sub.w d5,d7
	subq.w #1,d5
	move.w (a0)+,d3
	movea.l (a0)+,a1

loc_0215ee:
	movem.w (a1)+,d0-d1
	swap d4
	add.w d4,d1
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($18,a6),d0
	or.w ($1a,a6),d1
	move.w (a0)+,d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_0215ee

loc_021618:
	rts

;==============================================
loc_02161a:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_021654
	sub.w d5,d7
	move.w (a0)+,d5
	movea.l (a0)+,a1

loc_021628:
	movem.w (a1)+,d0-d1
	swap d4
	add.w d4,d1
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($18,a6),d0
	or.w ($1a,a6),d1
	movem.w (a0)+,d2-d3
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_021628

loc_021654:
	rts

;==============================================
loc_021656:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_0216a2
	sub.w d5,d7
	subq.w #1,d5
	move.w (a0)+,d3
	movem.w (a0)+,d0-d1
	swap d4
	add.w d1,d4
	swap d4
	add.w d0,d4
	lea.l loc_0229ae(pc),a1

loc_021674:
	move.w (a0)+,d2
	movem.w (a1,d2.w),d0-d1
	swap d4
	add.w d4,d1
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($18,a6),d0
	or.w ($1a,a6),d1
	move.w (a0)+,d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_021674

loc_0216a2:
	rts

;==============================================
loc_0216a4:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_0216f0
	sub.w d5,d7
	move.w (a0)+,d5
	movem.w (a0)+,d0-d1
	swap d4
	add.w d1,d4
	swap d4
	add.w d0,d4
	lea.l loc_0229ae(pc),a1

loc_0216c0:
	move.w (a0)+,d2
	movem.w (a1,d2.w),d0-d1
	swap d4
	add.w d4,d1
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($18,a6),d0
	or.w ($1a,a6),d1
	movem.w (a0)+,d2-d3
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_0216c0

loc_0216f0:
	rts

;==============================================
loc_0216f2:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_021730
	sub.w d5,d7
	move.w (a0)+,d5

loc_0216fe:
	move.l (a0)+,d1
	move.l (a0)+,d0
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	ori.w #$2000,d0
	swap d0
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	or.w ($18,a6),d0
	swap d0
	addi.l #$6c000000,d1
	movem.l d0-d1,(a2)
	lea.l ($8,a2),a2
	dbra d5,loc_0216fe

loc_021730:
	rts

;==============================================
loc_021732:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_021770
	sub.w d5,d7
	move.w (a0)+,d5
	move.w (a0)+,d3
	movea.l (a0)+,a1

loc_021742:
	movem.w (a1)+,d0-d1
	swap d4
	add.w d4,d1
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($18,a6),d0
	ori.w #$2000,d1
	move.w (a0)+,d2
	addi.w #$6c00,d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_021742

loc_021770:
	rts

;==============================================
loc_021772:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_0217b0
	sub.w d5,d7
	move.w (a0)+,d5
	movea.l (a0)+,a1

loc_021780:
	movem.w (a1)+,d0-d1
	swap d4
	add.w d4,d1
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($18,a6),d0
	ori.w #$2000,d1
	movem.w (a0)+,d2-d3
	addi.w #$6c00,d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_021780

loc_0217b0:
	rts

;==============================================
loc_0217b2:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_021814
	sub.w d5,d7
	move.w (a0)+,d5
	move.w (a0)+,d3
	movea.l (a0)+,a1

loc_0217c2:
	move.w d3,d2
	lsr.w #8,d2
	bsr.w loc_021c0a
	swap d4
	add.w d4,d1
	swap d4
	add.w d4,d0
	cmpi.w #$fdc0,d0
	blt.b loc_0217de
	cmpi.w #$1c0,d0
	ble.b loc_0217e2

loc_0217de:
	move.w #$1c0,d0

loc_0217e2:
	cmpi.w #$fcf0,d1
	blt.b loc_0217ee
	cmpi.w #$f0,d1
	ble.b loc_0217f2

loc_0217ee:
	move.w #$f0,d1

loc_0217f2:
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($18,a6),d0
	ori.w #$2000,d1
	move.w (a0)+,d2
	addi.w #$6c00,d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_0217c2

loc_021814:
	rts

;==============================================
loc_021816:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_021878
	sub.w d5,d7
	move.w (a0)+,d5
	movea.l (a0)+,a1

loc_021824:
	move.b (2,a0),d2
	bsr.w loc_021c0a
	swap d4
	add.w d4,d1
	swap d4
	add.w d4,d0
	cmpi.w #$fdc0,d0
	blt.b loc_021840
	cmpi.w #$1c0,d0
	ble.b loc_021844

loc_021840:
	move.w #$1c0,d0

loc_021844:
	cmpi.w #$fcf0,d1
	blt.b loc_021850
	cmpi.w #$f0,d1
	ble.b loc_021854

loc_021850:
	move.w #$f0,d1

loc_021854:
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($18,a6),d0
	ori.w #$2000,d1
	movem.w (a0)+,d2-d3
	addi.w #$6c00,d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_021824

loc_021878:
	rts

;==============================================
loc_02187a:
	rts

;==============================================
loc_02187c:
	tst.b ($124,a5)
	beq.b loc_021888
	tst.b ($170,a5)
	beq.b loc_0218a8

loc_021888:
	moveq #6,d6
	lea.l ($5000,a5),a6

loc_02188e:
	tst.b (a6)
	beq.b loc_0218a0
	tst.b (1,a6)
	beq.b loc_0218a0
	tst.b (9,a6)
	bne.b loc_0218a0
	bsr.b loc_0218d8

loc_0218a0:
	lea.l ($200,a6),a6
	dbra d6,loc_02188e

loc_0218a8:
	rts

;==============================================
loc_0218aa:
	tst.b ($124,a5)
	beq.b loc_0218b6
	tst.b ($170,a5)
	beq.b loc_0218d6

loc_0218b6:
	moveq #6,d6
	lea.l ($5000,a5),a6

loc_0218bc:
	tst.b (a6)
	beq.b loc_0218ce
	tst.b (1,a6)
	beq.b loc_0218ce
	tst.b (9,a6)
	beq.b loc_0218ce
	bsr.b loc_0218d8

loc_0218ce:
	lea.l ($200,a6),a6
	dbra d6,loc_0218bc

loc_0218d6:
	rts

;==============================================
loc_0218d8:
	move.l #$400100,d4
	sub.w ($14,a6),d4
	swap d4
	add.w ($10,a6),d4
	movea.l ($1c,a6),a0
	move.w (a0)+,d0
	move.w loc_0218f6(pc,d0.w),d0
	jmp loc_0218f6(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0218f6:
	dc.w loc_021906-loc_0218f6
	dc.w loc_021944-loc_0218f6
	dc.w loc_021982-loc_0218f6
	dc.w loc_0219c2-loc_0218f6
	dc.w loc_021a22-loc_0218f6
	dc.w loc_0219ca-loc_0218f6
	dc.w loc_021a90-loc_0218f6
	dc.w loc_021a98-loc_0218f6

;==============================================
loc_021906:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.b loc_021942
	sub.w d5,d7
	move.w (a0)+,d5
	move.w (a0)+,d3
	movea.l (a0)+,a1

loc_021914:
	move.w (a1)+,d0
	move.w (a1)+,d1
	swap d4
	add.w d4,d1
	andi.w #$3ff,d1
	ori.w #$2000,d1
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	or.w ($18,a6),d0
	move.w (a0)+,d2
	addi.w #$6c00,d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_021914

loc_021942:
	rts

;==============================================
loc_021944:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.b loc_021980
	sub.w d5,d7
	move.w (a0)+,d5
	movea.l (a0)+,a1

loc_021950:
	move.w (a1)+,d0
	move.w (a1)+,d1
	swap d4
	add.w d4,d1
	andi.w #$3ff,d1
	ori.w #$2000,d1
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	or.w ($18,a6),d0
	move.w (a0)+,d2
	move.w (a0)+,d3
	addi.w #$6c00,d2
	movem.w d0-d3,(a2)
	lea.l ($8,a2),a2
	dbra d5,loc_021950

loc_021980:
	rts

;==============================================
loc_021982:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.b loc_0219c0
	sub.w d5,d7
	move.w (a0)+,d5
	move.l #$6c000000,d2

loc_021992:
	move.l (a0)+,d1
	move.l (a0)+,d0
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	ori.w #$2000,d0
	swap d0
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	or.w ($18,a6),d0
	swap d0
	add.l d2,d1
	movem.l d0-d1,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_021992

loc_0219c0:
	rts

;==============================================
loc_0219c2:
	move.l #$6e80001f,d2
	bra.b loc_0219d0

loc_0219ca:
	move.l #$6e80001d,d2

loc_0219d0:
	cmpi.w #$c0,d7
	bcs.b loc_0219c0
	subi.w #$c0,d7
	movea.l (a0),a0
	moveq #$b,d5

loc_0219de:
	moveq #0,d1

loc_0219e0:
	move.l d1,d0
	add.l d4,d0
	moveq #0,d3
	move.b (a0)+,d3
	beq.b loc_021a20
	cmpi.b #$7f,d3
	beq.b loc_021a10
	cmpi.w #$1c0,d0
	bcc.b loc_021a0c
	swap d0
	swap d3
	andi.l #$3ff03ff,d0
	ori.l #$e0002000,d0
	add.l d2,d3
	move.l d0,(a2)+
	move.l d3,(a2)+

loc_021a0c:
	addq.w #8,d1
	bra.b loc_0219e0

loc_021a10:
	addi.w #$fff0,d4
	swap d4
	addi.w #$10,d4
	swap d4
	dbra d5,loc_0219de

loc_021a20:
	rts

;==============================================
loc_021a22:
	lea.l ($200,a5),a1
	move.w ($14,a6),d4
	sub.w ($14,a1),d4
	neg.w d4
	addi.w #$100,d4
	swap d4
	move.w ($10,a6),d4
	sub.w ($10,a1),d4
	addi.w #$40,d4
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.b loc_021a8e
	sub.w d5,d7
	move.w (a0)+,d5
	movea.l (a0)+,a1

loc_021a4e:
	move.w (a1)+,d0
	move.w (a1)+,d1
	swap d4
	add.w d4,d1
	andi.w #$3ff,d1
	ori.w #$2000,d1
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	or.w ($18,a6),d0
	move.w (a0)+,d2
	move.w (a0)+,d3
	addi.w #$6c00,d2
	tst.b ($c,a6)
	beq.b loc_021a82
	bmi.b loc_021a7e
	andi.w #$ffe0,d3

loc_021a7e:
	or.b ($d,a6),d3

loc_021a82:
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_021a4e

loc_021a8e:
	rts

;==============================================
loc_021a90:
	move.l #$6e80001f,d2
	bra.b loc_021a9e

loc_021a98:
	move.l #$6e80001d,d2

loc_021a9e:
	cmpi.w #$e0,d7
	bcs.b loc_021aea
	subi.w #$e0,d7
	movea.l (a0),a0
	moveq #$e,d5

loc_021aac:
	moveq #$0,d1

loc_021aae:
	move.l d1,d0
	add.l d4,d0
	moveq #0,d3
	move.b (a0)+,d3
	beq.b loc_021aea
	cmpi.b #$7f,d3
	beq.b loc_021ade
	swap d0
	cmpi.w #$f0,d0
	bcc.b loc_021ada
	swap d3
	andi.l #$3ff03ff,d0
	ori.l #$e0002000,d0
	add.l d2,d3
	move.l d0,(a2)+
	move.l d3,(a2)+

loc_021ada:
	addq.w #8,d1
	bra.b loc_021aae

loc_021ade:
	swap d4
	addi.w #$10,d4
	swap d4
	dbra d5,loc_021aac

loc_021aea:
	rts

;==============================================
loc_021aec:
	move.w ($71be,a5),d6
	beq.b loc_021b12
	cmp.w d6,d7
	bcs.b loc_021b12
	sub.w d6,d7
	lea.l ($71c2,a5),a6
	move.w ($71ba,a5),d6
	subq.w #1,d6

loc_021b02:
	movem.l (a6)+,d0-d1
	movem.l d0-d1,(a2)
	lea.l (8,a2),a2
	dbra d6,loc_021b02

loc_021b12:
	rts

;==============================================
loc_021b14:
	move.w ($71c0,a5),d6
	beq.b loc_021b3a
	cmp.w d6,d7
	bcs.b loc_021b3a
	sub.w d6,d7
	lea.l ($79c2,a5),a6
	move.w ($71bc,a5),d6
	subq.w #1,d6

loc_021b2a:
	movem.l (a6)+,d0-d1
	movem.l d0-d1,(a2)
	lea.l (8,a2),a2
	dbra d6,loc_021b2a

loc_021b3a:
	rts

;==============================================
loc_021b3c:
	tst.b ($ce,a5)
	beq.b loc_021b6a
	tst.b ($cf,a5)
	bpl.b loc_021b6a
	moveq #$1f,d0
	cmpi.w #6,d7
	bcs.b loc_021b6a
	subi.w #6,d7
	moveq #5,d6
	lea.l loc_022996(pc),a6
	move.w #$20d0,d1

loc_021b5e:
	move.w (a6)+,(a2)+
	move.w d1,(a2)+
	move.w (a6)+,(a2)+
	move.w d0,(a2)+
	dbra d6,loc_021b5e

loc_021b6a:
	rts

;==============================================
loc_021b6c:
	rts

;==============================================
loc_021b6e:
	moveq #0,d4
	move.b ($e,a6),d4
	beq.b loc_021bd0
	moveq #0,d0
	cmpi.b #8,d4
	bne.b loc_021b98
	move.w ($26,a6),d1
	beq.b loc_021b98
	add.w d1,d1
	movea.l ($380,a5),a0
	move.w ($3a0,a5),d0
	sub.w d1,d0
	move.w (a0,d0.w),d0
	subi.w #$c0,d0

loc_021b98:
	movea.l loc_021bfa(pc,d4.w),a0
	move.w d2,d4
	tst.b ($f,a6)
	beq.b loc_021ba8
	add.w ($14e,a5),d4

loc_021ba8:
	sub.w ($14,a0),d4
	neg.w d4
	addi.w #$100,d4
	swap d4
	move.w ($10,a6),d4
	cmpi.b #0,(8,a6)
	bhi.b loc_021bc4
	add.w ($d4,a6),d4

loc_021bc4:
	sub.w ($10,a0),d4
	addi.w #$40,d4
	sub.w d0,d4
	rts

loc_021bd0:
	move.w d2,d4
	tst.b ($f,a6)
	beq.b loc_021bdc
	add.w ($14e,a5),d4

loc_021bdc:
	neg.w d4
	addi.w #$100,d4
	swap d4
	move.w ($10,a6),d4
	cmpi.b #0,(8,a6)
	bhi.b loc_021bf4
	add.w ($d4,a6),d4

loc_021bf4:
	addi.w #$40,d4
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_021bfa:
	dc.l $00000030,$00ff8200,$00ff8280,$00ff8300

;==============================================
loc_021c0a:
	movem.l d3/d6-d7/a0,(-$5cee,a5)
	move.b d2,d3
	andi.w #$f0,d2
	lsr.w #1,d2
	addq.w #8,d2
	andi.w #$f,d3
	lsl.w #3,d3
	addq.w #8,d3
	swap d3
	move.w d2,d3
	movem.w (a1)+,d0-d1
	swap d3
	move.b ($20,a6),d2
	beq.b loc_021c3e
	ext.w d2
	move.w d0,d6
	add.w d3,d0
	muls.w d2,d0
	asr.w #4,d0
	add.w d6,d0

loc_021c3e:
	swap d3
	move.b ($22,a6),d2
	beq.b loc_021c52
	ext.w d2
	move.w d1,d7
	add.w d3,d1
	muls.w d2,d1
	asr.w #4,d1
	add.w d7,d1

loc_021c52:
	moveq #0,d2
	move.b ($24,a6),d2
	beq.b loc_021c88
	lsl.w #3,d2
	lea.l loc_021c90(pc,d2.w),a0
	swap d3
	add.w d3,d0
	swap d3
	add.w d3,d1
	move.w d0,d6
	move.w d1,d7
	muls.w (a0)+,d0
	asr.l #8,d0
	muls.w (a0)+,d7
	asr.l #8,d7
	add.w d7,d0
	muls.w (a0)+,d6
	asr.l #8,d6
	muls.w (a0)+,d1
	asr.l #8,d1
	add.w d6,d1
	swap d3
	sub.w d3,d0
	swap d3
	sub.w d3,d1

loc_021c88:
	movem.l (-$5cee,a5),d3/d6-d7/a0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_021c90:
	dc.w $0100,$0000,$0000,$0100,$00ff,$0006,$fffa,$00ff
	dc.w $00ff,$000c,$fff4,$00ff,$00ff,$0012,$ffee,$00ff
	dc.w $00fe,$0019,$ffe7,$00fe,$00fd,$001f,$ffe1,$00fd
	dc.w $00fd,$0025,$ffdb,$00fd,$00fc,$002b,$ffd5,$00fc
	dc.w $00fa,$0031,$ffcf,$00fa,$00f9,$0038,$ffc8,$00f9
	dc.w $00f8,$003d,$ffc3,$00f8,$00f6,$0044,$ffbc,$00f6
	dc.w $00f4,$004a,$ffb6,$00f4,$00f2,$0050,$ffb0,$00f2
	dc.w $00f0,$0056,$ffaa,$00f0,$00ee,$005b,$ffa5,$00ee
	dc.w $00ec,$0061,$ff9f,$00ec,$00e9,$0067,$ff99,$00e9
	dc.w $00e7,$006d,$ff93,$00e7,$00e4,$0072,$ff8e,$00e4
	dc.w $00e1,$0078,$ff88,$00e1,$00de,$007d,$ff83,$00de
	dc.w $00db,$0083,$ff7d,$00db,$00d8,$0088,$ff78,$00d8
	dc.w $00d4,$008e,$ff72,$00d4,$00d1,$0093,$ff6d,$00d1
	dc.w $00cd,$0098,$ff68,$00cd,$00c9,$009d,$ff63,$00c9
	dc.w $00c5,$00a2,$ff5e,$00c5,$00c1,$00a7,$ff59,$00c1
	dc.w $00bd,$00ab,$ff55,$00bd,$00b9,$00b0,$ff50,$00b9
	dc.w $00b4,$00b4,$ff4c,$00b4,$00b0,$00b9,$ff47,$00b0
	dc.w $00ab,$00bd,$ff43,$00ab,$00a7,$00c1,$ff3f,$00a7
	dc.w $00a2,$00c5,$ff3b,$00a2,$009d,$00c9,$ff37,$009d
	dc.w $0098,$00cd,$ff33,$0098,$0093,$00d1,$ff2f,$0093
	dc.w $008e,$00d4,$ff2c,$008e,$0088,$00d8,$ff28,$0088
	dc.w $0083,$00db,$ff25,$0083,$007d,$00de,$ff22,$007d
	dc.w $0078,$00e1,$ff1f,$0078,$0072,$00e4,$ff1c,$0072
	dc.w $006d,$00e7,$ff19,$006d,$0067,$00e9,$ff17,$0067
	dc.w $0061,$00ec,$ff14,$0061,$005b,$00ee,$ff12,$005b
	dc.w $0056,$00f0,$ff10,$0056,$0050,$00f2,$ff0e,$0050
	dc.w $004a,$00f4,$ff0c,$004a,$0044,$00f6,$ff0a,$0044
	dc.w $003d,$00f8,$ff08,$003d,$0038,$00f9,$ff07,$0038
	dc.w $0031,$00fa,$ff06,$0031,$002b,$00fc,$ff04,$002b
	dc.w $0025,$00fd,$ff03,$0025,$001f,$00fd,$ff03,$001f
	dc.w $0019,$00fe,$ff02,$0019,$0012,$00ff,$ff01,$0012
	dc.w $000c,$00ff,$ff01,$000c,$0006,$00ff,$ff01,$0006
	dc.w $0000,$0100,$ff00,$0000,$fffa,$00ff,$ff01,$fffa
	dc.w $fff4,$00ff,$ff01,$fff4,$ffee,$00ff,$ff01,$ffee
	dc.w $ffe7,$00fe,$ff02,$ffe7,$ffe1,$00fd,$ff03,$ffe1
	dc.w $ffdb,$00fd,$ff03,$ffdb,$ffd5,$00fc,$ff04,$ffd5
	dc.w $ffcf,$00fa,$ff06,$ffcf,$ffc8,$00f9,$ff07,$ffc8
	dc.w $ffc3,$00f8,$ff08,$ffc3,$ffbc,$00f6,$ff0a,$ffbc
	dc.w $ffb6,$00f4,$ff0c,$ffb6,$ffb0,$00f2,$ff0e,$ffb0
	dc.w $ffaa,$00f0,$ff10,$ffaa,$ffa5,$00ee,$ff12,$ffa5
	dc.w $ff9f,$00ec,$ff14,$ff9f,$ff99,$00e9,$ff17,$ff99
	dc.w $ff93,$00e7,$ff19,$ff93,$ff8e,$00e4,$ff1c,$ff8e
	dc.w $ff88,$00e1,$ff1f,$ff88,$ff83,$00de,$ff22,$ff83
	dc.w $ff7d,$00db,$ff25,$ff7d,$ff78,$00d8,$ff28,$ff78
	dc.w $ff72,$00d4,$ff2c,$ff72,$ff6d,$00d1,$ff2f,$ff6d
	dc.w $ff68,$00cd,$ff33,$ff68,$ff63,$00c9,$ff37,$ff63
	dc.w $ff5e,$00c5,$ff3b,$ff5e,$ff59,$00c1,$ff3f,$ff59
	dc.w $ff55,$00bd,$ff43,$ff55,$ff50,$00b9,$ff47,$ff50
	dc.w $ff4c,$00b4,$ff4c,$ff4c,$ff47,$00b0,$ff50,$ff47
	dc.w $ff43,$00ab,$ff55,$ff43,$ff3f,$00a7,$ff59,$ff3f
	dc.w $ff3b,$00a2,$ff5e,$ff3b,$ff37,$009d,$ff63,$ff37
	dc.w $ff33,$0098,$ff68,$ff33,$ff2f,$0093,$ff6d,$ff2f
	dc.w $ff2c,$008e,$ff72,$ff2c,$ff28,$0088,$ff78,$ff28
	dc.w $ff25,$0083,$ff7d,$ff25,$ff22,$007d,$ff83,$ff22
	dc.w $ff1f,$0078,$ff88,$ff1f,$ff1c,$0072,$ff8e,$ff1c
	dc.w $ff19,$006d,$ff93,$ff19,$ff17,$0067,$ff99,$ff17
	dc.w $ff14,$0061,$ff9f,$ff14,$ff12,$005b,$ffa5,$ff12
	dc.w $ff10,$0056,$ffaa,$ff10,$ff0e,$0050,$ffb0,$ff0e
	dc.w $ff0c,$004a,$ffb6,$ff0c,$ff0a,$0044,$ffbc,$ff0a
	dc.w $ff08,$003d,$ffc3,$ff08,$ff07,$0038,$ffc8,$ff07
	dc.w $ff06,$0031,$ffcf,$ff06,$ff04,$002b,$ffd5,$ff04
	dc.w $ff03,$0025,$ffdb,$ff03,$ff03,$001f,$ffe1,$ff03
	dc.w $ff02,$0019,$ffe7,$ff02,$ff01,$0012,$ffee,$ff01
	dc.w $ff01,$000c,$fff4,$ff01,$ff01,$0006,$fffa,$ff01
	dc.w $ff00,$0000,$0000,$ff00,$ff01,$fffa,$0006,$ff01
	dc.w $ff01,$fff4,$000c,$ff01,$ff01,$ffee,$0012,$ff01
	dc.w $ff02,$ffe7,$0019,$ff02,$ff03,$ffe1,$001f,$ff03
	dc.w $ff03,$ffdb,$0025,$ff03,$ff04,$ffd5,$002b,$ff04
	dc.w $ff06,$ffcf,$0031,$ff06,$ff07,$ffc8,$0038,$ff07
	dc.w $ff08,$ffc3,$003d,$ff08,$ff0a,$ffbc,$0044,$ff0a
	dc.w $ff0c,$ffb6,$004a,$ff0c,$ff0e,$ffb0,$0050,$ff0e
	dc.w $ff10,$ffaa,$0056,$ff10,$ff12,$ffa5,$005b,$ff12
	dc.w $ff14,$ff9f,$0061,$ff14,$ff17,$ff99,$0067,$ff17
	dc.w $ff19,$ff93,$006d,$ff19,$ff1c,$ff8e,$0072,$ff1c
	dc.w $ff1f,$ff88,$0078,$ff1f,$ff22,$ff83,$007d,$ff22
	dc.w $ff25,$ff7d,$0083,$ff25,$ff28,$ff78,$0088,$ff28
	dc.w $ff2c,$ff72,$008e,$ff2c,$ff2f,$ff6d,$0093,$ff2f
	dc.w $ff33,$ff68,$0098,$ff33,$ff37,$ff63,$009d,$ff37
	dc.w $ff3b,$ff5e,$00a2,$ff3b,$ff3f,$ff59,$00a7,$ff3f
	dc.w $ff43,$ff55,$00ab,$ff43,$ff47,$ff50,$00b0,$ff47
	dc.w $ff4c,$ff4c,$00b4,$ff4c,$ff50,$ff47,$00b9,$ff50
	dc.w $ff55,$ff43,$00bd,$ff55,$ff59,$ff3f,$00c1,$ff59
	dc.w $ff5e,$ff3b,$00c5,$ff5e,$ff63,$ff37,$00c9,$ff63
	dc.w $ff68,$ff33,$00cd,$ff68,$ff6d,$ff2f,$00d1,$ff6d
	dc.w $ff72,$ff2c,$00d4,$ff72,$ff78,$ff28,$00d8,$ff78
	dc.w $ff7d,$ff25,$00db,$ff7d,$ff83,$ff22,$00de,$ff83
	dc.w $ff88,$ff1f,$00e1,$ff88,$ff8e,$ff1c,$00e4,$ff8e
	dc.w $ff93,$ff19,$00e7,$ff93,$ff99,$ff17,$00e9,$ff99
	dc.w $ff9f,$ff14,$00ec,$ff9f,$ffa5,$ff12,$00ee,$ffa5
	dc.w $ffaa,$ff10,$00f0,$ffaa,$ffb0,$ff0e,$00f2,$ffb0
	dc.w $ffb6,$ff0c,$00f4,$ffb6,$ffbc,$ff0a,$00f6,$ffbc
	dc.w $ffc3,$ff08,$00f8,$ffc3,$ffc8,$ff07,$00f9,$ffc8
	dc.w $ffcf,$ff06,$00fa,$ffcf,$ffd5,$ff04,$00fc,$ffd5
	dc.w $ffdb,$ff03,$00fd,$ffdb,$ffe1,$ff03,$00fd,$ffe1
	dc.w $ffe7,$ff02,$00fe,$ffe7,$ffee,$ff01,$00ff,$ffee
	dc.w $fff4,$ff01,$00ff,$fff4,$fffa,$ff01,$00ff,$fffa
	dc.w $0000,$ff00,$0100,$0000,$0006,$ff01,$00ff,$0006
	dc.w $000c,$ff01,$00ff,$000c,$0012,$ff01,$00ff,$0012
	dc.w $0019,$ff02,$00fe,$0019,$001f,$ff03,$00fd,$001f
	dc.w $0025,$ff03,$00fd,$0025,$002b,$ff04,$00fc,$002b
	dc.w $0031,$ff06,$00fa,$0031,$0038,$ff07,$00f9,$0038
	dc.w $003d,$ff08,$00f8,$003d,$0044,$ff0a,$00f6,$0044
	dc.w $004a,$ff0c,$00f4,$004a,$0050,$ff0e,$00f2,$0050
	dc.w $0056,$ff10,$00f0,$0056,$005b,$ff12,$00ee,$005b
	dc.w $0061,$ff14,$00ec,$0061,$0067,$ff17,$00e9,$0067
	dc.w $006d,$ff19,$00e7,$006d,$0072,$ff1c,$00e4,$0072
	dc.w $0078,$ff1f,$00e1,$0078,$007d,$ff22,$00de,$007d
	dc.w $0083,$ff25,$00db,$0083,$0088,$ff28,$00d8,$0088
	dc.w $008e,$ff2c,$00d4,$008e,$0093,$ff2f,$00d1,$0093
	dc.w $0098,$ff33,$00cd,$0098,$009d,$ff37,$00c9,$009d
	dc.w $00a2,$ff3b,$00c5,$00a2,$00a7,$ff3f,$00c1,$00a7
	dc.w $00ab,$ff43,$00bd,$00ab,$00b0,$ff47,$00b9,$00b0
	dc.w $00b4,$ff4c,$00b4,$00b4,$00b9,$ff50,$00b0,$00b9
	dc.w $00bd,$ff55,$00ab,$00bd,$00c1,$ff59,$00a7,$00c1
	dc.w $00c5,$ff5e,$00a2,$00c5,$00c9,$ff63,$009d,$00c9
	dc.w $00cd,$ff68,$0098,$00cd,$00d1,$ff6d,$0093,$00d1
	dc.w $00d4,$ff72,$008e,$00d4,$00d8,$ff78,$0088,$00d8
	dc.w $00db,$ff7d,$0083,$00db,$00de,$ff83,$007d,$00de
	dc.w $00e1,$ff88,$0078,$00e1,$00e4,$ff8e,$0072,$00e4
	dc.w $00e7,$ff93,$006d,$00e7,$00e9,$ff99,$0067,$00e9
	dc.w $00ec,$ff9f,$0061,$00ec,$00ee,$ffa5,$005b,$00ee
	dc.w $00f0,$ffaa,$0056,$00f0,$00f2,$ffb0,$0050,$00f2
	dc.w $00f4,$ffb6,$004a,$00f4,$00f6,$ffbc,$0044,$00f6
	dc.w $00f8,$ffc3,$003d,$00f8,$00f9,$ffc8,$0038,$00f9
	dc.w $00fa,$ffcf,$0031,$00fa,$00fc,$ffd5,$002b,$00fc
	dc.w $00fd,$ffdb,$0025,$00fd,$00fd,$ffe1,$001f,$00fd
	dc.w $00fe,$ffe7,$0019,$00fe,$00ff,$ffee,$0012,$00ff
	dc.w $00ff,$fff4,$000c,$00ff,$00ff,$fffa,$0006,$00ff

;==============================================
loc_022490:
	tst.b ($124,a5)
	bne.w loc_022544
	move.w ($138,a5),d0
	move.w loc_0224a4(pc,d0.w),d1
	jmp loc_0224a4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0224a4:
	dc.w loc_0224dc-loc_0224a4
	dc.w loc_0224ac-loc_0224a4
	dc.w loc_0224be-loc_0224a4
	dc.w loc_0224d0-loc_0224a4

;==============================================
loc_0224ac:
	lea.l (p4memory,a5),a6
	bsr.b loc_0224e6
	lea.l (p3memory,a5),a6
	bsr.b loc_0224e6
	lea.l (p1memory,a5),a6
	bra.b loc_0224e6

;==============================================
loc_0224be:
	lea.l (p4memory,a5),a6
	bsr.b loc_0224e6
	lea.l (p3memory,a5),a6
	bsr.b loc_0224e6
	lea.l (p2memory,a5),a6
	bra.b loc_0224e6

;==============================================
loc_0224d0:
	lea.l (p4memory,a5),a6
	bsr.b loc_0224e6
	lea.l (p3memory,a5),a6
	bsr.b loc_0224e6

loc_0224dc:
	lea.l (p2memory,a5),a6
	bsr.b loc_0224e6
	lea.l (p1memory,a5),a6

loc_0224e6:
	tst.b (a6)
	beq.b loc_022544
	tst.b (1,a6)
	beq.b loc_022544
	tst.b ($d1,a6)
	bne.b loc_022544
	tst.l ($264,a6)
	beq.b loc_022544
	move.w ($64,a6),d2
	bsr.w loc_021b6e
	moveq #0,d0
	movea.l ($1c,a6),a0
	move.b ($e,a0),d0
	beq.b loc_022544
	lsl.w #2,d0
	movea.l ($264,a6),a4
	lea.l (a4,d0.w),a4
	move.w (a4),d0
	add.w d0,d0
	lea.l loc_2e514c,a0
	move.w (a0,d0.w),d0
	movea.l (4,a0,d0.w),a0
	move.w (2,a4),d0
	tst.b ($b,a6)
	beq.b loc_022538
	neg.w d0

loc_022538:
	add.w d0,d4
	move.w (a0)+,d0
	move.w loc_022546(pc,d0.w),d0
	jmp loc_022546(pc,d0.w)

loc_022544:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_022546:
	dc.w loc_02255a-loc_022546
	dc.w loc_0225ac-loc_022546
	dc.w loc_02260a-loc_022546
	dc.w loc_022678-loc_022546
	dc.w loc_02150c-loc_022546;efc6
	dc.w loc_02150c-loc_022546
	dc.w loc_02150c-loc_022546
	dc.w loc_02150c-loc_022546

	dc.w loc_02150c-loc_022546
	dc.w loc_02150c-loc_022546


;==============================================
loc_02255a:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.b loc_0225aa
	sub.w d5,d7
	subq.w #1,d5
	move.w (a0)+,d3
	move.b ($b,a6),d2
	lsl.b #5,d2
	andi.b #$20,d2
	or.b d2,d3
	movea.l (a0)+,a1

loc_022574:
	movem.w (a1)+,d0-d1
	swap d4
	add.w d4,d1
	btst #5,d3
	beq.b loc_022588
	neg.w d0
	subi.w #$10,d0

loc_022588:
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($d0,a6),d0
	ori.w #$6000,d1
	move.w (a0)+,d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_022574

loc_0225aa:
	rts

;==============================================
loc_0225ac:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.b loc_022608
	sub.w d5,d7
	move.w (a0)+,d5
	movea.l (a0)+,a1

loc_0225b8:
	movem.w (a1)+,d0-d1
	move.b ($b,a6),d3
	lsl.b #5,d3
	andi.b #$20,d3
	swap d4
	add.w d4,d1
	btst #5,d3
	beq.b loc_0225e0
	move.b (2,a0),d2
	andi.w #$f,d2
	addq.w #1,d2
	lsl.w #4,d2
	neg.w d0
	sub.w d2,d0

loc_0225e0:
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($d0,a6),d0
	ori.w #$6000,d1
	move.l (a0)+,d2
	eor.b d3,d2
	move.w d2,d3
	swap d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_0225b8

loc_022608:
	rts

;==============================================
loc_02260a:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_022676
	sub.w d5,d7
	subq.w #1,d5
	move.w (a0)+,d3
	move.b ($b,a6),d2
	lsl.b #5,d2
	andi.b #$20,d2
	or.b d2,d3
	movem.w (a0)+,d0-d1
	swap d4
	add.w d1,d4
	btst #5,d3
	beq.b loc_022634
	neg.w d0

loc_022634:
	swap d4
	add.w d0,d4
	lea.l loc_0229ae(pc),a1

loc_02263c:
	move.w (a0)+,d2
	movem.w (a1,d2.w),d0-d1
	swap d4
	add.w d4,d1
	btst #5,d3
	beq.b loc_022654
	neg.w d0
	subi.w #$10,d0

loc_022654:
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($d0,a6),d0
	ori.w #$6000,d1
	move.w (a0)+,d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_02263c

loc_022676:
	rts

;==============================================
loc_022678:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_0226f6
	sub.w d5,d7
	move.w (a0)+,d5
	movem.w (a0)+,d0-d1
	move.b ($b,a6),d3
	lsl.b #5,d3
	swap d4
	add.w d1,d4
	btst #5,d3
	beq.b loc_02269a
	neg.w d0

loc_02269a:
	swap d4
	add.w d0,d4
	lea.l loc_0229ae(pc),a1

loc_0226a2:
	move.w (a0)+,d2
	movem.w (a1,d2.w),d0-d1
	move.b ($b,a6),d3
	lsl.b #5,d3
	andi.b #$20,d3
	swap d4
	add.w d4,d1
	btst #5,d3
	beq.b loc_0226ce
	move.b (2,a0),d2
	andi.w #$f,d2
	addq.w #1,d2
	lsl.w #4,d2
	neg.w d0
	sub.w d2,d0

loc_0226ce:
	swap d4
	add.w d4,d0
	andi.w #$3ff,d0
	andi.w #$3ff,d1
	or.w ($d0,a6),d0
	ori.w #$6000,d1
	move.l (a0)+,d2
	eor.b d3,d2
	move.w d2,d3
	swap d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_0226a2

loc_0226f6:
	rts

;==============================================
loc_0226f8:
	lea.l ($5e00,a5),a6
	tst.b (a6)
	beq.b loc_022736
	tst.b (1,a6)
	beq.b loc_022736
	lea.l ($20,a6),a4
	bsr.w loc_022738
	lea.l ($30,a6),a4
	bsr.w loc_022738
	lea.l ($40,a6),a4
	bsr.w loc_022738
	lea.l ($50,a6),a4
	bsr.w loc_022738
	lea.l ($60,a6),a4
	bsr.w loc_022738
	lea.l ($70,a6),a4
	bra.w loc_022738

loc_022736:
	rts

;==============================================
loc_022738:
	tst.b (a4)
	beq.b loc_022736
	movea.l ($a,a4),a0
	movea.l (4,a0),a0
	move.w (a0)+,d0
	move.w loc_02274e(pc,d0.w),d0
	jmp loc_02274e(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02274e:
	dc.w loc_022766-loc_02274e
	dc.w loc_0227ae-loc_02274e
	dc.w loc_0227ee-loc_02274e
	dc.w loc_022848-loc_02274e
	dc.w loc_02289a-loc_02274e
	dc.w loc_02150c-loc_02274e
	dc.w loc_02150c-loc_02274e
	dc.w loc_02150c-loc_02274e

	dc.w loc_02150c-loc_02274e
	dc.w loc_02150c-loc_02274e
	dc.w loc_0228de-loc_02274e
	dc.w loc_02293a-loc_02274e

;==============================================
loc_022766:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_0227ac
	sub.w d5,d7
	subq.w #1,d5
	move.l #$e0006000,d2
	move.l #$3ff03ff,d3
	move.l (2,a4),d4
	move.w (a0)+,d1
	swap d1
	movea.l (a0)+,a1

loc_022788:
	swap d4
	move.w (a1)+,d0
	add.w d4,d0
	swap d0
	swap d4
	move.w (a1)+,d0
	add.w d4,d0
	and.l d3,d0
	or.l d2,d0
	move.w (a0)+,d1
	swap d1
	movem.l d0-d1,(a2)
	swap d1
	lea.l (8,a2),a2
	dbra d5,loc_022788

loc_0227ac:
	rts

;==============================================
loc_0227ae:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_0227ec
	sub.w d5,d7
	move.w (a0)+,d5
	movea.l (a0)+,a1
	move.l #$e0006000,d2
	move.l #$3ff03ff,d3
	move.l (2,a4),d4

loc_0227cc:
	swap d4
	move.w (a1)+,d0
	add.w d4,d0
	swap d0
	swap d4
	move.w (a1)+,d0
	add.w d4,d0
	and.l d3,d0
	or.l d2,d0
	move.l (a0)+,d1
	movem.l d0-d1,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_0227cc

loc_0227ec:
	rts

;==============================================
loc_0227ee:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_022846
	sub.w d5,d7
	subq.w #1,d5
	move.w (a0)+,d1
	swap d1
	movem.w (a0)+,d2-d3
	move.l (2,a4),d4
	add.w d3,d4
	swap d4
	add.w d2,d4
	move.l #$e0006000,d2
	move.l #$3ff03ff,d3
	lea.l loc_0229ae(pc),a1

loc_02281c:
	move.w (a0)+,d1
	move.w (a1,d1.w),d0
	add.w d4,d0
	swap d4
	swap d0
	move.w (2,a1,d1.w),d0
	add.w d4,d0
	swap d4
	and.l d3,d0
	or.l d2,d0
	move.w (a0)+,d1
	swap d1
	movem.l d0-d1,(a2)
	swap d1
	lea.l (8,a2),a2
	dbra d5,loc_02281c

loc_022846:
	rts

;==============================================
loc_022848:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_022898
	sub.w d5,d7
	move.w (a0)+,d5
	movem.w (a0)+,d2-d3
	move.l (2,a4),d4
	add.w d3,d4
	swap d4
	add.w d2,d4
	move.l #$e0006000,d2
	move.l #$3ff03ff,d3
	lea.l loc_0229ae(pc),a1

loc_022872:
	move.w (a0)+,d1
	move.w (a1,d1.w),d0
	add.w d4,d0
	swap d4
	swap d0
	move.w (2,a1,d1.w),d0
	add.w d4,d0
	swap d4
	and.l d3,d0
	or.l d2,d0
	move.l (a0)+,d1
	movem.l d0-d1,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_022872

loc_022898:
	rts

;==============================================
loc_02289a:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_0228dc
	sub.w d5,d7
	move.w (a0)+,d5
	move.l #$e0002000,d2
	move.l #$3ff03ff,d3
	move.l (2,a4),d4

loc_0228b6:
	move.l (a0)+,d1
	move.l (a0)+,d0
	add.w d4,d0
	swap d0
	swap d4
	add.w d4,d0
	swap d0
	and.l d3,d0
	or.l d2,d0
	swap d4
	addi.l #$6c000000,d1
	movem.l d0-d1,(a2)
	lea.l (8,a2),a2
	dbra d5,loc_0228b6

loc_0228dc:
	rts

;==============================================
loc_0228de:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_022938
	sub.w d5,d7
	movem.w (a0)+,d5-d6
	move.w (4,a4),d1
	ori.w #$2000,d1

loc_0228f4:
	cmpi.w #$20f0,d1
	bcs.b loc_022908
	tst.b (1,a4)
	bne.b loc_022908
	andi.w #$f,d1
	addi.w #$2000,d1

loc_022908:
	andi.w #$23ff,d1
	move.w d5,d4
	move.w (2,a4),d0
	ori.w #$e000,d0

loc_022916:
	move.w (a0)+,d3
	move.w (a0)+,d2
	beq.b loc_022928
	addi.w #$6c00,d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2

loc_022928:
	addi.w #$10,d0
	dbra d4,loc_022916
	addi.w #$10,d1
	dbra d6,loc_0228f4

loc_022938:
	rts

;==============================================
loc_02293a:
	move.w (a0)+,d5
	cmp.w d5,d7
	bcs.w loc_022994
	sub.w d5,d7
	move.w (a0)+,d5
	move.w (a0)+,d6
	move.w (2,a4),d0
	ori.w #$e000,d0

loc_022950:
	cmpi.w #$e1c0,d0
	bcs.b loc_022964
	tst.b (1,a4)
	bne.b loc_022964
	andi.w #$f,d0
	addi.w #$e030,d0

loc_022964:
	andi.w #$e3ff,d0
	move.w d5,d4
	move.w (4,a4),d1
	ori.w #$2000,d1

loc_022972:
	move.w (a0)+,d3
	move.w (a0)+,d2
	beq.b loc_022984
	addi.w #$6c00,d2
	movem.w d0-d3,(a2)
	lea.l (8,a2),a2

loc_022984:
	addi.w #$10,d1
	dbra d4,loc_022972
	addi.w #$10,d0
	dbra d6,loc_022950

loc_022994:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_022996:
	dc.w $e0e4,$6ece,$e0ec,$6ecf,$e0fc,$6ec3,$e104,$6ec1
	dc.w $e10c,$6ed2,$e114,$6ec4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0229ae:
	dc.w $0000,$0000,$0010,$0000,$0020,$0000,$0030,$0000
	dc.w $0040,$0000,$0050,$0000,$0060,$0000,$0070,$0000
	dc.w $0080,$0000,$0090,$0000,$00a0,$0000,$00b0,$0000
	dc.w $00c0,$0000,$00d0,$0000,$00e0,$0000,$00f0,$0000
	dc.w $0000,$0010,$0010,$0010,$0020,$0010,$0030,$0010
	dc.w $0040,$0010,$0050,$0010,$0060,$0010,$0070,$0010
	dc.w $0080,$0010,$0090,$0010,$00a0,$0010,$00b0,$0010
	dc.w $00c0,$0010,$00d0,$0010,$00e0,$0010,$00f0,$0010
	dc.w $0000,$0020,$0010,$0020,$0020,$0020,$0030,$0020
	dc.w $0040,$0020,$0050,$0020,$0060,$0020,$0070,$0020
	dc.w $0080,$0020,$0090,$0020,$00a0,$0020,$00b0,$0020
	dc.w $00c0,$0020,$00d0,$0020,$00e0,$0020,$00f0,$0020
	dc.w $0000,$0030,$0010,$0030,$0020,$0030,$0030,$0030
	dc.w $0040,$0030,$0050,$0030,$0060,$0030,$0070,$0030
	dc.w $0080,$0030,$0090,$0030,$00a0,$0030,$00b0,$0030
	dc.w $00c0,$0030,$00d0,$0030,$00e0,$0030,$00f0,$0030
	dc.w $0000,$0040,$0010,$0040,$0020,$0040,$0030,$0040
	dc.w $0040,$0040,$0050,$0040,$0060,$0040,$0070,$0040
	dc.w $0080,$0040,$0090,$0040,$00a0,$0040,$00b0,$0040
	dc.w $00c0,$0040,$00d0,$0040,$00e0,$0040,$00f0,$0040
	dc.w $0000,$0050,$0010,$0050,$0020,$0050,$0030,$0050
	dc.w $0040,$0050,$0050,$0050,$0060,$0050,$0070,$0050
	dc.w $0080,$0050,$0090,$0050,$00a0,$0050,$00b0,$0050
	dc.w $00c0,$0050,$00d0,$0050,$00e0,$0050,$00f0,$0050
	dc.w $0000,$0060,$0010,$0060,$0020,$0060,$0030,$0060
	dc.w $0040,$0060,$0050,$0060,$0060,$0060,$0070,$0060
	dc.w $0080,$0060,$0090,$0060,$00a0,$0060,$00b0,$0060
	dc.w $00c0,$0060,$00d0,$0060,$00e0,$0060,$00f0,$0060
	dc.w $0000,$0070,$0010,$0070,$0020,$0070,$0030,$0070
	dc.w $0040,$0070,$0050,$0070,$0060,$0070,$0070,$0070
	dc.w $0080,$0070,$0090,$0070,$00a0,$0070,$00b0,$0070
	dc.w $00c0,$0070,$00d0,$0070,$00e0,$0070,$00f0,$0070
	dc.w $0000,$0080,$0010,$0080,$0020,$0080,$0030,$0080
	dc.w $0040,$0080,$0050,$0080,$0060,$0080,$0070,$0080
	dc.w $0080,$0080,$0090,$0080,$00a0,$0080,$00b0,$0080
	dc.w $00c0,$0080,$00d0,$0080,$00e0,$0080,$00f0,$0080
	dc.w $0000,$0090,$0010,$0090,$0020,$0090,$0030,$0090
	dc.w $0040,$0090,$0050,$0090,$0060,$0090,$0070,$0090
	dc.w $0080,$0090,$0090,$0090,$00a0,$0090,$00b0,$0090
	dc.w $00c0,$0090,$00d0,$0090,$00e0,$0090,$00f0,$0090
	dc.w $0000,$00a0,$0010,$00a0,$0020,$00a0,$0030,$00a0
	dc.w $0040,$00a0,$0050,$00a0,$0060,$00a0,$0070,$00a0
	dc.w $0080,$00a0,$0090,$00a0,$00a0,$00a0,$00b0,$00a0
	dc.w $00c0,$00a0,$00d0,$00a0,$00e0,$00a0,$00f0,$00a0
	dc.w $0000,$00b0,$0010,$00b0,$0020,$00b0,$0030,$00b0
	dc.w $0040,$00b0,$0050,$00b0,$0060,$00b0,$0070,$00b0
	dc.w $0080,$00b0,$0090,$00b0,$00a0,$00b0,$00b0,$00b0
	dc.w $00c0,$00b0,$00d0,$00b0,$00e0,$00b0,$00f0,$00b0
	dc.w $0000,$00c0,$0010,$00c0,$0020,$00c0,$0030,$00c0
	dc.w $0040,$00c0,$0050,$00c0,$0060,$00c0,$0070,$00c0
	dc.w $0080,$00c0,$0090,$00c0,$00a0,$00c0,$00b0,$00c0
	dc.w $00c0,$00c0,$00d0,$00c0,$00e0,$00c0,$00f0,$00c0
	dc.w $0000,$00d0,$0010,$00d0,$0020,$00d0,$0030,$00d0
	dc.w $0040,$00d0,$0050,$00d0,$0060,$00d0,$0070,$00d0
	dc.w $0080,$00d0,$0090,$00d0,$00a0,$00d0,$00b0,$00d0
	dc.w $00c0,$00d0,$00d0,$00d0,$00e0,$00d0,$00f0,$00d0
	dc.w $0000,$00e0,$0010,$00e0,$0020,$00e0,$0030,$00e0
	dc.w $0040,$00e0,$0050,$00e0,$0060,$00e0,$0070,$00e0
	dc.w $0080,$00e0,$0090,$00e0,$00a0,$00e0,$00b0,$00e0
	dc.w $00c0,$00e0,$00d0,$00e0,$00e0,$00e0,$00f0,$00e0
	dc.w $0000,$00f0,$0010,$00f0,$0020,$00f0,$0030,$00f0
	dc.w $0040,$00f0,$0050,$00f0,$0060,$00f0,$0070,$00f0
	dc.w $0080,$00f0,$0090,$00f0,$00a0,$00f0,$00b0,$00f0
	dc.w $00c0,$00f0,$00d0,$00f0,$00e0,$00f0,$00f0,$00f0

;==============================================
loc_022dae:
	tst.b ($15c,a5)
	bne.w loc_022e36
	moveq #0,d0
	move.l d0,($4d8,a5)
	move.l d0,($8d8,a5)
	move.l d0,($cd8,a5)
	move.l d0,($10d8,a5)
	move.w d0,($4e0,a5)
	move.w d0,($8e0,a5)
	move.w d0,($ce0,a5)
	move.w d0,($10e0,a5)
	move.b d0,($6a5,a5)
	move.b d0,($aa5,a5)
	move.b d0,($ea5,a5)
	move.b d0,($12a5,a5)
	tst.b ($10e,a5)
	bmi.w loc_022e36
	tst.b ($107,a5)
	bmi.w loc_022e36
	move.b ($4ab,a5),d0
	or.b ($8ab,a5),d0
	bne.b loc_022e36
	lea.l (p1memory,a5),a1
	bsr.w loc_0249a4
	lea.l (p2memory,a5),a1
	bsr.w loc_0249a4
	lea.l (p3memory,a5),a1
	bsr.w loc_0249a4
	lea.l (p4memory,a5),a1
	bsr.w loc_0249a4
	bsr.w loc_024d6c
	bsr.w loc_022e3a
	bsr.w loc_024bf0
	bsr.w loc_024c76
	bsr.w loc_024082

loc_022e36:
	moveq #0,d0
	rts

;==============================================
loc_022e3a:
	lea.l (p1memory,a5),a6
	btst.b #1,($4cf,a5)
	beq.b loc_022e4e
	lea.l (p2memory,a5),a1
	bsr.w loc_022f54

loc_022e4e:
	btst.b #2,($4cf,a5)
	beq.b loc_022e5e
	lea.l (p3memory,a5),a1
	bsr.w loc_022f54

loc_022e5e:
	btst.b #3,($4cf,a5)
	beq.b loc_022e6e
	lea.l (p4memory,a5),a1
	bsr.w loc_022f54

loc_022e6e:
	lea.l (p2memory,a5),a6
	btst.b #0,($8cf,a5)
	beq.b loc_022e82
	lea.l (p1memory,a5),a1
	bsr.w loc_022f54

loc_022e82:
	btst.b #2,($8cf,a5)
	beq.b loc_022e92
	lea.l (p3memory,a5),a1
	bsr.w loc_022f54

loc_022e92:
	btst.b #3,($8cf,a5)
	beq.b loc_022ea2
	lea.l (p4memory,a5),a1
	bsr.w loc_022f54

loc_022ea2:
	lea.l (p3memory,a5),a6
	btst.b #0,($ccf,a5)
	beq.b loc_022eb6
	lea.l (p1memory,a5),a1
	bsr.w loc_022f54

loc_022eb6:
	btst.b #1,($ccf,a5)
	beq.b loc_022ec6
	lea.l (p2memory,a5),a1
	bsr.w loc_022f54

loc_022ec6:
	lea.l (p4memory,a5),a6
	btst.b #0,($10cf,a5)
	beq.b loc_022eda
	lea.l (p1memory,a5),a1
	bsr.w loc_022f54

loc_022eda:
	btst.b #1,($10cf,a5)
	beq.b loc_022eea
	lea.l (p2memory,a5),a1
	bsr.w loc_022f54

loc_022eea:
	move.w ($138,a5),d0
	move.w loc_022ef6(pc,d0.w),d1
	jmp loc_022ef6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_022ef6:
	dc.w loc_022efe-loc_022ef6
	dc.w loc_022f0a-loc_022ef6
	dc.w loc_022f22-loc_022ef6
	dc.w loc_022f3a-loc_022ef6

;==============================================
loc_022efe:
	lea.l (p1memory,a5),a6
	lea.l (p2memory,a5),a1
	bra.w loc_023104

loc_022f0a:
	lea.l (p1memory,a5),a6
	lea.l (p3memory,a5),a1
	bsr.w loc_023104
	lea.l (p1memory,a5),a6
	lea.l (p4memory,a5),a1
	bra.w loc_023104

loc_022f22:
	lea.l (p2memory,a5),a6
	lea.l (p3memory,a5),a1
	bsr.w loc_023104
	lea.l (p2memory,a5),a6
	lea.l (p4memory,a5),a1
	bra.w loc_023104

loc_022f3a:
	lea.l (p1memory,a5),a6
	lea.l (p3memory,a5),a1
	bsr.w loc_023104
	lea.l (p2memory,a5),a6
	lea.l (p3memory,a5),a1
	bra.w loc_023104

loc_022f52:
	rts

;==============================================
loc_022f54:
	move.w a6,(-$5cd6,a5)
	move.w a6,(-$5cd2,a5)
	move.w a1,(-$5cd4,a5)
	move.w a1,(-$5cd0,a5)
	clr.b ($ea,a6)
	tst.b (a6)
	beq.w loc_023100
	tst.b ($67,a6)
	bne.w loc_023100
	tst.b ($a8,a6)
	bne.w loc_023100
	bsr.w loc_024d34
	beq.w loc_023100

loc_022f86:
	movea.l ($1c,a1),a0
	tst.b ($dd,a6)
	beq.b loc_022f9e
	bmi.b loc_022fb8
	cmpi.b #$ff,($d,a0)
	bne.w loc_023100
	bra.b loc_022fb8

loc_022f9e:
	tst.b ($d,a0)
	bpl.b loc_022fb8
	cmpi.b #$fe,($d,a0)
	beq.w loc_022fb8
	cmpi.b #$ff,($d,a0)
	beq.w loc_023100

loc_022fb8:
	movea.l ($1c,a6),a0
	move.b (9,a0),d0
	beq.w loc_023100
	lsl.w #5,d0
	movea.l ($a0,a6),a3
	lea.l (a3,d0.w),a3
	move.b ($e,a3),d0
	tst.b (8,a6)
	bne.w loc_022fee
	moveq #0,d1
	move.b ($5a,a6),d1
	lea.l ($25a,a1),a0
	move.b (a0,d1.w),d1
	cmp.b d1,d0
	beq.w loc_023100

loc_022fee:
	move.l ($c8,a1),(-$5cce,a5)
	beq.w loc_0230ee
	move.b (-$5cce,a5),d0
	beq.b loc_02304a
	andi.w #$ff,d0
	lsl.w #3,d0
	movea.l ($90,a1),a2
	lea.l (a2,d0.w),a2
	bsr.w loc_0246fc
	bhi.b loc_02304a
	addq.b #1,($ea,a6)
	move.w ($2da,a1),d0
	move.w d0,($2e8,a1)
	move.w ($2dc,a1),($2ea,a1)
	sub.w ($2dc,a1),d0
	bpl.b loc_02302c
	neg.w d0

loc_02302c:
	move.w d0,($2e2,a1)
	move.w ($2de,a1),d0
	move.w d0,($2ec,a1)
	move.w ($2e0,a1),($2ee,a1)
	sub.w ($2e0,a1),d0
	bpl.b loc_023046
	neg.w d0

loc_023046:
	add.w d0,($2e2,a1)

loc_02304a:
	move.b (-$5ccd,a5),d0
	beq.b loc_02309c
	andi.w #$ff,d0
	lsl.w #3,d0
	movea.l ($94,a1),a2
	lea.l (a2,d0.w),a2
	bsr.w loc_0246fc
	bhi.b loc_02309c
	addq.b #2,($ea,a6)
	move.w ($2da,a1),d0
	move.w d0,($2f0,a1)
	move.w ($2dc,a1),($2f2,a1)
	sub.w ($2dc,a1),d0
	bpl.b loc_02307e
	neg.w d0

loc_02307e:
	move.w d0,($2e4,a1)
	move.w ($2de,a1),d0
	move.w d0,($2f4,a1)
	move.w ($2e0,a1),($2f6,a1)
	sub.w ($2e0,a1),d0
	bpl.b loc_023098
	neg.w d0

loc_023098:
	add.w d0,($2e4,a1)

loc_02309c:
	move.b (-$5ccc,a5),d0
	beq.b loc_0230ee
	andi.w #$ff,d0
	lsl.w #3,d0
	movea.l ($98,a1),a2
	lea.l (a2,d0.w),a2
	bsr.w loc_0246fc
	bhi.b loc_0230ee
	addq.b #4,($ea,a6)
	move.w ($2da,a1),d0
	move.w d0,($2f8,a1)
	move.w ($2dc,a1),($2fa,a1)
	sub.w ($2dc,a1),d0
	bpl.b loc_0230d0
	neg.w d0

loc_0230d0:
	move.w d0,($2e6,a1)
	move.w ($2de,a1),d0
	move.w d0,($2fc,a1)
	move.w ($2e0,a1),($2fe,a1)
	sub.w ($2e0,a1),d0
	bpl.b loc_0230ea
	neg.w d0

loc_0230ea:
	add.w d0,($2e6,a1)

loc_0230ee:
	tst.b ($ea,a6)
	beq.b loc_023100
	move.l a3,($d8,a1)
	move.w a6,($e0,a1)
	moveq #1,d0
	rts

loc_023100:
	moveq #0,d0
	rts

;==============================================
loc_023104:
	tst.b (a6)
	beq.w loc_023252
	tst.b (a1)
	beq.w loc_023252
	tst.b ($2a5,a6)
	bne.w loc_023252
	tst.b ($2a5,a1)
	bne.w loc_023252
	tst.l ($d8,a6)
	beq.w loc_02322a
	tst.l ($d8,a1)
	beq.w loc_0231ec
	movea.l ($d8,a6),a0
	move.b ($19,a0),d0
	movea.l ($d8,a1),a0
	move.b ($19,a0),d1
	tst.b ($eb,a6)
	beq.b loc_023150
	tst.b ($eb,a1)
	bne.b loc_023158
	bra.w loc_0231d8

loc_023150:
	tst.b ($eb,a1)
	bne.w loc_023216

loc_023158:
	cmp.b d0,d1
	beq.w loc_0231a6
	move.b d0,d2
	move.b d1,d3
	andi.w #$f0,d0
	andi.w #$f0,d1
	cmp.b d1,d0
	bne.w loc_0231a6
	andi.w #$f,d2
	andi.w #$f,d3
	move.w d2,d4
	sub.w d3,d4
	bpl.w loc_023182
	neg.w d4

loc_023182:
	add.w d4,d4
	lea.l loc_0253a8(pc),a0
	move.w (a0,d4.w),d4
	jsr RNGFunction
	andi.w #$f,d0
	btst.l d0,d4
	bne.w loc_0231a6
	cmp.b d3,d2
	bcs.w loc_023216
	bra.w loc_0231d8

loc_0231a6:
	move.w a6,(-$5cd6,a5)
	move.w a6,(-$5cd2,a5)
	move.w a1,(-$5cd4,a5)
	move.w a1,(-$5cd0,a5)
	movea.l ($d8,a1),a3
	bsr.w loc_023254
	dc.w $cd49 ;exg.l a6,a1
	move.w a6,(-$5cd6,a5)
	move.w a6,(-$5cd2,a5)
	move.w a1,(-$5cd4,a5)
	move.w a1,(-$5cd0,a5)
	movea.l ($d8,a1),a3
	bra.w loc_023254

loc_0231d8:
	move.b #6,($2ad,a1)
	move.b #$12,($2ae,a1)
	move.b #$c,($27b,a1)
	bra.b loc_0231f2

loc_0231ec:
	tst.l ($d8,a6)
	beq.b loc_023252

loc_0231f2:
	movea.w ($e0,a6),a0
	cmpa.w a1,a0
	bne.w loc_023252
	dc.w $cd49 ;exg.l a6,a1
	move.w a6,(-$5cd6,a5)
	move.w a6,(-$5cd2,a5)
	move.w a1,(-$5cd4,a5)
	move.w a1,(-$5cd0,a5)
	movea.l ($d8,a1),a3
	bra.w loc_023254

loc_023216:
	move.b #6,($2ad,a6)
	move.b #$12,($2ae,a6)
	move.b #$c,($27b,a6)
	bra.b loc_023230

loc_02322a:
	tst.l ($d8,a1)
	beq.b loc_023252

loc_023230:
	movea.w ($e0,a1),a0
	cmpa.w a6,a0
	bne.w loc_023252
	move.w a6,(-$5cd6,a5)
	move.w a6,(-$5cd2,a5)
	move.w a1,(-$5cd4,a5)
	move.w a1,(-$5cd0,a5)
	movea.l ($d8,a1),a3
	bra.w loc_023254

loc_023252:
	rts

;==============================================
loc_023254:
	clr.w (-$5cbc,a5)
	bsr.w loc_023278
	tst.w (-$5cbc,a5)
	bne.b loc_023276
	bsr.w loc_023ecc
	bsr.w loc_023d02
	bsr.w loc_024520
	bsr.w loc_024680
	bra.w loc_02469e

loc_023276:
	rts

;==============================================
loc_023278:
	moveq #0,d0
	lea.l ($25a,a1),a0
	move.b ($5a,a6),d0
	move.b ($e,a3),(a0,d0.w)
	andi.b #$7f,(a0,d0.w)
	moveq #0,d0
	movea.l ($1c,a1),a0
	move.b ($d,a0),d0
	ble.w loc_0232a4
	cmpi.b #4,d0
	bcc.w loc_02339c

loc_0232a4:
	bsr.w loc_0251f0
	move.b #1,($5b,a6)
	clr.b ($1af,a5)
	move.b #$b4,($2cb,a1)
	move.b #$5a,($24b,a1)
	clr.b ($df,a1)
	clr.b ($26c,a1)
	clr.b ($23a,a1)
	clr.b ($239,a1)
	clr.w (-$5cbe,a5)
	clr.w (-$5cba,a5)
	tst.b ($2ce,a1)
	beq.w loc_0232e6
	clr.b ($2ce,a1)
	clr.b ($2cf,a1)

loc_0232e6:
	cmpi.b #8,(8,a6)
	beq.b loc_0232fc
	moveq #0,d0
	move.b ($5a,a6),d0
	lea.l ($280,a1),a0
	addq.b #1,(a0,d0.w)

loc_0232fc:
	move.b ($a,a3),($29f,a1)
	move.b ($1c,a3),($df,a1)
	tst.b (8,a6)
	beq.b loc_02331e
	cmpi.b #$22,(2,a6)
	bne.b loc_02331e
	move.b #0,($57,a1)
	bra.b loc_023324

loc_02331e:
	move.b (9,a3),($57,a1)

loc_023324:
	tst.b ($28d,a1)
	bne.b loc_023330
	move.b ($3e,a6),($28d,a1)

loc_023330:
	bsr.w loc_023db2
	move.l #$2020000,(4,a1)
	bsr.w loc_023394
	bmi.w loc_023384
	bne.w loc_023366
	moveq #0,d0
	movea.l ($1c,a1),a0
	move.b ($d,a0),d0
	ble.w loc_023384
	tst.b ($24e,a1)
	bne.w loc_023384
	bsr.w loc_023e26
	beq.w loc_023384

loc_023366:
	move.b #1,($1af,a5)
	move.b #$ff,($55,a1)
	move.b #$78,($24b,a1)
	move.b #$1e,($278,a1)
	bsr.w loc_0239a8
	bra.b loc_023388

loc_023384:
	bsr.w loc_023588

loc_023388:
	bsr.w loc_023e76
	bsr.w loc_023c8e
	bra.w loc_023df2

loc_023394:
	moveq #0,d0
	rts

loc_023398:
	moveq #-1,d0
	rts

loc_02339c:
	subq.w #4,d0
	lsl.w #1,d0
	move.w loc_0233a8(pc,d0.w),d1
	jmp loc_0233a8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0233a8:
	dc.w loc_0233b4-loc_0233a8
	dc.w loc_02343c-loc_0233a8
	dc.w loc_023488-loc_0233a8
	dc.w loc_0234de-loc_0233a8
	dc.w loc_023510-loc_0233a8
	dc.w loc_023542-loc_0233a8

;==============================================
loc_0233b4:
	tst.b (8,a6)
	bne.w loc_0232a4
	move.b ($b,a6),d0
	cmp.b ($b,a1),d0
	beq.w loc_0232a4
	tst.b ($31,a6)
	bne.b loc_0233e6
	btst.b #1,($ea,a6)
	beq.w loc_0232a4
	btst.b #1,($15,a3)
	bne.w loc_023430
	bra.w loc_0232a4

loc_0233e6:
	btst.b #0,($ea,a6)
	beq.w loc_0232a4
	cmpi.b #$10,(6,a6)
	beq.w loc_0232a4
	cmpi.b #$e,(6,a6)
	beq.w loc_0232a4
	tst.w ($44,a6)
	bpl.w loc_0232a4
	move.w ($14,a6),d0
	sub.w ($14,a1),d0
	cmpi.w #$40,d0
	bcs.w loc_0232a4
	move.w ($10,a6),d0
	sub.w ($10,a1),d0
	bpl.b loc_023428
	neg.w d0

loc_023428:
	cmpi.w #$50,d0
	bcc.w loc_0232a4

loc_023430:
	move.w #1,(-$5cbc,a5)
	jmp loc_03f940

;==============================================
loc_02343c:
	cmpi.b #1,($132,a1)
	bne.w loc_0232a4
	btst.b #0,($15,a3)
	bne.w loc_0232a4
	cmpi.b #1,($e,a3)
	bne.w loc_0232a4
	tst.b (8,a6)
	bne.b loc_023468
	tst.b ($31,a6)
	bne.w loc_0232a4

loc_023468:
	cmpi.b #3,($27e,a1)
	bcc.w loc_0232a4
	move.w #1,(-$5cbc,a5)
	move.b #0,($2c8,a6)
	move.b ($9,a3),($27f,a1)
	bra.w loc_02357e

;==============================================
loc_023488:
	cmpi.b #1,($132,a1)
	bne.w loc_0232a4
	btst.b #0,($15,a3)
	bne.w loc_0232a4
	btst.b #1,($15,a3)
	bne.w loc_0232a4
	cmpi.b #1,($e,a3)
	bne.w loc_0232a4
	tst.b (8,a6)
	bne.b loc_0234be
	tst.b ($31,a6)
	bne.w loc_0232a4

loc_0234be:
	cmpi.b #3,($27e,a1)
	bcc.w loc_0232a4
	move.w #1,(-$5cbc,a5)
	move.b #1,($2c8,a6)
	move.b (9,a3),($27f,a1)
	bra.w loc_02357e

;==============================================
loc_0234de:
	tst.b (8,a6)
	bne.w loc_0232a4
	move.b ($b,a6),d0
	cmp.b ($b,a1),d0
	beq.w loc_0232a4
	cmpi.b #2,($13,a3)
	beq.w loc_0232a4
	tst.b ($2c8,a6)
	bne.w loc_0232a4
	move.w #1,(-$5cbc,a5)
	jmp loc_06a216

;==============================================
loc_023510:
	tst.b (8,a6)
	bne.w loc_0232a4
	move.b ($b,a6),d0
	cmp.b ($b,a1),d0
	beq.w loc_0232a4
	cmpi.b #2,($13,a3)
	beq.w loc_0232a4
	tst.b ($2c8,a6)
	beq.w loc_0232a4
	move.w #1,(-$5cbc,a5)
	jmp loc_06a216

;==============================================
loc_023542:
	tst.b (8,a6)
	bne.w loc_0232a4
	move.b ($b,a6),d0
	cmp.b ($b,a1),d0
	beq.w loc_0232a4
	btst.b #0,($ea,a6)
	beq.w loc_0232a4
	tst.b ($13,a3)
	bne.w loc_0232a4
	btst.b #1,($15,a3)
	beq.w loc_0232a4
	move.w #1,(-$5cbc,a5)
	jmp loc_05b29c

;==============================================
loc_02357e:
	move.l #$2000c0a,(4,a1)
	rts

;==============================================
loc_023588:
	bsr.w loc_024500
	move.b #1,($23b,a1)
	tst.b ($28d,a1)
	bne.b loc_0235ac
	moveq #$c,d0
	cmpi.b #0,($13,a3)
	beq.b loc_0235ae
	moveq #$12,d0
	cmpi.b #1,($13,a3)
	beq.b loc_0235ae

loc_0235ac:
	moveq #$18,d0

loc_0235ae:
	move.b d0,($26a,a1)
	bsr.w loc_023c70
	tst.b ($125,a1)
	beq.b loc_0235ca
	move.b ($127,a1),d0
	lsr.b #1,d0
	andi.w #$f,d0
	add.b d0,($26a,a1)

loc_0235ca:
	bsr.w loc_023c30
	cmpi.b #2,($270,a1)
	bne.b loc_0235dc
	move.b #3,($270,a1)

loc_0235dc:
	movea.w (-$5cd2,a5),a0
	moveq #0,d0
	move.b ($d,a3),d0
	add.w d0,d0
	tst.w ($50,a1)
	bmi.w loc_0236d0
	tst.b ($2ce,a1)
	bne.w loc_023668
	tst.b ($31,a1)
	bne.w loc_023668
	move.w loc_023608(pc,d0.w),d1
	jmp loc_023608(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_023608:
	dc.w loc_023770-loc_023608;168
	dc.w loc_023770-loc_023608;168
	dc.w loc_023770-loc_023608;168
	dc.w loc_0237ac-loc_023608;1a4
	dc.w loc_0237be-loc_023608;1b6
	dc.w loc_0237d0-loc_023608;1c8
	dc.w loc_023802-loc_023608;1fa
	dc.w loc_023814-loc_023608;20c

	dc.w loc_023826-loc_023608;21e
	dc.w loc_023858-loc_023608;250
	dc.w loc_023862-loc_023608;25a
	dc.w loc_02386c-loc_023608;264
	dc.w loc_02389e-loc_023608;296
	dc.w loc_02389e-loc_023608;296
	dc.w loc_0238ac-loc_023608;2a4
	dc.w loc_0238f2-loc_023608;2ea

	dc.w loc_0238ba-loc_023608;2b2
	dc.w loc_0238d2-loc_023608;2ca
	dc.w loc_0238f2-loc_023608;2ea
	dc.w loc_0238ea-loc_023608;2e2
	dc.w loc_0238ea-loc_023608;2e2
	dc.w loc_023900-loc_023608;2f8
	dc.w loc_0238ea-loc_023608;2e2
	dc.w loc_0238ea-loc_023608;2e2

	dc.w loc_02390e-loc_023608;306
	dc.w loc_0238f2-loc_023608;2ea
	dc.w loc_0238f2-loc_023608;2ea
	dc.w loc_0238f2-loc_023608;2ea
	dc.w loc_0238f2-loc_023608;2ea
	dc.w loc_0238f2-loc_023608;2ea
	dc.w loc_02392a-loc_023608;322
	dc.w loc_0237d0-loc_023608;1c8

	dc.w loc_02394a-loc_023608;342
	dc.w loc_023962-loc_023608;35a
	dc.w loc_023770-loc_023608;168
	dc.w loc_023770-loc_023608;168
	dc.w loc_023770-loc_023608;168
	dc.w loc_023770-loc_023608;168
	dc.w loc_023770-loc_023608;168
	dc.w loc_023770-loc_023608;168

	dc.w loc_023770-loc_023608;168
	dc.w loc_023770-loc_023608;168
	dc.w loc_023770-loc_023608;168
	dc.w loc_023770-loc_023608;168
	dc.w loc_023770-loc_023608;168
	dc.w loc_023770-loc_023608;168
	dc.w loc_023770-loc_023608;168
	dc.w loc_023770-loc_023608;168

;==============================================
loc_023668:
	move.w loc_023670(pc,d0.w),d1
	jmp loc_023670(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_023670:
	dc.w loc_023876-loc_023670;206
	dc.w loc_023876-loc_023670;206
	dc.w loc_023876-loc_023670;206
	dc.w loc_023876-loc_023670;206
	dc.w loc_023876-loc_023670;206
	dc.w loc_023876-loc_023670;206
	dc.w loc_023876-loc_023670;206
	dc.w loc_023876-loc_023670;206

	dc.w loc_023876-loc_023670;206
	dc.w loc_023876-loc_023670;206
	dc.w loc_023876-loc_023670;206
	dc.w loc_023876-loc_023670;206
	dc.w loc_023876-loc_023670;206
	dc.w loc_02389e-loc_023670;22e
	dc.w loc_02389e-loc_023670;22e
	dc.w loc_02389e-loc_023670;22e

	dc.w loc_02389e-loc_023670;22e
	dc.w loc_02389e-loc_023670;22e
	dc.w loc_0238f2-loc_023670;282
	dc.w loc_023900-loc_023670;290
	dc.w loc_023900-loc_023670;290
	dc.w loc_023900-loc_023670;290
	dc.w loc_02390e-loc_023670;29e
	dc.w loc_02390e-loc_023670;29e

	dc.w loc_02390e-loc_023670;29e
	dc.w loc_0238f2-loc_023670;282
	dc.w loc_0238f2-loc_023670;282
	dc.w loc_0238f2-loc_023670;282
	dc.w loc_0238f2-loc_023670;282
	dc.w loc_02389e-loc_023670;22e
	dc.w loc_02392a-loc_023670;2ba
	dc.w loc_0238f2-loc_023670;282

	dc.w loc_02394a-loc_023670;2da
	dc.w loc_023962-loc_023670;2f2
	dc.w loc_02389e-loc_023670;22e
	dc.w loc_02389e-loc_023670;22e
	dc.w loc_02389e-loc_023670;22e
	dc.w loc_02389e-loc_023670;22e
	dc.w loc_02389e-loc_023670;22e
	dc.w loc_02389e-loc_023670;22e

	dc.w loc_02389e-loc_023670;22e
	dc.w loc_02389e-loc_023670;22e
	dc.w loc_02389e-loc_023670;22e
	dc.w loc_02389e-loc_023670;22e
	dc.w loc_02389e-loc_023670;22e
	dc.w loc_02389e-loc_023670;22e
	dc.w loc_02389e-loc_023670;22e
	dc.w loc_02389e-loc_023670;22e

;==============================================
loc_0236d0:
	tst.b ($31,a1)
	bne.b loc_0236de
	tst.b ($1af,a5)
	bne.w loc_023768

loc_0236de:
	move.b #1,($2ca,a1)
	move.b #1,($23b,a1)
	clr.b ($26e,a1)
	move.b ($d,a3),($55,a1)
	bsr.w loc_025058
	moveq #0,d0
	move.b ($d,a3),d0
	add.w d0,d0
	move.w loc_023708(pc,d0.w),d0
	jmp loc_023708(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_023708:
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214

	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214

	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_0238f2-loc_023708;1ea
	dc.w loc_023900-loc_023708;1f8
	dc.w loc_023900-loc_023708;1f8
	dc.w loc_023900-loc_023708;1f8
	dc.w loc_02390e-loc_023708;206
	dc.w loc_02390e-loc_023708;206

	dc.w loc_02390e-loc_023708;206
	dc.w loc_0238f2-loc_023708;1ea
	dc.w loc_0238f2-loc_023708;1ea
	dc.w loc_0238f2-loc_023708;1ea
	dc.w loc_0238f2-loc_023708;1ea
	dc.w loc_0238f2-loc_023708;1ea
	dc.w loc_02392a-loc_023708;222
	dc.w loc_0238f2-loc_023708;1ea

	dc.w loc_02394a-loc_023708;242
	dc.w loc_023962-loc_023708;25a
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214

	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214
	dc.w loc_02391c-loc_023708;214

;==============================================
loc_023768:
	clr.b ($26c,a1)
	bra.w loc_0237de

;==============================================
loc_023770:
	move.w ($2e2,a1),d1
	cmp.w ($2e4,a1),d1
	bcs.w loc_023794
	cmpi.b #0,($d,a3)
	beq.w loc_023802
	cmpi.b #1,($d,a3)
	beq.w loc_023814
	bra.w loc_023826

loc_023794:
	cmpi.b #0,($d,a3)
	beq.w loc_0237ac
	cmpi.b #1,($d,a3)
	beq.w loc_0237be
	bra.w loc_0237d0

;==============================================
loc_0237ac:
	tst.b ($2c8,a1)
	bne.w loc_023858
	move.b #3,($55,a1)
	bra.w loc_02398c

;==============================================
loc_0237be:
	tst.b ($2c8,a1)
	bne.w loc_023862
	move.b #4,($55,a1)
	bra.w loc_02398c

;==============================================
loc_0237d0:
	bsr.w loc_023970
	bne.b loc_0237f0
	tst.b ($26c,a1)
	bne.w loc_023898

loc_0237de:
	tst.b ($2c8,a1)
	bne.w loc_02386c
	move.b #5,($55,a1)
	bra.w loc_02398c

;==============================================
loc_0237f0
	tst.b ($2c8,a1)
	bne.w loc_023862
	move.b #4,($55,a1)
	bra.w loc_02398c

;==============================================
loc_023802:
	tst.b ($2c8,a1)
	bne.w loc_023858
	move.b #6,($55,a1)
	bra.w loc_02398c

;==============================================
loc_023814:
	tst.b ($2c8,a1)
	bne.w loc_023862
	move.b #7,($55,a1)
	bra.w loc_02398c

;==============================================
loc_023826:
	bsr.w loc_023970
	bne.b loc_023846
	tst.b ($26c,a1)
	bne.w loc_023898
	tst.b ($2c8,a1)
	bne.w loc_02386c
	move.b #8,($55,a1)
	bra.w loc_02398c

loc_023846:
	tst.b ($2c8,a1)
	bne.w loc_023862
	move.b #7,($55,a1)
	bra.w loc_02398c

;==============================================
loc_023858:
	move.b #9,($55,a1)
	bra.w loc_02398c

;==============================================
loc_023862:
	move.b #$a,($55,a1)
	bra.w loc_02398c

;==============================================
loc_02386c:
	move.b #$b,($55,a1)
	bra.w loc_02398c

;==============================================
loc_023876:
	tst.b ($2ca,a1)
	bne.b loc_02389e
	tst.b ($2ce,a1)
	bne.b loc_02389e
	tst.b ($13,a3)
	bne.b loc_02389e
	tst.b ($26c,a1)
	bne.w loc_02389e
	move.b #$c,($55,a1)
	rts

;==============================================
loc_023898:
	move.w #1,(-$5cba,a5)

loc_02389e:
	move.b #$d,($55,a1)
	move.b #1,($2ca,a1)
	rts

;==============================================
loc_0238ac:
	move.b #1,($2ca,a1)
	move.b ($d,a3),($55,a1)
	rts

;==============================================
loc_0238ba:
	clr.b ($2c8,a1)
	move.b #5,($55,a1)
	tst.b ($26c,a1)
	beq.b loc_0238d0
	move.b #4,($55,a1)

loc_0238d0:
	rts

;==============================================
loc_0238d2:
	clr.b ($2c8,a1)
	move.b #8,($55,a1)
	tst.b ($26c,a1)
	beq.b loc_0238e8
	move.b #7,($55,a1)

loc_0238e8:
	rts

;==============================================
loc_0238ea:
	move.b ($d,a3),($55,a1)
	rts

;==============================================
loc_0238f2:
	move.b #1,($2ca,a1)
	move.b ($d,a3),($55,a1)
	rts

;==============================================
loc_023900:
	move.b #1,($2ca,a1)
	move.b #$15,($55,a1)
	rts

;==============================================
loc_02390e:
	move.b #1,($2ca,a1)
	move.b #$18,($55,a1)
	rts

;==============================================
loc_02391c:
	move.b #1,($2ca,a1)
	move.b #$d,($55,a1)
	rts

;==============================================
loc_02392a:
	tst.b ($279,a1)
	bne.b loc_023932
	bra.b loc_02391c

loc_023932:
	move.b #$1e,($55,a1)
	clr.b ($31,a1)
	move.w ($64,a1),($14,a1)
	move.b #1,($2ca,a1)
	rts

;==============================================
loc_02394a:
	move.b #$20,($55,a1)
	clr.b ($31,a1)
	move.w ($64,a1),($14,a1)
	move.b #1,($2ca,a1)
	rts

;==============================================
loc_023962:
	move.b #1,($2ca,a1)
	move.b #$21,($55,a1)
	rts

;==============================================
loc_023970:
	tst.b (8,a6)
	bne.b loc_023988
	tst.b ($31,a6)
	beq.b loc_023988
	tst.b ($26c,a1)
	beq.w loc_023988
	moveq #1,d0
	rts

loc_023988:
	moveq #0,d0
	rts

;==============================================
loc_02398c:
	tst.b (8,a6)
	bne.w loc_0239a6
	tst.b ($31,a6)
	beq.b loc_0239a6
	cmpi.b #3,($57,a1)
	bcc.b loc_0239a6
	clr.b ($57,a1)

loc_0239a6:
	rts

;==============================================
loc_0239a8:
	tst.w ($138,a5)
	bne.w loc_023a7e
	tst.b ($f0,a1)
	bne.w loc_023a7e
	moveq #0,d3
	movea.w (-$5cd2,a5),a0
	move.b ($1a,a3),d1
	bne.b loc_0239c8
	move.b (8,a3),d1

loc_0239c8:
	andi.w #$7f,d1
	tst.b ($8,a6)
	beq.b loc_0239d4
	lsr.w #1,d1

loc_0239d4:
	cmpi.b #0,($13,a3)
	bne.b loc_023a0c
	tst.b ($31,a0)
	bne.b loc_023a08
	tst.b ($2c8,a0)
	bne.b loc_0239f8
	movea.l #loc_0c7cda,a0
	andi.w #$7f,d1
	move.b (a0,d1.w),d1
	bra.b loc_023a38

loc_0239f8:
	movea.l #loc_0c7bda,a0
	andi.w #$7f,d1
	move.b (a0,d1.w),d1
	bra.b loc_023a38

loc_023a08:
	lsr.b #1,d1
	bra.b loc_023a38

loc_023a0c:
	cmpi.b #2,($13,a3)
	beq.b loc_023a24
	movea.l #loc_0c77da,a0
	andi.w #$7f,d1
	move.b (a0,d1.w),d1
	bra.b loc_023a38

loc_023a24:
	move.b d1,d0
	lsr.b #2,d0
	sub.b d0,d1
	movea.l #loc_0c77da,a0
	andi.w #$7f,d1
	move.b (a0,d1.w),d1

loc_023a38:
	bsr.w loc_023a80
	add.b d1,d3
	beq.b loc_023a42
	bpl.b loc_023a44

loc_023a42:
	moveq #1,d3

loc_023a44:
	movea.l ($1c,a1),a0
	bsr.w loc_023aea
	bsr.w loc_023b3a
	bsr.w loc_023ba4
	tst.b d3
	bne.b loc_023a5a
	moveq #1,d3

loc_023a5a:
	move.b d3,($29a,a1)
	add.b d3,($24d,a1)
	add.b d3,($24f,a1)
	move.b ($24c,a1),d0
	cmp.b ($24d,a1),d0
	bcc.b loc_023a7e
	move.b ($5a,a1),d0
	bset.b d0,($26e,a1)
	move.b #1,($25d,a1)

loc_023a7e:
	rts

;==============================================
loc_023a80:
	movea.w (-$5cd2,a5),a0
	moveq #0,d2
	moveq #0,d0
	move.b ($102,a0),d0
	movea.l #loc_0c5f9a,a0
	move.b (a0,d0.w),d0
	bpl.b loc_023a9c
	moveq #1,d2
	neg.b d0

loc_023a9c:
	lsl.w #7,d0
	movea.l #loc_0c70da,a0
	lea.l (a0,d0.w),a0
	move.b (a0,d1.w),d0
	tst.b d2
	beq.b loc_023ab2
	neg.b d0

loc_023ab2:
	add.b d0,d1
	move.b d1,d2
	moveq #0,d0
	movea.w (-$5cd2,a5),a0
	move.b ($102,a0),d0
	movea.l #loc_0c5fba,a0
	move.b (a0,d0.w),d0
	lsl.w #5,d0
	movea.l #loc_0c5fda,a0
	lea.l (a0,d0.w),a0
	jsr RNGFunction
	andi.w #$1f,d0
	move.b (a0,d0.w),d0
	add.b d0,d2
	move.b d2,d1
	rts

;==============================================
loc_023aea:
	moveq #0,d1
	move.b ($15,a3),d1
	lsl.w #2,d1
	add.b ($d,a0),d1
	move.b loc_023b02(pc,d1.w),d1
	move.w loc_023b22(pc,d1.w),d1
	jmp loc_023b22(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_023b02
	dc.b $00,$00,$02,$04,$00,$00,$00,$00,$00,$00,$00,$02,$00,$00,$00,$00
	dc.b $00,$00,$02,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

loc_023b22:
	dc.w loc_023b28-loc_023b22
	dc.w loc_023b2a-loc_023b22
	dc.w loc_023b32-loc_023b22

;==============================================
loc_023b28:
	rts

;==============================================
loc_023b2a:
	move.b d3,d1
	lsr.b #2,d1
	add.b d1,d3
	rts

;==============================================
loc_023b32:
	move.b d3,d1
	lsr.b #1,d1
	add.b d1,d3
	rts

;==============================================
loc_023b3a:
	moveq #0,d0
	move.b (PL_charid,a1),d0
	movea.l #loc_0c5f7a,a0
	move.b (a0,d0.w),d0
	cmpi.b #Cody_id,(PL_Charid,a1)
	bne.b loc_023b5e
	cmpi.b #Vism_ID,(PL_ism_choice,a1)
	bne.b loc_023b5e
	subi.b #$10,d0

loc_023b5e:
	moveq #0,d1
	move.b (pl_blockstring_counter,a1),d1
	lsl.b #2,d1
	add.b d1,d0
	bpl.b loc_023b88
	neg.b d0
	cmpi.b #$21,d0
	bcs.b loc_023b74
	moveq #$20,d0

loc_023b74:
	lsl.w #7,d0
	movea.l #loc_0c70da,a0
	lea.l (a0,d0.w),a0
	move.b (a0,d3.w),d1
	add.b d1,d3
	rts

loc_023b88:
	cmpi.b #$21,d0
	bcs.b loc_023b90
	moveq #$20,d0

loc_023b90:
	lsl.w #7,d0
	movea.l #loc_0c70da,a0
	lea.l (a0,d0.w),a0
	move.b (a0,d3.w),d1
	sub.b d1,d3
	rts

;==============================================
loc_023ba4:
	tst.b ($125,a1)
	bne.b loc_023c0c
	tst.w (-$5cbe,a5)
	bne.b loc_023c0c
	movea.w (-$5cd2,a5),a0
	tst.b ($125,a0)
	bne.b loc_023bc0
	tst.w ($378,a0)
	bne.b loc_023c0c

loc_023bc0:
	moveq #0,d1
	tst.w ($378,a1)
	bne.b loc_023be4
	moveq #1,d1
	move.w ($374,a1),d0
	not.w d0
	and.w ($372,a1),d0
	bne.b loc_023be4
	moveq #2,d1
	move.w ($376,a1),d0
	not.w d0
	and.w ($374,a1),d0
	beq.b loc_023c0c

loc_023be4:
	move.b #4,($2ad,a1)
	move.b #$16,($2ae,a1)
	moveq #8,d0
	cmpi.b #$10,($297,a1)
	bcc.b loc_023c04
	move.b ($297,a1),d0
	add.b d1,d0
	move.b loc_023c0e(pc,d0.w),d0

loc_023c04:
	move.w loc_023c26(pc,d0.w),d0
	jmp loc_023c26(pc,d0.w)

loc_023c0c:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_023c0e:
	dc.b $00,$00,$00,$00,$02,$02,$02,$02,$04,$04,$04,$04
	dc.b $04,$04,$04,$04,$06,$06,$06,$06,$06,$06,$06,$06

loc_023c26:
	dc.w loc_02442e-loc_023c26
	dc.w loc_024436-loc_023c26
	dc.w loc_02443e-loc_023c26
	dc.w loc_024446-loc_023c26
	dc.w loc_02444e-loc_023c26

;==============================================
loc_023c30:
	tst.w ($50,a1)
	bmi.b loc_023c6e
	tst.b ($28d,a1)
	bne.b loc_023c6e
	move.b ($c,a3),d0
	tst.b ($26c,a1)
	beq.b loc_023c4c
	move.b d0,d1
	lsr.b #2,d1
	add.b d1,d0

loc_023c4c:
	add.b d0,($2cc,a1)
	move.b ($2cc,a1),d0
	cmp.b ($2cd,a1),d0
	bcs.w loc_023c6e
	move.b #1,($2ce,a1)
	addq.b #5,($2cd,a1)
	clr.b ($2cb,a1)
	clr.b ($2cc,a1)

loc_023c6e:
	rts

;==============================================
loc_023c70:
	moveq #0,d1
	move.b ($1b,a3),d1
	add.b d1,($26a,a1)
	move.b ($26a,a1),d1
	tst.b ($26c,a1)
	bne.b loc_023c86
	lsr.b #1,d1

loc_023c86:
	lsr.b #1,d1
	move.b d1,($26b,a1)
	rts

;==============================================
loc_023c8e:
	move.b ($b,a6),($66,a1)
	move.b ($b,a3),d0
	bmi.b loc_023cee
	cmpi.b #2,d0
	beq.b loc_023cb6
	eor.b d0,($66,a1)
	bra.b loc_023d00

loc_023ca6:
	moveq #0,d0
	tst.w ($40,a1)
	bmi.b loc_023cb0
	moveq #1,d0

loc_023cb0:
	move.b d0,($66,a1)
	bra.b loc_023d00

loc_023cb6:
	moveq #0,d1
	move.w ($10,a1),d0
	sub.w ($290,a5),d0
	cmpi.w #$c0,d0
	bgt.b loc_023cc8
	moveq #1,d1

loc_023cc8:
	move.b d1,($66,a1)
	bra.b loc_023d00
	move.b ($3c,a6),($66,a1)
	bra.b loc_023d00
	movea.w (-$5cd2,a5),a0
	moveq #0,d0
	move.w ($10,a0),d1
	cmp.w ($10,a1),d1
	bcc.b loc_023ce8
	addq.b #1,d0

loc_023ce8:
	move.b d0,($66,a1)
	rts

loc_023cee:
	moveq #0,d0
	move.w ($10,a6),d1
	cmp.w ($10,a1),d1
	bcc.b loc_023cfc
	addq.b #1,d0

loc_023cfc:
	move.b d0,($66,a1)

loc_023d00:
	rts

;==============================================
loc_023d02:
	moveq #0,d0
	move.b ($10,a3),d0
	bmi.w loc_023da8
	tst.b ($68,a6)
	bne.b loc_023d42
	lsl.w #2,d0
	lea.l loc_025328(pc),a0
	tst.b ($55,a1)
	bpl.b loc_023d22
	lea.l loc_02532a(pc),a0

loc_023d22:
	lea.l (a0,d0.w),a0
	tst.b ($26e,a1)
	bne.w loc_023d8a
	tst.b ($28d,a1)
	bne.b loc_023d44
	move.b (a0)+,($5f,a6)
	move.b (a0),($5f,a1)
	tst.w (-$5cba,a5)
	bne.b loc_023d60

loc_023d42:
	rts

loc_023d44:
	move.b (a0)+,d0
	lsr.b #1,d0
	move.b d0,($5f,a6)
	tst.b (8,a6)
	bne.b loc_023d5a
	move.b (a0),d0
	lsr.b #1,d0
	move.b d0,($5f,a1)

loc_023d5a:
	tst.w (-$5cba,a5)
	beq.b loc_023d42

loc_023d60:
	addi.b #$10,($5f,a6)
	addi.b #$10,($5f,a1)
	cmpi.b #$1e,($5f,a6)
	bcs.b loc_023d7a
	move.b #$1e,($5f,a6)

loc_023d7a:
	cmpi.b #$1e,($5f,a1)
	bcs.b loc_023d88
	move.b #$1e,($5f,a1)

loc_023d88:
	rts

loc_023d8a:
	move.b (a0)+,d0
	cmpi.b #$10,d0
	bcc.b loc_023d94
	moveq #$10,d0

loc_023d94:
	move.b d0,($5f,a6)
	move.b (a0),d0
	cmpi.b #$10,d0
	bcc.b loc_023da2
	moveq #$10,d0

loc_023da2:
	move.b d0,($5f,a1)
	rts

loc_023da8:
	clr.b ($5f,a6)
	clr.b ($5f,a1)
	rts

;==============================================
loc_023db2:
	moveq #3,d1
	tst.b ($28d,a1)
	bne.b loc_023dcc
	moveq #2,d1
	tst.b ($31,a1)
	bmi.b loc_023dcc
	moveq #1,d1
	bsr.w loc_023dd2
	bne.b loc_023dcc
	moveq #0,d1

loc_023dcc:
	move.b d1,($25f,a1)
	rts

;==============================================
loc_023dd2:
	tst.b ($a9,a1)
	beq.b loc_023dee
	tst.b ($c7,a1)
	bmi.b loc_023dee
	move.b #1,($26c,a1)
	move.w #1,(-$5cbe,a5)
	moveq #1,d0
	rts

loc_023dee:
	moveq #0,d0
	rts

;==============================================
loc_023df2:
	move.l a6,($1a8,a5)
	moveq #0,d0
	move.b ($11,a3),d0
	tst.b ($55,a1)
	bpl.b loc_023e04
	lsr.b #1,d0

loc_023e04:
	movea.w (-$5cd2,a5),a6
	jsr loc_02ef6c
	tst.b ($55,a1)
	bmi.b loc_023e20
	movea.w (-$5cd0,a5),a6
	moveq #3,d0
	jsr loc_02ef6c

loc_023e20:
	movea.l ($1a8,a5),a6
	rts

;==============================================
loc_023e26:
	cmpi.b #4,d0
	beq.w loc_023e72
	cmpi.b #7,d0
	beq.w loc_023e72
	cmpi.b #8,d0
	beq.w loc_023e72
	cmpi.b #9,d0
	beq.w loc_023e72
	move.b ($15,a3),d1
	beq.b loc_023e6e
	cmpi.b #5,d0
	beq.b loc_023e60
	cmpi.b #6,d0
	beq.b loc_023e68
	subq.b #1,d0
	btst.l d0,d1
	bne.b loc_023e72
	bra.b loc_023e6e

loc_023e60:
	btst #0,d1
	bne.b loc_023e72
	bra.b loc_023e6e

loc_023e68:
	btst #1,d1
	bne.b loc_023e72

loc_023e6e:
	moveq #1,d0
	rts

loc_023e72:
	moveq #0,d0
	rts

;==============================================
loc_023e76:
	tst.b (8,a6)
	beq.b loc_023eca
	move.b #1,($2a5,a1)
	cmpi.b #$17,(2,a6)
	beq.b loc_023eca
	cmpi.b #$22,(2,a6)
	beq.b loc_023eca
	movea.w (-$5cd2,a5),a0
	move.b #1,($239,a0)
	move.b #$ff,($239,a1)
	cmpi.b #$ff,($55,a1)
	beq.b loc_023eca
	tst.w ($50,a1)
	bmi.w loc_023eca
	tst.b ($d7,a6)
	beq.b loc_023eca
	move.b #$f,($11c,a5)
	move.b #2,($11d,a5)
	move.b #2,($11e,a5)

loc_023eca:
	rts

;==============================================
loc_023ecc:
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.w loc_023f22
	tst.w ($50,a1)
	bmi.w loc_023f22
	clr.w (-$5cca,a5)
	move.w #1,(-$5cc6,a5)
	moveq #0,d2
	moveq #0,d3
	move.b (8,a3),d2
	beq.b loc_023f14
	bsr.w loc_0240ea
	bsr.w loc_023f24
	cmpi.b #$ff,($55,a1)
	bne.b loc_023f10
	bsr.w loc_024456
	beq.w loc_023f18

loc_023f10:
	bsr.w loc_02424a

loc_023f14:
	move.w d3,(-$5cca,a5)

loc_023f18:
	bsr.w loc_0240bc
	tst.w ($50,a1)
	bmi.b loc_023f34

loc_023f22:
	rts

;==============================================
loc_023f24:
	tst.b ($67,a1)
	beq.b loc_023f32
	tst.b ($2ca,a1)
	bne.b loc_023f32
	lsr.w #1,d2

loc_023f32:
	rts

;==============================================
loc_023f34:
	move.w #$ffff,($50,a1)
	move.w #$ffff,($52,a1)
	clr.b ($26e,a1)
	move.l #$2020000,(4,a1)
	bsr.w loc_023f5c
	tst.b ($1af,a5)
	beq.w loc_0236d0
	bra.w loc_023588

;==============================================
loc_023f5c:
	jsr loc_009ed0
	tst.b d0
	beq.b loc_023fb4
	movea.w (-$5cd2,a5),a0
	move.b ($101,a0),($144,a5)
	bsr.w loc_023fb6
	moveq #$a,d0
	tst.b ($3e,a6)
	bne.b loc_023f92
	move.b ($17,a3),d0
	beq.b loc_023fb4
	bpl.b loc_023f92
	andi.b #$7f,d0
	tst.b ($b,a6)
	bne.b loc_023f92
	eori.b #1,d0

loc_023f92:
	subq.b #1,d0
	move.b d0,($12b,a5)
	movea.w (-$5cd2,a5),a0
	tst.b ($3e,a6)
	beq.b loc_023fae
	subi.w #$48,($11e,a0)
	bpl.b loc_023fae
	clr.w ($11e,a0)

loc_023fae:
	jmp loc_0810a8

loc_023fb4:
	rts

;==============================================
loc_023fb6:
	moveq #8,d0
	tst.b ($3e,a6)
	bne.b loc_023ff0
	move.b ($16,a3),d0
	tst.b ($132,a0)
	bpl.b loc_023fde
	cmpi.b #7,d0
	bne.w loc_023fd4
	moveq #9,d0
	bra.b loc_023ff0

loc_023fd4:
	cmpi.b #9,d0
	bcs.b loc_023ff0
	moveq #9,d0
	bra.b loc_023ff0

loc_023fde:
	cmpi.b #7,d0
	bne.w loc_023ff0
	move.b ($82,a0),d0
	lsr.b #1,d0
	addi.b #$a,d0

loc_023ff0:
	tst.b ($1af,a5)
	beq.b loc_023ffa
	ori.b #$20,d0

loc_023ffa:
	cmpi.w #$90,($50,a0)
	bne.b loc_024006
	ori.b #$40,d0

loc_024006:
	bsr.w loc_024026
	andi.w #$f,d0
	move.b loc_024016(pc,d0.w),($148,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_024016:
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $08,$06,$00,$02,$04,$00,$00,$00

;==============================================
;Juni&Juli Boss Icon
loc_024026:
	move.w ($138,a5),d1
	move.w loc_024032(pc,d1.w),d1
	jmp loc_024032(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_024032:
	dc.w loc_02403a-loc_024032
	dc.w loc_024040-loc_024032;p2 slot
	dc.w loc_024056-loc_024032;p1 slot
	dc.w loc_02406c-loc_024032;player controlled?

;==============================================
loc_02403a:
	move.b d0,($b4,a0)
	rts

;p2 bar
loc_024040:
	move.b d0,($b4,a0)
	btst.b #1,($101,a0)
	beq.b loc_024054
	move.b d0,($cb4,a5)
	move.b d0,($10b4,a5)

loc_024054:
	rts

;p1 bar
loc_024056:
	move.b d0,($b4,a0)
	btst.b #1,($101,a0)
	beq.b loc_02406a
	move.b d0,($cb4,a5)
	move.b d0,($10b4,a5)

loc_02406a:
	rts

;player control
loc_02406c:
	move.b d0,($b4,a0)
	btst.b #1,($101,a0)
	bne.b loc_024080
	move.b d0,($4b4,a5)
	move.b d0,($8b4,a5)

loc_024080:
	rts

;==============================================
loc_024082:
	lea.l (p1memory,a5),a0
	bsr.w loc_02409e
	lea.l (p2memory,a5),a0
	bsr.w loc_02409e
	lea.l (p3memory,a5),a0
	bsr.w loc_02409e
	lea.l (p4memory,a5),a0

loc_02409e:
	tst.b ($b4,a0)
	beq.b loc_0240ba
	btst.b #6,($b4,a0)
	beq.b loc_0240ba
	cmpi.w #$90,($50,a0)
	beq.b loc_0240ba
	bclr.b #6,($b4,a0)

loc_0240ba:
	rts

;==============================================
loc_0240bc:
	move.w ($50,a1),(-$5cb4,a5)
	move.w (-$5cca,a5),d4
	tst.b ($26c,a1)
	beq.b loc_0240d2
	move.w d4,d0
	lsr.w #3,d0
	add.w d0,d4

loc_0240d2:
	sub.w d4,($50,a1)
	tst.b (8,a3)
	bpl.b loc_0240e8
	moveq #0,d0
	tst.w ($50,a1)
	bpl.b loc_0240e8
	move.w d0,($50,a1)

loc_0240e8:
	rts

;==============================================
loc_0240ea:
	tst.b ($cc,a6)
	beq.b loc_0240f4
	move.b ($cc,a6),d2

loc_0240f4:
	bsr.w loc_024170
	bsr.w loc_024238
	andi.w #$7f,d2
	beq.b loc_02416a
	lsl.w #5,d2
	movea.w (-$5cd2,a5),a0
	add.b ($127,a0),d2
	movea.l #loc_0c3b3a,a0;attack damage table
	move.b (a0,d2.w),d2
	cmpi.b #2,($13,a3)
	bne.b loc_024126
	move.b d2,d0
	lsr.b #1,d0
	lsr.b #2,d2
	add.b d0,d2

loc_024126:
	moveq #0,d0
	move.b ($18,a3),d0
	movea.l #loc_0c4b3a,a0
	lsl.w #5,d0
	lea.l (a0,d0.w),a0
	jsr RNGFunction
	andi.w #$1f,d0
	move.b (a0,d0.w),d0
	add.b d0,d2
	bpl.b loc_02414c
	moveq #0,d2

loc_02414c:
	tst.b d2
	bne.b loc_024152
	moveq #1,d2

loc_024152:
	tst.b ($ec,a6)
	beq.b loc_02415e
	move.b d2,d0
	lsr.b #1,d0
	add.b d0,d2

loc_02415e:
	bsr.w loc_0244a8
	cmpi.b #$80,d2
	bcs.b loc_02416a
	moveq #$7f,d2

loc_02416a:
	andi.w #$ff,d2
	rts

;==============================================
loc_024170:
	tst.b d2
	beq.b loc_0241a4
	bmi.b loc_0241a4
	moveq #0,d0
	move.b loc_0241b8(pc,d2.w),d0
	movea.w (-$5cd2,a5),a0
	tst.b ($132,a0)
	beq.b loc_0241a4
	bmi.b loc_024192
	sub.b d0,d2
	beq.b loc_02418e
	bpl.b loc_0241a4

loc_02418e:
	moveq #1,d2
	bra.b loc_0241a4

loc_024192:
	cmpi.b #2,($13,a3)
	beq.b loc_0241a4
	add.w d0,d2
	cmpi.w #$80,d2
	bcs.b loc_0241a4
	moveq #$7f,d2

loc_0241a4:
	movea.w (-$5cd2,a5),a0
	tst.b ($eb,a0)
	beq.b loc_0241b6
	subq.b #1,d2
	beq.b loc_0241b4
	bpl.b loc_0241b6

loc_0241b4:
	moveq #1,d2

loc_0241b6:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0241b8:
	dc.b $00,$00,$00,$00,$00,$01,$01,$01,$01,$01,$02,$02,$02,$02,$02,$03
	dc.b $03,$03,$03,$03,$04,$04,$04,$04,$04,$05,$05,$05,$05,$05,$06,$06
	dc.b $06,$06,$06,$07,$07,$07,$07,$07,$08,$08,$08,$08,$08,$09,$09,$09
	dc.b $09,$09,$0a,$0a,$0a,$0a,$0a,$0b,$0b,$0b,$0b,$0b,$0c,$0c,$0c,$0c
	dc.b $0c,$0d,$0d,$0d,$0d,$0d,$0e,$0e,$0e,$0e,$0e,$0f,$0f,$0f,$0f,$0f
	dc.b $10,$10,$10,$10,$10,$11,$11,$11,$11,$11,$12,$12,$12,$12,$12,$13
	dc.b $13,$13,$13,$13,$14,$14,$14,$14,$14,$15,$15,$15,$15,$15,$16,$16
	dc.b $16,$16,$16,$17,$17,$17,$17,$17,$18,$18,$18,$18,$18,$19,$19,$19

;==============================================
loc_024238:
	tst.b (8,a6)
	beq.b loc_024248
	cmpi.b #$22,(2,a6)
	bne.b loc_024248
	lsr.b #1,d2

loc_024248:
	rts

;==============================================
loc_02424a:
	tst.b d2
	beq.w loc_024370
	moveq #0,d3
	move.b ($102,a1),d0
	andi.w #$1f,d0
	lsl.w #5,d0
	move.w d0,d4
	add.b ($127,a1),d0
	movea.l #loc_0c4f3a,a0
	move.b (a0,d0.w),d3
	cmpi.b #$ff,($132,a1)
	bne.b loc_024276
	subq.b #4,d3

loc_024276:
	tst.b ($ec,a1)
	beq.b loc_024280
	subi.b #$18,d3

loc_024280:
	bsr.w loc_024372
	moveq #$1f,d0
	cmpi.b #$1f,($5e,a1)
	bcc.b loc_0242b2
	lea.l loc_0253d8(pc),a0
	tst.b ($28d,a1)
	bne.b loc_0242a8
	moveq #0,d0
	move.b ($1d,a3),d0
	lsl.w #5,d0
	lea.l loc_0253b8(pc),a0
	lea.l (a0,d0.w),a0

loc_0242a8:
	moveq #0,d0
	move.b ($5e,a1),d0
	move.b (a0,d0.w),d0

loc_0242b2:
	add.b d0,d3
	moveq #0,d5
	move.b ($102,a1),d5
	movea.l #loc_0c5f3a,a0
	move.b (a0,d5.w),d5
	cmp.w ($50,a1),d5
	bcs.b loc_02431e
	jsr RNGFunction
	andi.w #$1f,d0
	movea.l #loc_0c573a,a0
	lea.l (a0,d4.w),a0
	move.b (a0,d0.w),d4
	add.b d4,d3
	moveq #0,d5
	move.b ($102,a1),d5
	movea.l #loc_0c5f5a,a0
	move.b (a0,d5.w),d5
	cmp.w ($50,a1),d5
	bcs.b loc_02431e
	move.b ($102,a1),d4
	andi.w #$1f,d4
	lsl.w #5,d4
	jsr RNGFunction
	andi.w #$1f,d0
	movea.l #loc_0c5b3a,a0
	lea.l (a0,d4.w),a0
	move.b (a0,d0.w),d4
	add.b d4,d3

loc_02431e:
	tst.b d3
	bpl.b loc_024340
	neg.b d3
	andi.w #$7f,d3
	lsl.w #7,d3
	movea.l #loc_0c70da,a0
	lea.l (a0,d3.w),a0
	move.b (a0,d2.w),d3
	add.b d2,d3
	andi.w #$ff,d3
	bra.b loc_024360

loc_024340
	cmpi.b #$21,d3
	bcs.b loc_024348
	moveq #$20,d3

loc_024348:
	andi.w #$ff,d3
	lsl.w #7,d3
	movea.l #loc_0c605a,a0
	lea.l (a0,d3.w),a0
	move.b (a0,d2.w),d3
	andi.w #$ff,d3

loc_024360:
	bsr.w loc_024390
	bsr.w loc_0243c2
	cmpi.w #$80,d3
	bcs.b loc_024370
	moveq #$7f,d3

loc_024370:
	rts

;==============================================
loc_024372:
	movea.w (-$5cd2,a5),a0
	move.w ($50,a1),d0
	sub.w ($50,a0),d0
	bmi.b loc_02438e
	cmpi.w #$11,d0
	bcs.b loc_02438e
	lsr.w #4,d0
	andi.w #$1f,d0
	sub.b d0,d3

loc_02438e:
	rts

;==============================================
loc_024390:
	moveq #0,d0
	move.b (Dip_Damage,a5),d0
	add.w d0,d0
	move.w loc_0243a0(pc,d0.w),d1
	jmp loc_0243a0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0243a0:
	dc.w loc_0243a8-loc_0243a0
	dc.w loc_0243b0-loc_0243a0
	dc.w loc_0243b2-loc_0243a0
	dc.w loc_0243ba-loc_0243a0

;==============================================
loc_0243a8:
	move.b d3,d0
	lsr.b #3,d0
	sub.b d0,d3
	rts

loc_0243b0:
	rts

loc_0243b2:
	move.b d3,d0
	lsr.b #3,d0
	add.b d0,d3
	rts

loc_0243ba:
	move.b d3,d0
	lsr.b #2,d0
	add.b d0,d3
	rts

;==============================================
loc_0243c2:
	tst.b ($125,a1)
	bne.b loc_024412
	tst.w (-$5cbe,a5)
	bne.b loc_024412
	tst.w ($378,a1)
	beq.b loc_024412
	movea.w (-$5cd2,a5),a0
	tst.b ($125,a0)
	bne.b loc_0243e4
	tst.w ($378,a0)
	bne.b loc_024412

loc_0243e4:
	moveq #6,d0
	cmpi.b #$16,($2ae,a1)
	beq.b loc_0243fa
	move.b #4,($2ad,a1)
	move.b #$14,($2ae,a1)

loc_0243fa:
	cmpi.b #$10,($5e,a1)
	bcc.b loc_02440a
	move.b ($5e,a1),d0
	move.b loc_024414(pc,d0.w),d0

loc_02440a:
	move.w loc_024424(pc,d0.w),d0
	jmp loc_024424(pc,d0.w)

loc_024412:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_024414:
	dc.b $00,$00,$00,$00,$02,$02,$02,$02,$04,$04,$04,$04,$04,$04,$04,$04

loc_024424:
	dc.w loc_02442e-loc_024424
	dc.w loc_024436-loc_024424
	dc.w loc_02443e-loc_024424
	dc.w loc_024446-loc_024424
	dc.w loc_02444e-loc_024424

;==============================================
loc_02442e:
	move.b d3,d0
	lsr.b #1,d0
	sub.b d0,d3
	rts

loc_024436:
	move.b d3,d0
	lsr.b #2,d0
	sub.b d0,d3
	rts

loc_02443e:
	move.b d3,d0
	lsr.b #3,d0
	sub.b d0,d3
	rts

loc_024446:
	move.b d3,d0
	lsr.b #4,d0
	sub.b d0,d3
	rts

loc_02444e:
	move.b d3,d0
	lsr.b #5,d0
	sub.b d0,d3
	rts

;==============================================
loc_024456:
	tst.b ($12,a3)
	beq.b loc_024476
	moveq #0,d0
	movea.w (-$5cd2,a5),a0
	move.b ($132,a0),d0
	add.b ($132,a1),d0
	addq.b #2,d0
	add.w d0,d0
	move.w loc_024478(pc,d0.w),d0
	jmp loc_024478(pc,d0.w)

loc_024476:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_024478:
	dc.w loc_024482-loc_024478
	dc.w loc_024482-loc_024478
	dc.w loc_02448e-loc_024478
	dc.w loc_02449a-loc_024478
	dc.w loc_02449a-loc_024478

;==============================================
loc_024482:
	addq.b #3,d2
	lsr.b #2,d2
	bne.b loc_02448a
	moveq #1,d2

loc_02448a:
	moveq #1,d0
	rts

;==============================================
loc_02448e:
	addq.b #7,d2
	lsr.b #3,d2
	bne.b loc_024496
	moveq #1,d2

loc_024496:
	moveq #1,d0
	rts

;==============================================
loc_02449a:
	addi.b #$f,d2
	lsr.b #4,d2
	bne.b loc_0244a4
	moveq #1,d2

loc_0244a4:
	moveq #1,d0
	rts

;==============================================
loc_0244a8:
	moveq #0,d0
	andi.w #$ff,d2
	tst.b (8,a6)
	bne.b loc_0244d6
	tst.b ($a9,a1)
	beq.b loc_0244cc
	move.b ($294,a6),d0
	beq.b loc_0244cc
	tst.b ($c7,a1)
	bmi.b loc_0244cc
	bsr.w loc_0244d8
	bra.b loc_0244d6

loc_0244cc:
	move.b ($294,a1),d0
	beq.b loc_0244d6
	bsr.w loc_0244d8

loc_0244d6:
	rts

;==============================================
loc_0244d8:
	add.w d0,d0
	move.w loc_0244e2(pc,d0.w),d0
	jmp loc_0244e2(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0244e2:
	dc.w loc_0244ea-loc_0244e2
	dc.w loc_0244ec-loc_0244e2
	dc.w loc_0244f0-loc_0244e2
	dc.w loc_0244f8-loc_0244e2

;==============================================
loc_0244ea:
	rts

loc_0244ec:
	lsl.w #1,d2
	rts

loc_0244f0:
	move.w d2,d0
	lsr.w #2,d0
	add.w d0,d2
	rts

loc_0244f8:
	move.w d2,d0
	lsr.w #1,d0
	add.w d0,d2
	rts

;==============================================
loc_024500:
	move.b ($5e,a1),d0
	cmpi.b #$63,d0
	beq.b loc_02451e
	addq.b #1,d0
	move.b d0,($5e,a1)
	movea.w (-$5cd2,a5),a0
	cmp.b ($115,a0),d0
	bls.b loc_02451e
	move.b d0,($115,a0)

loc_02451e:
	rts

;==============================================
loc_024520:
	move.w ($2e2,a1),d0
	cmp.w ($2e4,a1),d0
	bcs.b loc_02453a
	move.w ($2e4,a1),d0
	cmp.w ($2e6,a1),d0
	bcs.w loc_02455e
	bra.w loc_02457a

loc_02453a:
	cmp.w ($2e6,a1),d0
	bcc.w loc_02457a
	move.w ($2e8,a1),($2da,a1)
	move.w ($2ea,a1),($2dc,a1)
	move.w ($2ec,a1),($2de,a1)
	move.w ($2ee,a1),($2e0,a1)
	bra.w loc_0245b6

loc_02455e:
	move.w ($2f0,a1),($2da,a1)
	move.w ($2f2,a1),($2dc,a1)
	move.w ($2f4,a1),($2de,a1)
	move.w ($2f6,a1),($2e0,a1)
	bra.w loc_0245b6

loc_02457a:
	move.w ($2f8,a1),($2da,a1)
	move.w ($2fa,a1),($2dc,a1)
	move.w ($2fc,a1),($2de,a1)
	move.w ($2fe,a1),($2e0,a1)
	bra.b loc_0245b6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_024594:
	dc.b $1a,$00,$1a,$00,$1a,$00,$1c,$00,$1c,$00,$1c,$00,$1e,$00,$0e,$ff
	dc.b $0e,$ff,$0e,$ff,$0e,$ff,$0e,$ff,$0e,$ff,$1a,$00,$1c,$00,$1e,$00
	dc.b $0e,$ff

;==============================================
loc_0245b6:
	moveq #$18,d0
	moveq #$12,d1
	tst.b ($26e,a1)
	bne.b loc_0245e0
	move.b ($14,a3),d0
	move.b ($f,a3),d1
	tst.b ($55,a1)
	bpl.b loc_0245e0
	move.b loc_024594+1(pc,d0.w),d1
	move.b loc_024594(pc,d0.w),d0
	tst.b ($12,a3)
	bne.b loc_0245e0
	moveq #$1a,d0
	moveq #0,d1

loc_0245e0:
	bsr.w loc_02465c
	jsr loc_01c2c8
	beq.w loc_02465a
	move.l #$1000400,(a4)
	move.b d0,(3,a4)
	move.b d1,($57,a4)
	move.w a1,($36,a4)
	movea.w (-$5cd2,a5),a0
	move.b ($59,a0),($59,a4)
	clr.b ($67,a4)
	clr.w ($3a,a4)
	tst.w (-$5cbe,a5)
	beq.b loc_024624
	move.b #2,($3a,a4)
	move.b #4,($3b,a4)

loc_024624:
	tst.w ($50,a1)
	bmi.b loc_024630
	tst.w (-$5cba,a5)
	beq.b loc_024636

loc_024630:
	move.b #2,($3b,a4)

loc_024636:
	move.w ($2da,a1),d0
	sub.w ($2dc,a1),d0
	asr.w #1,d0
	add.w ($2dc,a1),d0
	move.w d0,($10,a4)
	move.w ($2de,a1),d1
	sub.w ($2e0,a1),d1
	asr.w #1,d1
	add.w ($2e0,a1),d1
	move.w d1,($14,a4)

loc_02465a:
	rts

;==============================================
loc_02465c:
	movea.w (-$5cd2,a5),a0
	cmpi.b #6,($102,a0)
	bne.b loc_02467e
	tst.b ($132,a0)
	bpl.b loc_02467e
	tst.b d1
	beq.b loc_02467e
	bmi.b loc_02467e
	cmpi.b #5,d1
	bcc.b loc_02467e
	addi.b #8,d1

loc_02467e:
	rts

;==============================================
loc_024680:
	tst.b ($55,a1)
	bpl.b loc_02469c
	move.b #$ff,($5b,a6)
	tst.b (8,a6)
	beq.b loc_02469c
	movea.w (-$5cd2,a5),a0
	move.b #$ff,($239,a0)

loc_02469c:
	rts

;==============================================
loc_02469e:
	tst.b ($141,a5)
	bne.b loc_0246fa
	movea.w (-$5cd2,a5),a0
	tst.b ($125,a0)
	bne.b loc_0246fa
	tst.b ($55,a1)
	bmi.b loc_0246fa
	tst.b ($eb,a0)
	bne.b loc_0246da
	moveq #0,d0
	move.b (8,a3),d0
	cmpi.b #$40,d0
	bcs.b loc_0246c8
	moveq #$3f,d0

loc_0246c8:
	lea.l loc_0257b8(pc),a0
	move.b (a0,d0.w),d0
	movea.w (-$5cd2,a5),a0
	jmp loc_01bb6e

loc_0246da:
	moveq #0,d0
	move.b (8,a3),d0
	cmpi.b #$40,d0
	bcs.b loc_0246e8
	moveq #$3f,d0

loc_0246e8:
	lea.l loc_0257f8(pc),a0
	move.b (a0,d0.w),d0
	movea.w (-$5cd2,a5),a0
	jmp loc_01bb6e

loc_0246fa:
	rts

;==============================================
loc_0246fc:
	movea.w (-$5cd2,a5),a0
	tst.b ($eb,a0)
	bne.w loc_0247f6
	tst.b (8,a6)
	bne.w loc_024786
	move.w (a3),d0
	tst.b ($b,a6)
	beq.w loc_02471c
	neg.w d0

loc_02471c:
	move.w (a2),d1
	tst.b ($b,a1)
	beq.w loc_024728
	neg.w d1

loc_024728:
	add.w ($10,a6),d0
	add.w ($10,a1),d1
	move.w d0,($2da,a1)
	move.w d1,($2dc,a1)
	sub.w d0,d1
	bpl.w loc_024740
	neg.w d1

loc_024740:
	move.w (4,a3),d0
	add.w (4,a2),d0
	cmp.w d0,d1
	bhi.w loc_024784
	move.w (2,a3),d0
	move.w (2,a2),d1
	add.w ($14,a6),d0
	add.w ($14,a1),d1
	move.w d0,($2de,a1)
	move.w d1,($2e0,a1)
	sub.w d0,d1
	bpl.w loc_02476e
	neg.w d1

loc_02476e:
	move.w (6,a3),d0
	add.w (6,a2),d0
	movea.w (-$5cd0,a5),a0
	tst.b ($eb,a0)
	beq.b loc_024782
	addq.w #4,d0

loc_024782:
	cmp.w d0,d1

loc_024784:
	rts

loc_024786:
	move.w (a3),d0
	tst.b ($b,a6)
	beq.w loc_024792
	neg.w d0

loc_024792:
	move.w (a2),d1
	tst.b ($b,a1)
	beq.w loc_02479e
	neg.w d1

loc_02479e:
	add.w ($10,a6),d0
	add.w ($10,a1),d1
	move.w d0,($2da,a1)
	move.w d1,($2dc,a1)
	sub.w d0,d1
	bpl.w loc_0247b6
	neg.w d1

loc_0247b6:
	move.w (4,a3),d0
	add.w (4,a2),d0
	subq.w #2,d0
	bpl.b loc_0247c4
	moveq #0,d0

loc_0247c4:
	cmp.w d0,d1
	bhi.w loc_0247f4
	move.w (2,a3),d0
	move.w (2,a2),d1
	add.w ($14,a6),d0
	add.w ($14,a1),d1
	move.w d0,($2de,a1)
	move.w d1,($2e0,a1)
	sub.w d0,d1
	bpl.w loc_0247ea
	neg.w d1

loc_0247ea:
	move.w (6,a3),d0
	add.w (6,a2),d0
	cmp.w d0,d1

loc_0247f4:
	rts

loc_0247f6:
	move.w (a3),d0
	tst.b ($b,a6)
	beq.w loc_024802
	neg.w d0

loc_024802:
	move.w (a2),d1
	tst.b ($b,a1)
	beq.w loc_02480e
	neg.w d1

loc_02480e:
	add.w ($10,a6),d0
	add.w ($10,a1),d1
	move.w d0,($2da,a1)
	move.w d1,($2dc,a1)
	sub.w d0,d1
	bpl.w loc_024826
	neg.w d1

loc_024826:
	move.w (4,a3),d0
	subq.w #4,d0
	beq.b loc_024830
	bpl.b loc_024832

loc_024830:
	moveq #1,d0

loc_024832:
	add.w (4,a2),d0
	movea.w (-$5cd0,a5),a0
	tst.b ($eb,a0)
	beq.b loc_024842
	addq.w #4,d0

loc_024842:
	cmp.w d0,d1
	bhi.w loc_024882
	move.w (2,a3),d0
	move.w (2,a2),d1
	add.w ($14,a6),d0
	add.w ($14,a1),d1
	move.w d0,($2de,a1)
	move.w d1,($2e0,a1)
	sub.w d0,d1
	bpl.w loc_024868
	neg.w d1

loc_024868:
	move.w (6,a3),d0
	subq.w #4,d0
	beq.b loc_024872
	bpl.b loc_024874

loc_024872:
	moveq #1,d0

loc_024874:
	add.w (6,a2),d0
	tst.b ($eb,a0)
	beq.b loc_024880
	addq.w #4,d0

loc_024880:
	cmp.w d0,d1

loc_024882:
	rts

;==============================================
loc_024884:
	move.w (a3),d0
	tst.b ($b,a6)
	beq.w loc_024890
	neg.w d0

loc_024890:
	move.w (a2),d1
	tst.b ($b,a1)
	beq.w loc_02489c
	neg.w d1

loc_02489c:
	add.w ($10,a6),d0
	add.w ($10,a1),d1
	sub.w d0,d1
	bpl.w loc_0248ac
	neg.w d1

loc_0248ac:
	move.w (4,a3),d0
	add.w (4,a2),d0
	cmp.w d0,d1
	bhi.w loc_0248dc
	move.w (2,a3),d0
	move.w (2,a2),d1
	add.w ($14,a6),d0
	add.w ($14,a1),d1
	sub.w d0,d1
	bpl.w loc_0248d2
	neg.w d1

loc_0248d2:
	move.w (6,a3),d0
	add.w (6,a2),d0
	cmp.w d0,d1

loc_0248dc:
	rts

;==============================================
loc_0248de:
	move.w (a3),d0
	tst.b ($b,a6)
	beq.w loc_0248ea
	neg.w d0

loc_0248ea:
	move.w (a2),d1
	tst.b ($b,a1)
	beq.w loc_0248f6
	neg.w d1

loc_0248f6:
	add.w d6,d0
	add.w ($10,a1),d1
	sub.w d0,d1
	bpl.w loc_024904
	neg.w d1

loc_024904:
	move.w (4,a3),d0
	add.w (4,a2),d0
	cmp.w d0,d1
	bhi.w loc_024934
	move.w (2,a3),d0
	move.w (2,a2),d1
	add.w ($14,a6),d0
	add.w ($14,a1),d1
	sub.w d0,d1
	bpl.w loc_02492a
	neg.w d1

loc_02492a:
	move.w (6,a3),d0
	add.w (6,a2),d0
	cmp.w d0,d1

loc_024934:
	rts

;==============================================
loc_024936:
	move.w (a3),d0
	tst.b ($b,a6)
	beq.w loc_024792
	neg.w d0
	move.w (a2),d1
	tst.b ($b,a1)
	beq.w loc_02494e
	neg.w d1

loc_02494e:
	add.w ($10,a6),d0
	add.w ($10,a1),d1
	sub.w d0,d1
	bpl.w loc_02495e
	neg.w d1

loc_02495e:
	move.w (4,a3),d0
	add.w (4,a2),d0
	cmpi.b #$ff,($132,a1)
	bne.b loc_024970
	addq.w #4,d0

loc_024970:
	cmp.w d0,d1
	bhi.w loc_0249a2
	move.w (2,a3),d0
	move.w (2,a2),d1
	add.w ($14,a6),d0
	add.w ($14,a1),d1
	sub.w d0,d1
	bpl.w loc_02498e
	neg.w d1

loc_02498e:
	move.w (6,a3),d0
	add.w (6,a2),d0
	cmpi.b #$ff,($132,a1)
	bne.b loc_0249a0
	addq.w #4,d0

loc_0249a0:
	cmp.w d0,d1

loc_0249a2:
	rts

;==============================================
loc_0249a4:
	moveq #-1,d0
	move.w d0,($2e2,a1)
	move.w d0,($2e4,a1)
	move.w d0,($2e6,a1)
	move.l d0,($2e8,a1)
	move.l d0,($2ec,a1)
	move.l d0,($2f0,a1)
	move.l d0,($2f4,a1)
	move.l d0,($2f8,a1)
	move.l d0,($2fc,a1)
	rts

;==============================================
loc_0249cc:
	move.w ($138,a5),d0
	move.w loc_0249d8(pc,d0.w),d1
	jmp loc_0249d8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0249d8:
	dc.w loc_0249e0-loc_0249d8
	dc.w loc_024a0c-loc_0249d8
	dc.w loc_024a34-loc_0249d8
	dc.w loc_024a5c-loc_0249d8

;==============================================
loc_0249e0:
	lea.l (p1memory,a5),a6
	lea.l (p2memory,a5),a4
	clr.b ($298,a6)
	clr.b ($298,a4)
	tst.b ($29d,a6)
	beq.w loc_024a80
	clr.b ($29d,a6)
	clr.b ($29d,a4)
	lea.l (p2memory,a5),a6
	lea.l (p1memory,a5),a4
	bra.w loc_024a80

loc_024a0c:
	lea.l (p1memory,a5),a6
	lea.l (p3memory,a5),a4
	clr.b ($298,a6)
	clr.b ($298,a4)
	bsr.w loc_024a80
	lea.l (p1memory,a5),a6
	lea.l (p4memory,a5),a4
	clr.b ($298,a6)
	clr.b ($298,a4)
	bra.w loc_024a80

loc_024a34:
	lea.l (p2memory,a5),a6
	lea.l (p3memory,a5),a4
	clr.b ($298,a6)
	clr.b ($298,a4)
	bsr.w loc_024a80
	lea.l (p2memory,a5),a6
	lea.l (p4memory,a5),a4
	clr.b ($298,a6)
	clr.b ($298,a4)
	bra.w loc_024a80

loc_024a5c:
	lea.l (p1memory,a5),a6
	lea.l (p3memory,a5),a4
	clr.b ($298,a6)
	clr.b ($298,a4)
	bsr.w loc_024a80
	lea.l (p2memory,a5),a6
	lea.l (p3memory,a5),a4
	clr.b ($298,a6)
	clr.b ($298,a4)

loc_024a80:
	moveq #0,d0
	move.b ($cb,a6),d0
	beq.w loc_024bb0
	moveq #0,d1
	move.b ($cb,a4),d1
	beq.w loc_024bb0
	tst.b ($67,a6)
	bne.w loc_024bb0
	tst.b ($67,a4)
	bne.w loc_024bb0
	tst.w ($50,a6)
	bmi.w loc_024bb0
	tst.w ($50,a4)
	bmi.w loc_024bb0
	movea.l ($9c,a6),a0
	movea.l ($9c,a4),a1
	lsl.w #3,d0
	lsl.w #3,d1
	lea.l (a0,d0.w),a0
	lea.l (a1,d1.w),a1
	move.w (2,a0),d0
	add.w ($14,a6),d0
	move.w (2,a1),d1
	add.w ($14,a4),d1
	moveq #0,d2
	sub.w d0,d1
	bpl.b loc_024ae2
	neg.w d1
	moveq #1,d2

loc_024ae2:
	move.w (6,a0),d0
	add.w (6,a1),d0
	sub.w d0,d1
	bpl.w loc_024bb0
	move.w (a0),d0
	tst.b ($b,a6)
	beq.b loc_024afa
	neg.w d0

loc_024afa:
	add.w ($10,a6),d0
	move.w (a1),d1
	tst.b ($b,a4)
	beq.b loc_024b08
	neg.w d1

loc_024b08:
	add.w ($10,a4),d1
	moveq #0,d2
	sub.w d0,d1
	bpl.b loc_024b16
	neg.w d1
	moveq #1,d2

loc_024b16:
	move.w (4,a0),d0
	add.w (4,a1),d0
	sub.w d0,d1
	bmi.b loc_024b28
	beq.b loc_024b28
	bra.w loc_024bb0

loc_024b28:
	addq.b #1,($298,a6)
	addq.b #1,($298,a4)
	tst.b ($de,a6)
	bne.w loc_024bb0
	tst.b ($de,a4)
	bne.w loc_024bb0
	neg.w d1
	swap d1
	tst.b ($ac,a6)
	bne.w loc_024bb2
	tst.b ($ac,a4)
	bne.w loc_024be0
	tst.b ($2d8,a6)
	bne.b loc_024b8e
	tst.b ($31,a6)
	bne.b loc_024b8e
	tst.b ($2d8,a4)
	bne.b loc_024ba6
	tst.b ($31,a4)
	bne.b loc_024ba6

loc_024b6c:
	lsr.l #1,d1
	move.l d1,d0
	neg.l d0
	tst.w d2
	beq.b loc_024b84
	move.w ($10,a6),d2
	cmp.w ($10,a4),d2
	bcs.b loc_024b84
	neg.l d0
	neg.l d1

loc_024b84:
	add.l d0,($10,a6)
	add.l d1,($10,a4)
	bra.b loc_024bb0

loc_024b8e:
	tst.b ($2d8,a4)
	bne.b loc_024b6c
	tst.b ($31,a4)
	bne.b loc_024b6c
	tst.w d2
	bne.b loc_024ba0
	neg.l d1

loc_024ba0:
	add.l d1,($10,a6)
	bra.b loc_024bb0

loc_024ba6:
	tst.w d2
	beq.b loc_024bac
	neg.l d1

loc_024bac:
	add.l d1,($10,a4)

loc_024bb0:
	rts

loc_024bb2:
	tst.b ($ac,a4)
	bne.b loc_024bc8

loc_024bb8:
	cmpi.b #1,($ac,a6)
	beq.b loc_024bc2
	neg.l d1

loc_024bc2:
	add.l d1,($10,a4)
	bra.b loc_024bb0

loc_024bc8:
	tst.b ($2d8,a6)
	bne.b loc_024be0
	tst.b ($31,a6)
	bne.b loc_024be0
	tst.b ($2d8,a4)
	bne.b loc_024bb8
	tst.b ($31,a4)
	bne.b loc_024bb8

loc_024be0:
	cmpi.b #1,($ac,a4)
	beq.b loc_024bea
	neg.l d1

loc_024bea:
	add.l d1,($10,a6)
	bra.b loc_024bb0

;==============================================
loc_024bf0:
	move.b ($6ebd,a5),d7
	beq.w loc_024c74
	subq.b #1,d7
	ext.w d7
	lea.l ($6fce,a5),a4

loc_024c00:
	movea.w -(a4),a6
	move.l a4,($1a4,a5)
	cmpi.b #1,(a6)
	bne.w loc_024c6c
	tst.b ($a8,a6)
	bne.w loc_024c6c
	move.w #4,(-$5cc0,a5)
	move.l #loc_025318,(-$5cc4,a5)

loc_024c24:
	movea.l (-$5cc4,a5),a0
	movea.l (a0),a1
	cmpi.b #1,($59,a1)
	bne.b loc_024c62
	bsr.w loc_024d34
	beq.b loc_024c62
	move.w ($36,a6),(-$5cd2,a5)
	move.w a6,(-$5cd6,a5)
	move.w a1,(-$5cd4,a5)
	move.w a1,(-$5cd0,a5)
	movea.l ($1c,a6),a0
	move.b (9,a0),d0
	beq.b loc_024c62
	clr.b ($ea,a6)
	bsr.w loc_022f86
	beq.b loc_024c62
	bsr.w loc_024cfa

loc_024c62:
	addq.l #4,(-$5cc4,a5)
	subq.w #1,(-$5cc0,a5)
	bne.b loc_024c24

loc_024c6c:
	movea.l ($1a4,a5),a4
	dbra d7,loc_024c00

loc_024c74:
	rts

;==============================================
loc_024c76:
	move.b ($6ebe,a5),d7
	beq.w loc_024cf8
	subq.b #1,d7
	ext.w d7
	lea.l ($6ffe,a5),a4

loc_024c86:
	movea.w -(a4),a6
	move.l a4,($1a4,a5)
	cmpi.b #1,(a6)
	bne.w loc_024cf0
	tst.b ($a8,a6)
	bne.w loc_024cf0
	move.w #4,(-$5cc0,a5)
	move.l #loc_025318,(-$5cc4,a5)

loc_024caa:
	movea.l (-$5cc4,a5),a0
	movea.l (a0),a1
	tst.b ($59,a1)
	bne.b loc_024ce6
	bsr.w loc_024d34
	beq.b loc_024ce6
	move.w ($36,a6),(-$5cd2,a5)
	move.w a6,(-$5cd6,a5)
	move.w a1,(-$5cd4,a5)
	move.w a1,(-$5cd0,a5)
	movea.l ($1c,a6),a0
	move.b (9,a0),d0
	beq.b loc_024ce6
	clr.b ($ea,a6)
	bsr.w loc_022f86
	beq.b loc_024ce6
	bsr.w loc_024cfa

loc_024ce6:
	addq.l #4,(-$5cc4,a5)
	subq.w #1,(-$5cc0,a5)
	bne.b loc_024caa

loc_024cf0:
	movea.l ($1a4,a5),a4
	dbra d7,loc_024c86

loc_024cf8:
	rts

;==============================================
loc_024cfa:
	movea.l ($d8,a1),a3
	bsr.w loc_023254
	tst.w (-$5cbc,a5)
	bne.b loc_024d30
	move.l #$800000,d1
	move.b (2,a6),d0
	btst.l d0,d1
	bne.b loc_024d2e
	addq.b #1,(a6)
	move.l #$2020000,(4,a6)
	subq.w #1,($50,a6)
	bpl.b loc_024d2e
	move.l #$4000000,(4,a6)

loc_024d2e:
	rts

loc_024d30:
	addq.b #1,(a6)
	rts

;==============================================
loc_024d34:
	cmpi.b #1,(a1)
	bne.w loc_024d68
	move.b ($67,a1),d0
	or.b ($25d,a1),d0
	or.b ($d6,a1),d0
	or.b ($2ce,a1),d0
	bne.w loc_024d68
	movea.l ($1c,a1),a0
	tst.b (8,a0)
	beq.w loc_023100
	tst.l ($d8,a1)
	bne.w loc_024d68
	moveq #1,d0
	rts

loc_024d68:
	moveq #0,d0
	rts

;==============================================
loc_024d6c:
	move.b ($6ebd,a5),d7
	beq.w loc_024e0e
	subq.b #1,d7
	ext.w d7
	lea.l ($6fce,a5),a4
	move.l a4,d4

loc_024d7e:
	movea.l d4,a4
	movea.w -(a4),a6
	move.l a4,d4
	move.b ($6ebe,a5),d6
	beq.w loc_024e0e
	subq.b #1,d6
	ext.w d6
	lea.l ($6ffe,a5),a4
	move.l a4,d5

loc_024d96:
	movea.l d5,a4
	movea.w -(a4),a1
	move.l a4,d5
	cmpa.w a6,a1
	beq.w loc_024e06
	tst.b ($d6,a6)
	bne.w loc_024e0a
	tst.b ($d6,a1)
	bne.w loc_024e06
	cmpi.b #$17,(2,a6)
	beq.w loc_024e0a
	cmpi.b #$17,(2,a1)
	beq.w loc_024e06
	cmpi.b #1,(a6)
	bne.w loc_024e0a
	cmpi.b #1,(a1)
	bne.w loc_024e06
	move.b ($c8,a6),d2
	beq.b loc_024e0a
	move.b ($c8,a1),d3
	beq.b loc_024e06
	movea.l ($90,a6),a3
	ext.w d2
	lsl.w #3,d2
	lea.l (a3,d2.w),a3
	movea.l ($90,a1),a2
	ext.w d3
	lsl.w #3,d3
	lea.l (a2,d3.w),a2
	bsr.w loc_024884
	bhi.b loc_024e06
	bsr.w loc_024e10
	bra.b loc_024e0a

loc_024e06:
	dbra d6,loc_024d96

loc_024e0a:
	dbra d7,loc_024d7e

loc_024e0e:
	rts

;==============================================
loc_024e10:
	moveq #0,d0
	move.b ($bd,a6),d0
	move.w loc_024e1e(pc,d0.w),d1
	jmp loc_024e1e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_024e1e:
	dc.w loc_024e2c-loc_024e1e
	dc.w loc_024e46-loc_024e1e
	dc.w loc_024e60-loc_024e1e
	dc.w loc_024e7a-loc_024e1e
	dc.w loc_024e94-loc_024e1e
	dc.w loc_024eae-loc_024e1e
	dc.w loc_024ec8-loc_024e1e

;==============================================
loc_024e2c:
	move.b ($bd,a1),d0
	move.w loc_024e38(pc,d0.w),d1
	jmp loc_024e38(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_024e38:
	dc.w loc_024ee2-loc_024e38
	dc.w loc_024ee2-loc_024e38
	dc.w loc_024f3a-loc_024e38
	dc.w loc_024ee2-loc_024e38
	dc.w loc_024f3a-loc_024e38
	dc.w loc_024ee2-loc_024e38
	dc.w loc_024ee2-loc_024e38

;==============================================
loc_024e46:
	move.b ($bd,a1),d0
	move.w loc_024e52(pc,d0.w),d1
	jmp loc_024e52(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_024e52:
	dc.w loc_024ee2-loc_024e52
	dc.w loc_024ee2-loc_024e52
	dc.w loc_024f3a-loc_024e52
	dc.w loc_024ee2-loc_024e52
	dc.w loc_024f3a-loc_024e52
	dc.w loc_024ee2-loc_024e52
	dc.w loc_024ee2-loc_024e52

;==============================================
loc_024e60:
	move.b ($bd,a1),d0
	move.w loc_024e6c(pc,d0.w),d1
	jmp loc_024e6c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_024e6c:
	dc.w loc_024f84-loc_024e6c
	dc.w loc_024f84-loc_024e6c
	dc.w loc_024ee2-loc_024e6c
	dc.w loc_024ee2-loc_024e6c
	dc.w loc_024ee2-loc_024e6c
	dc.w loc_024ee2-loc_024e6c
	dc.w loc_024ee2-loc_024e6c


;==============================================
loc_024e7a:
	move.b ($bd,a1),d0
	move.w loc_024e86(pc,d0.w),d1
	jmp loc_024e86(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_024e86:
	dc.w loc_024ee2-loc_024e86
	dc.w loc_024ee2-loc_024e86
	dc.w loc_024ee2-loc_024e86
	dc.w loc_024ee2-loc_024e86
	dc.w loc_024f3a-loc_024e86
	dc.w loc_024ee2-loc_024e86
	dc.w loc_024ee2-loc_024e86

;==============================================
loc_024e94:
	move.b ($bd,a1),d0
	move.w loc_024ea0(pc,d0.w),d1
	jmp loc_024ea0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_024ea0:
	dc.w loc_024f84-loc_024ea0
	dc.w loc_024f84-loc_024ea0
	dc.w loc_024ee2-loc_024ea0
	dc.w loc_024f84-loc_024ea0
	dc.w loc_024ee2-loc_024ea0
	dc.w loc_024ee2-loc_024ea0
	dc.w loc_024ee2-loc_024ea0

;==============================================
loc_024eae:
	move.b ($bd,a1),d0
	move.w loc_024eba(pc,d0.w),d1
	jmp loc_024eba(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_024eba:
	dc.w loc_024ee2-loc_024eba
	dc.w loc_024ee2-loc_024eba
	dc.w loc_024ee2-loc_024eba
	dc.w loc_024ee2-loc_024eba
	dc.w loc_024ee2-loc_024eba
	dc.w loc_024ee2-loc_024eba
	dc.w loc_024ee2-loc_024eba

;==============================================
loc_024ec8:
	move.b ($bd,a1),d0
	move.w loc_024ed4(pc,d0.w),d1
	jmp loc_024ed4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_024ed4:
	dc.w loc_024ee2-loc_024ed4
	dc.w loc_024ee2-loc_024ed4
	dc.w loc_024ee2-loc_024ed4
	dc.w loc_024ee2-loc_024ed4
	dc.w loc_024ee2-loc_024ed4
	dc.w loc_024ee2-loc_024ed4
	dc.w loc_024ee2-loc_024ed4

;==============================================
loc_024ee2:
	moveq #0,d0
	addq.b #1,(a6)
	cmpi.b #2,($bd,a6)
	beq.b loc_024f04
	cmpi.b #$c,($bd,a6)
	beq.b loc_024f04
	move.l #$2020000,(4,a6)
	subq.w #1,($50,a6)
	bpl.b loc_024f0e

loc_024f04:
	moveq #1,d0
	move.l #$4000000,(4,a6)

loc_024f0e:
	addq.b #1,(a1)
	cmpi.b #2,($bd,a1)
	beq.b loc_024f2e
	cmpi.b #$c,($bd,a1)
	beq.b loc_024f2e
	move.l #$2020000,(4,a1)
	subq.w #1,($50,a1)
	bpl.b loc_024f38

loc_024f2e:
	moveq #1,d0
	move.l #$4000000,(4,a1)

loc_024f38:
	rts

;==============================================
loc_024f3a:
	addq.b #1,(a1)
	move.b ($72,a1),d0
	move.l #$2040000,(4,a1)
	add.b d0,(5,a1)
	move.w a6,($6e,a1)
	addq.b #1,(a6)
	move.l #$2040000,(4,a6)
	add.b d0,(5,a6)
	eori.b #1,($59,a6)
	movea.w ($36,a6),a0
	subq.b #1,($238,a0)
	bne.b loc_024f72
	clr.w ($a4,a0)

loc_024f72:
	movea.w ($36,a1),a0
	move.w a6,($a4,a0)
	addq.b #1,($238,a0)
	move.w a0,($36,a6)
	rts

;==============================================
loc_024f84:
	addq.b #1,(a6)
	move.b ($72,a6),d0
	move.l #$2040000,(4,a6)
	add.b d0,(5,a6)
	move.w a1,($6e,a6)
	addq.b #1,(a1)
	move.l #$2040000,(4,a1)
	add.b d0,(5,a1)
	eori.b #1,($59,a1)
	movea.w ($36,a1),a0
	subq.b #1,($238,a0)
	bne.b loc_024fbc
	clr.w ($a4,a0)

loc_024fbc:
	movea.w ($36,a6),a0
	move.w a1,($a4,a0)
	addq.b #1,($238,a0)
	move.w a0,($36,a1)
	rts

;==============================================
loc_024fce:
	moveq #0,d0
	movea.l ($1c,a6),a0
	move.b (9,a0),d0
	beq.b loc_025050
	lsl.w #5,d0
	movea.l ($a0,a6),a3
	lea.l (a3,d0.w),a3
	moveq #$b,d7
	lea.l ($1400,a5),a1

loc_024fea:
	tst.b (a1)
	beq.b loc_025012
	move.b ($59,a6),d0
	cmp.b ($59,a1),d0
	beq.b loc_025012
	moveq #0,d0
	move.b ($c8,a1),d0
	beq.b loc_025012
	lsl.w #3,d0
	movea.l ($90,a1),a2
	lea.l (a2,d0.w),a2
	bsr.w loc_024884
	bcs.w loc_025054

loc_025012:
	lea.l ($100,a1),a1
	dbra d7,loc_024fea
	moveq #$b,d7
	lea.l ($2000,a5),a1

loc_025020:
	tst.b (a1)
	beq.b loc_025048
	move.b ($59,a6),d0
	cmp.b ($59,a1),d0
	beq.b loc_025048
	moveq #0,d0
	move.b ($c8,a1),d0
	beq.b loc_025048
	lsl.w #3,d0
	movea.l ($90,a1),a2
	lea.l (a2,d0.w),a2
	bsr.w loc_024884
	bcs.w loc_025054

loc_025048:
	lea.l ($100,a1),a1
	dbra d7,loc_025020

loc_025050:
	moveq #0,d0
	rts

loc_025054:
	moveq #1,d0
	rts

;==============================================
loc_025058:
	tst.b ($2a4,a1)
	bne.b loc_025076
	move.b #1,($2a4,a1)
	move.b #$f,($11c,a5)
	move.b #8,($11d,a5)
	move.b #2,($11e,a5)

loc_025076:
	rts

;==============================================
loc_025078:
	cmpi.b #1,(a6)
	bne.w loc_02508c
	move.w ($138,a5),d0
	move.w loc_02508e(pc,d0.w),d1
	jmp loc_02508e(pc,d1.w)

loc_02508c:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02508e:
	dc.w loc_025096-loc_02508e
	dc.w loc_0250aa-loc_02508e
	dc.w loc_0250c6-loc_02508e
	dc.w loc_0250e2-loc_02508e

;==============================================
loc_025096:
	lea.l (p1memory,a5),a1
	tst.b ($59,a6)
	bne.w loc_0250fa
	lea.l (p2memory,a5),a1
	bra.w loc_0250fa

loc_0250aa:
	lea.l (p1memory,a5),a1
	tst.b ($59,a6)
	bne.w loc_0250fa
	lea.l (p3memory,a5),a1
	bsr.w loc_0250fa
	lea.l (p4memory,a5),a1
	bra.w loc_0250fa

loc_0250c6:
	lea.l (p2memory,a5),a1
	tst.b ($59,a6)
	bne.w loc_0250fa
	lea.l (p3memory,a5),a1
	bsr.w loc_0250fa
	lea.l (p4memory,a5),a1
	bra.w loc_0250fa

loc_0250e2:
	lea.l (p3memory,a5),a1
	tst.b ($59,a6)
	beq.w loc_0250fa
	lea.l (p1memory,a5),a1
	bsr.w loc_0250fa
	lea.l (p2memory,a5),a1

loc_0250fa:
	tst.b ($31,a1)
	bne.b loc_02508c
	movea.l ($1c,a6),a0
	move.b ($cb,a6),d0
	beq.b loc_02508c
	ext.w d0
	lsl.w #3,d0
	movea.l ($9c,a6),a2
	lea.l (a2,d0.w),a2
	move.b ($cb,a1),d0
	beq.w loc_02508c
	ext.w d0
	lsl.w #3,d0
	movea.l ($9c,a1),a3
	lea.l (a3,d0.w),a3
	moveq #0,d1
	move.w (2,a2),d0
	add.w ($14,a6),d0
	move.w (2,a3),d1
	add.w ($14,a1),d1
	moveq #0,d2
	sub.w d0,d1
	bpl.b loc_025146
	neg.w d1
	moveq #1,d2

loc_025146:
	move.w (6,a2),d0
	add.w (6,a3),d0
	sub.w d0,d1
	bpl.b loc_025198
	move.w (a2),d0
	tst.b ($b,a6)
	beq.b loc_02515c
	neg.w d0

loc_02515c:
	add.w ($10,a6),d0
	move.w (a3),d1
	tst.b ($b,a1)
	beq.b loc_02516a
	neg.w d1

loc_02516a:
	add.w ($10,a1),d1
	moveq #0,d2
	sub.w d0,d1
	bpl.b loc_025178
	neg.w d1
	moveq #1,d2

loc_025178:
	move.w (4,a2),d0
	add.w (4,a3),d0
	sub.w d0,d1
	bpl.b loc_025198
	neg.w d1
	tst.w d2
	beq.b loc_02518c
	neg.l d1

loc_02518c:
	tst.b ($ac,a1)
	bne.w loc_02519a
	add.w d1,($10,a1)

loc_025198:
	rts

loc_02519a:
	movea.w ($38,a1),a0
	sub.w d1,($10,a0)
	sub.w d1,($10,a6)
	bra.b loc_025198

;==============================================
loc_0251a8:
	moveq #0,d0
	movea.l ($1c,a6),a0
	move.b (9,a0),d0
	beq.b loc_0251ec
	lsl.w #5,d0
	movea.l ($a0,a6),a3
	lea.l (a3,d0.w),a3
	lea.l (p1memory,a5),a1
	tst.b ($59,a6)
	bne.b loc_0251cc
	lea.l (p2memory,a5),a1

loc_0251cc:
	moveq #0,d0
	movea.l ($1c,a1),a0
	move.b (9,a0),d0
	beq.b loc_0251ec
	lsl.w #5,d0
	movea.l ($a0,a1),a2
	lea.l (a2,d0.w),a2
	bsr.w loc_0246fc
	bhi.b loc_0251ec
	moveq #1,d0
	rts

loc_0251ec:
	moveq #0,d0
	rts

;==============================================
loc_0251f0:
	tst.b (8,a6)
	bne.b loc_025202
	moveq #0,d0
	move.b ($102,a6),d0
	move.b loc_025204(pc,d0.w),($28e,a6)

loc_025202:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_025204:
	dc.b $05,$05,$04,$06,$05,$06,$06,$06
	dc.b $06,$06,$06,$06,$06,$06,$06,$06
	dc.b $06,$06,$06,$06,$06,$06,$06,$06
	dc.b $06,$06,$06,$06,$06,$06,$06,$06


;==============================================
loc_025224:
	tst.b ($59,a6)
	bne.b loc_025260
	tst.w (-$5cc6,a5)
	bne.b loc_025248
	move.w (-$5cac,a5),(-$5caa,a5)
	move.w (-$5cae,a5),(-$5cac,a5)
	move.w (-$5cb0,a5),(-$5cae,a5)
	move.w d2,(-$5cb0,a5)
	rts

loc_025248:
	move.w (-$5ca4,a5),(-$5ca2,a5)
	move.w (-$5ca6,a5),(-$5ca4,a5)
	move.w (-$5ca8,a5),(-$5ca6,a5)
	move.w d2,(-$5ca8,a5)
	rts

loc_025260:
	tst.w (-$5cc6,a5)
	bne.b loc_02527e
	move.w (-$5c9c,a5),(-$5c9a,a5)
	move.w (-$5c9e,a5),(-$5c9c,a5)
	move.w (-$5ca0,a5),(-$5c9e,a5)
	move.w d2,(-$5ca0,a5)
	rts

loc_02527e:
	move.w (-$5c94,a5),(-$5c92,a5)
	move.w (-$5c96,a5),(-$5c94,a5)
	move.w (-$5c98,a5),(-$5c96,a5)
	move.w d2,(-$5c98,a5)
	rts

;==============================================
loc_025296:
	tst.b ($59,a6)
	bne.b loc_0252da
	move.w (-$5cb4,a5),d4
	sub.w ($50,a1),d4
	move.w (-$5c8c,a5),(-$5c8a,a5)
	move.w (-$5c8e,a5),(-$5c8c,a5)
	move.w (-$5c90,a5),(-$5c8e,a5)
	move.w d4,(-$5c90,a5)
	move.w (-$5cb2,a5),d4
	sub.w ($52,a1),d4
	move.w (-$5c84,a5),(-$5c82,a5)
	move.w (-$5c86,a5),(-$5c84,a5)
	move.w (-$5c88,a5),(-$5c86,a5)
	move.w d4,(-$5c88,a5)
	rts

loc_0252da:
	move.w (-$5cb4,a5),d4
	sub.w ($50,a1),d4
	move.w (-$5c7c,a5),(-$5c7a,a5)
	move.w (-$5c7e,a5),(-$5c7c,a5)
	move.w (-$5c80,a5),(-$5c7e,a5)
	move.w d4,(-$5c80,a5)
	move.w (-$5cb2,a5),d4
	sub.w ($52,a1),d4
	move.w (-$5c74,a5),(-$5c72,a5)
	move.w (-$5c76,a5),(-$5c74,a5)
	move.w (-$5c78,a5),(-$5c76,a5)
	move.w d4,(-$5c78,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_025318:
	dc.l $00ff8400,$00ff8800,$00ff8c00,$00ff9000

loc_025328:
	dc.w $0000

loc_02532a
	dc.b $00,$00,$01,$01,$01,$01,$02,$02
	dc.b $02,$02,$03,$03,$03,$03,$04,$04
	dc.b $04,$04,$05,$05,$05,$05,$06,$06
	dc.b $06,$06,$07,$07,$07,$07,$08,$08
	dc.b $08,$08,$09,$09,$09,$09,$0a,$0a
	dc.b $0a,$0a,$0b,$0b,$0b,$0b,$0c,$0c
	dc.b $0c,$0c,$0d,$0d,$0d,$0d,$0e,$0e
	dc.b $0e,$0e,$0f,$0f,$0f,$0f,$10,$10
	dc.b $10,$10,$11,$11,$11,$11,$12,$12
	dc.b $12,$12,$13,$13,$13,$13,$14,$14
	dc.b $14,$14,$15,$15,$15,$15,$16,$16
	dc.b $16,$16,$17,$17,$17,$17,$18,$18
	dc.b $18,$18,$19,$19,$19,$19,$1a,$1a
	dc.b $1a,$1a,$1b,$1b,$1b,$1b,$1c,$1c
	dc.b $1c,$1c,$1d,$1d,$1d,$1d,$1e,$1e
	dc.b $1e,$1e,$1f,$1f,$1f,$1f

loc_0253a8:
	dc.w $ffff,$00ff,$000f,$0003,$0000,$0000,$0000,$0000

loc_0253b8:
	dc.b $00,$01,$02,$03,$04,$05,$06,$07
	dc.b $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
	dc.b $10,$11,$12,$13,$14,$15,$16,$17
	dc.b $18,$19,$1a,$1b,$1c,$1d,$1e,$1f

loc_0253d8:
	dc.w $0002,$0406,$080a,$0c0e,$1012,$1416,$181a,$1c1e
	dc.w $1f1f,$1f1f,$1f1f,$1f1f,$1f1f,$1f1f,$1f1f,$1f1f
	dc.w $0003,$0609,$0c0f,$1215,$181b,$1e1f,$1f1f,$1f1f
	dc.w $1f1f,$1f1f,$1f1f,$1f1f,$1f1f,$1f1f,$1f1f,$1f1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0002,$0406,$080a,$0c0e,$1012,$1416,$181a,$1c1e
	dc.w $1f1f,$1f1f,$1f1f,$1f1f,$1f1f,$1f1f,$1f1f,$1f1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0002,$0406,$080a,$0c0e,$1012,$1416,$181a,$1c1e
	dc.w $1f1f,$1f1f,$1f1f,$1f1f,$1f1f,$1f1f,$1f1f,$1f1f
	dc.w $0002,$0406,$080a,$0c0e,$1012,$1416,$181a,$1c1e
	dc.w $1f1f,$1f1f,$1f1f,$1f1f,$1f1f,$1f1f,$1f1f,$1f1f
	dc.w $0000,$0000,$0000,$0000,$0001,$0203,$0405,$0607
	dc.w $0809,$0a0b,$0c0d,$0e0f,$1011,$1213,$1415,$1617
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0404,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f
	dc.w $0001,$0203,$0405,$0607,$0809,$0a0b,$0c0d,$0e0f
	dc.w $1011,$1213,$1415,$1617,$1819,$1a1b,$1c1d,$1e1f

loc_0257b8:
	dc.b $00,$04,$04,$04,$04,$05,$05,$05
	dc.b $06,$06,$06,$07,$07,$07,$07,$08
	dc.b $08,$08,$08,$0d,$0d,$0d,$0d,$12
	dc.b $12,$12,$12,$17,$17,$17,$17,$21
	dc.b $21,$21,$21,$21,$21,$21,$21,$21
	dc.b $21,$21,$21,$21,$21,$21,$21,$21
	dc.b $21,$21,$21,$21,$21,$21,$21,$21
	dc.b $21,$21,$21,$21,$21,$21,$21,$21

loc_0257f8:
	dc.b $00,$05,$05,$05,$05,$07,$07,$07
	dc.b $09,$09,$09,$0b,$0b,$0b,$0b,$0d
	dc.b $0d,$0d,$0d,$17,$17,$17,$17,$21
	dc.b $21,$21,$21,$2b,$2b,$2b,$2b,$3f
	dc.b $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
	dc.b $3f,$3f,$3f,$3f,$3f,$3f,$3f,$3f
	dc.b $3f,$3f,$45,$45,$45,$45,$45,$45
	dc.b $45,$45,$45,$45,$45,$45,$45,$45

;==============================================
loc_025838:
	move.w (8,a5),d0
	move.w loc_02585c(pc,d0.w),d1
	jsr loc_02585c(pc,d1.w)
	jsr loc_0336d6
	jsr loc_03330e
	jsr loc_033522
	jmp loc_020c4a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02585c:
	dc.w loc_025876-loc_02585c
	dc.w loc_025952-loc_02585c
	dc.w loc_025a48-loc_02585c

loc_025862:
	dc.w $0000,$01d0,$03a0,$0570
	dc.w $0740,$0910

loc_02586e:
	dc.w $01b4,$0186,$0158,$012a

;==============================================
loc_025876:
	addq.w #2,(8,a5)
	bsr.w loc_025bb8
	bne.b loc_02588e
	lea.l (-$5c42,a5),a0
	moveq #0,d0
	move.b (-$7189,a5),d0
	adda.w loc_025862(pc,d0.w),a0

loc_02588e:
	move.l a0,(-$5c48,a5)
	jsr loc_01b0e6
	jsr loc_01bdd0
	clr.b ($23c,a5)
	move.w #0,($210,a5)
	move.w (-$5c44,a5),d0
	subi.w #$1a,d0
	add.w d0,d0
	move.w loc_02586e(pc,d0.w),($214,a5)
	move.l #$8000,($240,a5)
	move.l #$20000,($244,a5)
	move.w #$40,($290,a5)
	move.w #$300,($294,a5)
	move.w #$40,($310,a5)
	move.w #$700,($314,a5)
	move.w ($210,a5),($22,a5)
	move.w ($214,a5),($24,a5)
	move.w ($290,a5),($26,a5)
	move.w ($294,a5),($28,a5)
	move.w ($310,a5),($2a,a5)
	move.w ($314,a5),($2c,a5)
	jsr loc_01e256
	move.w #0,($128,a5)
	jsr loc_01fa5e
	jsr loc_01f07a
	jsr loc_01fcba
	bsr.w loc_025aa2
	bsr.w loc_025b06
	move.w #$1b00,($32,a5)
	move.w #$2461,($3a,a5)
	move.w #Mainpalette,(palrampointer,a5)
	move.l #$90c000,($e0,a5)
	moveq #$14,d0
	jsr loc_0039e0
	jmp loc_01738a

;==============================================
loc_025952:
	move.w ($c,a5),d0
	move.w loc_02595e(pc,d0.w),d1
	jmp loc_02595e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02595e:
	dc.w loc_025964-loc_02595e
	dc.w loc_02598e-loc_02595e
	dc.w loc_025a0c-loc_02595e

;==============================================
loc_025964:
	addq.w #2,($c,a5)
	move.w #$1b0e,($32,a5)
	move.w #$2461,($3a,a5)
	move.w #$f0,($a,a5)
	jsr loc_0b464a
	lea.l ($200,a5),a0
	move.w a0,($36,a4)
	jmp loc_094644

;==============================================
loc_02598e:
	lea.l ($200,a5),a6
	bsr.w loc_0259d8
	tst.b ($14,a5)
	beq.b loc_0259ac
	bmi.b loc_0259a2
	addq.w #2,($c,a5)

loc_0259a2:
	subq.b #1,($15,a5)
	bne.b loc_0259d6
	clr.b ($14,a5)

loc_0259ac:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.w ($10,a6),($22,a5)
	move.w ($14,a6),($24,a5)
	eori.b #1,($3c,a6)
	move.b ($3c,a6),d0
	add.b d0,($23,a5)

loc_0259d6:
	rts

;----------------------------------------------
loc_0259d8:
	tst.b ($16,a5)
	beq.b loc_025a0a
	clr.b ($16,a5)
	move.w ($10,a6),($20,a6)
	move.w ($14,a6),($24,a6)
	moveq #$55,d0
	lea.l $900018,a1
	jsr loc_018cdc
	moveq #$55,d0
	lea.l $901018,a1
	jsr loc_018cdc

loc_025a0a:
	rts

;==============================================
loc_025a0c:
	lea.l ($200,a5),a6
	cmpi.w #$3c,($a,a5)
	bne.b loc_025a24
	move.l #$4440000,d0
	jsr loc_00322e

loc_025a24:
	subq.w #1,($a,a5)
	bpl.b loc_025a32
	addq.w #2,(8,a5)
	clr.w ($c,a5)

loc_025a32:
	move.w ($10,a6),($22,a5)
	eori.b #1,($3c,a6)
	move.b ($3c,a6),d0
	add.b d0,($23,a5)
	rts

;==============================================
loc_025a48:
	addq.w #2,(4,a5)
	moveq #0,d0
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	rts

;==============================================
loc_025a60:
	lea.l (-$5c42,a5),a1
	moveq #5,d5
	moveq #0,d6

loc_025a68:
	lea.l Default_Scores(pc),a0
	moveq #$1c,d4
	bsr.b loc_025a78
	addq.b #1,d6
	dbra d5,loc_025a68
	rts

;==============================================
loc_025a78:
	movem.l (a0)+,d0-d3
	ror.l #8,d1
	subi.b #$41,d1
	ror.l #8,d1
	subi.b #$41,d1
	ror.l #8,d1
	subi.b #$41,d1
	ror.l #8,d1
	movem.l d0-d3,(a1)
	move.b d6,($f,a1)
	lea.l ($10,a1),a1
	dbra d4,loc_025a78
	rts

;==============================================
loc_025aa2:
	movea.l (-$5c48,a5),a2
	moveq #0,d0
	move.b (8,a2),d0
	move.b loc_025ae6(pc,d0.w),d0
	add.w d0,d0
	add.w d0,d0
	movea.l #loc_351f14,a0
	movea.l (a0,d0.w),a0
	moveq #0,d0
	move.b ($f,a2),d0
	move.b loc_025ae0(pc,d0.w),d0
	add.b (9,a2),d0
	lsl.w #8,d0
	lea.l (a0,d0.w),a0
	movea.l #$90c000,a1
	moveq #7,d7
	jmp loc_01b7c0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_025ae0:
	dc.b $00,$02,$04,$00,$02,$04

loc_025ae6:
	dc.b $00,$01,$02,$03,$04,$05,$06,$07
	dc.b $08,$09,$0a,$0b,$0c,$0d,$0e,$0f
	dc.b $10,$11,$04,$11,$06,$0a,$16,$0a
	dc.b $18,$19,$1a,$1b,$1c,$1d,$0a,$0a

;==============================================
loc_025b06:
	moveq #0,d0
	movea.l (-$5c48,a5),a0
	move.b ($f,a0),d0
	add.w d0,d0
	move.w loc_025b6a(pc,d0.w),d0
	movea.l #loc_35bb94,a0
	adda.w d0,a0
	movea.l #$90c140,a1
	moveq #4,d6
	bsr.b loc_025b82
	moveq #0,d0
	movea.l (-$5c48,a5),a0
	move.b ($f,a0),d0
	add.w d0,d0
	move.w loc_025b76(pc,d0.w),d0
	movea.l #loc_35bb94,a0
	adda.w d0,a0
	movea.l #$90c340,a1
	moveq #4,d6
	bsr.b loc_025b82
	movea.l #loc_363eb4,a0
	movea.l #$90c800,a1
	moveq #0,d6
	bsr.b loc_025b82
	movea.l #loc_364cf4,a0
	movea.l #$90cc00,a1
	moveq #0,d6
	bra.b loc_025b82

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_025b6a:
	dc.w $0880,$0920,$09c0,$0880
	dc.w $0920,$09c0

loc_025b76:
	dc.w $09c0,$0880,$0920,$09c0
	dc.w $0880,$0920

;==============================================
loc_025b82:
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
	lea.l ($10,a1),a1
	dbra d6,loc_025b82
	rts

;==============================================
loc_025bb8:
	lea.l (-$5c42,a5),a0
	moveq #5,d1
	moveq #0,d2

loc_025bc0:
	move.w (-$5c44,a5),d0
	subq.w #2,d0
	movea.l a0,a1

loc_025bc8:
	tst.b ($c,a1)
	bne.b loc_025be4
	lea.l ($10,a1),a1
	dbra d0,loc_025bc8
	addq.b #2,d2
	lea.l ($1d0,a0),a0
	dbra d1,loc_025bc0
	moveq #0,d0
	rts

loc_025be4:
	move.b d2,(-$7189,a5)
	moveq #1,d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Defualt Scores
Default_Scores:
	dc.l $00030000
	dc.b 'RYU',$2d
	dc.w $0000,$0005,$0000,$0000

	dc.l $00029000
	dc.b 'KEN',$2d
	dc.w $0100,$0005,$0000,$0000

	dc.l $00028000
	dc.b 'CHN',$2d
	dc.w $0400,$0005,$0000,$0000

	dc.l $00027000
	dc.b 'SGT',$2d
	dc.w $0b00,$0005,$0000,$0000

	dc.l $00026000
	dc.b 'ADN',$2d
	dc.w $0500,$0005,$0000,$0000

	dc.l $00025000
	dc.b 'BRD',$2d
	dc.w $0800,$0004,$0000,$0000

	dc.l $00024000
	dc.b 'GUY',$2d
	dc.w $0700,$0004,$0000,$0000

	dc.l $00023000
	dc.b 'SDM',$2d
	dc.w $0600,$0004,$0000,$0000

	dc.l $00022000
	dc.b 'CHL',$2d
	dc.w $0300,$0004,$0000,$0000

	dc.l $00021000
	dc.b 'ROS',$2d
	dc.w $0900,$0004,$0000,$0000

	dc.l $00020000
	dc.b 'BSN',$2d
	dc.w $0a00,$0003,$0000,$0000

	dc.l $00019000
	dc.b 'AKM',$2d
	dc.w $0200,$0003,$0000,$0000

	dc.l $00018000
	dc.b 'DAN',$2d
	dc.w $0c00,$0003,$0000,$0000

	dc.l $00017000
	dc.b 'DHL',$2d
	dc.w $0f00,$0003,$0000,$0000

	dc.l $00016000
	dc.b 'ZNG',$2d
	dc.w $1000,$0003,$0000,$0000

	dc.l $00015000
	dc.b 'GEN',$2d
	dc.w $1100,$0002,$0000,$0000

	dc.l $00014000
	dc.b 'ROL',$2d
	dc.w $0e00,$0002,$0000,$0000

	dc.l $00013000
	dc.b 'SKR',$2d
	dc.w $0d00,$0002,$0000,$0000

	dc.l $00012000
	dc.b 'BLN',$2d
	dc.w $1900,$0002,$0000,$0000

	dc.l $00011000
	dc.b 'HND',$2d
	dc.w $1800,$0002,$0000,$0000

	dc.l $00010000
	dc.b 'VEG',$2d
	dc.w $1c00,$0002,$0000,$0000

	dc.l $00009000
	dc.b 'CAM',$2d
	dc.w $1600,$0002,$0000,$0000

	dc.l $00008000
	dc.b 'COD',$2d
	dc.w $1b00,$0002,$0000,$0000

	dc.l $00007000
	dc.b 'MIK',$2d
	dc.w $1a00,$0002,$0000,$0000

	dc.l $00006000
	dc.b 'KRN',$2d
	dc.w $1d00,$0002,$0000,$0000

	dc.l $00005000
	dc.b 'BAL',$2d
	dc.w $1500,$0002,$0000,$0000

	dc.l $00004000
	dc.b 'JUL',$2d
	dc.w $1e00,$0002,$0000,$0000

	dc.l $00003000
	dc.b 'JUN',$2d
	dc.w $1f00,$0002,$0000,$0000

	dc.l $00000000
	dc.b 'RYU',$2d
	dc.w $0000,$0002,$0000,$0000

;==============================================
Credits_PRG:
	moveq #0,d0
	move.b ($149,a5),d0
	move.w loc_025dca(pc,d0.w),d1
	jmp loc_025dca(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_025dca:
	dc.w loc_025dfc-loc_025dca
	dc.w loc_025dde-loc_025dca
	dc.w loc_025dd8-loc_025dca
	dc.w loc_025dd2-loc_025dca

;==============================================
loc_025dd2:
	jmp loc_0ad1f8

;==============================================
loc_025dd8:
	jmp loc_0ad1f8

;==============================================
loc_025dde:
	cmpi.b #0,($1c6,a5)
	bne.w loc_025dfc
	movea.w ($13c,a5),a0
	cmpi.b #$a,($102,a0)
	beq.w loc_025dfc
	move.b #$20,($1c6,a5)

loc_025dfc:
	move.w (8,a5),d0
	move.w loc_025e08(pc,d0.w),d1
	jmp loc_025e08(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_025e08:
	dc.w loc_025e10-loc_025e08
	dc.w loc_025f26-loc_025e08
	dc.w loc_025fb6-loc_025e08
	dc.w loc_025fba-loc_025e08

;==============================================
loc_025e10:
	addq.w #2,(8,a5)
	moveq #0,d0
	move.w d0,($c,a5)
	move.w d0,($e,a5)
	move.w d0,($1c8,a5)
	move.b d0,($1ca,a5)
	move.w d0,($1cc,a5)
	move.b d0,(-$5108,a5)
	move.b d0,(-$5107,a5)
	move.b d0,(-$5106,a5)
	move.b d0,(-$5105,a5)
	move.b d0,(-$5104,a5)
	move.b d0,(-$5103,a5)
	move.b d0,(-$5102,a5)
	move.b d0,(-$5139,a5)
	move.w d0,(-$4fe4,a5)
	move.w d0,(-$5064,a5)
	move.w d0,(-$5044,a5)
	move.w d0,(-$5024,a5)
	move.w d0,(-$5004,a5)
	move.l d0,(-$514a,a5)
	move.l d0,(-$5146,a5)
	move.l d0,(-$5142,a5)
	move.w d0,(-$50d0,a5)
	move.w d0,(-$50ce,a5)
	move.w d0,(-$513c,a5)
	move.b d0,(-$5136,a5)
	move.b d0,(-$5135,a5)
	move.b d0,(-$5130,a5)
	moveq #0,d1
	move.w #$91c0,d1
	lsl.l #8,d1
	move.l d1,(-$5162,a5)
	moveq #0,d1
	move.w #$9200,d1
	lsl.l #8,d1
	move.l d1,(-$515e,a5)
	move.b ($1c6,a5),d0
	add.w d0,d0
	lea.l loc_026ed4(pc),a0
	move.w d0,d1
	add.w d1,d1
	add.w d0,d1
	move.w (a0,d1.w),(-$5138,a5)
	move.w (2,a0,d1.w),(-$5134,a5)
	move.w (4,a0,d1.w),(-$5132,a5)
	add.w d0,d0
	lea.l loc_026bbc(pc),a0
	cmpi.w #0,(Region,a5)
	beq.w loc_025ed0
	lea.l loc_026c40(pc),a0

loc_025ed0:
	movea.l (a0,d0.w),a0
	move.l a0,(-$515a,a5)
	lea.l loc_026cc4(pc),a0
	cmpi.w #0,(Region,a5)
	beq.w loc_025eea
	lea.l loc_026d48(pc),a0

loc_025eea:
	movea.l (a0,d0.w),a0
	move.l a0,(-$5156,a5)
	lea.l loc_026dcc(pc),a0
	cmpi.w #0,(Region,a5)
	beq.w loc_025f04
	lea.l loc_026e50(pc),a0

loc_025f04:
	movea.l (a0,d0.w),a0
	move.l a0,(-$512e,a5)
	moveq #-1,d0
	move.w d0,(-$5152,a5)
	move.w d0,(-$5150,a5)
	move.w d0,(-$514e,a5)
	move.w d0,(-$514c,a5)
	bsr.w loc_026ad2
	bra.w loc_025f26

;==============================================
loc_025f26:
	addq.w #1,($1cc,a5)
	tst.b (-$5130,a5)
	bne.w loc_025f92
	jsr loc_026f9a
	jsr loc_025fc6(pc)
	nop
	jsr loc_0263ac(pc)
	nop
	jsr loc_026528(pc)
	nop
	bsr.w loc_0265ae
	jsr loc_03330e
	jsr loc_0335e0
	jsr loc_033522
	jsr loc_0336d6
	jsr loc_02643e(pc)
	nop
	jsr loc_020c4a
	move.b ($60,a5),d1
	moveq #1,d0
	cmpi.b #1,(Active_Player,a5)
	beq.w loc_025f84
	moveq #2,d0

loc_025f84:
	and.w d0,d1
	bne.w loc_025f8c
	rts

loc_025f8c:
	addq.w #2,(8,a5)
	rts

loc_025f92:
	bsr.w loc_02643e
	move.b ($201,a5),d1
	or.b ($281,a5),d1
	or.b ($301,a5),d1
	bne.w loc_025fb4
	clr.b (-$5130,a5)
	move.w #Mainpalette,(palrampointer,a5)
	bra.w loc_0260de

loc_025fb4:
	rts

;==============================================
loc_025fb6:
	addq.w #2,(8,a5)

loc_025fba:
	jsr loc_01b0e6
	jmp loc_00adde

;==============================================
loc_025fc6:
	tst.b (-$5107,a5)
	beq.w loc_0260a4
	clr.b (-$5107,a5)
	moveq #0,d2
	move.w (-$50fa,a5),d0
	move.w d0,d1
	andi.w #$ff,d0
	ext.w d0
	andi.w #$ff00,d1
	asl.w #4,d0
	asr.w #4,d1
	move.w d1,($22,a5)
	move.w d0,($24,a5)
	move.w d1,($210,a5)
	move.w d0,($214,a5)
	move.w d2,($212,a5)
	move.w d2,($216,a5)
	move.w (-$50f8,a5),d0
	move.w d0,d1
	andi.w #$ff,d0
	ext.w d0
	andi.w #$ff00,d1
	asl.w #4,d0
	asr.w #4,d1
	move.w d1,($26,a5)
	move.w d0,($28,a5)
	move.w d1,($290,a5)
	move.w d0,($294,a5)
	move.w d2,($292,a5)
	move.w d2,($296,a5)
	move.w (-$50f6,a5),d0
	move.w d0,d1
	andi.w #$ff,d0
	ext.w d0
	andi.w #$ff00,d1
	asl.w #4,d0
	asr.w #4,d1
	move.w d1,($2a,a5)
	move.w d0,($2c,a5)
	move.w d1,($310,a5)
	move.w d0,($314,a5)
	move.w d2,($312,a5)
	move.w d2,($316,a5)
	move.w #$9100,(gfxram8x8,a5)
	move.w #$9140,(gfxram16x16,a5)
	move.w #$9180,(gfxram32x32,a5)
	move.w (-$50f4,a5),($32,a5)
	move.w (-$50f2,a5),($3a,a5)
	bsr.w loc_026710
	jsr loc_01b208
	move.l (-$5162,a5),d1
	move.l (-$515e,a5),d2
	move.l d1,(-$515e,a5)
	move.l d2,(-$5162,a5)
	lsr.l #8,d2
	move.w d2,(palrampointer,a5)
	moveq #0,d0
	move.b d0,(-$5149,a5)
	move.b d0,(-$5145,a5)
	move.b d0,(-$5141,a5)

loc_0260a4:
	tst.b (-$5105,a5)
	beq.w loc_0260b4
	clr.b (-$5105,a5)
	addq.w #2,(8,a5)

loc_0260b4:
	tst.b (-$5104,a5)
	beq.w loc_0260de
	clr.b (-$5104,a5)
	bsr.w loc_02694c
	move.w #$9000,(gfxram8x8,a5)
	move.w #$9040,(gfxram16x16,a5)
	move.w #$9080,(gfxram32x32,a5)
	tst.b (-$5130,a5)
	bne.w loc_026204

loc_0260de:
	tst.b (-$5102,a5)
	beq.w loc_02611e
	jsr loc_01c0ba
	jsr loc_01c126
	jsr loc_02750e
	tst.b (-$5102,a5)
	bmi.w loc_02611a
	bsr.w loc_026710
	move.l (-$5162,a5),d1
	move.l (-$515e,a5),d2
	move.l d1,(-$515e,a5)
	move.l d2,(-$5162,a5)
	lsr.l #8,d2
	move.w d2,(palrampointer,a5)

loc_02611a:
	clr.b (-$5102,a5)

loc_02611e:
	tst.b (-$5101,a5)
	beq.w loc_02612e
	clr.b (-$5101,a5)
	bsr.w loc_026a22

loc_02612e:
	tst.b (-$5100,a5)
	beq.w loc_02613e
	bsr.w loc_026aa0
	clr.b (-$5100,a5)

loc_02613e:
	tst.b (-$50ff,a5)
	beq.w loc_0261d0
	moveq #0,d2
	move.w (-$50de,a5),d0
	move.w d0,d1
	andi.w #$ff,d0
	ext.w d0
	andi.w #$ff00,d1
	asl.w #4,d0
	asr.w #4,d1
	move.w d1,($22,a5)
	move.w d0,($24,a5)
	move.w d1,($210,a5)
	move.w d0,($214,a5)
	move.w d2,($212,a5)
	move.w d2,($216,a5)
	move.w (-$50dc,a5),d0
	move.w d0,d1
	andi.w #$ff,d0
	ext.w d0
	andi.w #$ff00,d1
	asl.w #4,d0
	asr.w #4,d1
	move.w d1,($26,a5)
	move.w d0,($28,a5)
	move.w d1,($290,a5)
	move.w d0,($294,a5)
	move.w d2,($292,a5)
	move.w d2,($296,a5)
	move.w (-$50da,a5),d0
	move.w d0,d1
	andi.w #$ff,d0
	ext.w d0
	andi.w #$ff00,d1
	asl.w #4,d0
	asr.w #4,d1
	move.w d1,($2a,a5)
	move.w d0,($2c,a5)
	move.w d1,($310,a5)
	move.w d0,($314,a5)
	move.w d2,($312,a5)
	move.w d2,($316,a5)
	clr.b (-$50ff,a5)

loc_0261d0:
	tst.b (-$5106,a5)
	beq.w loc_0261e0
	bsr.w loc_0266bc
	clr.b (-$5106,a5)

loc_0261e0:
	tst.b (-$5108,a5)
	beq.w loc_0261f0
	clr.b (-$5108,a5)
	bsr.w loc_026206

loc_0261f0:
	tst.b (-$50fd,a5)
	beq.w loc_026204
	clr.b ($401,a5)
	clr.b ($801,a5)
	clr.b (-$50fd,a5)

loc_026204:
	rts

;==============================================
loc_026206:
	move.w (-$50fc,a5),d0
	move.w loc_026212(pc,d0.w),d1
	jmp loc_026212(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_026212:
	dc.w loc_026220-loc_026212
	dc.w loc_026240-loc_026212
	dc.w loc_026266-loc_026212
	dc.w loc_026286-loc_026212
	dc.w loc_0262dc-loc_026212
	dc.w loc_0262ea-loc_026212
	dc.w loc_0262f8-loc_026212

;==============================================
loc_026220:
	moveq #0,d1
	move.w (palrampointer,a5),d1
	lsl.l #8,d1
	movea.l d1,a0
	lea.l $90c000,a1
	bsr.w loc_026300
	move.w #Mainpalette,(palrampointer,a5)
	jmp loc_0173f6

;==============================================
loc_026240:
	move.b (-$5103,a5),(-$513a,a5)
	clr.b (-$5103,a5)
	lea.l $90c000,a1
	bsr.w loc_026342
	move.b (-$513a,a5),(-$5103,a5)
	move.w #Mainpalette,(palrampointer,a5)
	jmp loc_017320

;==============================================
loc_026266:
	moveq #0,d1
	move.w (palrampointer,a5),d1
	lsl.l #8,d1
	movea.l d1,a0
	lea.l $90c000,a1
	bsr.w loc_026300
	move.w #Mainpalette,(palrampointer,a5)
	jmp loc_01741a

;==============================================
loc_026286:
	move.b (-$5103,a5),(-$513a,a5)
	move.b #1,(-$5103,a5)
	movea.l (-$515e,a5),a1
	bsr.w loc_026342
	lea.l $922000,a0
	lea.l $90c000,a1
	bsr.w loc_026300
	move.b (-$513a,a5),(-$5103,a5)
	movea.l (-$515e,a5),a0
	move.l a0,($184,a5)
	lea.l ($400,a0),a0
	move.l a0,($188,a5)
	lea.l ($400,a0),a0
	move.l a0,($18c,a5)
	lea.l ($400,a0),a0
	move.l a0,($190,a5)
	move.w #Mainpalette,(palrampointer,a5)
	jmp loc_0173d2

;==============================================
loc_0262dc:
	move.w (palrampointer,a5),(-$513e,a5)
	move.w #$9220,(palrampointer,a5)
	rts

;==============================================
loc_0262ea:
	move.w (palrampointer,a5),(-$513e,a5)
	move.w #$9240,(palrampointer,a5)
	rts

;==============================================
loc_0262f8:
	move.w (-$513e,a5),(palrampointer,a5)
	rts

;==============================================
loc_026300:
	cmpi.w #Mainpalette,(palrampointer,a5)
	beq.w loc_026340
	moveq #$1f,d7

loc_02630c:
	movem.l (a0)+,d0-d6/a2
	movem.l d0-d6/a2,(a1)
	lea.l ($20,a1),a1
	movem.l (a0)+,d0-d6/a2
	movem.l d0-d6/a2,(a1)
	lea.l ($20,a1),a1
	movem.l (a0)+,d0-d6/a2
	movem.l d0-d6/a2,(a1)
	lea.l ($20,a1),a1
	movem.l (a0)+,d0-d6/a2
	movem.l d0-d6/a2,(a1)
	lea.l ($20,a1),a1
	dbra d7,loc_02630c

loc_026340:
	rts

;==============================================
loc_026342:
	move.w (-$50cc,a5),d0
	add.w d0,d0
	add.w d0,d0
	movea.l (-$515a,a5),a0
	movea.l (a0,d0.w),a0
	moveq #0,d1
	moveq #$1c,d6
	bsr.w loc_0267b6
	move.w (-$50ca,a5),d0
	add.w d0,d0
	add.w d0,d0
	movea.l (-$515a,a5),a0
	movea.l (a0,d0.w),a0
	move.w #$400,d1
	moveq #$1f,d6
	bsr.w loc_0267b6
	move.w (-$50c8,a5),d0
	add.w d0,d0
	add.w d0,d0
	movea.l (-$515a,a5),a0
	movea.l (a0,d0.w),a0
	move.w #$800,d1
	moveq #$1f,d6
	bsr.w loc_0267b6
	move.w (-$50c6,a5),d0
	add.w d0,d0
	add.w d0,d0
	movea.l (-$515a,a5),a0
	movea.l (a0,d0.w),a0
	move.w #$c00,d1
	moveq #$1f,d6
	bsr.w loc_0267b6
	bra.w loc_02689a

;==============================================
loc_0263ac:
	lea.l (-$50c4,a5),a4
	tst.b (a4)
	beq.w loc_0263be
	lea.l ($200,a5),a6
	bsr.w loc_0263e4

loc_0263be:
	lea.l ($20,a4),a4
	tst.b (a4)
	beq.w loc_0263d0
	lea.l ($280,a5),a6
	bsr.w loc_0263e4

loc_0263d0:
	lea.l ($20,a4),a4
	tst.b (a4)
	beq.w loc_0263e2
	lea.l ($280,a5),a6
	bra.w loc_0263e4

loc_0263e2:
	rts

;==============================================
loc_0263e4:
	moveq #0,d2
	move.w (1,a4),d0
	move.w loc_0263f2(pc,d0.w),d1
	jmp loc_0263f2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0263f2:
	dc.w loc_0263f6-loc_0263f2
	dc.w loc_02640c-loc_0263f2

;==============================================
loc_0263f6:
	move.w (2,a4),($10,a6)
	move.w (4,a4),($14,a6)
	move.w d2,($12,a6)
	move.w d2,($16,a6)
	rts

;===========================================================================
loc_02640c:
	move.w (2,a4),($10,a6)
	move.w (4,a4),($14,a6)
	move.w (6,a4),($12,a6)
	move.w (8,a4),($16,a6)
	move.w ($a,a4),($40,a6)
	move.w ($c,a4),($44,a6)
	move.w ($e,a4),($42,a6)
	move.w ($10,a4),($46,a6)
	rts

;==============================================
;Stage ???
loc_02643e:
	move.w (stageid,a5),d0
	move.w loc_026478(pc,d0.w),d1
	jsr loc_026478(pc,d1.w)
	move.w (-$50ce,a5),d1
	add.w d1,($24,a5)
	andi.w #$1ff,($24,a5)
	add.w d1,($28,a5)
	andi.w #$3ff,($28,a5)
	add.w d1,($2c,a5)
	andi.w #$7ff,($2c,a5)
	add.w d1,($2e,a5)
	andi.w #$3ff,($2e,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_026478:
	dc.w loc_0264dc-loc_026478;
	dc.w loc_0264d0-loc_026478;
	dc.w loc_0264dc-loc_026478;
	dc.w loc_0264dc-loc_026478;
	dc.w loc_0264dc-loc_026478;
	dc.w loc_0264d0-loc_026478;
	dc.w loc_0264d0-loc_026478;
	dc.w loc_0264d0-loc_026478;

	dc.w loc_0264d0-loc_026478;
	dc.w loc_0264d0-loc_026478;
	dc.w loc_0264dc-loc_026478;
	dc.w loc_0264dc-loc_026478;
	dc.w loc_0264d0-loc_026478;
	dc.w loc_0264d0-loc_026478;
	dc.w loc_0264d0-loc_026478;
	dc.w loc_0264dc-loc_026478;

	dc.w loc_0264dc-loc_026478;
	dc.w loc_0264d0-loc_026478;
	dc.w loc_0264dc-loc_026478;
	dc.w loc_0264d0-loc_026478;
	dc.w loc_0264d0-loc_026478;
	dc.w loc_0264dc-loc_026478;
	dc.w loc_0264dc-loc_026478;
	dc.w loc_0264dc-loc_026478;

	dc.w loc_0264d0-loc_026478;
	dc.w loc_0264dc-loc_026478;
	dc.w loc_0264d0-loc_026478;
	dc.w loc_0264d0-loc_026478;
	dc.w loc_0264d0-loc_026478;
	dc.w loc_0264d0-loc_026478;
	dc.w loc_0264dc-loc_026478;
	dc.w loc_0264dc-loc_026478;

;==============================================
loc_0264b8:
	bsr.w loc_026608
	bsr.w loc_026636
	bra.w loc_02668e

;==============================================
loc_0264c4:
	bsr.w loc_026608
	bsr.w loc_02668e
	bra.w loc_026636

;==============================================
loc_0264d0:
	bsr.w loc_026636
	bsr.w loc_026608
	bra.w loc_02668e

;==============================================
loc_0264dc:
	bsr.w loc_026636
	bsr.w loc_02668e
	bra.w loc_026608

;==============================================
loc_0264e8:
	bsr.w loc_02668e
	bsr.w loc_026608
	bra.w loc_026636

;==============================================
loc_0264f4:
	bsr.w loc_02668e
	bsr.w loc_026636
	bra.w loc_026608

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_026500:
	dc.b $00,$00,$01,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$01,$00,$01
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00
	dc.b $00,$00,$00,$00

;==============================================
loc_026528:
	tst.b (-$5139,a5)
	bne.w loc_026568
	move.w (-$5138,a5),d1
	cmp.w ($1cc,a5),d1
	bhi.w loc_026568
	jsr loc_0b3014
	beq.w loc_026568
	move.l #$10000,($40,a4)
	moveq #0,d0
	move.b ($1c6,a5),d0
	move.b loc_026500(pc,d0.w),d0
	beq.w loc_026564
	move.l #$20000,($40,a4)

loc_026564:
	st.b (-$5139,a5)

loc_026568:
	tst.b (-$5136,a5)
	bne.w loc_026588
	move.w (-$5134,a5),d1
	cmp.w ($1cc,a5),d1
	bhi.w loc_026588
	moveq #2,d0
	jsr loc_0039e0
	st.b (-$5136,a5)

loc_026588:
	tst.b (-$5135,a5)
	bne.w loc_0265ac
	move.w (-$5132,a5),d1
	cmp.w ($1cc,a5),d1
	bhi.w loc_0265ac
	move.l #$da0000,d0
	jsr loc_00322e
	st.b (-$5135,a5)

loc_0265ac:
	rts

;==============================================
loc_0265ae:
	lea.l (-$5064,a5),a6
	moveq #3,d7

loc_0265b4:
	tst.b (a6)
	beq.w loc_0265fe
	tst.w (6,a6)
	bmi.w loc_0265e6
	subq.w #1,(6,a6)
	bpl.w loc_0265fe
	moveq #0,d0
	move.w (2,a6),d0
	tst.b ($149,a5)
	beq.w loc_0265dc
	move.w (4,a6),d0

loc_0265dc:
	jsr loc_00d12a
	bra.w loc_0265fe

loc_0265e6:
	tst.w (8,a6)
	bmi.w loc_0265f6
	subq.w #1,(8,a6)
	bpl.w loc_0265fe

loc_0265f6:
	clr.b (a6)
	move.b #2,($160,a5)

loc_0265fe:
	lea.l ($20,a6),a6
	dbra d7,loc_0265b4
	rts

;==============================================
loc_026608:
	moveq #0,d0
	move.b (-$514a,a5),d0
	move.w loc_026616(pc,d0.w),d1
	jmp loc_026616(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_026616:
	dc.w loc_02661a-loc_026616
	dc.w loc_02661e-loc_026616

;==============================================
loc_02661a:
	addq.b #2,(-$514a,a5)

loc_02661e:
	move.b (-$5149,a5),d0
	move.w loc_02662a(pc,d0.w),d1
	jmp loc_02662a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02662a:
	dc.w loc_02662e-loc_02662a
	dc.w loc_026630-loc_02662a

;==============================================
loc_02662e:
	rts

loc_026630:
	jmp loc_017514

;==============================================
loc_026636:
	moveq #0,d0
	move.b (-$5146,a5),d0
	move.w loc_026644(pc,d0.w),d1
	jmp loc_026644(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_026644:
	dc.w loc_026648-loc_026644
	dc.w loc_02664c-loc_026644

;==============================================
loc_026648:
	addq.b #2,(-$5146,a5)

loc_02664c:
	move.b (-$5145,a5),d0
	move.w loc_026658(pc,d0.w),d1
	jmp loc_026658(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_026658:
	dc.w loc_02665e-loc_026658
	dc.w loc_026660-loc_026658
	dc.w loc_026670-loc_026658

;==============================================
loc_02665e:
	rts

;==============================================
loc_026660:
	jsr loc_017c4e
	move.w (-$50ce,a5),d1
	add.w d1,($294,a5)
	rts

;==============================================
loc_026670:
	move.w ($290,a5),d1
	andi.w #$3ff,d1
	move.w d1,($26,a5)
	move.w ($294,a5),d1
	andi.w #$3ff,d1
	move.w d1,($28,a5)
	jmp loc_019b22

;==============================================
loc_02668e:
	moveq #0,d0
	move.b (-$5142,a5),d0
	move.w loc_02669c(pc,d0.w),d1
	jmp loc_02669c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02669c:
	dc.w loc_0266a0-loc_02669c
	dc.w loc_0266a4-loc_02669c

;==============================================
loc_0266a0:
	addq.b #2,(-$5142,a5)

loc_0266a4:
	move.b (-$5141,a5),d0
	move.w loc_0266b0(pc,d0.w),d1
	jmp loc_0266b0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0266b0:
	dc.w loc_0266b4-loc_0266b0
	dc.w loc_0266b6-loc_0266b0

;==============================================
loc_0266b4:
	rts

loc_0266b6:
	jmp loc_017f98

;==============================================
loc_0266bc:
	moveq #0,d0
	move.w (-$50d8,a5),d0
	add.w d0,d0
	add.w d0,d0
	movea.l (-$515a,a5),a0
	movea.l (a0,d0.w),a0
	move.w (-$50d2,a5),d0
	move.w loc_0266e8(pc,d0.w),d1
	jsr loc_0266e8(pc,d1.w)
	move.w (-$50d6,a5),d1
	move.w (-$50d4,a5),d6
	subq.w #1,d6
	bra.w loc_0267b6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0266e8:
	dc.w loc_0266f0-loc_0266e8
	dc.w loc_0266f6-loc_0266e8
	dc.w loc_0266fc-loc_0266e8
	dc.w loc_026708-loc_0266e8

;==============================================
loc_0266f0:
	movea.l (-$5162,a5),a1
	rts

loc_0266f6:
	movea.l (-$515e,a5),a1
	rts

loc_0266fc:
	moveq #0,d1
	move.w (palrampointer,a5),d1
	lsl.l #8,d1
	movea.l d1,a1
	rts

loc_026708:
	lea.l $90c000,a1
	rts

;==============================================
loc_026710:
	movea.l (-$515e,a5),a1
	bra.w loc_02671c

loc_026718:
	movea.l (-$5162,a5),a1

loc_02671c:
	move.w (-$50f0,a5),d0
	cmp.w (-$5152,a5),d0
	beq.w loc_02672c
	move.w d0,(-$5152,a5)

loc_02672c:
	add.w d0,d0
	add.w d0,d0
	movea.l (-$515a,a5),a0
	movea.l (a0,d0.w),a0
	moveq #0,d1
	moveq #$1d,d6
	bsr.w loc_0267b6
	move.w (-$50ee,a5),d0
	cmp.w (-$5150,a5),d0
	beq.w loc_026750
	move.w d0,(-$5150,a5)

loc_026750:
	add.w d0,d0
	add.w d0,d0
	movea.l (-$515a,a5),a0
	movea.l (a0,d0.w),a0
	move.w #$400,d1
	moveq #$1f,d6
	bsr.w loc_0267b6
	move.w (-$50ec,a5),d0
	cmp.w (-$514e,a5),d0
	beq.w loc_026776
	move.w d0,(-$514e,a5)

loc_026776:
	add.w d0,d0
	add.w d0,d0
	movea.l (-$515a,a5),a0
	movea.l (a0,d0.w),a0
	move.w #$800,d1
	moveq #$1f,d6
	bsr.w loc_0267b6
	move.w (-$50ea,a5),d0
	cmp.w (-$514c,a5),d0
	beq.w loc_02679c
	move.w d0,(-$514c,a5)

loc_02679c:
	add.w d0,d0
	add.w d0,d0
	movea.l (-$515a,a5),a0
	movea.l (a0,d0.w),a0
	move.w #$c00,d1
	moveq #$1f,d6
	bsr.w loc_0267b6
	bra.w loc_02689a

;==============================================
loc_0267b6:
	lea.l (a1,d1.w),a3
	tst.b (-$5103,a5)
	bne.w loc_02681a

loc_0267c2:
	lea.l loc_026b70(pc),a2
	move.w (a0)+,d0
	cmpi.w #8,d0
	bgt.w loc_0267de
	movea.l (a2,d0.w),a4
	move.w (a0)+,d0
	movea.l (a4,d0.w),a4
	bra.w loc_0267e8

loc_0267de:
	movea.l (a2,d0.w),a4
	move.w (a0)+,d0
	adda.w (a4,d0.w),a4

loc_0267e8:
	move.w (a0)+,d0
	lea.l (a4,d0.w),a4
	move.w (a0)+,d5
	subq.w #1,d5

loc_0267f2:
	movem.l (a4)+,d0-d3
	movem.l d0-d3,(a3)
	lea.l ($10,a3),a3
	movem.l (a4)+,d0-d3
	movem.l d0-d3,(a3)
	lea.l ($10,a3),a3
	subq.w #1,d6
	bmi.w loc_026818
	dbra d5,loc_0267f2
	tst.w d6
	bpl.b loc_0267c2

loc_026818:
	rts

loc_02681a:
	move.l #$f000f000,d4

loc_026820:
	lea.l loc_026b70(pc),a2
	move.w (a0)+,d0
	cmpi.w #8,d0
	bgt.w loc_02683c
	movea.l (a2,d0.w),a4
	move.w (a0)+,d0
	movea.l (a4,d0.w),a4
	bra.w loc_026846

loc_02683c:
	movea.l (a2,d0.w),a4
	move.w (a0)+,d0
	adda.w (a4,d0.w),a4

loc_026846:
	move.w (a0)+,d0
	lea.l (a4,d0.w),a4
	move.w (a0)+,d5
	subq.w #1,d5

loc_026850:
	movem.l (a4)+,d0-d3
	or.l d4,d0
	or.l d4,d1
	or.l d4,d2
	or.l d4,d3
	movem.l d0-d3,(a3)
	lea.l ($10,a3),a3
	movem.l (a4)+,d0-d3
	or.l d4,d0
	or.l d4,d1
	or.l d4,d2
	or.l d4,d3
	movem.l d0-d3,(a3)
	lea.l ($10,a3),a3
	subq.w #1,d6
	bmi.w loc_026886
	dbra d5,loc_026850
	tst.w d6
	bpl.b loc_026820

loc_026886:
	rts

;==============================================
loc_026888:
	movea.l #$90c3a0,a3
	movea.l #loc_33bff4,a4
	moveq #1,d6
	bra.w loc_0268ea

;==============================================
loc_02689a:
	movea.l #loc_33bff4,a4
	lea.l ($3a0,a1),a3
	moveq #1,d6
	tst.b (-$5103,a5)
	bne.w loc_0268ea
	movem.l (a4)+,d0-d3
	movem.l d0-d3,(a3)
	lea.l ($10,a3),a3
	movem.l (a4)+,d0-d3
	movem.l d0-d3,(a3)
	lea.l ($10,a3),a3
	movea.l #loc_33c034,a4

loc_0268cc:
	movem.l (a4)+,d0-d3
	movem.l d0-d3,(a3)
	lea.l ($10,a3),a3
	movem.l (a4)+,d0-d3
	movem.l d0-d3,(a3)
	lea.l ($10,a3),a3
	dbra d6,loc_0268cc
	rts

loc_0268ea:
	move.l #$f000f000,d4
	movem.l (a4)+,d0-d3
	or.l d4,d0
	or.l d4,d1
	or.l d4,d2
	or.l d4,d3
	movem.l d0-d3,(a3)
	lea.l ($10,a3),a3
	movem.l (a4)+,d0-d3
	or.l d4,d0
	or.l d4,d1
	or.l d4,d2
	or.l d4,d3
	movem.l d0-d3,(a3)
	lea.l ($10,a3),a3
	movea.l #loc_33c034,a4

loc_02691e:
	movem.l (a4)+,d0-d3
	or.l d4,d0
	or.l d4,d1
	or.l d4,d2
	or.l d4,d3
	movem.l d0-d3,(a3)
	lea.l ($10,a3),a3
	movem.l (a4)+,d0-d3
	or.l d4,d0
	or.l d4,d1
	or.l d4,d2
	or.l d4,d3
	movem.l d0-d3,(a3)
	lea.l ($10,a3),a3
	dbra d6,loc_02691e
	rts

;==============================================
loc_02694c:
	move.w #$9240,(palrampointer,a5)
	move.w (-$50e8,a5),(stageid,a5)
	cmpi.w #0,(Region,a5)
	beq.w loc_026972
	cmpi.w #$30,(stageid,a5)
	bne.w loc_026972
	move.w #$18,(stageid,a5)

loc_026972:
	jsr loc_01a5e8
	lea.l ($200,a5),a6
	clr.l (4,a6)
	jsr loc_017514
	lea.l ($280,a5),a6
	clr.l (4,a6)
	jsr loc_017c4e
	lea.l ($300,a5),a6
	clr.l (4,a6)
	jsr loc_017f98
	jsr loc_01884a
	tst.b (-$5103,a5)
	beq.w loc_0269cc
	jsr loc_01fae2
	movea.l #$90c3a0,a3
	movea.l #loc_33bff4,a4
	moveq #1,d6
	bsr.w loc_0268ea
	bra.w loc_0269e4

loc_0269cc:
	jsr loc_01f892
	movea.l #$90c3a0,a3
	movea.l #loc_33bff4,a4
	moveq #1,d6
	bsr.w loc_0268ea

loc_0269e4:
	st.b (-$5130,a5)
	move.b ($201,a5),d1
	or.b ($281,a5),d1
	or.b ($301,a5),d1
	beq.w loc_026a02
	move.w #Mainpalette,(palrampointer,a5)
	clr.b (-$5130,a5)

loc_026a02:
	move.b #2,(-$5149,a5)
	move.b #2,(-$5145,a5)
	move.b #2,(-$5141,a5)
	move.w #$220,($410,a5)
	move.w #$2e0,($810,a5)
	rts

;==============================================
loc_026a22:
	bsr.w loc_026a2e
	bsr.w loc_026a54
	bra.w loc_026a7a

;==============================================
loc_026a2e:
	movea.l (-$5156,a5),a4
	lea.l $910000,a1
	move.w (-$50e4,a5),d0
	add.w d0,d0
	adda.w (a4,d0.w),a4
	moveq #3,d7

loc_026a44:
	moveq #0,d0
	move.b (a4)+,d0
	jsr loc_018cdc
	dbra d7,loc_026a44
	rts

;==============================================
loc_026a54:
	movea.l (-$5156,a5),a4
	lea.l $914000,a1
	move.w (-$50e2,a5),d0
	add.w d0,d0
	adda.w (a4,d0.w),a4
	moveq #$f,d7

loc_026a6a:
	moveq #0,d0
	move.b (a4)+,d0
	jsr loc_018f20
	dbra d7,loc_026a6a
	rts

;==============================================
loc_026a7a:
	movea.l (-$5156,a5),a4
	lea.l $918000,a1
	move.w (-$50e0,a5),d0
	add.w d0,d0
	adda.w (a4,d0.w),a4
	moveq #$3f,d7

loc_026a90:
	moveq #0,d0
	move.b (a4)+,d0
	jsr loc_0190d2
	dbra d7,loc_026a90
	rts

;==============================================
loc_026aa0:
	moveq #0,d0
	move.b (-$5100,a5),d0
	move.w loc_026aae(pc,d0.w),d1
	jmp loc_026aae(pc,d1.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_026aae:
	dc.w loc_026ab8-loc_026aae
	dc.w loc_026aba-loc_026aae
	dc.w loc_026ac0-loc_026aae
	dc.w loc_026ac6-loc_026aae
	dc.w loc_026acc-loc_026aae

;==============================================
loc_026ab8:
	rts

;==============================================
loc_026aba:
	jmp loc_01bdd6

;==============================================
loc_026ac0:
	jmp loc_01c0ba

;==============================================
loc_026ac6:
	jmp loc_01c0f0

;==============================================
loc_026acc:
	jmp loc_01bdd0

;==============================================
loc_026ad2:
	moveq #0,d1
	move.w #$9220,d1
	lsl.l #8,d1
	movea.l d1,a1
	moveq #-1,d0
	moveq #$1c,d7
	bsr.w loc_026b18
	move.l #$f000f000,d5
	bsr.w loc_026b34
	moveq #$5f,d7
	bsr.w loc_026b18
	moveq #0,d1
	move.w #$9240,d1
	lsl.l #8,d1
	movea.l d1,a1
	move.l #$f000f000,d0
	moveq #$1c,d7
	bsr.w loc_026b18
	bsr.w loc_026b34
	moveq #$5f,d7
	bsr.w loc_026b18
	bra.w loc_026888

;==============================================
loc_026b18:
	move.l d0,d1
	move.l d0,d2
	move.l d0,d3
	move.l d0,d4
	move.l d0,d5
	move.l d0,d6
	movea.l d0,a2

loc_026b26:
	movem.l d0-d6/a2,(a1)
	lea.l ($20,a1),a1
	dbra d7,loc_026b26
	rts

;==============================================
loc_026b34:
	movea.l #loc_33bff4,a0
	bsr.w loc_026b46
	lea.l ($20,a0),a0
	bsr.w loc_026b46

loc_026b46:
	movem.l (a0)+,d1-d4
	or.l d5,d1
	or.l d5,d2
	or.l d5,d3
	or.l d5,d4
	movem.l d1-d4,(a1)
	lea.l ($10,a1),a1
	movem.l (a0)+,d1-d4
	or.l d5,d1
	or.l d5,d2
	or.l d5,d3
	or.l d5,d4
	movem.l d1-d4,(a1)
	lea.l ($10,a1),a1
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_026b70:
	dc.l loc_339774,loc_026ba4,loc_351f14,loc_32c094
	dc.l loc_3329d4,loc_3383b4,loc_33c474,loc_33fd14
	dc.l loc_340954,loc_345bd4,loc_3477b4,loc_349cb4
	dc.l loc_34cdd4
	
loc_026ba4:
	dc.l loc_33bb14,loc_33bc74,loc_340154,loc_346fb4
	dc.l loc_349fb4,loc_35bb94

loc_026bbc:
	dc.l loc_317378,loc_317c14,loc_31831c,loc_3192ba
	dc.l loc_31a03c,loc_31a890,loc_31bcec,loc_31ca64
	dc.l loc_31d1e0,loc_31d898,loc_31e12e,loc_31ec66
	dc.l loc_31f62e,loc_320514,loc_3211e2,loc_32263a
	dc.l loc_323dda,loc_3248e4,loc_31a03c,loc_3248e4
	dc.l loc_31bcec,loc_31e12e,loc_3257b0,loc_317378
	dc.l loc_326600,loc_3275d8,loc_328784,loc_329784
	dc.l loc_32a478,loc_32b0a4,loc_31e12e,loc_31e12e
	dc.l loc_32be52

loc_026c40:
	dc.l loc_317378,loc_317c14,loc_31831c,loc_3192ba
	dc.l loc_31a03c,loc_31a890,loc_31bcec,loc_31ca64
	dc.l loc_31d1e0,loc_31d898,loc_31e12e,loc_31ec66
	dc.l loc_31f62e,loc_320514,loc_3211e2,loc_32263a
	dc.l loc_323dda,loc_3248e4,loc_31a03c,loc_3248e4
	dc.l loc_31bcec,loc_31e12e,loc_3257b0,loc_317378
	dc.l loc_326600,loc_3275d8,loc_328784,loc_329784
	dc.l loc_32a478,loc_32b0a4,loc_31e12e,loc_31e12e
	dc.l loc_32be52

loc_026cc4:
	dc.l loc_31755c,loc_317cf4,loc_3183ec,loc_3194a6
	dc.l loc_31a1a4,loc_31a94c,loc_31c330,loc_31cb64
	dc.l loc_31d2dc,loc_31d938,loc_31e25e,loc_31ed56
	dc.l loc_31f746,loc_3208b0,loc_3215a6,loc_322afa
	dc.l loc_3242b2,loc_324bb4,loc_31a1a4,loc_324bb4
	dc.l loc_31c330,loc_31e25e,loc_325944,loc_31755c
	dc.l loc_326724,loc_327950,loc_328b18,loc_329924
	dc.l loc_32a5a0,loc_32b1ec,loc_31e25e,loc_31e25e
	dc.l loc_32c03a

loc_026d48:
	dc.l loc_31755c,loc_317cf4,loc_3183ec,loc_3194a6
	dc.l loc_31a1a4,loc_31a94c,loc_31c330,loc_31cb64
	dc.l loc_31d2dc,loc_31d938,loc_31e25e,loc_31ed56
	dc.l loc_31f746,loc_3208b0,loc_3215a6,loc_322afa
	dc.l loc_3242b2,loc_324bb4,loc_31a1a4,loc_324bb4
	dc.l loc_31c330,loc_31e25e,loc_325944,loc_31755c
	dc.l loc_326724,loc_327950,loc_328b18,loc_329924
	dc.l loc_32a5a0,loc_32b1ec,loc_31e25e,loc_31e25e
	dc.l loc_32c03a

loc_026dcc:
	dc.l loc_3167be,loc_3175b6,loc_317d4e,loc_318446
	dc.l loc_319512,loc_31a1fe,loc_31a9a6,loc_31c438
	dc.l loc_31cbbe,loc_31d336,loc_31d992,loc_31e2b8
	dc.l loc_31edb0,loc_31f7a0,loc_320910,loc_321654
	dc.l loc_322bfc,loc_32430c,loc_319512,loc_32430c
	dc.l loc_31a9a6,loc_31d992,loc_324cac,loc_3167be
	dc.l loc_3259d6,loc_32677e,loc_3279fe,loc_328b84
	dc.l loc_32997e,loc_32a5fa,loc_31d992,loc_31d992
	dc.l loc_32b26c

loc_026e50:
	dc.l loc_3167be,loc_3175b6,loc_317d4e,loc_318446
	dc.l loc_319512,loc_31a1fe,loc_31a9a6,loc_31c438
	dc.l loc_31cbbe,loc_31d336,loc_31d992,loc_31e2b8
	dc.l loc_31edb0,loc_31f7a0,loc_320910,loc_321654
	dc.l loc_322bfc,loc_32430c,loc_319512,loc_32430c
	dc.l loc_31a9a6,loc_31d992,loc_324cac,loc_3167be
	dc.l loc_3259d6,loc_32677e,loc_3279fe,loc_328b84
	dc.l loc_32997e,loc_32a5fa,loc_31d992,loc_31d992
	dc.l loc_32b26c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_026ed4:
	dc.w $2118,$0010,$2ca8
	dc.w $0666,$0010,$11f6
	dc.w $0503,$0010,$0a2b
	dc.w $1861,$0010,$23f1
	dc.w $19e7,$0010,$2577
	dc.w $01be,$0010,$0d4e
	dc.w $0df7,$0000,$1987
	dc.w $088e,$0010,$141e
	dc.w $0c3a,$0010,$17ca
	dc.w $091e,$0000,$14ae
	dc.w $008d,$0000,$0c1d
	dc.w $1271,$0000,$1e01
	dc.w $0cc6,$0000,$1856
	dc.w $0b7c,$0010,$170c
	dc.w $09aa,$0028,$153a
	dc.w $0e3d,$0010,$19cd
	dc.w $1c08,$0010,$2798
	dc.w $026e,$0010,$0796
	dc.w $19e7,$0010,$2577
	dc.w $026e,$0010,$0796
	dc.w $0df7,$0000,$1987
	dc.w $008d,$0000,$0c1d
	dc.w $0f5f,$0010,$1aef
	dc.w $2118,$0010,$2ca8
	dc.w $0e2c,$0010,$19bc
	dc.w $138f,$0020,$1f1f
	dc.w $1073,$0000,$1c03
	dc.w $1728,$0000,$22b8
	dc.w $0b03,$0000,$1693
	dc.w $10fd,$0010,$1c8d
	dc.w $008d,$0000,$0c1d
	dc.w $008d,$0000,$0c1d
	dc.w $2138,$0010,$2cc8

;==============================================
loc_026f9a:
	moveq #0,d0
	move.w ($c,a5),d0
	move.w loc_026fa8(pc,d0.w),d1
	jmp loc_026fa8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_026fa8:
	dc.w loc_026fb2-loc_026fa8
	dc.w loc_026fb8-loc_026fa8
	dc.w loc_027202-loc_026fa8
	dc.w loc_027220-loc_026fa8
	dc.w loc_027254-loc_026fa8

;==============================================
loc_026fb2:
	addq.w #2,($c,a5)
	rts

;==============================================
loc_026fb8:
	movea.l (-$512e,a5),a0
	move.w (a0)+,d0
	move.w (a0)+,d1
	move.w d0,(-$512a,a5)
	move.w d1,(-$5128,a5)
	andi.w #$f,d1
	add.w d1,d1
	move.w loc_026fe2(pc,d1.w),d1
	jsr loc_026fe2(pc,d1.w)
	move.l a0,(-$512e,a5)
	addq.w #2,($c,a5)
	bra.w loc_027202

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_026fe2:
	dc.w loc_027002-loc_026fe2
	dc.w loc_027004-loc_026fe2
	dc.w loc_02700a-loc_026fe2
	dc.w loc_027014-loc_026fe2
	dc.w loc_027022-loc_026fe2
	dc.w loc_027034-loc_026fe2
	dc.w loc_02704a-loc_026fe2
	dc.w loc_027064-loc_026fe2

	dc.w loc_027082-loc_026fe2
	dc.w loc_0270a4-loc_026fe2
	dc.w loc_0270ca-loc_026fe2
	dc.w loc_0270f4-loc_026fe2
	dc.w loc_027122-loc_026fe2
	dc.w loc_027154-loc_026fe2
	dc.w loc_02718a-loc_026fe2
	dc.w loc_0271c4-loc_026fe2

;==============================================
loc_027002:
	rts

loc_027004:
	move.w (a0)+,(-$5126,a5)
	rts

loc_02700a:
	move.w (a0)+,(-$5126,a5)
	move.w (a0)+,(-$5124,a5)
	rts

loc_027014:
	move.w (a0)+,(-$5126,a5)
	move.w (a0)+,(-$5124,a5)
	move.w (a0)+,(-$5122,a5)
	rts

loc_027022:
	move.w (a0)+,(-$5126,a5)
	move.w (a0)+,(-$5124,a5)
	move.w (a0)+,(-$5122,a5)
	move.w (a0)+,(-$5120,a5)
	rts

loc_027034:
	move.w (a0)+,(-$5126,a5)
	move.w (a0)+,(-$5124,a5)
	move.w (a0)+,(-$5122,a5)
	move.w (a0)+,(-$5120,a5)
	move.w (a0)+,(-$511e,a5)
	rts


loc_02704a:
	move.w (a0)+,(-$5126,a5)
	move.w (a0)+,(-$5124,a5)
	move.w (a0)+,(-$5122,a5)
	move.w (a0)+,(-$5120,a5)
	move.w (a0)+,(-$511e,a5)
	move.w (a0)+,(-$511c,a5)
	rts

loc_027064:
	move.w (a0)+,(-$5126,a5)
	move.w (a0)+,(-$5124,a5)
	move.w (a0)+,(-$5122,a5)
	move.w (a0)+,(-$5120,a5)
	move.w (a0)+,(-$511e,a5)
	move.w (a0)+,(-$511c,a5)
	move.w (a0)+,(-$511a,a5)
	rts

loc_027082:
	move.w (a0)+,(-$5126,a5)
	move.w (a0)+,(-$5124,a5)
	move.w (a0)+,(-$5122,a5)
	move.w (a0)+,(-$5120,a5)
	move.w (a0)+,(-$511e,a5)
	move.w (a0)+,(-$511c,a5)
	move.w (a0)+,(-$511a,a5)
	move.w (a0)+,(-$5118,a5)
	rts

loc_0270a4:
	move.w (a0)+,(-$5126,a5)
	move.w (a0)+,(-$5124,a5)
	move.w (a0)+,(-$5122,a5)
	move.w (a0)+,(-$5120,a5)
	move.w (a0)+,(-$511e,a5)
	move.w (a0)+,(-$511c,a5)
	move.w (a0)+,(-$511a,a5)
	move.w (a0)+,(-$5118,a5)
	move.w (a0)+,(-$5116,a5)
	rts

loc_0270ca:
	move.w (a0)+,(-$5126,a5)
	move.w (a0)+,(-$5124,a5)
	move.w (a0)+,(-$5122,a5)
	move.w (a0)+,(-$5120,a5)
	move.w (a0)+,(-$511e,a5)
	move.w (a0)+,(-$511c,a5)
	move.w (a0)+,(-$511a,a5)
	move.w (a0)+,(-$5118,a5)
	move.w (a0)+,(-$5116,a5)
	move.w (a0)+,(-$5114,a5)
	rts

loc_0270f4:
	move.w (a0)+,(-$5126,a5)
	move.w (a0)+,(-$5124,a5)
	move.w (a0)+,(-$5122,a5)
	move.w (a0)+,(-$5120,a5)
	move.w (a0)+,(-$511e,a5)
	move.w (a0)+,(-$511c,a5)
	move.w (a0)+,(-$511a,a5)
	move.w (a0)+,(-$5118,a5)
	move.w (a0)+,(-$5116,a5)
	move.w (a0)+,(-$5114,a5)
	move.w (a0)+,(-$5112,a5)
	rts

loc_027122:
	move.w (a0)+,(-$5126,a5)
	move.w (a0)+,(-$5124,a5)
	move.w (a0)+,(-$5122,a5)
	move.w (a0)+,(-$5120,a5)
	move.w (a0)+,(-$511e,a5)
	move.w (a0)+,(-$511c,a5)
	move.w (a0)+,(-$511a,a5)
	move.w (a0)+,(-$5118,a5)
	move.w (a0)+,(-$5116,a5)
	move.w (a0)+,(-$5114,a5)
	move.w (a0)+,(-$5112,a5)
	move.w (a0)+,(-$5110,a5)
	rts

loc_027154:
	move.w (a0)+,(-$5126,a5)
	move.w (a0)+,(-$5124,a5)
	move.w (a0)+,(-$5122,a5)
	move.w (a0)+,(-$5120,a5)
	move.w (a0)+,(-$511e,a5)
	move.w (a0)+,(-$511c,a5)
	move.w (a0)+,(-$511a,a5)
	move.w (a0)+,(-$5118,a5)
	move.w (a0)+,(-$5116,a5)
	move.w (a0)+,(-$5114,a5)
	move.w (a0)+,(-$5112,a5)
	move.w (a0)+,(-$5110,a5)
	move.w (a0)+,(-$510e,a5)
	rts

loc_02718a:
	move.w (a0)+,(-$5126,a5)
	move.w (a0)+,(-$5124,a5)
	move.w (a0)+,(-$5122,a5)
	move.w (a0)+,(-$5120,a5)
	move.w (a0)+,(-$511e,a5)
	move.w (a0)+,(-$511c,a5)
	move.w (a0)+,(-$511a,a5)
	move.w (a0)+,(-$5118,a5)
	move.w (a0)+,(-$5116,a5)
	move.w (a0)+,(-$5114,a5)
	move.w (a0)+,(-$5112,a5)
	move.w (a0)+,(-$5110,a5)
	move.w (a0)+,(-$510e,a5)
	move.w (a0)+,(-$510c,a5)
	rts

loc_0271c4:
	move.w (a0)+,(-$5126,a5)
	move.w (a0)+,(-$5124,a5)
	move.w (a0)+,(-$5122,a5)
	move.w (a0)+,(-$5120,a5)
	move.w (a0)+,(-$511e,a5)
	move.w (a0)+,(-$511c,a5)
	move.w (a0)+,(-$511a,a5)
	move.w (a0)+,(-$5118,a5)
	move.w (a0)+,(-$5116,a5)
	move.w (a0)+,(-$5114,a5)
	move.w (a0)+,(-$5112,a5)
	move.w (a0)+,(-$5110,a5)
	move.w (a0)+,(-$510e,a5)
	move.w (a0)+,(-$510c,a5)
	move.w (a0)+,(-$510a,a5)
	rts

;==============================================
loc_027202:
	tst.b ($182,a5)
	bne.w loc_02721e
	subq.w #1,(-$512a,a5)
	beq.w loc_027216
	bpl.w loc_02721e

loc_027216
	addq.b #2,($c,a5)
	bra.w loc_027220

loc_02721e:
	rts

;==============================================
loc_027220:
	move.w (-$5128,a5),d0
	lsr.w #3,d0
	andi.w #$e,d0
	move.w loc_02723c(pc,d0.w),d1
	jsr loc_02723c(pc,d1.w)
	move.w #2,($c,a5)
	bra.w loc_026fb8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02723c:
	dc.w loc_027244-loc_02723c
	dc.w loc_027248-loc_02723c
	dc.w loc_02724c-loc_02723c
	dc.w loc_027250-loc_02723c

;==============================================
loc_027244:
	bra.w loc_027256

loc_027248:
	bra.w loc_027436

loc_02724c:
	bra.w loc_0274d6

loc_027250:
	bra.w loc_0274d8

;==============================================
loc_027254:
	rts

;==============================================
loc_027256:
	move.b (-$5128,a5),d0
	andi.w #$f,d0
	add.w d0,d0
	move.w loc_027268(pc,d0.w),d1
	jmp loc_027268(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_027268:
	dc.w loc_027280-loc_027268
	dc.w loc_027288-loc_027268
	dc.w loc_0272f2-loc_027268
	dc.w loc_027338-loc_027268
	dc.w loc_027340-loc_027268
	dc.w loc_02735c-loc_027268
	dc.w loc_0273a4-loc_027268
	dc.w loc_0273be-loc_027268

	dc.w loc_0273d2-loc_027268
	dc.w loc_0273ec-loc_027268
	dc.w loc_02741a-loc_027268
	dc.w loc_02742e-loc_027268

;==============================================
loc_027280:
	move.b #1,(-$5105,a5)
	rts

;==============================================
loc_027288:
	move.b #1,(-$5107,a5)
	move.b (-$5128,a5),d0
	andi.w #$f0,d0
	lsr.w #4,d0
	move.b d0,(-$5103,a5)
	move.w (-$5126,a5),(-$50fa,a5)
	move.w (-$5124,a5),(-$50f8,a5)
	move.w (-$5122,a5),(-$50f6,a5)
	move.w (-$511e,a5),(-$50f0,a5)
	move.w (-$511c,a5),(-$50ee,a5)
	move.w (-$511a,a5),(-$50ec,a5)
	move.w (-$5118,a5),(-$50ea,a5)
	move.w (-$5120,a5),d1
	add.w d1,d1
	move.w loc_0272da(pc,d1.w),(-$50f4,a5)
	move.w loc_0272da+2(pc,d1.w),(-$50f2,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0272da:
	dc.w $1b0e,$2461
	dc.w $1e0e,$4261
	dc.w $270e,$2641
	dc.w $2d0e,$4621
	dc.w $360e,$6241
	dc.w $390e,$6421

;==============================================
loc_0272f2:
	move.b #1,(-$5108,a5)
	move.b (-$5128,a5),d0
	andi.w #$f0,d0
	lsr.w #3,d0
	move.w d0,(-$50fc,a5)
	move.w loc_02730e(pc,d0.w),d1
	jmp loc_02730e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02730e:
	dc.w loc_02731c-loc_02730e
	dc.w loc_02731e-loc_02730e
	dc.w loc_02731c-loc_02730e
	dc.w loc_02731e-loc_02730e
	dc.w loc_02731c-loc_02730e
	dc.w loc_02731c-loc_02730e
	dc.w loc_02731c-loc_02730e

;==============================================
loc_02731c:
	rts

;==============================================
loc_02731e:
	move.w (-$5126,a5),(-$50cc,a5)
	move.w (-$5124,a5),(-$50ca,a5)
	move.w (-$5122,a5),(-$50c8,a5)
	move.w (-$5120,a5),(-$50c6,a5)
	rts

;==============================================
loc_027338:
	move.w (-$5126,a5),($1c8,a5)
	rts

;==============================================
loc_027340:
	move.b #1,(-$5104,a5)
	move.w (-$5126,a5),(-$50e8,a5)
	move.b (-$5128,a5),d0
	andi.w #$f0,d0
	lsr.w #4,d0
	move.b d0,(-$5103,a5)
	rts

;==============================================
loc_02735c:
	move.b #1,(-$5102,a5)
	move.w (-$5126,a5),d0
	move.w d0,(-$50e6,a5)
	move.b d0,($1ca,a5)
	move.b (-$5128,a5),d0
	andi.w #$f0,d0
	lsr.w #4,d0
	cmpi.b #$f,d0
	beq.w loc_02739c
	move.b d0,(-$5103,a5)
	move.w (-$5124,a5),(-$50f0,a5)
	move.w (-$5122,a5),(-$50ee,a5)
	move.w (-$5120,a5),(-$50ec,a5)
	move.w (-$511e,a5),(-$50ea,a5)

loc_02739c:
	move.b #-1,(-$5102,a5)
	rts

;==============================================
loc_0273a4:
	move.b #1,(-$5101,a5)
	move.w (-$5126,a5),(-$50e4,a5)
	move.w (-$5124,a5),(-$50e2,a5)
	move.w (-$5122,a5),(-$50e0,a5)
	rts

;==============================================
loc_0273be:
	move.b (-$5128,a5),d0
	andi.w #$f0,d0
	lsr.w #4,d0
	addq.w #1,d0
	add.w d0,d0
	move.b d0,(-$5100,a5)
	rts

;==============================================
loc_0273d2:
	move.b #1,(-$50ff,a5)
	move.w (-$5126,a5),(-$50de,a5)
	move.w (-$5124,a5),(-$50dc,a5)
	move.w (-$5122,a5),(-$50da,a5)
	rts

;==============================================
loc_0273ec:
	move.b #1,(-$5106,a5)
	move.w (-$5126,a5),(-$50d2,a5)
	move.w (-$5124,a5),(-$50d8,a5)
	move.w (-$5122,a5),(-$50d6,a5)
	move.w (-$5120,a5),(-$50d4,a5)
	move.b (-$5128,a5),d0
	andi.w #$f0,d0
	lsr.w #4,d0
	move.b d0,(-$5103,a5)
	rts

;==============================================
loc_02741a:
	move.b #1,(-$50fe,a5)
	move.w (-$5126,a5),(-$50d0,a5)
	move.w (-$5124,a5),(-$50ce,a5)
	rts
 
;==============================================
loc_02742e:
	move.b #1,(-$50fd,a5)
	rts

;==============================================
loc_027436:
	move.b (-$5128,a5),d0
	move.w d0,d1
	andi.w #$60,d1
	lea.l (-$50c4,a5),a4
	lea.l (a4,d1.w),a4
	add.w d0,d0
	andi.w #$1e,d0
	move.w loc_027456(pc,d0.w),d1
	jmp loc_027456(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_027456:
	dc.w loc_02745e-loc_027456
	dc.w loc_027474-loc_027456
	dc.w loc_0274ae-loc_027456
	dc.w loc_0274c2-loc_027456

;==============================================
loc_02745e:
	move.b #1,(a4)
	move.b d0,(1,a4)
	move.w (-$5126,a5),(2,a4)
	move.w (-$5124,a5),(4,a4)
	rts

;----------------------------------------------------------------------
loc_027474:
	move.b #1,(a4)
	move.b d0,(1,a4)
	move.w (-$5126,a5),(2,a4)
	move.w (-$5124,a5),(4,a4)
	move.w (-$5122,a5),(6,a4)
	move.w (-$5120,a5),(8,a4)
	move.w (-$511e,a5),($a,a4)
	move.w (-$511c,a5),($c,a4)
	move.w (-$511a,a5),($e,a4)
	move.w (-$5118,a5),($10,a4)
	rts

;----------------------------------------------------------------------
loc_0274ae:
	move.b #2,(-$5149,a5)
	move.b #2,(-$5145,a5)
	move.b #2,(-$5141,a5)
	rts

;----------------------------------------------------------------------
loc_0274c2:
	move.b #2,(-$5149,a5)
	move.b #4,(-$5145,a5)
	move.b #2,(-$5141,a5)
	rts

;==============================================
loc_0274d6:
	rts

;==============================================
loc_0274d8:
	move.w (-$4fe4,a5),d0
	lea.l (-$5064,a5),a6
	lea.l (a6,d0.w),a6
	addi.w #$20,d0
	andi.w #$60,d0
	move.w d0,(-$4fe4,a5)
	move.b #1,(a6)
	move.w (-$5126,a5),(6,a6)
	move.w (-$5124,a5),(8,a6)
	move.w (-$5122,a5),(2,a6)
	move.w (-$5120,a5),(4,a6)
	rts

;==============================================
loc_02750e:
	move.b ($1c6,a5),d1
	add.w d1,d1
	add.w d1,d1
	movea.l #loc_0275da,a0
	cmpi.w #0,(Region,a5)
	beq.w loc_02752c
	movea.l #loc_02765e,a0

loc_02752c:
	movea.l (a0,d1.w),a0
	moveq #0,d0
	move.b ($1ca,a5),d0
	subi.w #1,d0
	add.w d0,d0
	move.w (a0,d0.w),d1
	lea.l (a0,d1.w),a1

loc_027544:
	tst.w (a1)
	bmi.w loc_027554
	bsr.w loc_027556
	lea.l ($20,a1),a1
	bra.b loc_027544

loc_027554:
	rts

;==============================================
loc_027556:
	jsr loc_01c2c8
	addq.b #1,(a4)
	move.b (a1),(2,a4)
	move.b (1,a1),(3,a4)
	move.b (2,a1),($b,a4)
	move.b (3,a1),($70,a4)
	move.b (4,a1),($18,a4)
	move.b (5,a1),(9,a4)
	move.b (6,a1),($d,a4)
	move.b (7,a1),($76,a4)
	move.w (8,a1),($10,a4)
	move.w ($a,a1),($14,a4)
	move.w ($c,a1),($72,a4)
	move.w ($e,a1),($74,a4)
	move.w ($10,a1),($40,a4)
	move.w ($12,a1),($44,a4)
	move.w ($14,a1),($48,a4)
	move.w ($16,a1),($4c,a4)
	move.l ($18,a1),($78,a4)
	move.l ($1c,a1),($7c,a4)
	move.b #$ff,($c,a4)
	move.w (-$4fe0,a5),($36,a4)
	move.w a4,(-$4fe0,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0275da:
	dc.l loc_316d70,loc_3178d0,loc_317f34,loc_31892a
	dc.l loc_3199f4,loc_31a4a8,loc_31b02e,loc_31c6fc
	dc.l loc_31ce58,loc_31d5f4,loc_31dcc6,loc_31e69e
	dc.l loc_31f106,loc_31fca8,loc_320c7a,loc_321bda
	dc.l loc_32321e,loc_3244e0,loc_3199f4,loc_3244e0
	dc.l loc_31b02e,loc_31dcc6,loc_3250c4,loc_316d70
	dc.l loc_325e14,loc_326ca4,loc_327e50,loc_329018
	dc.l loc_329d70,loc_32a9fc,loc_31dcc6,loc_31dcc6
	dc.l loc_32b82a


loc_02765e:
	dc.l loc_316d70,loc_3178d0,loc_317f34,loc_31892a
	dc.l loc_3199f4,loc_31a4a8,loc_31b02e,loc_31c6fc
	dc.l loc_31ce58,loc_31d5f4,loc_31dcc6,loc_31e69e
	dc.l loc_31f106,loc_31fca8,loc_320c7a,loc_321bda
	dc.l loc_32321e,loc_3244e0,loc_3199f4,loc_3244e0
	dc.l loc_31b02e,loc_31dcc6,loc_3250c4,loc_316d70
	dc.l loc_325e14,loc_326ca4,loc_327e50,loc_329018
	dc.l loc_329d70,loc_32a9fc,loc_31dcc6,loc_31dcc6
	dc.l loc_32b82a

;==============================================
loc_0276e2:
	tst.b ($8b,a5)
	bne.w loc_0277dc
	tst.b ($15c,a5)
	bne.w loc_0277dc
	move.w ($774,a5),($776,a5)
	move.w ($b74,a5),($b76,a5)
	move.w ($772,a5),($774,a5)
	move.w ($b72,a5),($b74,a5)
	move.w ($770,a5),($772,a5)
	move.w ($b70,a5),($b72,a5)
	move.w ($77c,a5),($77e,a5)
	move.w ($b7c,a5),($b7e,a5)
	move.b ($431,a5),($6d8,a5)
	move.b ($831,a5),($ad8,a5)
	move.b ($c31,a5),($ed8,a5)
	move.b ($1031,a5),($12d8,a5)
	move.w ($51a,a5),d0
	andi.w #$f70f,d0
	move.w d0,($770,a5)
	move.w d0,($77c,a5)
	move.w ($91a,a5),d0
	andi.w #$f70f,d0
	move.w d0,($b70,a5)
	move.w d0,($b7c,a5)
	bsr.w loc_0279f8
	bsr.w loc_02795e
	bsr.w loc_0277ee

loc_027766:
	moveq #0,d0
	move.b (-$4fde,a5),d0
	lea.l (-$4fdc,a5),a0
	move.b (a0,d0.w),d0
	lsl.w #2,d0
	movea.l loc_0277de(pc,d0.w),a6
	tst.b (a6)
	beq.b loc_0277be
	tst.b ($67,a6)
	bmi.b loc_0277be
	move.b ($4ab,a5),d0
	or.b ($8ab,a5),d0
	or.b ($cab,a5),d0
	or.b ($10ab,a5),d0
	beq.b loc_02779c
	tst.b ($ab,a6)
	beq.b loc_0277be

loc_02779c:
	bsr.w loc_027b3e
	move.b ($67,a6),d0
	beq.w loc_0277be
	cmpi.b #1,d0
	bne.b loc_0277b6
	addq.b #1,($67,a6)
	bsr.w loc_027b3e

loc_0277b6:
	movea.w ($38,a6),a6
	bsr.w loc_027b3e

loc_0277be:
	addq.b #1,(-$4fde,a5)
	cmpi.b #4,(-$4fde,a5)
	bcs.b loc_027766
	bsr.w loc_0278fa
	bsr.w loc_027884
	bsr.w loc_027b2e
	jsr loc_02e8e0

loc_0277dc:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0277de:
	dc.l $00ff8400,$00ff8800,$00ff8c00,$00ff9000

;==============================================
loc_0277ee:
	clr.b (-$4fde,a5)
	jsr RNGFunction
	andi.w #$3c,d0
	move.l loc_027804(pc,d0.w),(-$4fdc,a5)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_027804:
	dc.l $00010203,$00010302,$00020103,$00020301
	dc.l $00030102,$00030201,$01000203,$01000302
	dc.l $01020003,$01020300,$01030002,$01030200
	dc.l $02000103,$02000301,$02010003,$02010300
	dc.l $02030001,$02030100,$03000102,$03000201
	dc.l $03010002,$03010200,$03020001,$03020100
	dc.l $00030201,$01000302,$02010003,$03020100
	dc.l $00030201,$01000302,$02010003,$03020100

;==============================================
loc_027884:
	tst.b (p1memory,a5)
	beq.b loc_0278a6
	movea.l ($41c,a5),a0
	tst.b (9,a0)
	bne.b loc_0278a6
	tst.w ($138,a5)
	bne.b loc_02789e
	clr.b ($a5a,a5)

loc_02789e:
	clr.b ($e5a,a5)
	clr.b ($125a,a5)

loc_0278a6:
	tst.b (p2memory,a5)
	beq.b loc_0278c8
	movea.l ($81c,a5),a0
	tst.b (9,a0)
	bne.b loc_0278c8
	tst.w ($138,a5)
	bne.b loc_0278c0
	clr.b ($65b,a5)

loc_0278c0:
	clr.b ($e5b,a5)
	clr.b ($125b,a5)

loc_0278c8:
	tst.b (p3memory,a5)
	beq.b loc_0278e0
	movea.l ($c1c,a5),a0
	tst.b (9,a0)
	bne.b loc_0278e0
	clr.b ($65a,a5)
	clr.b ($a5a,a5)

loc_0278e0:
	tst.b (p4memory,a5)
	beq.b loc_0278f8
	movea.l ($101c,a5),a0
	tst.b (9,a0)
	bne.b loc_0278f8
	clr.b ($65b,a5)
	clr.b ($a5b,a5)

loc_0278f8:
	rts

;==============================================
loc_0278fa:
	lea.l (p1memory,a5),a6
	bsr.w loc_027916
	lea.l (p2memory,a5),a6
	bsr.w loc_027916
	lea.l (p3memory,a5),a6
	bsr.w loc_027916
	lea.l (p4memory,a5),a6

loc_027916:
	moveq #0,d1
	tst.b (a6)
	beq.b loc_027958
	movea.w ($38,a6),a4
	moveq #0,d0
	move.b ($cb,a4),d0
	beq.b loc_027948
	movea.l ($9c,a4),a0
	lsl.w #3,d0
	lea.l (a0,d0.w),a0
	move.w (4,a0),d1
	neg.w d1
	move.w (a0),d0
	move.b ($2c9,a6),d2
	eori.b #1,d2
	beq.b loc_027948
	neg.w d0
	neg.w d1

loc_027948:
	add.w d1,d0
	add.w ($10,a4),d0
	move.w ($10,a6),d1
	sub.w d0,d1
	bpl.b loc_027958
	neg.w d1

loc_027958:
	move.w d1,($21c,a6)
	rts

;==============================================
loc_02795e:
	move.w ($138,a5),d0
	move.w loc_02796a(pc,d0.w),d1
	jmp loc_02796a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02796a:
	dc.w loc_027972-loc_02796a
	dc.w loc_027982-loc_02796a
	dc.w loc_02799a-loc_02796a
	dc.w loc_0279b2-loc_02796a

;----------------------------------------------
loc_027972:
	lea.l (p1memory,a5),a0
	bsr.w loc_0279ca
	lea.l (p2memory,a5),a0
	bra.w loc_0279ca

;----------------------------------------------
loc_027982:
	lea.l (p1memory,a5),a0
	bsr.w loc_0279ca
	lea.l (p3memory,a5),a0
	bsr.w loc_0279ca
	lea.l (p4memory,a5),a0
	bra.w loc_0279ca

;----------------------------------------------
loc_02799a:
	lea.l (p2memory,a5),a0
	bsr.w loc_0279ca
	lea.l (p3memory,a5),a0
	bsr.w loc_0279ca
	lea.l (p4memory,a5),a0
	bra.w loc_0279ca

;----------------------------------------------
loc_0279b2:
	lea.l (p1memory,a5),a0
	bsr.w loc_0279ca
	lea.l (p2memory,a5),a0
	bsr.w loc_0279ca
	lea.l (p3memory,a5),a0
	bra.w loc_0279ca

;----------------------------------------------
loc_0279ca:
	movea.w ($38,a0),a1
	moveq #0,d1
	move.w ($10,a0),d0
	sub.w ($10,a1),d0
	bpl.b loc_0279dc
	moveq #1,d1

loc_0279dc:
	addi.w #$18,d0
	cmpi.w #$30,d0
	bls.b loc_0279f6
	move.b #0,($2c9,a0)
	tst.b d1
	beq.b loc_0279f6
	move.b #1,($2c9,a0)

loc_0279f6:
	rts

;==============================================
loc_0279f8:
	move.w ($138,a5),d0
	move.w loc_027a04(pc,d0.w),d1
	jmp loc_027a04(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_027a04:
	dc.w loc_027a0c-loc_027a04
	dc.w loc_027a0e-loc_027a04
	dc.w loc_027a1c-loc_027a04
	dc.w loc_027a2a-loc_027a04

;----------------------------------------------
loc_027a0c:
	rts

;----------------------------------------------
loc_027a0e:
	lea.l (p1memory,a5),a0
	lea.l (p3memory,a5),a1
	lea.l (p4memory,a5),a2
	bra.b loc_027a36

;----------------------------------------------
loc_027a1c:
	lea.l (p2memory,a5),a0
	lea.l (p3memory,a5),a1
	lea.l (p4memory,a5),a2
	bra.b loc_027a36

;----------------------------------------------
loc_027a2a:
	lea.l (p3memory,a5),a0
	lea.l (p1memory,a5),a1
	lea.l (p2memory,a5),a2

;----------------------------------------------
loc_027a36
	tst.b ($67,a0)
	bne.b loc_027a9a
	tst.w ($50,a1)
	bmi.b loc_027a54
	tst.w ($50,a2)
	bmi.b loc_027a54
	tst.b ($25e,a0)
	beq.b loc_027a54
	subq.b #1,($25e,a0)
	bra.b loc_027a98

loc_027a54:
	move.b #$3c,d0
	btst.b #1,($101,a0)
	bne.b loc_027a64
	move.b #$1e,d0

loc_027a64:
	move.b d0,($25e,a0)
	move.w ($10,a1),d0
	sub.w ($10,a0),d0
	bpl.b loc_027a74
	neg.w d0

loc_027a74:
	move.w ($10,a2),d1
	sub.w ($10,a0),d1
	bpl.b loc_027a80
	neg.w d1

loc_027a80:
	tst.w ($50,a1)
	bmi.b loc_027a8e
	move.w a1,($38,a0)
	cmp.w d0,d1
	bcc.b loc_027a98

loc_027a8e:
	tst.w ($50,a2)
	bmi.b loc_027a98
	move.w a2,($38,a0)

loc_027a98:
	rts

loc_027a9a:
	movea.w a2,a3
	tst.b ($67,a1)
	beq.b loc_027aa4
	movea.w a1,a3

loc_027aa4:
	move.w a3,($38,a0)
	rts

;==============================================
loc_027aaa:
	rts

;==============================================
loc_027aac:
	tst.b ($b,a6)
	beq.b loc_027ac8
	move.w ($370,a6),d0
	andi.w #3,d0
	move.b loc_027b0c(pc,d0.w),d0
	andi.w #$fffc,($370,a6)
	or.w d0,($370,a6)

loc_027ac8:
	move.b ($371,a6),($83,a6)
	moveq #0,d1
	move.w ($376,a6),d0
	not.w d0
	and.w ($374,a6),d0
	or.w d0,d1
	move.w ($374,a6),d0
	not.w d0
	and.w ($372,a6),d0
	or.w d0,d1
	move.w ($372,a6),d0
	not.w d0
	and.w ($370,a6),d0
	move.w d0,($378,a6)
	or.w d0,d1
	move.w d1,($2aa,a6)
	move.w ($370,a6),d0
	not.w d0
	and.w ($372,a6),d0
	move.w d0,($37a,a6)
	bra.b loc_027b10

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_027b0c:
	dc.b $00,$02,$01,$03

;----------------------------------------------
loc_027b10:
	tst.b ($2c9,a6)
	beq.b loc_027b2c
	move.w ($37c,a6),d0
	andi.w #3,d0
	move.b loc_027b0c(pc,d0.w),d0
	andi.w #$fffc,($37c,a6)
	or.w d0,($37c,a6)

loc_027b2c:
	rts

;==============================================
loc_027b2e:
	cmpi.w #6,($138,a5)
	bne.b loc_027b3c
	move.w ($51e,a5),($91e,a5)

loc_027b3c:
	rts

;==============================================
loc_027b3e:
	tst.b ($125,a6)
	beq.b loc_027b46
	bra.b loc_027b4a

loc_027b46:
	bsr.w loc_027aac

loc_027b4a:
	moveq #0,d0
	move.b (4,a6),d0
	move.w loc_027b5e(pc,d0.w),d1
	jsr loc_027b5e(pc,d1.w)
	jmp loc_02ff8a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_027b5e:
	dc.w loc_027b66-loc_027b5e
	dc.w loc_027c94-loc_027b5e
	dc.w loc_02a708-loc_027b5e
	dc.w loc_02a708-loc_027b5e

;==============================================
loc_027b66:
	moveq #0,d0
	move.b d0,($31,a6)
	move.b d0,($67,a6)
	move.b d0,($5e,a6)
	move.b d0,($5d,a6)
	move.b d0,($5b,a6)
	move.b d0,($68,a6)
	move.b d0,($114,a6)
	move.b d0,($3e,a6)
	moveq #0,d0
	move.w #$1f,d6
	lea.l ($80,a6),a0

loc_027b92:
	move.l d0,(a0)+
	dbra d6,loc_027b92
	moveq #0,d0
	move.w #$9f,d6
	lea.l ($180,a6),a0

loc_027ba2:
	move.l d0,(a0)+
	dbra d6,loc_027ba2
	move.b #1,(1,a6)
	move.w #$90,($50,a6)
	move.w #$90,($52,a6)
	move.b #8,($26d,a6)
	move.b #$1e,($278,a6)
	tst.b ($125,a6)
	bne.b loc_027bf6
	move.b ($15e,a6),($f0,a6)
	move.b ($15a,a6),($ec,a6)
	move.b ($131,a6),($eb,a6)
	tst.b ($15d,a5)
	beq.b loc_027bf6
	tst.b ($14b,a6)
	beq.b loc_027bf6
	move.w ($154,a6),($50,a6)
	move.w ($154,a6),($52,a6)

loc_027bf6:
	jsr loc_02fc84
	bsr.w loc_02bf16
	bsr.w loc_02beca
	bsr.w loc_02ad26
	bsr.w loc_02bdd6
	bsr.w loc_02c0ce
	bsr.w loc_02bfaa
	jsr loc_02077a
	bsr.w loc_02c0ac
	jsr loc_02fc4a
	bsr.w loc_02bea8
	move.b #-1,($c,a6)
	jsr loc_02f15c
	cmpi.w #6,($138,a5)
	bne.b loc_027c6e

loc_027c3c:
	bsr.w loc_02baf2

loc_027c40:
	tst.b ($ec,a6)
	bne.b loc_027c54
	cmpi.b #-1,(PL_ism_choice,a6)
	beq.b loc_027c54
	move.b #1,(pl_taunt_count,a6)

loc_027c54:
	move.b ($102,a6),d0
	ext.w d0
	lsl.w #2,d0
	movea.l #loc_0dd192,a0
	movea.l (a0,d0.w),a0
	jsr (a0)
	jmp loc_02e322

loc_027c6e:
	bsr.w loc_02b854
	tst.b ($159,a6)
	beq.b loc_027c3c
	move.l #$20e0000,($4,a6)
	tst.b ($32b,a6)
	bne.b loc_027c8c
	moveq #$22,d0
	bsr.w loc_02a708

loc_027c8c:
	bsr.b loc_027c40
	bra.w loc_02a070
	rts

;==============================================
loc_027c94:
	tst.b ($125,a6)
	beq.b loc_027caa
	jsr loc_0329aa
	beq.b loc_027cb2
	jsr loc_032ae0
	bra.b loc_027cb2

loc_027caa:
	bsr.w loc_02b148
	bsr.w loc_029884

loc_027cb2:
	bsr.w loc_027cda
	bsr.w loc_027fa2

loc_027cba:
	moveq #0,d0
	move.b (5,a6),d0
	move.w loc_027cc8(pc,d0.w),d1
	jmp loc_027cc8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_027cc8:
	dc.w loc_027fe2-loc_027cc8
	dc.w loc_028afe-loc_027cc8
	dc.w loc_029c20-loc_027cc8
	dc.w loc_029c48-loc_027cc8
	dc.w loc_029d5a-loc_027cc8
	dc.w loc_029d88-loc_027cc8
	dc.w loc_029e18-loc_027cc8
	dc.w loc_02a070-loc_027cc8

	dc.w loc_02a518-loc_027cc8

;==============================================
loc_027cda:
	clr.b ($2c6,a6)
	bsr.w loc_027e54
	tst.b ($25d,a6)
	beq.b loc_027cec
	subq.b #1,($25d,a6)

loc_027cec:
	tst.w ($ba,a6)
	beq.b loc_027d32
	movea.w ($38,a6),a0
	tst.w ($50,a0)
	bmi.b loc_027d32
	subq.w #1,($e4,a6)
	subq.w #1,($e2,a6)
	bne.b loc_027d20
	move.w #3,($e2,a6)
	subq.w #1,($ba,a6)
	bne.b loc_027d20
	clr.b ($b9,a6)
	clr.w ($e2,a6)
	clr.w ($11e,a6)
	bra.b loc_027d32

loc_027d20:
	move.w ($ba,a6),d0
	cmp.w ($11e,a6),d0
	bcc.b loc_027d32
	move.w d0,($11e,a6)
	bsr.w loc_027dec

loc_027d32:
	tst.b ($28a,a6)
	beq.b loc_027d3c
	subq.b #1,($28a,a6)

loc_027d3c:
	tst.b (PL_Reversal_Window,a6)
	beq.b loc_027d46
	subq.b #1,(PL_Reversal_Window,a6)

loc_027d46:
	tst.b ($23f,a6)
	beq.b loc_027d50
	subq.b #1,($23f,a6)

loc_027d50:
	tst.b ($5f,a6)
	bne.b loc_027d84
	tst.b ($24e,a6)
	beq.b loc_027d84
	subq.b #1,($24e,a6)
	bsr.w loc_02b56a
	tst.b d6
	beq.b loc_027d84
	move.b #$10,($2ae,a6)
	move.b #2,($2ad,a6)
	move.b #2,($27b,a6)
	sub.b d6,($24e,a6)
	bpl.b loc_027d84
	clr.b ($24e,a6)

loc_027d84:
	tst.b ($2cb,a6)
	beq.b loc_027d94
	subq.b #1,($2cb,a6)
	bne.b loc_027d94
	clr.b ($2cc,a6)

loc_027d94:
	tst.w ($50,a6)
	bmi.b loc_027daa
	tst.b ($24b,a6)
	beq.b loc_027daa
	subq.b #1,($24b,a6)
	bne.b loc_027daa
	bsr.w loc_027e10

loc_027daa:
	tst.b ($d2,a6)
	beq.b loc_027db4
	subq.b #1,($d2,a6)

loc_027db4:
	tst.b ($2ad,a6)
	beq.b loc_027dcc
	subq.b #1,($2ad,a6)
	bne.b loc_027dcc
	move.b #0,($2ae,a6)
	move.b #$ff,($2a1,a6)

loc_027dcc:
	clr.w ($d4,a6)
	tst.b ($27b,a6)
	beq.b loc_027dea
	subq.b #1,($27b,a6)
	moveq #1,d0
	btst.b #0,($27b,a6)
	bne.b loc_027de6
	neg.w d0

loc_027de6:
	move.w d0,($d4,a6)

loc_027dea:
	rts

;==============================================
loc_027dec:
	cmpi.w #6,($138,a5)
	bne.b loc_027e0e
	cmpi.b #1,($101,a6)
	bne.b loc_027e0e
	lea.l (p1memory,a5),a0
	move.w ($ba,a6),d0
	cmp.w ($11e,a0),d0
	bcc.b loc_027e0e
	move.w d0,($11e,a0)

loc_027e0e:
	rts

;==============================================
loc_027e10:
	tst.b ($24d,a6)
	beq.b loc_027e52
	subq.b #1,($24d,a6)
	moveq #0,d0
	move.b ($24c,a6),d0
	sub.b ($24d,a6),d0
	cmpi.b #$20,d0
	bcc.b loc_027e4c
	moveq #0,d1
	move.b ($26d,a6),d1
	lsl.w #5,d1
	movea.l #loc_0c815a,a0
	lea.l (a0,d1.w),a0
	move.b (a0,d0.w),d0
	cmp.b ($278,a6),d0
	bcc.b loc_027e4c
	move.b d0,($24b,a6)
	rts

loc_027e4c:
	move.b ($278,a6),($24b,a6)

loc_027e52:
	rts

;==============================================
loc_027e54:
	movea.w ($38,a6),a4
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.w loc_027f60
	tst.b (1,a6)
	beq.w loc_027f60
	cmpi.w #$206,(4,a6)
	beq.w loc_027f60
	cmpi.w #$204,(4,a6)
	beq.w loc_027f60
	tst.b ($ab,a6)
	bne.w loc_027f60
	tst.b ($285,a6)
	beq.w loc_027f60
	subq.b #1,($285,a6)
	beq.w loc_027eb8
	tst.b ($284,a6)
	bne.w loc_027f60
	move.b ($28f,a6),d0
	sub.b ($285,a6),d0
	cmpi.b #$18,d0
	bcc.w loc_027f62
	bra.w loc_027f60

loc_027eb8:
	move.w ($288,a6),d0
	move.b d0,($330,a6)
	sub.w d0,($50,a6)
	bpl.w loc_027f54
	move.l #$2020000,(4,a6)
	move.b #$d,($55,a6)
	move.b #1,($2ca,a6)
	btst.b #1,($101,a6)
	beq.b loc_027ef2
	move.b ($286,a6),($4b4,a5)
	move.b ($286,a6),($8b4,a5)
	bra.b loc_027ef8

loc_027ef2:
	move.b ($286,a6),($b4,a4)

loc_027ef8:
	tst.b ($67,a6)
	beq.w loc_027f3a
	move.l #$2020200,($4,a4)
	clr.b ($57,a4)
	move.b #4,($54,a4)
	move.b #$f,($55,a4)
	clr.b ($67,a6)
	clr.b ($67,a4)
	clr.b ($263,a4)
	move.b ($b,a4),($66,a4)
	eori.b #1,($66,a4)
	clr.b ($23a,a4)
	move.b #1,($2ca,a6)

loc_027f3a:
	move.b ($286,a6),d0
	subi.b #$a,d0
	add.b d0,d0
	move.b d0,($248,a4)
	move.b #0,($12b,a5)
	jmp loc_0810fc

loc_027f54:
	subq.b #1,($284,a6)
	bmi.b loc_027f62
	move.b ($28f,a6),($285,a6)

loc_027f60:
	rts

loc_027f62:
	clr.b ($284,a6)
	clr.b ($285,a6)
	clr.b ($28f,a6)
	move.l #$2020000,(4,a6)
	move.b #$d,($55,a6)
	move.b #1,($2ca,a6)
	move.b #1,($2ce,a6)
	clr.b ($2cb,a6)
	clr.b ($2cc,a6)
	move.b ($b,a4),($66,a6)
	move.b #0,($57,a6)
	jmp loc_003872

;==============================================
loc_027fa2:
	moveq #0,d0
	move.b ($2c2,a6),d0
	beq.b loc_027fc0
	subq.b #1,($2c2,a6)
	move.b loc_027fc2(pc,d0.w),d0
	ext.w d0
	tst.b ($b,a6)
	beq.b loc_027fbc
	neg.w d0

loc_027fbc:
	add.w d0,($10,a6)

loc_027fc0:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_027fc2:
	dc.b $00,$00,$01,$01,$02,$02,$03,$03
	dc.b $04,$04,$05,$05,$06,$06,$07,$07
	dc.b $08,$08,$09,$09,$0a,$0a,$0b,$0b
	dc.b $0c,$0c,$0d,$0d,$0e,$0e,$0f,$0f

;==============================================
loc_027fe2:
	tst.b ($5f,a6)
	beq.b loc_028002
	subq.b #1,($5f,a6)
	bsr.w loc_02a7e2
	cmpi.b #4,($102,a6)
	bne.b loc_027ffe
	jsr loc_03d96e

loc_027ffe:
	bra.w loc_02ada2

loc_028002:
	tst.b ($125,a6)
	beq.b loc_028054
	tst.b ($249,a6)
	bne.b loc_028054
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.b loc_028054
	cmpi.w #$200,(4,a6)
	bne.b loc_028044
	cmpi.b #$e,(6,a6)
	bne.b loc_028044
	cmpi.b #6,($102,a6)
	beq.b loc_02803c
	cmpi.b #$f,($102,a6)
	bne.b loc_028044

loc_02803c:
	cmpi.b #$c,($aa,a6)
	beq.b loc_028054

loc_028044:
	jsr loc_030a80
	cmpi.w #$204,(4,a6)
	beq.w loc_027cba

loc_028054:
	moveq #0,d0
	move.b (6,a6),d0
	move.w loc_028066(pc,d0.w),d1
	jsr loc_028066(pc,d1.w)
	bra.w loc_02ada2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_028066:
	dc.w loc_028078-loc_028066;66
	dc.w loc_02818c-loc_028066;
	dc.w loc_02828c-loc_028066;6a
	dc.w loc_028362-loc_028066;6c
	dc.w loc_0286de-loc_028066
	dc.w loc_0287b0-loc_028066
	dc.w loc_0287e0-loc_028066
	dc.w loc_028ad8-loc_028066

	dc.w loc_028ad8-loc_028066

;==============================================
loc_028078:
	move.b (7,a6),d0
	move.w loc_028084(pc,d0.w),d1
	jmp loc_028084(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_028084:
	dc.w loc_02808c-loc_028084
	dc.w loc_0280b8-loc_028084
	dc.w loc_02811a-loc_028084
	dc.w loc_028164-loc_028084

;----------------------------------------------
loc_02808c:
	addq.b #2,(7,a6)
	clr.b ($124,a6)
	moveq #0,d0
	tst.b ($125,a6)
	bne.b loc_0280a8
	cmpi.b #$a,($102,a6)
	bne.b loc_0280a6
	moveq #$30,d0

loc_0280a6:
	bra.b loc_0280b4

loc_0280a8:
	tst.b ($2c8,a6)
	beq.b loc_0280b4
	addq.b #2,(7,a6)
	moveq #1,d0

loc_0280b4:
	bsr.w loc_02a708

loc_0280b8:
	clr.b ($2c8,a6)
	tst.b ($10d,a5)
	bne.w loc_02aca0
	bsr.w loc_02af7a
	bne.w loc_02b002
	bsr.w loc_02b746
	bne.b loc_028116
	tst.b ($10e,a5)
	bne.b loc_028116
	bsr.w loc_02aab2
	bne.w loc_02aabc
	tst.b ($125,a6)
	bne.b loc_028116
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02b1c8
	bsr.w loc_02aaf0
	bne.w loc_02aaf8
	bsr.w loc_02a96e
	bne.w loc_02a98c
	bsr.w loc_02ab24
	bne.w loc_02ac60
	bsr.w loc_02a8fa
	bne.w loc_02a908

loc_028116:
	bra.w loc_02a7ea

loc_02811a:
	move.b #1,($2c8,a6)
	tst.b ($10d,a5)
	bne.w loc_02aca0
	bsr.w loc_02af7a
	bne.w loc_02b002
	bsr.w loc_02b746
	bne.b loc_028164
	bsr.w loc_02aab2
	bne.w loc_02aabc
	tst.b ($125,a6)
	bne.b loc_028164
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02b1c8
	bsr.w loc_02aaf0
	beq.w loc_02ab12
	bsr.w loc_02ab24
	bne.w loc_02ac60

loc_028164:
	cmpi.b #6,($102,a6)
	bne.b loc_028188
	tst.b ($35,a6)
	beq.b loc_028188
	clr.b ($35,a6)
	jsr loc_01c2c8
	beq.b loc_028188
	move.l #$1003a05,(a4)
	move.w a6,($36,a4)

loc_028188:
	bra.w loc_02a7ea

;==============================================
loc_02818c:
	move.b (7,a6),d0
	move.w loc_028198(pc,d0.w),d1
	jmp loc_028198(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_028198:
	dc.w loc_0281a0-loc_028198
	dc.w loc_0281b0-loc_028198
	dc.w loc_02821a-loc_028198
	dc.w loc_02822a-loc_028198

;----------------------------------------------
loc_0281a0:
	addq.b #2,(7,a6)
	tst.b ($125,a6)
	beq.b loc_0281b0
	moveq #7,d0
	bsr.w loc_02a708

loc_0281b0:
	tst.b ($10d,a5)
	bne.w loc_02aca0
	bsr.w loc_02af7a
	bne.w loc_02b002
	tst.b ($125,a6)
	bne.b loc_028206
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02b1c8
	bsr.w loc_02a96e
	bne.w loc_02a98c
	bsr.w loc_02ab24
	bne.w loc_02ac60
	bsr.w loc_02aaf0
	bne.b loc_028206
	bsr.w loc_02a8fa
	bne.w loc_02a908
	addq.b #2,(7,a6)
	move.b ($35,a6),d0
	andi.w #$ff,d0
	addq.w #4,d0
	bra.w loc_02a708

loc_028206:
	bsr.w loc_02aab2
	bne.w loc_02aabc
	tst.b ($33,a6)
	bmi.w loc_02bb26
	bra.w loc_02a7ea

;----------------------------------------------
loc_02821a:
	addq.b #2,(7,a6)
	tst.b ($125,a6)
	beq.b loc_02822a
	moveq #4,d0
	bsr.w loc_02a708

loc_02822a:
	tst.b ($10d,a5)
	bne.w loc_02aca0
	bsr.w loc_02af7a
	bne.w loc_02b002
	tst.b ($125,a6)
	bne.b loc_028278
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02b1c8
	bsr.w loc_02a96e
	bne.w loc_02a98c
	bsr.w loc_02ab24
	bne.w loc_02ac60
	bsr.w loc_02aaf0
	beq.b loc_028278
	clr.b (7,a6)
	move.b ($35,a6),d0
	andi.w #$ff,d0
	addq.w #7,d0
	bra.w loc_02a708

loc_028278:
	bsr.w loc_02aab2
	bne.w loc_02aabc
	tst.b ($33,a6)
	bmi.w loc_02baf2
	bra.w loc_02a7ea

;==============================================
loc_02828c:
	move.b (7,a6),d0
	move.w loc_028298(pc,d0.w),d1
	jmp loc_028298(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_028298:
	dc.w loc_02829c-loc_028298
	dc.w loc_0282e0-loc_028298

;----------------------------------------------
loc_02829c:
	addq.b #2,(7,a6)
	clr.b ($2c8,a6)

loc_0282a4:
	move.b ($2c9,a6),($b,a6)
	moveq #2,d0
	tst.b ($3c,a6)
	beq.b loc_0282b4
	moveq #3,d0

loc_0282b4:
	bsr.w loc_02a708
	moveq #0,d1
	tst.b ($3c,a6)
	beq.b loc_0282c2
	addq.b #4,d1

loc_0282c2:
	move.b ($102,a6),d0
	ext.w d0
	lsl.w #3,d0
	add.w d1,d0
	movea.l ($2d0,a6),a0
	move.l (a0,d0.w),d0
	tst.b ($b,a6)
	beq.b loc_0282dc
	neg.l d0

loc_0282dc:
	move.l d0,($40,a6)

loc_0282e0:
	tst.b ($10d,a5)
	bne.w loc_02aca0
	bsr.w loc_02af7a
	bne.w loc_02b002
	bsr.w loc_02b746
	bne.b loc_028338
	tst.b ($125,a6)
	bne.b loc_02833c
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02b1c8
	bsr.w loc_02a96e
	bne.w loc_02a98c
	bsr.w loc_02ab24
	bne.w loc_02ac60
	bsr.w loc_02aaf0
	bne.w loc_02aaf8
	bsr.w loc_02aaa8
	beq.w loc_02bae0
	bsr.w loc_02aab2
	bne.w loc_02aabc
	bsr.w loc_02a958

loc_028338:
	bra.w loc_02a7ea

loc_02833c:
	bsr.w loc_02aab2
	bne.w loc_0282a4
	move.b ($211,a6),d0
	cmp.b ($3c,a6),d0
	beq.b loc_028356
	move.b d0,($3c,a6)
	bra.w loc_0282a4

loc_028356:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	bra.w loc_02a7ea

;==============================================
loc_028362:
	move.b (7,a6),d0
	move.w loc_02836e(pc,d0.w),d1
	jmp loc_02836e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02836e:
	dc.w loc_028380-loc_02836e
	dc.w loc_0283b6-loc_02836e
	dc.w loc_028480-loc_02836e
	dc.w loc_0284ec-loc_02836e
	dc.w loc_02855c-loc_02836e
	dc.w loc_0285f0-loc_02836e
	dc.w loc_028638-loc_02836e
	dc.w loc_028692-loc_02836e

	dc.w loc_0286b4-loc_02836e

;==============================================
loc_028380:
	tst.b ($33,a6)
	bpl.b loc_0283b2
	addq.b #2,($7,a6)
	clr.b ($2c8,a6)
	move.b #1,($31,a6)
	clr.b ($23f,a6)
	moveq #$13,d0
	cmpi.b #1,($3c,a6)
	beq.b loc_0283ae
	moveq #$14,d0
	cmpi.b #$ff,($3c,a6)
	beq.b loc_0283ae
	moveq #$12,d0

loc_0283ae:
	bra.w loc_02a708

loc_0283b2:
	bra.w loc_02a7ea

;==============================================
loc_0283b6:
	bsr.w loc_02aa08
	bcc.b loc_02842c
	tst.l ($44,a6)
	bpl.b loc_02842c
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b ($a9,a6)
	clr.b ($328,a6)
	clr.b ($32d,a6)
	jsr loc_00369c
	tst.b ($125,a6)
	bne.b loc_02841e
	cmpi.b #$e,($102,a6)
	bne.b loc_0283fe
	jsr loc_051af4
	beq.b loc_0283fe
	jmp loc_051b12

loc_0283fe:
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02b1c8
	bsr.w loc_02ab24
	bne.w loc_02ac60
	bsr.w loc_02aab2
	bne.w loc_02aabc

loc_02841e:
	addq.b #2,(7,a6)
	clr.b ($328,a6)
	moveq #$11,d0
	bra.w loc_02a708

loc_02842c:
	tst.b ($125,a6)
	bne.b loc_028456
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02a9d0
	bsr.w loc_02b6ac
	bne.w loc_02b714
	bsr.w loc_02ab24
	bne.w loc_02b736
	bra.w loc_02a7ea

loc_028456:
	jsr loc_030758
	bne.w loc_02a9d0
	jsr loc_0309d0
	bne.w loc_02b714
	tst.b (PL_ism_choice,a6)
	bmi.w loc_02a7ea
	jsr loc_030a2a
	bne.w loc_02b736
	bra.w loc_02a7ea

;==============================================
loc_028480:
	tst.b ($125,a6)
	beq.b loc_0284a8
	tst.b ($33,a6)
	bpl.w loc_02a7ea
	tst.b ($2c1,a6)
	beq.w loc_02baf2
	clr.b ($201,a6)
	clr.b ($202,a6)
	jsr loc_032258
	bra.w loc_02baf2

loc_0284a8:
	tst.b ($10d,a5)
	bne.w loc_02aca0
	bsr.w loc_02af7a
	bne.w loc_02b002
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02b1c8
	bsr.w loc_02aab2
	bne.w loc_02aabc
	bsr.w loc_02ab24
	bne.w loc_02ac60
	tst.b ($33,a6)
	bpl.w loc_02a7ea
	bsr.w loc_02aaf0
	bne.w loc_02aaf8
	bra.w loc_02baf2

;----------------------------------------------
loc_0284ec:
	bsr.w loc_02aa08
	bcc.b loc_02852e
	tst.l ($44,a6)
	bpl.b loc_02852e

loc_0284f8:
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b ($a9,a6)
	clr.b ($32d,a6)
	jsr loc_00369c
	tst.b ($125,a6)
	bne.b loc_028522
	bsr.w loc_02ab24
	bne.w loc_02ac60

loc_028522:
	move.b #4,(7,a6)
	moveq #$11,d0
	bra.w loc_02a708

loc_02852e:
	tst.b ($33,a6)
	bpl.b loc_028544
	tst.b ($b9,a6)
	beq.b loc_028544
	move.b #2,(7,a6)
	clr.b ($a9,a6)

loc_028544:
	bsr.w loc_02a7ea
	cmpi.b #$b,($102,a6)
	bne.b loc_02855a
	tst.b ($35,a6)
	beq.b loc_02855a
	clr.b ($35,a6)

loc_02855a:
	rts

;----------------------------------------------
loc_02855c:
	bsr.w loc_02aa08
	bcc.b loc_02859e
	tst.l ($44,a6)
	bpl.b loc_02859e
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b ($a9,a6)
	clr.b ($32d,a6)
	jsr loc_00369c
	tst.b ($125,a6)
	bne.b loc_028592
	bsr.w loc_02ab24
	bne.w loc_02ac60

loc_028592:
	move.b #4,(7,a6)
	moveq #$11,d0
	bra.w loc_02a708

loc_02859e:
	tst.b ($125,a6)
	bne.b loc_0285dc
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02a9d0
	bsr.w loc_02ab24
	bne.b loc_0285d8
	move.b ($2c9,a6),d0
	move.b ($b,a6),d1
	cmp.b d0,d1
	beq.b loc_0285d2
	move.b #0,($d2,a6)
	move.b #0,($d3,a6)

loc_0285d2:
	move.b #2,(7,a6)

loc_0285d8:
	bra.w loc_02a7ea

loc_0285dc:
	jsr loc_030758
	bne.w loc_02a9d0
	jsr loc_0307d0
	bne.b loc_0285d8
	bra.b loc_0285d2

;----------------------------------------------
loc_0285f0:
	tst.b ($33,a6)
	bpl.b loc_028634
	move.b #2,(7,a6)
	moveq #0,d0
	move.b ($102,a6),d0
	ext.w d0
	lsl.w #6,d0
	movea.l ($2d4,a6),a0
	lea.l ($20,a0,d0.w),a0
	move.l (a0)+,d0
	move.l (a0)+,($44,a6)
	move.l (a0)+,d1
	move.l (a0),($4c,a6)
	eori.b #1,($b,a6)
	beq.b loc_028626
	neg.l d0
	neg.l d1

loc_028626:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	moveq #$13,d0
	bra.w loc_02a708

loc_028634:
	bra.w loc_02a7ea

;----------------------------------------------
loc_028638:
	bsr.w loc_02aa08
	bcc.b loc_02867e
	tst.l ($44,a6)
	bpl.b loc_02867e
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b ($a9,a6)
	clr.b ($328,a6)
	clr.b ($32d,a6)
	jsr loc_00369c
	tst.b ($125,a6)
	bne.b loc_028672
	bsr.w loc_02ab24
	bne.w loc_02ac60

loc_028672:
	move.b #4,(7,a6)
	moveq #$11,d0
	bra.w loc_02a708

loc_02867e:
	tst.b ($33,a6)
	bpl.b loc_02868e
	move.b #2,(7,a6)
	clr.b ($a9,a6)

loc_02868e:
	bra.w loc_02a7ea

;----------------------------------------------
loc_028692:
	move.l #$2000600,(4,a6)
	move.b ($2c9,a6),($b,a6)
	clr.b ($217,a6)
	move.b ($211,a6),($3c,a6)
	bsr.w loc_02aa46
	moveq #$10,d0
	bra.w loc_02a708

;----------------------------------------------
loc_0286b4:
	jsr loc_02aa08(pc)
	nop
	bcs.w loc_0284f8
	subq.b #1,($3a,a6)
	bne.w loc_02a7ea
	move.l #$2000602,(4,a6)
	tst.b ($ac,a6)
	beq.b loc_0286dc
	addq.b #1,($32d,a6)
	clr.b ($270,a6)

loc_0286dc:
	rts

;==============================================
loc_0286de:
	move.b (7,a6),d0
	move.w loc_0286ea(pc,d0.w),d1
	jmp loc_0286ea(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0286ea:
	dc.w loc_0286ee-loc_0286ea
	dc.w loc_02875e-loc_0286ea

;----------------------------------------------
loc_0286ee:
	tst.b ($125,a6)
	bne.b loc_028748
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02b1c8
	bsr.w loc_02a96e
	bne.w loc_02a98c
	bsr.w loc_02a8fa
	bne.w loc_02a908
	bsr.w loc_02aaf0
	beq.b loc_02872e
	addq.b #2,(7,a6)
	move.b ($35,a6),d0
	andi.w #$ff,d0
	addi.w #$d,d0
	bra.w loc_02a708

loc_02872e:
	bsr.w loc_02ab24
	bne.w loc_02ac60
	tst.b ($33,a6)
	bmi.w loc_02baf2
	move.b ($2c9,a6),($b,a6)
	bra.w loc_02a7ea

loc_028748:
	tst.b ($33,a6)
	bpl.b loc_02875a
	tst.b ($2c8,a6)
	beq.w loc_02baf2
	bra.w loc_02bb26

loc_02875a:
	bra.w loc_02a7ea

;----------------------------------------------
loc_02875e:
	tst.b ($125,a6)
	bne.b loc_028748
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02b1c8
	bsr.w loc_02a96e
	bne.w loc_02a98c
	bsr.w loc_02ab24
	bne.w loc_02ac60
	bsr.w loc_02aaf0
	bne.b loc_02879e
	clr.b (7,a6)
	move.b ($35,a6),d0
	andi.w #$ff,d0
	addi.w #$a,d0
	bra.w loc_02a708

loc_02879e:
	tst.b ($33,a6)
	bmi.w loc_02bb26
	move.b ($2c9,a6),($b,a6)
	bra.w loc_02a7ea

;==============================================
loc_0287b0:
	tst.b ($28e,a6)
	beq.b loc_0287ba
	subq.b #1,($28e,a6)

loc_0287ba:
	tst.b ($293,a6)
	beq.b loc_0287c4
	subq.b #1,($293,a6)

loc_0287c4:
	tst.b ($23e,a6)
	beq.b loc_0287ce
	subq.b #1,($23e,a6)

loc_0287ce:
	move.b ($102,a6),d0
	lsl.w #2,d0
	movea.l #loc_0dcb92,a0
	movea.l (a0,d0.w),a0
	jmp (a0)

;==============================================
loc_0287e0:
	move.b (7,a6),d0
	move.w loc_0287ec(pc,d0.w),d1
	jmp loc_0287ec(pc,d1.w)


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0287ec:
	dc.w loc_0287fa-loc_0287ec
	dc.w loc_0288a2-loc_0287ec
	dc.w loc_0288e2-loc_0287ec
	dc.w loc_028984-loc_0287ec
	dc.w loc_0289c4-loc_0287ec
	dc.w loc_0289f0-loc_0287ec
	dc.w loc_028a3a-loc_0287ec

;----------------------------------------------
loc_0287fa:
	tst.b ($10d,a5)
	bne.w loc_02aca0
	bsr.w loc_02af7a
	bne.w loc_02b002
	tst.b ($125,a6)
	bne.b loc_028868
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02b1c8
	bsr.w loc_02a96e
	bne.w loc_02a98c
	bsr.w loc_02ab24
	beq.b loc_028840
	bsr.w loc_02ab0a
	bne.w loc_02888a

loc_028836:
	move.b ($2c9,a6),($b,a6)
	bra.w loc_02a7ea

loc_028840:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),d0
	move.b ($b,a6),d1
	cmp.b d0,d1
	beq.b loc_028862
	move.b #0,($d2,a6)
	move.b #0,($d3,a6)
	move.b ($2c9,a6),($b,a6)

loc_028862:
	moveq #$17,d0
	bra.w loc_02a708

loc_028868:
	jsr loc_0307d0
	beq.w loc_02baf2
	movea.w ($38,a6),a4
	tst.b ($ed,a4)
	bne.w loc_02888a
	tst.b ($31,a4)
	bne.b loc_028836
	tst.b ($2c8,a4)
	beq.b loc_028836

loc_02888a:
	move.b #4,(7,a6)
	move.b #1,($2c8,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #$19,d0
	bra.w loc_02a708

;----------------------------------------------
loc_0288a2:
	tst.b ($125,a6)
	bne.b loc_0288d0
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02b1c8
	bsr.w loc_02a96e
	bne.w loc_02a98c
	bsr.w loc_02ab24
	bne.w loc_028970
	bsr.w loc_02a8fa
	bne.w loc_02a908

loc_0288d0:
	tst.b ($33,a6)
	bmi.w loc_02baf2
	move.b ($2c9,a6),($b,a6)
	bra.w loc_02a7ea

;----------------------------------------------
loc_0288e2:
	tst.b ($10d,a5)
	bne.w loc_02aca0
	bsr.w loc_02af7a
	bne.w loc_02b002
	tst.b ($125,a6)
	bne.b loc_028950
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02b1c8
	bsr.w loc_02a96e
	bne.w loc_02a98c
	bsr.w loc_02ab24
	beq.b loc_028928
	bsr.w loc_02aaf0
	beq.w loc_028970

loc_02891e:
	move.b ($2c9,a6),($b,a6)
	bra.w loc_02a7ea

loc_028928:
	addq.b #2,(7,a6)
	move.b ($2c9,a6),d0
	move.b ($b,a6),d1
	cmp.b d0,d1
	beq.b loc_02894a
	move.b #0,($d2,a6)
	move.b #0,($d3,a6)
	move.b ($2c9,a6),($b,a6)

loc_02894a:
	moveq #$1a,d0
	bra.w loc_02a708

loc_028950:
	jsr loc_0307d0
	beq.w loc_02bb26
	movea.w ($38,a6),a4
	tst.b ($ed,a4)
	bne.b loc_02891e
	tst.b ($2c8,a4)
	beq.b loc_028970
	tst.b ($31,a4)
	beq.b loc_02891e

loc_028970:
	clr.b (7,a6)
	clr.b ($2c8,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #$16,d0
	bra.w loc_02a708

;----------------------------------------------
loc_028984:
	tst.b ($125,a6)
	bne.b loc_0289b2
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02b1c8
	bsr.w loc_02a96e
	bne.w loc_02a98c
	bsr.w loc_02ab24
	bne.w loc_02888a
	bsr.w loc_02a8fa
	bne.w loc_02a908

loc_0289b2:
	tst.b ($33,a6)
	bmi.w loc_02bb26
	move.b ($2c9,a6),($b,a6)
	bra.w loc_02a7ea

;----------------------------------------------
loc_0289c4:
	move.b ($2c9,a6),($b,a6)
	moveq #0,d1
	moveq #$15,d0
	movea.w ($38,a6),a4
	tst.b ($31,a4)
	bne.b loc_0289e8
	tst.b ($ed,a4)
	bne.b loc_0289e4
	tst.b ($2c8,a4)
	beq.b loc_0289e8

loc_0289e4:
	addq.b #4,d1
	moveq #$18,d0

loc_0289e8:
	move.b d1,(7,a6)
	bra.w loc_02a708

;----------------------------------------------
loc_0289f0:
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b ($27f,a6),d0
	move.b loc_028a2a(pc,d0.w),($3a,a6)

loc_028a00:
	movea.l #loc_02d0bc,a0
	tst.b ($2c8,a6)
	beq.b loc_028a12
	movea.l #loc_02d0c4,a0

loc_028a12:
	moveq #0,d0
	move.b ($27e,a6),d0
	move.b (a0,d0.w),d0
	addq.b #1,($27e,a6)
	andi.b #7,($27e,a6)
	bra.w loc_02a758

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_028a2a:
	dc.b $07,$0c,$10,$10,$10,$24,$1c,$2c
	dc.b $10,$38,$10,$12,$10,$10,$10,$10

;----------------------------------------------
loc_028a3a:
	tst.b ($33,a6)
	bmi.b loc_028a9c
	tst.b ($3a,a6)
	beq.b loc_028a4e
	subq.b #1,($3a,a6)
	bra.w loc_028ace

loc_028a4e:
	tst.b ($125,a6)
	bne.w loc_02a7ea
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02b1c8
	bsr.w loc_02a96e
	bne.w loc_02a98c
	tst.b ($2c8,a6)
	bne.b loc_028a88
	btst.b #2,($371,a6)
	beq.w loc_02a7ea
	move.b #1,($2c8,a6)
	bra.w loc_028a00

loc_028a88:
	btst.b #2,($371,a6)
	bne.w loc_02a7ea
	move.b #0,($2c8,a6)
	bra.w loc_028a00

loc_028a9c:
	clr.b ($27e,a6)
	tst.b ($125,a6)
	bne.w loc_029b50
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02b1c8
	bsr.w loc_02ab24
	bne.w loc_02ac60
	btst.b #2,($371,a6)
	beq.w loc_02baf2
	bra.w loc_02bb26

loc_028ace:
	tst.b ($35,a6)
	bne.w loc_02a7ea
	rts

;==============================================
loc_028ad8:
	clr.b ($247,a6)
	clr.b ($23b,a6)
	move.b ($102,a6),d0
	lsl.w #2,d0
	movea.l #loc_0dcc12,a0
	tst.b ($125,a6)
	beq.b loc_028af8
	movea.l #loc_0dcc92,a0

loc_028af8:
	movea.l (a0,d0.w),a0
	jmp (a0)

;==============================================
loc_028afe:
	move.b (6,a6),d0
	move.w loc_028b0e(pc,d0.w),d1
	jsr loc_028b0e(pc,d1.w)
	bra.w loc_02ada2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_028b0e:
	dc.w loc_028b14-loc_028b0e
	dc.w loc_029284-loc_028b0e
	dc.w loc_029ac4-loc_028b0e


;==============================================
loc_028b14:

	move.b (7,a6),d0
	move.w loc_028b20(pc,d0.w),d1
	jmp loc_028b20(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_028b20:
	dc.w loc_028b26-loc_028b20
	dc.w loc_029140-loc_028b20
	dc.w loc_0291a0-loc_028b20

;----------------------------------------------
loc_028b26:
	addq.b #2,(7,a6)
	tst.b ($273,a6)
	bne.b loc_028b44
	move.b ($26c,a6),($273,a6)
	beq.b loc_028b44
	jsr loc_02e8d0
	move.b #$c,($114,a0)

loc_028b44:
	cmpi.b #$a,($102,a6)
	bne.b loc_028b5c
	tst.b ($29e,a6)
	beq.b loc_028b5c
	clr.b ($29e,a6)
	move.b #0,($2a0,a6)

loc_028b5c:
	cmpi.b #$1c,($102,a6)
	bne.b loc_028b70
	move.b #1,($6f,a6)
	move.b #1,($70,a6)

loc_028b70:
	bsr.w loc_02bcd8
	bsr.w loc_02c0ac
	bsr.w loc_02bac0
	tst.w ($ba,a6)
	beq.b loc_028bb6
	clr.w ($ba,a6)
	clr.b ($b9,a6)
	cmpi.w #6,($138,a5)
	bne.b loc_028baa
	cmpi.b #1,($101,a6)
	bne.b loc_028baa
	lea.l (p1memory,a5),a0
	subi.w #$48,($11e,a0)
	bpl.b loc_028baa
	clr.w ($11e,a0)

loc_028baa:
	subi.w #$48,($11e,a6)
	bpl.b loc_028bb6
	clr.w ($11e,a6)

loc_028bb6:
	cmpi.b #$ff,($55,a6)
	beq.w loc_028eac
	movea.w ($38,a6),a4
	clr.b ($284,a4)
	clr.b ($285,a4)
	clr.b ($28f,a4)
	tst.b ($135,a5)
	bne.b loc_028be6
	st.b ($135,a5)
	jsr loc_02e8d0
	move.b #8,($114,a0)

loc_028be6:
	moveq #0,d0
	move.b ($55,a6),d0
	add.w d0,d0
	move.w loc_028bf6(pc,d0.w),d1
	jmp loc_028bf6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_028bf6:
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060

	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c98-loc_028bf6;00a2
	dc.w loc_028cf2-loc_028bf6;00fc
	dc.w loc_028cc0-loc_028bf6;00ca
	dc.w loc_028d3a-loc_028bf6;0144


	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028cd2-loc_028bf6;00dc
	dc.w loc_028d56-loc_028bf6;0160
	dc.w loc_028d56-loc_028bf6;0160
	dc.w loc_028d96-loc_028bf6;01a0
	dc.w loc_028dc2-loc_028bf6;01cc
	dc.w loc_028dc2-loc_028bf6;01cc

	dc.w loc_028e02-loc_028bf6;020c
	dc.w loc_028e2e-loc_028bf6;0238
	dc.w loc_028e3e-loc_028bf6;0248
	dc.w loc_028e60-loc_028bf6;026a
	dc.w loc_028d3a-loc_028bf6;0144
	dc.w loc_028d3a-loc_028bf6;0144
	dc.w loc_02911a-loc_028bf6;0524
	dc.w loc_028e3e-loc_028bf6;0248

	dc.w loc_02911a-loc_028bf6;0524
	dc.w loc_028e82-loc_028bf6;028c
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060

	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060
	dc.w loc_028c56-loc_028bf6;0060

;==============================================
loc_028c56:
	move.b #0,($54,a6)
	clr.b ($287,a6)
	clr.b ($26b,a6)
	move.b ($2c9,a6),($b,a6)
	bsr.w loc_029332
	moveq #0,d0
	move.b ($55,a6),d0
	lea.l loc_02d5b2(pc),a0
	move.b (a0,d0.w),d0
	tst.b ($26c,a6)
	beq.b loc_028c84
	addq.b #1,d0

loc_028c84:
	bsr.w loc_02a75e
	bsr.w loc_02b11c
	moveq #0,d0
	tst.b ($5f,a6)
	beq.w loc_029140
	rts

;==============================================
loc_028c98:
	move.b #6,($54,a6)
	clr.b ($287,a6)

loc_028ca2:
	move.b #$ff,($31,a6)
	addq.b #1,($5d,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_02918e
	move.w d0,($14,a6)
	bra.w loc_02918e

;==============================================
loc_028cc0:
	move.b #1,($d6,a6)
	move.b #$7f,($26a,a6)
	move.b #1,($258,a6)

loc_028cd2:
	move.b #8,($54,a6)
	tst.w ($50,a6)
	bmi.b loc_028cec
	tst.b ($23a,a6)
	beq.b loc_028cec
	tst.b ($2ca,a6)
	beq.w loc_028d46

loc_028cec
	clr.b ($287,a6)
	bra.b loc_028ca2

;==============================================
loc_028cf2:
	move.b #8,($54,a6)
	clr.b ($287,a6)
	move.b #$ff,($31,a6)
	addq.b #1,($5d,a6)
	cmpi.b #$10,($29f,a6)
	bcc.b loc_028ca2
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_028d1c
	move.w d0,($14,a6)

loc_028d1c:
	moveq #0,d0
	move.b ($29f,a6),d0
	move.b loc_028d2a(pc,d0.w),d0
	bra.w loc_02a75e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_028d2a:
	dc.b $26,$27,$27,$26,$26,$26,$26,$26
	dc.b $25,$25,$24,$24,$24,$24,$24,$24

;==============================================
loc_028d3a:
	tst.w ($50,a6)
	bmi.b loc_028cd2
	tst.b ($2ca,a6)
	bne.b loc_028cd2

loc_028d46:
	move.b #$16,($29f,a6)
	move.b #$c,($55,a6)
	bra.w loc_028c98

;==============================================
loc_028d56:
	move.b #0,($54,a6)
	move.b #0,($287,a6)
	clr.b ($26b,a6)
	move.b #2,($2a0,a6)
	bsr.w loc_029332
	bsr.w loc_02918e
	tst.b ($251,a6)
	bne.b loc_028d84
	addq.b #1,($251,a6)
	jsr loc_083b28

loc_028d84:
	jsr loc_003688
	moveq #0,d0
	tst.b ($5f,a6)
	beq.w loc_029140
	rts

;==============================================
loc_028d96:
	move.b #8,($54,a6)
	move.b #0,($287,a6)
	move.b #2,($2a0,a6)
	tst.b ($251,a6)
	bne.b loc_028db8
	addq.b #1,($251,a6)
	jsr loc_083b28

loc_028db8:
	jsr loc_003688
	bra.w loc_028ca2

;==============================================
loc_028dc2:
	move.b #0,($54,a6)
	move.b #0,($287,a6)
	clr.b ($26b,a6)
	move.b #4,($2a0,a6)
	bsr.w loc_029332
	bsr.w loc_02918e
	tst.b ($250,a6)
	bne.b loc_028df0
	addq.b #1,($250,a6)
	jsr loc_083b82

loc_028df0:
	jsr loc_003688
	moveq #0,d0
	tst.b ($5f,a6)
	beq.w loc_029140
	rts

;==============================================
loc_028e02:
	move.b #8,($54,a6)
	move.b #0,($287,a6)
	move.b #4,($2a0,a6)
	tst.b ($250,a6)
	bne.b loc_028e24
	addq.b #1,($250,a6)
	jsr loc_083b82

loc_028e24:
	jsr loc_003688
	bra.w loc_028ca2

;==============================================
loc_028e2e:
	move.b #$a,($54,a6)
	move.b #0,($287,a6)
	bra.w loc_028ca2

;==============================================
loc_028e3e:
	move.b #8,($54,a6)
	move.b #0,($287,a6)
	move.b #1,($d6,a6)
	jsr loc_083bdc
	move.b #1,($252,a6)
	bra.w loc_028ca2

;==============================================
loc_028e60:
	move.b #8,($54,a6)
	move.b #0,($287,a6)
	move.b #1,($d6,a6)
	move.b #6,($2a0,a6)
	move.b #$30,($5f,a6)
	bra.w loc_028ca2

;==============================================
loc_028e82:
	move.b #8,($54,a6)
	move.b #0,($287,a6)
	move.b #$ff,($31,a6)
	addq.b #1,($5d,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.b loc_028ea6
	move.w d0,($14,a6)

loc_028ea6:
	moveq #6,d0
	bra.w loc_02a75e

loc_028eac:
	move.b #4,(7,a6)
	move.b ($2c9,a6),($b,a6)
	addq.b #1,(pl_blockstring_counter,a6)
	tst.b ($31,a6)
	bne.b loc_028f02
	move.b #2,($54,a6)
	clr.w ($3a,a6)
	move.b ($24c,a6),d0
	sub.b ($24d,a6),d0
	bmi.w loc_028f78
	cmpi.b #$10,d0
	bhi.b loc_028eea
	move.b #$1a,($2a0,a6)
	jsr loc_0a50c2

loc_028eea:
	bsr.w loc_029092
	tst.b ($125,a6)
	bne.b loc_028f30
	moveq #$c,d0
	tst.b ($2c8,a6)
	beq.b loc_028efe
	moveq #$f,d0

loc_028efe:
	bra.w loc_02a75e

loc_028f02:
	move.b #4,($54,a6)
	move.b #$ff,($31,a6)
	move.b #$a,($23f,a6)
	move.b ($24c,a6),d0
	cmp.b ($24d,a6),d0
	bcs.b loc_028f78
	moveq #$12,d0
	bsr.w loc_02a75e
	moveq #0,d0
	tst.b ($5f,a6)
	beq.w loc_029140
	rts

loc_028f30:
	clr.b ($2c8,a6)
	moveq #$c,d0
	movea.w ($38,a6),a4
	tst.b ($ed,a4)
	bne.b loc_028f4c
	tst.b ($31,a4)
	bne.b loc_028f52
	tst.b ($2c8,a4)
	beq.b loc_028f52

loc_028f4c:
	addq.b #1,($2c8,a6)
	moveq #$f,d0

loc_028f52:
	bsr.w loc_02a75e
	moveq #0,d0
	tst.b ($5f,a6)
	beq.w loc_029140
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_028f62:
	dc.b $04,$08,$0c,$10,$14,$14

loc_028f68:
	dc.b $00,$00,$01,$01,$02,$02,$03,$03
	dc.b $04,$04,$05,$05,$05,$06,$06,$06

;----------------------------------------------
loc_028f78:
	move.b ($24c,a6),($296,a6)
	clr.b ($24d,a6)
	clr.b ($24b,a6)
	clr.b ($2cc,a6)
	clr.b ($2cb,a6)
	addq.b #1,($299,a6)
	moveq #0,d6
	moveq #0,d0
	moveq #0,d1
	move.b ($102,a6),d1
	movea.l #loc_0df952,a0
	move.b (a0,d1.w),d0
	move.b loc_028f62(pc,d0.w),d6
	moveq #8,d2
	move.b ($29a,a6),d1
	cmpi.b #$10,d1
	bcc.b loc_028fba
	move.b loc_028f68(pc,d1.w),d2

loc_028fba:
	add.b d2,d6
	moveq #0,d2
	move.b ($299,a6),d1
	movea.w ($38,a6),a4
	sub.b ($299,a4),d1
	bmi.b loc_028fe0
	beq.b loc_028fe0
	moveq #-4,d2
	cmpi.b #3,d1
	bcc.b loc_028fe0
	moveq #-2,d2
	cmpi.b #3,d1
	bcc.b loc_028fe0
	moveq #-1,d2

loc_028fe0:
	add.b d2,d6
	jsr RNGFunction
	andi.w #$1f,d0
	move.b loc_02904e(pc,d0.w),d1
	moveq #$14,d0
	moveq #$54,d2
	add.b d1,d6
	bmi.b loc_029020
	cmpi.b #8,d6
	bcc.b loc_029020
	moveq #$10,d0
	moveq #$4e,d2
	cmpi.b #7,d6
	bcc.b loc_029020
	moveq #$c,d0
	moveq #$48,d2
	cmpi.b #4,d6
	bcc.b loc_029020
	moveq #8,d0
	moveq #$42,d2
	cmpi.b #3,d6
	bcc.b loc_029020
	moveq #4,d0
	moveq #$3c,d2

loc_029020:
	move.b d2,($24e,a6)
	sub.b d0,($24c,a6)
	bmi.b loc_029032
	cmpi.b #$10,($24c,a6)
	bcc.b loc_029038

loc_029032:
	move.b #$10,($24c,a6)

loc_029038:
	moveq #$12,d0
	tst.b ($31,a6)
	bne.b loc_02904a
	moveq #$c,d0
	tst.b ($2c8,a6)
	beq.b loc_02904a
	moveq #$f,d0

loc_02904a:
	bra.w loc_02a75e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02904e:
	dc.b $fc,$fe,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00

loc_02906e:
	dc.b $03,$02,$00,$fe

loc_029072:
	dc.b $02,$02,$01,$01,$01,$00,$00,$00
	dc.b $ff,$ff,$ff,$ff,$fe,$fe,$fe,$fe
	dc.b $fc,$fc,$fc,$fc,$fc,$fc,$fc,$fc
	dc.b $fa,$fa,$fa,$fa,$fa,$fa,$fa,$fa

;==============================================
loc_029092:
	moveq #0,d6
	moveq #0,d0
	move.b ($102,a6),d0
	movea.l #loc_0df972,a0
	move.b (a0,d0.w),d0
	move.b loc_02906e(pc,d0.w),d6
	moveq #-8,d1
	move.b ($24f,a6),d0
	cmpi.b #$20,d0
	bcc.b loc_0290b8
	move.b loc_029072(pc,d0.w),d1

loc_0290b8:
	add.b d1,d6
	jsr RNGFunction
	andi.w #$1f,d0
	move.b loc_0290d6(pc,d0.w),d1
	add.b d1,d6
	bpl.b loc_0290f6
	cmpi.b #-8,d6
	bcc.b loc_0290fe
	moveq #-8,d6
	bra.b loc_0290fe

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0290d6:
	dc.b $04,$02,$01,$01,$01,$01,$01,$01
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00

;----------------------------------------------
loc_0290f6:
	cmpi.b #9,d6
	bcs.b loc_0290fe
	moveq #8,d6

loc_0290fe:
	add.b d6,($26d,a6)
	bpl.b loc_02910a
	clr.b ($26d,a6)
	bra.b loc_029118

loc_02910a:
	cmpi.b #$f,($26d,a6)
	bcs.b loc_029118
	move.b #$f,($26d,a6)

loc_029118:
	rts

;==============================================
loc_02911a:
	move.b #$e,($54,a6)
	move.b #0,($287,a6)
	clr.b ($26b,a6)
	clr.b ($31,a6)
	tst.w ($50,a6)
	bmi.w loc_02918e
	move.b #1,($279,a6)
	bra.w loc_02918e

;----------------------------------------------
loc_029140:
	subq.b #1,($5f,a6)
	bpl.b loc_029160
	addq.b #2,(6,a6)
	clr.b (7,a6)
	clr.b ($5f,a6)
	cmpi.b #$21,($55,a6)
	beq.w loc_02918e
	bra.w loc_029284

loc_029160:
	movea.w ($38,a6),a4
	tst.b ($b9,a4)
	beq.b loc_02916e
	bsr.w loc_02b626

loc_02916e:
	lea.l loc_02c29c(pc),a0
	move.b ($5f,a6),d0
	ext.w d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	tst.b ($66,a6)
	bne.b loc_029186
	neg.w d0

loc_029186:
	move.w d0,($d4,a6)
	bra.w loc_02a7e2

loc_02918e:
	moveq #0,d0
	move.b ($55,a6),d0
	lea.l loc_02d5b2(pc),a0
	move.b (a0,d0.w),d0
	bra.w loc_02a75e

loc_0291a0:
	subq.b #1,($5f,a6)
	bpl.b loc_0291be
	tst.b ($2c3,a6)
	bne.w loc_0291f8
	addq.b #2,(6,a6)
	clr.b (7,a6)
	clr.b ($5f,a6)
	bra.w loc_029284

loc_0291be:
	bsr.w loc_02920c
	movea.w ($38,a6),a4
	tst.b ($b9,a4)
	beq.b loc_0291d0
	bsr.w loc_02b626

loc_0291d0:
	tst.b ($2c3,a6)
	bne.w loc_02a7ea
	lea.l loc_02c29c(pc),a0
	move.b ($5f,a6),d0
	ext.w d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	tst.b ($66,a6)
	bne.b loc_0291f0
	neg.w d0

loc_0291f0:
	move.w d0,($d4,a6)
	bra.w loc_02a7e2

loc_0291f8:
	addq.b #2,(6,a6)
	move.b #8,(7,a6)
	clr.b ($2c3,a6)
	clr.b ($5f,a6)
	rts

;Push Block Character Checks
loc_02920c:
	cmpi.b #$1f,($102,a6);if Juni
	beq.b loc_029224
	cmpi.b #$c,($102,a6);if Dan
	bne.b loc_029282
	cmpi.b #1,(PL_ism_choice,a6);if V-ism
	bne.b loc_029282

loc_029224:
	tst.b ($24e,a6)
	bne.b loc_029282
	movea.w ($38,a6),a4
	tst.b ($2c2,a4)
	bne.w loc_029282
	tst.b ($125,a6)
	bne.b loc_029282
	btst.b #1,($371,a6)
	beq.b loc_029282
	move.b ($378,a6),d0
	andi.b #7,d0
	cmpi.b #7,d0
	bne.b loc_029282
	move.b #1,($2c3,a6)
	move.b #$1f,($2c2,a4)
	moveq #$32,d0
	moveq #$3a,d3
	moveq #$43,d4
	tst.b ($31,a6)
	bne.b loc_029278
	moveq #$30,d0
	moveq #$3a,d3
	moveq #$2f,d4
	tst.b ($2c8,a6)
	beq.b loc_029278
	moveq #$31,d0

loc_029278:
	bsr.w loc_02a708
	jmp loc_080e84

loc_029282:
	rts

;==============================================
loc_029284:
	tst.b ($5f,a6)
	beq.b loc_029294
	bsr.w loc_02a7e2
	subq.b #1,($5f,a6)
	rts

loc_029294:
	move.b ($54,a6),d0
	move.w loc_0292a0(pc,d0.w),d1
	jmp loc_0292a0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0292a0:
	dc.w loc_0292b0-loc_0292a0
	dc.w loc_029360-loc_0292a0
	dc.w loc_029484-loc_0292a0
	dc.w loc_0295c8-loc_0292a0
	dc.w loc_02966a-loc_0292a0
	dc.w loc_029910-loc_0292a0
	dc.w loc_0299e0-loc_0292a0
	dc.w loc_029a52-loc_0292a0


;==============================================
loc_0292b0:
	move.b (7,a6),d0
	move.w loc_0292bc(pc,d0.w),d1
	jmp loc_0292bc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0292bc:
	dc.w loc_0292c4-loc_0292bc
	dc.w loc_0292c8-loc_0292bc
	dc.w loc_0292fe-loc_0292bc
	dc.w loc_029322-loc_0292bc

;==============================================
loc_0292c4:
	addq.b #2,(7,a6)

loc_0292c8:
	moveq #0,d6
	bsr.w loc_02b5ae
	beq.b loc_0292e0
	addq.b #2,(7,a6)
	clr.b ($250,a6)
	clr.b ($251,a6)
	clr.b ($252,a6)

loc_0292e0:
	tst.w ($50,a6)
	bpl.w loc_02a7ea
	cmpi.w #8,($268,a6)
	bcs.w loc_02a7ea
	move.b #6,(7,a6)
	moveq #$1b,d0
	bra.w loc_02a75e

loc_0292fe:
	tst.w ($50,a6)
	bmi.w loc_02af22
	move.l #$2020400,(4,a6)
	clr.b ($2ca,a6)
	clr.b ($23d,a6)
	clr.b ($23b,a6)
	move.b #0,($2a0,a6)
	rts

loc_029322:
	moveq #0,d6
	bsr.w loc_02b5ae
	beq.b loc_029330
	move.b #4,(7,a6)

loc_029330:
	rts

;==============================================
loc_029332:
	tst.w ($50,a6)
	bmi.w loc_02934e
	jmp loc_003d3a

loc_029340:
	tst.w ($50,a6)
	bmi.w loc_02934e
	jmp loc_003d5c

loc_02934e:
	tst.b ($32e,a6)
	bne.b loc_02935e
	st.b ($32e,a6)
	jmp loc_003d8a

loc_02935e:
	rts

;==============================================
loc_029360:
	move.b (7,a6),d0
	move.w loc_02936c(pc,d0.w),d1
	jmp loc_02936c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02936c:
	dc.w loc_029376-loc_02936c
	dc.w loc_0293a0-loc_02936c
	dc.w loc_02943c-loc_02936c
	dc.w loc_029456-loc_02936c
	dc.w loc_029466-loc_02936c

;----------------------------------------------
loc_029376:
	addq.b #2,(7,a6)
	tst.b ($24e,a6)
	beq.w loc_0293a0
	move.b #6,(7,a6)
	jsr loc_003db8
	moveq #$2b,d0
	tst.b ($2c8,a6)
	beq.b loc_029398
	moveq #$2c,d0

loc_029398:
	bsr.w loc_02a75e
	bra.w loc_029456

;----------------------------------------------
loc_0293a0:
	moveq #1,d6
	bsr.w loc_02b5ae
	beq.b loc_0293c0
	addq.b #2,(7,a6)
	move.b ($66,a6),d0
	eori.b #1,d0
	andi.b #1,d0
	move.b d0,($b,a6)
	bra.w loc_02943c

loc_0293c0:
	tst.w ($50,a6)
	bmi.w loc_02a7ea
	tst.b ($24e,a6)
	bne.w loc_02a7ea
	tst.b ($125,a6)
	bne.b loc_0293f8

loc_0293d6:
	btst.b #0,($371,a6)
	beq.w loc_02a7ea
	clr.b ($2c8,a6)
	moveq #$c,d0
	btst.b #2,($371,a6)
	beq.b loc_0293f4
	addq.b #1,($2c8,a6)
	moveq #$f,d0

loc_0293f4:
	bra.w loc_02a75e

loc_0293f8:
	cmpi.w #$90,($11e,a6)
	bne.b loc_029416
	tst.w ($50,a6)
	bmi.b loc_029416
	cmpi.b #$ff,(PL_ism_choice,a6) ;Xism check
	beq.b loc_029416
	tst.b ($214,a6)
	bne.w loc_02b16a

loc_029416:
	clr.b ($2c8,a6)
	moveq #$c,d0
	movea.w ($38,a6),a4
	tst.b ($ed,a4)
	bne.b loc_029432
	tst.b ($31,a4)
	bne.b loc_029438
	tst.b ($2c8,a4)
	beq.b loc_029438

loc_029432:
	addq.b #1,($2c8,a6)
	moveq #$f,d0

loc_029438:
	bra.w loc_02a75e

;----------------------------------------------
loc_02943c:
	tst.w ($50,a6)
	bmi.w loc_02af22
	move.l #$2020400,(4,a6)
	clr.b ($2ca,a6)
	clr.b ($23d,a6)
	rts

;----------------------------------------------
loc_029456:
	tst.b ($24e,a6)
	bne.w loc_02a7ea
	move.b #4,(7,a6)
	rts

;----------------------------------------------
loc_029466:
	tst.b ($33,a6)
	bpl.w loc_02a7ea
	move.l #$2020400,(4,a6)
	clr.b ($2ca,a6)
	clr.b ($23d,a6)
	clr.b ($23b,a6)
	rts

;==============================================
loc_029484:
	move.b (7,a6),d0
	move.w loc_029490(pc,d0.w),d1
	jmp loc_029490(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_029490:
	dc.w loc_02949a-loc_029490
	dc.w loc_029516-loc_029490
	dc.w loc_02952c-loc_029490
	dc.w loc_02957a-loc_029490
	dc.w loc_0295b6-loc_029490

;----------------------------------------------
loc_02949a:
	addq.b #2,(7,a6)

loc_02949e:
	move.b #$ff,($3c,a6)
	move.b #$ff,($31,a6)
	tst.b ($24e,a6)
	bne.b loc_0294d8
	move.l #$10000,($44,a6)
	move.l #$ffff9800,($4c,a6)
	clr.l ($48,a6)
	move.l #$60000,d0
	tst.b ($66,a6)
	bne.b loc_0294d2
	neg.l d0

loc_0294d2:
	move.l d0,($40,a6)
	rts

loc_0294d8:
	move.b #6,(7,a6)
	move.b #$10,($3a,a6)
	move.l #$10000,($44,a6)
	move.l #$ffffa800,($4c,a6)
	clr.l ($48,a6)
	move.l #$60000,d0
	tst.b ($66,a6)
	bne.b loc_029506
	neg.l d0

loc_029506:
	move.l d0,($40,a6)
	jsr loc_003db8
	moveq #$2d,d0
	bra.w loc_02a75e

;----------------------------------------------
loc_029516:
	clr.b ($23d,a6)
	tst.b ($ac,a6)
	beq.b loc_02952c
	moveq #1,d6
	bsr.w loc_02b5ae
	beq.b loc_02952c
	addq.b #2,(7,a6)

;----------------------------------------------
loc_02952c:
	bsr.w loc_02aa08
	bcc.b loc_029564
	tst.l ($44,a6)
	bpl.b loc_029564
	move.l #$2000604,(4,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($31,a6)
	clr.b ($a9,a6)
	move.b #1,($25d,a6)
	jsr loc_00369c
	moveq #$11,d0
	bra.w loc_02a708

loc_029564:
	tst.b ($33,a6)
	bpl.b loc_029576
	move.l #$2000602,(4,a6)
	clr.b ($a9,a6)

loc_029576:
	bra.w loc_02a7ea

;----------------------------------------------
loc_02957a:
	bsr.w loc_02aa08
	bcc.b loc_0295a6
	move.b #2,($54,a6)
	move.b #6,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	moveq #$2c,d0
	bsr.w loc_02a75e
	jmp loc_003630

loc_0295a6:
	tst.b ($24e,a6)
	bne.w loc_02a7ea
	move.b #2,(7,a6)
	rts

;----------------------------------------------
loc_0295b6:
	tst.b ($33,a6)
	bpl.w loc_02a7ea
	move.b #2,(7,a6)
	bra.w loc_02949e

;==============================================
loc_0295c8:
	move.b (7,a6),d0
	move.w loc_0295d4(pc,d0.w),d1
	jmp loc_0295d4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0295d4:
	dc.w loc_0295d8-loc_0295d4
	dc.w loc_029600-loc_0295d4

;----------------------------------------------
loc_0295d8:
	addq.b #2,(7,a6)
	clr.b ($a9,a6)
	clr.b ($2c8,a6)
	clr.b ($23d,a6)
	clr.b ($27a,a6)
	bsr.w loc_02aeca
	move.b #$ff,($31,a6)
	move.b #1,($32,a6)
	bsr.w loc_029340


loc_029600:
	tst.w ($44,a6)
	bmi.w loc_029610
	bsr.w loc_02b330
	bne.w loc_02b412

loc_029610:
	bsr.w loc_02aa08
	bcc.w loc_029648
	tst.w ($44,a6)
	bpl.w loc_029668
	move.l #$2020400,(4,a6)
	clr.b ($2ca,a6)
	clr.b ($23d,a6)
	clr.b ($23b,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	jmp loc_00369c

loc_029648:
	tst.w ($44,a6)
	bpl.w loc_029668
	move.b #1,($d6,a6)
	move.b #2,($23f,a6)
	clr.b ($26a,a6)
	clr.b ($26b,a6)
	bra.w loc_02a7ea

loc_029668:
	rts

;==============================================
loc_02966a:
	move.b (7,a6),d0
	move.w loc_029676(pc,d0.w),d1
	jmp loc_029676(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_029676:
	dc.w loc_029682-loc_029676
	dc.w loc_0296bc-loc_029676
	dc.w loc_029766-loc_029676
	dc.w loc_029780-loc_029676
	dc.w loc_0297b6-loc_029676
	dc.w loc_0297d4-loc_029676

;----------------------------------------------
loc_029682:
	addq.b #2,(7,a6)
	clr.b ($a9,a6)
	clr.b ($2c8,a6)
	clr.b ($23d,a6)
	clr.b ($27a,a6)
	tst.b ($f0,a6)
	beq.b loc_0296a2
	move.b #1,($32a,a6)

loc_0296a2:
	bsr.w loc_02aeca
	bsr.w loc_029340
	move.b #$ff,($31,a6)
	tst.b ($2ce,a6)
	beq.b loc_0296bc
	jsr loc_083628

loc_0296bc:
	bsr.w loc_02b330
	bne.w loc_02b412
	bsr.w loc_02aa08
	bcc.w loc_029750
	tst.l ($44,a6)
	bpl.w loc_029764
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.b #4,($3a,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	clr.b ($250,a6)
	clr.b ($251,a6)
	clr.b ($252,a6)
	move.b #0,($2a0,a6)
	clr.b ($26a,a6)
	clr.b ($26b,a6)
	tst.w ($50,a6)
	bmi.b loc_029738
	move.b #1,($279,a6)
	move.b #$18,($278,a6)
	moveq #0,d0
	move.b ($102,a6),d0
	movea.l #loc_0df9b2,a0
	move.b (a0,d0.w),d0
	sub.b d0,($2cb,a6)
	cmpi.b #$b4,($2cb,a6)
	bcs.b loc_029738
	clr.b ($2cb,a6)

loc_029738:
	jsr loc_00365c
	bsr.w loc_02b0f0
	bsr.w loc_029b86
	bne.w loc_029bec
	moveq #$14,d0
	bra.w loc_02a75e

loc_029750:
	movea.w ($38,a6),a4
	tst.b ($b9,a4)
	beq.w loc_02a7ea
	tst.w ($44,a6)
	bmi.w loc_02a7ea

loc_029764:
	rts

loc_029766:
	subq.b #1,($3a,a6)
	bne.b loc_029764
	addq.b #2,(7,a6)
	move.b #$ff,($31,a6)
	bsr.w loc_02aece
	moveq #$15,d0
	bra.w loc_02a75e

loc_029780:
	bsr.w loc_02aa08
	bcc.w loc_02a7ea
	tst.w ($44,a6)
	bpl.w loc_02a7ea
	addq.b #2,(7,a6)
	bsr.w loc_02b0c4
	clr.b ($31,a6)
	addq.b #8,($df,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	moveq #$16,d0
	bsr.w loc_02a75e
	jmp loc_003630

loc_0297b6:
	subq.b #1,($df,a6)
	bne.w loc_02a7ea
	tst.w ($50,a6)
	bmi.w loc_02af22
	addq.b #2,(7,a6)
	clr.b ($279,a6)
	moveq #$19,d0
	bra.w loc_02a75e

loc_0297d4:
	tst.b ($33,a6)
	bpl.w loc_02a7ea
	tst.b ($2ce,a6)
	beq.b loc_02983c
	move.b #$c,($54,a6)
	clr.b (7,a6)
	moveq #0,d0
	move.b d0,($2cb,a6)
	move.b d0,($2cc,a6)
	move.b d0,($2ce,a6)
	move.w d0,($280,a6)
	move.b d0,($2c8,a6)
	move.b d0,($d6,a6)
	move.b d0,($270,a6)
	move.b d0,($32a,a6)
	move.b d0,($26c,a6)
	move.b d0,($273,a6)
	addq.b #5,($2cd,a6)
	tst.b ($eb,a6)
	beq.b loc_029826
	addi.b #$10,($2cd,a6)

loc_029826:
	jsr RNGFunction
	andi.w #$1e,d0
	move.w loc_029864(pc,d0.w),($3a,a6)
	moveq #$1a,d0
	bra.w loc_02a75e

loc_02983c:
	move.l #$2020400,(4,a6)
	moveq #0,d0
	move.b d0,($2ca,a6)
	move.b d0,($23d,a6)
	move.b d0,($23b,a6)
	move.b d0,($d6,a6)
	move.b d0,($270,a6)
	move.b d0,($32a,a6)
	move.b d0,($2c8,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_029864:
	dc.w $005a,$0078,$0078,$0078
	dc.w $00b4,$00b4,$00b4,$00b4
	dc.w $00b4,$00b4,$00b4,$00f0
	dc.w $00f0,$00f0,$00f0,$012c

;==============================================
loc_029884:
	cmpi.b #$ff,(PL_ism_choice,a6)
	beq.w loc_0298de
	tst.b ($258,a6)
	bne.b loc_0298de
	move.w ($14,a6),d0
	sub.w ($64,a6),d0
	bmi.b loc_0298de
	cmpi.w #$50,d0
	bcc.b loc_0298de
	move.b ($378,a6),d0
	or.b ($37a,a6),d0
	andi.b #$70,d0
	cmpi.b #$70,d0
	beq.b loc_0298c8
	cmpi.b #$30,d0
	beq.b loc_0298c8
	cmpi.b #$50,d0
	beq.b loc_0298c8
	cmpi.b #$60,d0
	bne.b loc_0298de

loc_0298c8:
	jsr loc_02eea6
	beq.b loc_02990e
	move.l #$2100000,(4,a6)
	clr.b ($253,a6)
	rts

loc_0298de:
	cmpi.b #6,($102,a6)
	bne.b loc_02990e
	lea.l ($320,a6),a4
	jsr loc_02d63a
	beq.b loc_02990e
	jsr loc_02eea6
	beq.b loc_02990e
	move.l #$2100000,($4,a6)
	move.b #1,($253,a6)
	jmp loc_02f728

loc_02990e:
	rts

;==============================================
loc_029910:
	move.b (7,a6),d0
	move.w loc_02991c(pc,d0.w),d1
	jmp loc_02991c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02991c
	dc.w loc_029682-loc_02991c
	dc.w loc_029922-loc_02991c
	dc.w loc_02997c-loc_02991c

;----------------------------------------------
loc_029922:
	bsr.w loc_02aa08
	bcc.b loc_029972
	tst.l ($44,a6)
	bpl.b loc_029972
	addq.b #2,(7,a6)
	clr.b ($31,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	move.b #4,($3a,a6)
	move.b #1,($ad,a6)
	move.b #1,($d6,a6)
	moveq #1,d0
	move.l #$fffa0000,d2
	tst.w ($40,a6)
	bmi.b loc_029964
	moveq #0,d0
	neg.l d2

loc_029964:
	move.b d0,($b,a6)
	move.l d2,($40,a6)
	moveq #$1f,d0
	bra.w loc_02a75e

loc_029972:
	tst.w ($44,a6)
	bmi.w loc_02a7ea
	rts

loc_02997c:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	tst.b ($33,a6)
	bpl.w loc_02a7ea
	subq.b #1,($3a,a6)
	bne.w loc_02a7ea
	tst.w ($50,a6)
	bmi.w loc_02af22
	tst.b ($2ce,a6)
	bne.w loc_0299ca
	move.l #$2020400,(4,a6)
	clr.b ($2ca,a6)
	clr.b ($23d,a6)
	clr.b ($ad,a6)
	clr.b ($23b,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #1,($2c8,a6)
	rts

loc_0299ca:
	move.b #8,($54,a6)
	move.b #$a,(7,a6)
	clr.b ($ad,a6)
	moveq #$19,d0
	bra.w loc_02a75e

;==============================================
loc_0299e0:
	move.b (7,a6),d0
	move.w loc_0299ec(pc,d0.w),d1
	jmp loc_0299ec(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0299ec:
	dc.w loc_0299ee-loc_0299ec

;----------------------------------------------
loc_0299ee:
	tst.b ($10d,a5)
	bne.w loc_029a2e
	bsr.w loc_02af7a
	bne.w loc_029a2e
	bsr.w loc_02b56a
	sub.w d6,($3a,a6)
	bmi.b loc_029a2e
	tst.w d6
	beq.b loc_029a26
	cmpi.w #1,d6
	beq.b loc_029a16
	bsr.w loc_02a7ea

loc_029a16:
	bsr.w loc_02a7ea
	move.b #$10,($2ae,a6)
	move.b #1,($2ad,a6)

loc_029a26:
	subq.w #1,($3a,a6)
	bne.w loc_02a7ea

loc_029a2e:
	move.l #$2020400,(4,a6)
	move.b #$14,($28a,a6)
	clr.b ($2ca,a6)
	clr.b ($23d,a6)
	clr.b ($23b,a6)
	clr.w ($3a,a6)
	jmp loc_00374e

;==============================================
loc_029a52:
	move.b (7,a6),d0
	move.w loc_029a5e(pc,d0.w),d1
	jmp loc_029a5e(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_029a5e:
	dc.w loc_029a62-loc_029a5e
	dc.w loc_029a7a-loc_029a5e

;----------------------------------------------
loc_029a62:
	addq.b #2,(7,a6)
	move.b #$1e,($3a,a6)
	tst.b ($2ce,a6)
	beq.b loc_029a78
	jsr loc_083628

loc_029a78:
	rts

;----------------------------------------------
loc_029a7a:
	subq.b #1,($3a,a6)
	bne.w loc_02a7ea
	tst.w ($50,a6)
	bmi.w loc_02af22
	tst.b ($2ce,a6)
	bne.w loc_029ab2
	move.b #8,($54,a6)
	move.b #8,(7,a6)
	addq.b #8,($df,a6)
	move.w ($64,a6),($14,a6)
	clr.w ($16,a6)
	moveq #$1b,d0
	bra.w loc_02a75e

loc_029ab2:
	move.b #8,($54,a6)
	move.b #$a,(7,a6)
	moveq #$19,d0
	bra.w loc_02a75e

;==============================================
loc_029ac4:
	jsr loc_02f490
	moveq #5,d0
	tst.b ($273,a6)
	beq.b loc_029ad4
	moveq #2,d0

loc_029ad4:
	move.b d0,($23f,a6)
	moveq #0,d0
	move.b d0,($5d,a6)
	move.b d0,($5e,a6)
	move.l d0,($b0,a6)
	move.b d0,($5f,a6)
	move.b d0,($282,a6)
	move.w d0,($280,a6)
	move.b d0,($25f,a6)
	move.b d0,($270,a6)
	move.b d0,($32a,a6)
	move.b d0,($d6,a6)
	move.b d0,($26c,a6)
	move.b d0,($273,a6)
	move.b d0,($23a,a6)
	move.b d0,($23b,a6)
	move.b ($2c9,a6),($b,a6)
	move.b #0,($2a0,a6)
	tst.b (PL_cpucontrol,a6)
	bne.b loc_029b50
	move.b #2,(PL_Reversal_Window,a6)
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02b1c8
	bsr.w loc_02ab24
	bne.w loc_02ac60
	btst.b #2,($371,a6)
	beq.w loc_02baf2
	bra.w loc_02bb26

;==============================================
loc_029b50:
	clr.b ($201,a6)
	clr.w ($202,a6)
	clr.b ($23b,a6)
	clr.b ($d6,a6)
	tst.w ($206,a6)
	beq.b loc_029b6c
	jsr loc_032258

loc_029b6c:
	jsr loc_0307d0
	beq.b loc_029b7a
	jmp loc_030970

loc_029b7a:
	tst.b ($2c8,a6)
	beq.w loc_02baf2
	bra.w loc_02bb26

;==============================================
loc_029b86:
	tst.b ($125,a6)
	beq.w loc_029be8
	cmpi.b #6,($102,a6)
	beq.w loc_029ba2
	cmpi.b #$f,($102,a6)
	bne.w loc_029be8

loc_029ba2:
	tst.b ($2ce,a6)
	bne.w loc_029be8
	tst.b ($258,a6)
	bne.w loc_029be8
	tst.b ($50,a6)
	bmi.w loc_029be8
	cmpi.b #$ff,(PL_ism_choice,a6)
	beq.w loc_029be8
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.w loc_029be8
	bsr.w loc_02af7a
	bne.w loc_029be8
	movea.l #loc_0c97da,a1
	jmp loc_030a66

loc_029be8:
	moveq #0,d0
	rts

;==============================================
loc_029bec:
	move.l #$2000e00,(4,a6)
	move.b #2,($82,a6)
	clr.b ($250,a6)
	clr.b ($251,a6)
	clr.b ($252,a6)
	move.b #$c,($aa,a6)
	move.b #1,($a9,a6)
	cmpi.b #$f,($102,a6)
	bne.b loc_029c1e
	clr.b ($a9,a6)

loc_029c1e:
	rts

;==============================================
loc_029c20:
	move.b ($102,a6),d0
	lsl.w #2,d0
	movea.l #loc_0dcd12,a0
	tst.b ($125,a6)
	beq.b loc_029c38
	movea.l #loc_0dcd92,a0

loc_029c38:
	movea.l (a0,d0.w),a0
	jsr (a0)
	tst.b ($67,a6)
	beq.w loc_02ada2
	rts

;==============================================
loc_029c48:
	move.b (7,a6),d0
	move.w loc_029c58(pc,d0.w),d1
	jsr loc_029c58(pc,d1.w)
	bra.w loc_02ae4c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_029c58:
	dc.w loc_029c5c-loc_029c58
	dc.w loc_029cd8-loc_029c58

;----------------------------------------------
loc_029c5c:
	addq.b #2,(7,a6)
	moveq #0,d0
	move.b d0,($d6,a6)
	move.b d0,($25d,a6)
	move.b d0,($250,a6)
	move.b d0,($251,a6)
	move.b d0,($252,a6)
	tst.b ($25c,a6)
	bne.b loc_029c82
	move.b #0,($2a0,a6)

loc_029c82:
	tst.w ($ba,a6)
	beq.b loc_029cbc
	clr.w ($ba,a6)
	clr.b ($b9,a6)
	cmpi.w #6,($138,a5)
	bne.b loc_029cb0
	cmpi.b #1,($101,a6)
	bne.b loc_029cb0
	lea.l (p1memory,a5),a0
	subi.w #$48,($11e,a0)
	bpl.b loc_029cb0
	clr.w ($11e,a0)

loc_029cb0:
	subi.w #$48,($11e,a6)
	bpl.b loc_029cbc
	clr.w ($11e,a6)

loc_029cbc:
	tst.b ($135,a5)
	bne.b loc_029cd2
	st.b ($135,a5)
	jsr loc_02e8d0
	move.b #8,($114,a0)

loc_029cd2:
	move.b #8,($3a,a6)

loc_029cd8:
	tst.w ($50,a6)
	bmi.w loc_029d58
	tst.b ($3a,a6)
	beq.b loc_029d58
	subq.b #1,($3a,a6)
	bne.b loc_029d02
	tst.b ($125,a6)
	beq.b loc_029d08
	movea.l #loc_0c95da,a1
	jsr loc_030a66
	bne.b loc_029d4e
	bra.b loc_029d58

loc_029d02:
	tst.b ($125,a6)
	bne.b loc_029d58

loc_029d08:
	move.b ($371,a6),d0
	andi.w #3,d0
	beq.b loc_029d58
	move.b ($378,a6),d0
	andi.b #$77,d0
	beq.b loc_029d58
	cmpi.b #3,d0
	beq.b loc_029d4e
	cmpi.b #5,d0
	beq.b loc_029d4e
	cmpi.b #6,d0
	beq.b loc_029d4e
	cmpi.b #7,d0
	beq.b loc_029d4e
	cmpi.b #$30,d0
	beq.b loc_029d4e
	cmpi.b #$50,d0
	beq.b loc_029d4e
	cmpi.b #$60,d0
	beq.b loc_029d4e
	cmpi.b #$70,d0
	beq.b loc_029d4e
	bra.b loc_029d58

loc_029d4e:
	clr.b ($2ca,a6)
	move.b #1,($29b,a6)

loc_029d58:
	rts

;==============================================
loc_029d5a:
	move.b ($32c,a6),d0
	move.w loc_029d66(pc,d0.w),d1
	jmp loc_029d66(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_029d66:
	dc.w loc_029d76-loc_029d66
	dc.w loc_029e18-loc_029d66
	dc.w loc_029e18-loc_029d66
	dc.w loc_029e18-loc_029d66
	dc.w loc_029e18-loc_029d66
	dc.w loc_029e18-loc_029d66
	dc.w loc_029e18-loc_029d66
	dc.w loc_029e18-loc_029d66

;----------------------------------------------
loc_029d76:
	move.b ($102,a6),d0
	lsl.w #2,d0
	movea.l #loc_0dce12,a0
	movea.l (a0,d0.w),a0
	jmp (a0)

;==============================================
loc_029d88:
	move.b ($32c,a6),d0
	move.w loc_029d94(pc,d0.w),d1
	jmp loc_029d94(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_029d94:
	dc.w loc_029da4-loc_029d94
	dc.w loc_029e18-loc_029d94
	dc.w loc_029e18-loc_029d94
	dc.w loc_029e18-loc_029d94
	dc.w loc_029e18-loc_029d94
	dc.w loc_029e18-loc_029d94
	dc.w loc_029e18-loc_029d94
	dc.w loc_029e18-loc_029d94

;----------------------------------------------
loc_029da4:
	move.b ($102,a6),d0
	lsl.w #2,d0
	movea.l #loc_0dce92,a0
	movea.l (a0,d0.w),a0
	jmp (a0)

;==============================================
;Time OVer animation set
loc_029db6:
	move.b (6,a6),d0
	move.w loc_029dc2(pc,d0.w),d1
	jmp loc_029dc2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_029dc2:
	dc.w loc_029dca-loc_029dc2
	dc.w loc_029dda-loc_029dc2
	dc.w loc_029de8-loc_029dc2
	dc.w loc_029e00-loc_029dc2

;----------------------------------------------
loc_029dca:
	addq.b #2,(6,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	bra.w loc_02a708

;----------------------------------------------
loc_029dda:
	tst.b ($11c,a5)
	bne.b loc_029de4
	addq.b #2,(6,a6)

loc_029de4:
	bra.w loc_02a7ea

;----------------------------------------------
loc_029de8:
	addq.b #2,(6,a6)
	move.b #$78,($3a,a6)
	moveq #$28,d0
	tst.b ($15a,a5)
	beq.b loc_029dfc
	moveq #$29,d0

loc_029dfc:
	bra.w loc_02a708

;----------------------------------------------
loc_029e00:
	tst.b ($3a,a6)
	beq.b loc_029e14
	subq.b #1,($3a,a6)
	bne.b loc_029e14
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)

loc_029e14:
	bra.w loc_02a7ea

;==============================================
loc_029e18:
	move.b ($101,a6),d0
	bset.b d0,($10b,a5)
	moveq #0,d0
	move.b ($32c,a6),d0
	move.w loc_029e34(pc,d0.w),d1
	jsr loc_029e34(pc,d1.w)
	jmp loc_02ada2(pc)
	nop

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_029e34:
	dc.w loc_029e44-loc_029e34
	dc.w loc_029e52-loc_029e34
	dc.w loc_029e44-loc_029e34
	dc.w loc_029e56-loc_029e34
	dc.w loc_029eb6-loc_029e34
	dc.w loc_029f18-loc_029e34
	dc.w loc_029f84-loc_029e34
	dc.w loc_02a038-loc_029e34

;==============================================
loc_029e44:
	tst.b ($279,a6)
	bne.w loc_02a7ea
	move.b ($2c9,a6),($b,a6)

loc_029e52:
	bra.w loc_02a7ea

;==============================================
loc_029e56:
	move.b (7,a6),d0
	move.w loc_029e62(pc,d0.w),d1
	jmp loc_029e62(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_029e62:
	dc.w loc_029e68-loc_029e62
	dc.w loc_029e9a-loc_029e62
	dc.w loc_029eb2-loc_029e62

;----------------------------------------------
loc_029e68:
	cmpi.w #$c,($c,a5)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	tst.b ($279,a6)
	beq.b loc_029e88
	move.w #$1e,($12,a5)
	moveq #$19,d0
	bra.w loc_02a75e

loc_029e88:
	move.b #4,(7,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	bra.w loc_02a708

;----------------------------------------------
loc_029e9a:
	tst.b ($33,a6)
	bpl.w loc_02a7ea
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	bra.w loc_02a708

;----------------------------------------------
loc_029eb2:
	bra.w loc_02a7ea

;==============================================
loc_029eb6:
	move.b (7,a6),d0
	move.w loc_029ec2(pc,d0.w),d1
	jmp loc_029ec2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_029ec2:
	dc.w loc_029ec8-loc_029ec2
	dc.w loc_029ee8-loc_029ec2
	dc.w loc_029f14-loc_029ec2

;----------------------------------------------
loc_029ec8:
	cmpi.w #$c,($c,a5)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	move.w #$3c,($12,a5)
	moveq #2,d0
	bra.w loc_02a708

;----------------------------------------------
loc_029ee8:
	cmpi.w #$40,($21c,a6)
	bcc.b loc_029f00
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	bra.w loc_02a708

loc_029f00:
	move.w #3,d0
	tst.b ($b,a6)
	bne.b loc_029f0c
	neg.w d0

loc_029f0c:
	add.w d0,($10,a6)
	bra.w loc_02a7ea

;----------------------------------------------
loc_029f14:
	bra.w loc_02a7ea

;==============================================
loc_029f18:
	move.b ($7,a6),d0
	move.w loc_029f24(pc,d0.w),d1
	jmp loc_029f24(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_029f24:
	dc.w loc_029f2a-loc_029f24
	dc.w loc_029f62-loc_029f24
	dc.w loc_029f80-loc_029f24

;----------------------------------------------
loc_029f2a:
	cmpi.w #$c,($c,a5)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	tst.b ($279,a6)
	beq.b loc_029f4a
	move.w #$1e,($12,a5)
	moveq #$19,d0
	bra.w loc_02a75e

loc_029f4a:
	move.b #4,(7,a6)
	move.b ($2c9,a6),($b,a6)
	jsr loc_0836f4
	moveq #$1a,d0
	bra.w loc_02a75e

;----------------------------------------------
loc_029f62:
	tst.b ($33,a6)
	bpl.w loc_02a7ea
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	jsr loc_0836f4
	moveq #$1a,d0
	bra.w loc_02a75e

;----------------------------------------------
loc_029f80:
	bra.w loc_02a7ea

;==============================================
loc_029f84:
	move.b ($7,a6),d0
	move.w loc_029f90(pc,d0.w),d1
	jmp loc_029f90(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_029f90:
	dc.w loc_029f98-loc_029f90
	dc.w loc_029fca-loc_029f90
	dc.w loc_029fe2-loc_029f90
	dc.w loc_02a008-loc_029f90

;----------------------------------------------
loc_029f98:
	cmpi.w #$c,($c,a5)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	tst.b ($279,a6)
	beq.b loc_029fb8
	move.w #$1e,($12,a5)
	moveq #$19,d0
	bra.w loc_02a75e

loc_029fb8:
	move.b #4,(7,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	bra.w loc_02a708

;----------------------------------------------
loc_029fca:
	tst.b ($33,a6)
	bpl.w loc_02a7ea
	addq.b #2,(7,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	bra.w loc_02a708

;----------------------------------------------
loc_029fe2:
	cmpi.w #$10f,($112,a5)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	move.b #1,($2af,a6)
	move.b #1,($26f,a6)
	eori.b #1,($b,a6)
	moveq #2,d0
	bra.w loc_02a708

;----------------------------------------------
loc_02a008:
	jsr loc_01bd5c
	move.w ($10,a6),d1
	sub.w ($10,a3),d1
	addi.w #$40,d1
	cmpi.w #$200,d1
	bcc.w loc_02a7ea
	move.l #$30000,d0
	tst.b ($b,a6)
	bne.b loc_02a030
	neg.l d0

loc_02a030:
	add.l d0,($10,a6)
	bra.w loc_02a7ea

;==============================================
loc_02a038:
	move.b (7,a6),d0
	move.w loc_02a044(pc,d0.w),d1
	jmp loc_02a044(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02a044:
	dc.w loc_02a048-loc_02a044
	dc.w loc_02a066-loc_02a044

;----------------------------------------------
loc_02a048:
	addq.b #2,(7,a6)
	moveq #4,d0
	jsr loc_0a51cc
	move.b #$56,($2a0,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	bra.w loc_02a708

;----------------------------------------------
loc_02a066:
	move.b ($2c9,a6),($b,a6)
	bra.w loc_02a7ea

;==============================================
loc_02a070:
	tst.b ($10e,a5)
	beq.b loc_02a0b8
	moveq #0,d0
	move.b ($32b,a6),d0
	move.w loc_02a084(pc,d0.w),d1
	jmp loc_02a084(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02a084:
	dc.w loc_02a09c-loc_02a084
	dc.w loc_02a0c6-loc_02a084
	dc.w loc_02a10a-loc_02a084
	dc.w loc_02a164-loc_02a084
	dc.w loc_02a1da-loc_02a084
	dc.w loc_02a21e-loc_02a084
	dc.w loc_02a2a0-loc_02a084
	dc.w loc_02a306-loc_02a084

	dc.w loc_02a370-loc_02a084
	dc.w loc_02a3da-loc_02a084
	dc.w loc_02a444-loc_02a084
	dc.w loc_02a49c-loc_02a084

;==============================================
loc_02a09c:
	moveq #0,d0
	move.b ($102,a6),d0
	lsl.w #2,d0
	movea.l #loc_0dcf12,a0
	movea.l (a0,d0.w),a0
	jmp (a0)

;----------------------------------------------
;2a0b0
	tst.b ($33,a6)
	bpl.w loc_02a7ea

loc_02a0b8:
	move.l #$2000000,(4,a6)
	moveq #0,d0
	bra.w loc_02a708

;==============================================
loc_02a0c6:
	move.b (7,a6),d0
	move.w loc_02a0d2(pc,d0.w),d1
	jmp loc_02a0d2(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02a0d2:
	dc.w loc_02a0d8-loc_02a0d2
	dc.w loc_02a0e8-loc_02a0d2
	dc.w loc_02a0fc-loc_02a0d2

;----------------------------------------------
loc_02a0d8:
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	moveq #0,d0
	bra.w loc_02a708

;----------------------------------------------
loc_02a0e8:
	subq.b #1,($3a,a6)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	clr.b ($124,a6)
	bra.w loc_02a7ea

;----------------------------------------------
loc_02a0fc:
	cmpi.w #4,($c,a5)
	bne.w loc_02a7ea
	bra.w loc_02baf2

;==============================================
loc_02a10a:
	move.b (7,a6),d0
	move.w loc_02a116(pc,d0.w),d1
	jmp loc_02a116(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02a116:
	dc.w loc_02a11e-loc_02a116
	dc.w loc_02a12e-loc_02a116
	dc.w loc_02a140-loc_02a116
	dc.w loc_02a156-loc_02a116

;----------------------------------------------
loc_02a11e:
	addq.b #2,(7,a6)
	move.b #$1e,($3a,a6)
	moveq #$1b,d0
	bra.w loc_02a75e

;----------------------------------------------
loc_02a12e:
	subq.b #1,($3a,a6)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	moveq #$19,d0
	bra.w loc_02a75e

;----------------------------------------------
loc_02a140:
	tst.b ($33,a6)
	bpl.w loc_02a7ea
	addq.b #2,(7,a6)
	clr.b ($124,a6)
	moveq #0,d0
	bra.w loc_02a708

;----------------------------------------------
loc_02a156:
	cmpi.w #4,($c,a5)
	bne.w loc_02a7ea
	bra.w loc_02baf2

;==============================================
loc_02a164:
	move.b (7,a6),d0
	move.w loc_02a170(pc,d0.w),d1
	jmp loc_02a170(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02a170:
	dc.w loc_02a178-loc_02a170
	dc.w loc_02a19c-loc_02a170
	dc.w loc_02a1b6-loc_02a170
	dc.w loc_02a1cc-loc_02a170


;----------------------------------------------
loc_02a178:
	addq.b #2,(7,a6)
	moveq #0,d0
	jsr loc_0a51cc
	move.b #$54,($2a0,a6)
	move.w ($64,a6),d0
	addi.w #$e0,d0
	move.w d0,($14,a6)
	moveq #$22,d0
	bra.w loc_02a708

;----------------------------------------------
loc_02a19c:
	subq.w #4,($14,a6)
	move.w ($64,a6),d0
	cmp.w ($14,a6),d0
	bcs.w loc_02a7ea
	addq.b #2,(7,a6)
	moveq #0,d0
	bra.w loc_02a758

;----------------------------------------------
loc_02a1b6:
	tst.b ($33,a6)
	bpl.w loc_02a7ea
	addq.b #2,(7,a6)
	clr.b ($124,a6)
	moveq #0,d0
	bra.w loc_02a708

;----------------------------------------------
loc_02a1cc:
	cmpi.w #4,($c,a5)
	bne.w loc_02a7ea
	bra.w loc_02baf2

;==============================================
loc_02a1da:
	move.b (7,a6),d0
	move.w loc_02a1e6(pc,d0.w),d1
	jmp loc_02a1e6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02a1e6:
	dc.w loc_02a1ec-loc_02a1e6
	dc.w loc_02a1fc-loc_02a1e6
	dc.w loc_02a210-loc_02a1e6

;----------------------------------------------
loc_02a1ec:
	addq.b #2,(7,a6)
	move.b #$1e,($3a,a6)
	moveq #$1a,d0
	bra.w loc_02a75e

;----------------------------------------------
loc_02a1fc:
	subq.b #1,($3a,a6)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	clr.b ($124,a6)
	bra.w loc_02a7ea

;----------------------------------------------
loc_02a210:
	cmpi.w #4,($c,a5)
	bne.w loc_02a7ea
	bra.w loc_02baf2

;==============================================
loc_02a21e:
	move.b (7,a6),d0
	move.w loc_02a22a(pc,d0.w),d1
	jmp loc_02a22a(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02a22a:
	dc.w loc_02a234-loc_02a22a
	dc.w loc_02a252-loc_02a22a
	dc.w loc_02a264-loc_02a22a
	dc.w loc_02a27a-loc_02a22a
	dc.w loc_02a294-loc_02a22a

;----------------------------------------------
loc_02a234:
	addq.b #2,(7,a6)
	move.b #$2d,($3a,a6)
	moveq #1,d0
	jsr loc_0a51cc
	move.b #$56,($2a0,a6)
	moveq #$1b,d0
	bra.w loc_02a75e

;----------------------------------------------
loc_02a252:
	subq.b #1,($3a,a6)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	moveq #$19,d0
	bra.w loc_02a75e

;----------------------------------------------
loc_02a264:
	tst.b ($33,a6)
	bpl.w loc_02a7ea
	addq.b #2,(7,a6)
	clr.b ($124,a6)
	moveq #$1a,d0
	bra.w loc_02a75e

;----------------------------------------------
loc_02a27a:
	cmpi.w #4,($c,a5)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	moveq #0,d0
	bra.w loc_02a708

;----------------------------------------------
loc_02a294:
	subq.b #1,($3a,a6)
	bne.w loc_02a7ea
	bra.w loc_02baf2

;==============================================
loc_02a2a0:
	move.b (7,a6),d0
	move.w loc_02a2ac(pc,d0.w),d1
	jmp loc_02a2ac(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02a2ac:
	dc.w loc_02a2b4-loc_02a2ac
	dc.w loc_02a2d2-loc_02a2ac
	dc.w loc_02a2e6-loc_02a2ac
	dc.w loc_02a2fa-loc_02a2ac

;----------------------------------------------
loc_02a2b4:
	addq.b #2,(7,a6)
	move.b #$20,($3a,a6)
	moveq #1,d0
	jsr loc_0a51cc
	move.b #$56,($2a0,a6)
	moveq #$1b,d0
	bra.w loc_02a75e
 
;----------------------------------------------
loc_02a2d2:
	subq.b #1,($3a,a6)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	clr.b ($124,a6)
	bra.w loc_02a7ea

;----------------------------------------------
loc_02a2e6:
	cmpi.w #4,($c,a5)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	moveq #$19,d0
	bra.w loc_02a75e

;----------------------------------------------
loc_02a2fa:
	tst.b ($33,a6)
	bpl.w loc_02a7ea
	bra.w loc_02baf2

;==============================================
loc_02a306:
	move.b (7,a6),d0
	move.w loc_02a312(pc,d0.w),d1
	jmp loc_02a312(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02a312:
	dc.w loc_02a31a-loc_02a312
	dc.w loc_02a338-loc_02a312
	dc.w loc_02a34c-loc_02a312
	dc.w loc_02a364-loc_02a312

;----------------------------------------------
loc_02a31a:
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	moveq #1,d0
	jsr loc_0a51cc
	move.b #$56,($2a0,a6)
	moveq #0,d0
	bra.w loc_02a708

;----------------------------------------------
loc_02a338:
	subq.b #1,($3a,a6)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	clr.b ($124,a6)
	bra.w loc_02a7ea

;----------------------------------------------
loc_02a34c:
	cmpi.w #4,($c,a5)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	bra.w loc_02a7ea

;----------------------------------------------
loc_02a364:
	subq.b #1,($3a,a6)
	bne.w loc_02a7ea
	bra.w loc_02baf2

;==============================================
loc_02a370:
	move.b (7,a6),d0
	move.w loc_02a37c(pc,d0.w),d1
	jmp loc_02a37c(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02a37c:
	dc.w loc_02a384-loc_02a37c
	dc.w loc_02a3a2-loc_02a37c
	dc.w loc_02a3b6-loc_02a37c
	dc.w loc_02a3ce-loc_02a37c

;----------------------------------------------
loc_02a384:
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	moveq #2,d0
	jsr loc_0a51cc
	move.b #$58,($2a0,a6)
	moveq #0,d0
	bra.w loc_02a708

;----------------------------------------------
loc_02a3a2:
	subq.b #1,($3a,a6)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	clr.b ($124,a6)
	bra.w loc_02a7ea

;----------------------------------------------
loc_02a3b6:
	cmpi.w #4,($c,a5)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	bra.w loc_02a7ea

;----------------------------------------------
loc_02a3ce:
	subq.b #1,($3a,a6)
	bne.w loc_02a7ea
	bra.w loc_02baf2

;==============================================
loc_02a3da:
	move.b (7,a6),d0
	move.w loc_02a3e6(pc,d0.w),d1
	jmp loc_02a3e6(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02a3e6:
	dc.w loc_02a3ee-loc_02a3e6
	dc.w loc_02a40c-loc_02a3e6
	dc.w loc_02a420-loc_02a3e6
	dc.w loc_02a438-loc_02a3e6

;----------------------------------------------
loc_02a3ee:
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	moveq #3,d0
	jsr loc_0a51cc
	move.b #$5a,($2a0,a6)
	moveq #0,d0
	bra.w loc_02a708

;----------------------------------------------
loc_02a40c:
	subq.b #1,($3a,a6)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	clr.b ($124,a6)
	bra.w loc_02a7ea

;----------------------------------------------
loc_02a420:
	cmpi.w #4,($c,a5)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	bra.w loc_02a7ea

;----------------------------------------------
loc_02a438:
	subq.b #1,($3a,a6)
	bne.w loc_02a7ea
	bra.w loc_02baf2

;==============================================
loc_02a444:
	move.b (7,a6),d0
	move.w loc_02a450(pc,d0.w),d1
	jmp loc_02a450(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02a450:
	dc.w loc_02a456-loc_02a450
	dc.w loc_02a47a-loc_02a450
	dc.w loc_02a48e-loc_02a450

;----------------------------------------------
loc_02a456:
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	moveq #$36,d0
	cmpi.b #$c,($102,a6)
	beq.b loc_02a476
	moveq #$23,d0
	cmpi.b #$1d,($102,a6)
	beq.b loc_02a476
	moveq #0,d0

loc_02a476:
	bra.w loc_02a708

;----------------------------------------------
loc_02a47a:
	subq.b #1,($3a,a6)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	clr.b ($124,a6)
	bra.w loc_02a7ea

;----------------------------------------------
loc_02a48e:
	cmpi.w #4,($c,a5)
	bne.w loc_02a7ea
	bra.w loc_02baf2

;==============================================
loc_02a49c:
	move.b (7,a6),d0
	move.w loc_02a4a8(pc,d0.w),d1
	jmp loc_02a4a8(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02a4a8:
	dc.w loc_02a4b0-loc_02a4a8
	dc.w loc_02a4da-loc_02a4a8
	dc.w loc_02a4ee-loc_02a4a8
	dc.w loc_02a506-loc_02a4a8

;----------------------------------------------
loc_02a4b0:
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	clr.b (1,a6)
	cmpi.b #$1f,($102,a6)
	beq.b loc_02a4d4
	moveq #1,d0
	jsr loc_0a51cc
	move.b #$56,($2a0,a6)

loc_02a4d4:
	moveq #0,d0
	bra.w loc_02a708

;----------------------------------------------
loc_02a4da:
	subq.b #1,($3a,a6)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	clr.b ($124,a6)
	bra.w loc_02a7ea

;----------------------------------------------
loc_02a4ee:
	cmpi.w #4,($c,a5)
	bne.w loc_02a7ea
	addq.b #2,(7,a6)
	move.b #$3c,($3a,a6)
	bra.w loc_02a7ea

;----------------------------------------------
loc_02a506:
	subq.b #1,($3a,a6)
	bne.w loc_02a7ea
	clr.w (6,a6)
	clr.b ($32b,a6)
	rts

;==============================================
loc_02a518:
	move.b (6,a6),d0
	move.w loc_02a528(pc,d0.w),d1
	jsr loc_02a528(pc,d1.w)
	bra.w loc_02ada2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02a528:
	dc.w loc_02a52e-loc_02a528
	dc.w loc_02a694-loc_02a528
	dc.w loc_02a6f0-loc_02a528

;----------------------------------------------
loc_02a52e:
	bsr.w loc_02aa08
	bcc.w loc_02a7ea
	tst.l ($44,a6)
	bpl.w loc_02a7ea
	move.b #4,(6,a6)
	move.b #5,($23f,a6)
	move.w ($64,a6),($14,a6)
	move.b ($2c9,a6),($b,a6)
	jsr loc_02f490
	moveq #0,d0
	move.w d0,($16,a6)
	move.b d0,($31,a6)
	move.b d0,($a9,a6)
	move.b d0,($5e,a6)
	move.b d0,($5d,a6)
	move.b d0,($250,a6)
	move.b d0,($251,a6)
	move.b d0,($252,a6)
	move.b d0,($5d,a6)
	move.b d0,($5e,a6)
	move.l d0,($b0,a6)
	move.b d0,($5f,a6)
	move.b d0,($282,a6)
	move.w d0,($280,a6)
	move.b d0,($250,a6)
	move.b d0,($251,a6)
	move.b d0,($252,a6)
	move.b d0,($26c,a6)
	move.b d0,($273,a6)
	move.b d0,($26f,a6)
	move.b d0,($2c0,a6)
	move.b d0,($d6,a6)
	move.b d0,($270,a6)
	move.b d0,($32a,a6)
	move.b d0,($274,a6)
	move.b d0,($2af,a6)
	move.b d0,($23a,a6)
	move.b d0,($23b,a6)
	move.b #4,($3a,a6)
	move.b #$c,($3b,a6)
	move.b #0,($2a0,a6)
	bsr.w loc_02c0ac
	jsr loc_00369c
	moveq #$1e,d0
	moveq #0,d1
	move.b ($102,a6),d1
	add.w d1,d1
	add.w d1,d1
	move.l loc_02a614(pc,d1.w),d1
	tst.b ($b,a6)
	beq.b loc_02a602
	neg.l d1

loc_02a602:
	tst.b ($253,a6)
	beq.b loc_02a60c
	neg.l d1
	moveq #$1f,d0

loc_02a60c:
	move.l d1,($40,a6)
	bra.w loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02a614:
	dc.l $fffa0000,$fffa0000,$fffa0000,$fffa0000
	dc.l $fffa0000,$fffa0000,$fffb0000,$fffa0000
	dc.l $fffc0000,$fffa0000,$fffa0000,$fffa0000
	dc.l $fffa0000,$fffa0000,$fffa0000,$fffa0000
	dc.l $fffc0000,$fffa0000,$fffa0000,$fffa0000
	dc.l $fffa0000,$fffd0000,$fffa0000,$fffa0000
	dc.l $fffa0000,$fffa0000,$fffa0000,$fffa0000
	dc.l $fffa0000,$fffa0000,$fffa0000,$fffa0000

;----------------------------------------------
loc_02a694:
	tst.b ($33,a6)
	bpl.b loc_02a6c8
	cmpi.b #1,($32,a6)
	bne.b loc_02a6c8
	tst.b ($3b,a6)
	beq.b loc_02a6ac
	subq.b #1,($3b,a6)

loc_02a6ac:
	subq.b #1,($3a,a6)
	bne.b loc_02a6c8
	clr.b ($2ca,a6)
	clr.b ($23d,a6)
	clr.b ($ad,a6)
	move.b ($2c9,a6),($b,a6)
	bra.w loc_02bb26

loc_02a6c8:
	move.b ($371,a6),d0
	andi.b #$f,d0
	cmpi.b #2,d0
	beq.b loc_02a6e2
	tst.b ($3b,a6)
	bne.b loc_02a6e2
	move.b #1,($3a,a6)

loc_02a6e2:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	jmp loc_02a7ea(pc)
	nop

;----------------------------------------------
loc_02a6f0:
	subq.b #1,($3b,a6)
	bne.b loc_02a702
	move.b #2,(6,a6)
	move.b #1,($3b,a6)

loc_02a702:
	jmp loc_02a7ea(pc)
	nop

;==============================================
loc_02a708:
	movea.l ($2b0,a6),a0
	bra.w loc_02a762

;==============================================
loc_02a710:
	tst.b ($eb,a6)
	bne.w loc_02a74e
	moveq #0,d1
	move.b ($102,a6),d1
	ext.w d1
	lsl.w #2,d1
	movea.l #loc_0dcb12,a0
	movea.l (a0,d1.w),a0
	move.b (PL_ism_choice,a6),d1
	addq.b #1,d1
	add.w d1,d1
	move.w (a0,d1.w),d1
	lea.l (a0,d1.w),a0
	moveq #0,d1
	move.b d0,d1
	add.w d1,d1
	move.b (a0,d1.w),($23e,a6)
	move.b (1,a0,d1.w),($293,a6)

loc_02a74e:
	movea.l ($2bc,a6),a0
	bra.b loc_02a762

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02a754:
	dc.w $0100,$ff00

;==============================================
loc_02a758:
	movea.l ($2b4,a6),a0
	bra.b loc_02a762

loc_02a75e:
	movea.l ($2b8,a6),a0

loc_02a762:
	andi.w #$ff,d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0

loc_02a770:
	move.l a0,($1c,a6)
	move.l (a0),($32,a6)
	moveq #0,d0
	move.b (8,a0),d0
	lsl.w #2,d0
	movea.l ($88,a6),a0
	lea.l (a0,d0.w),a0
	move.l a0,($8c,a6)
	move.l (a0),($c8,a6)
	moveq #0,d0
	movea.l ($1c,a6),a0
	move.b ($a,a0),d0
	lsl.w #2,d0
	movea.l ($c0,a6),a0
	move.l (a0,d0.w),($c4,a6)
	move.b ($c6,a6),($3d,a6)
	moveq #0,d0
	move.b ($c6,a6),d0
	beq.b loc_02a7e0
	jsr loc_0032a4
	lsl.w #3,d0
	tst.b ($bc,a5)
	beq.b loc_02a7c4
	addq.w #2,d0

loc_02a7c4:
	moveq #0,d1
	movea.l ($e6,a6),a0
	move.w (a0,d0.w),d1
	beq.b loc_02a7da
	moveq #0,d2
	moveq #0,d3
	jmp loc_003938

loc_02a7da:
	jmp loc_00329c

loc_02a7e0:
	rts

;==============================================
loc_02a7e2:
	tst.b ($c5,a6)
	bne.b loc_02a7ea
	rts

loc_02a7ea:
	subq.b #1,($32,a6)
	bne.b loc_02a816

loc_02a7f0:
	movea.l ($1c,a6),a0
	move.b (1,a0),d0
	beq.b loc_02a802
	bmi.b loc_02a80a
	btst #6,d0
	bne.b loc_02a812

loc_02a802:
	lea.l ($14,a0),a0
	bra.w loc_02a770

loc_02a80a:
	movea.l ($14,a0),a0
	bra.w loc_02a770

loc_02a812:
	st.b ($33,a6)

loc_02a816:
	cmpi.b #1,($32,a6)
	bne.b loc_02a82e
	movea.l ($1c,a6),a0
	btst.b #6,(1,a0)
	beq.b loc_02a82e
	st.b ($33,a6)

loc_02a82e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02a830:
	dc.w $02b0,$02b4,$02b8,$02bc

;==============================================
loc_02a838:
	movea.w ($38,a6),a4

loc_02a83c:
	andi.w #6,d1
	move.w loc_02a830(pc,d1.w),d1
	movea.l (a4,d1.w),a0
	andi.w #$ff,d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0

loc_02a856:
	move.l a0,($1c,a4)
	move.l (a0),($32,a4)
	moveq #0,d0
	move.b (8,a0),d0
	lsl.w #2,d0
	movea.l ($88,a4),a0
	lea.l (a0,d0.w),a0
	move.l a0,($8c,a4)
	move.l (a0),($c8,a4)
	moveq #0,d0
	movea.l ($1c,a4),a0
	move.b ($a,a0),d0
	lsl.w #2,d0
	movea.l ($c0,a4),a0
	move.l (a0,d0.w),($c4,a4)
	moveq #0,d0
	move.b ($c6,a4),d0
	move.b d0,($3d,a4)
	beq.b loc_02a8c4
	jsr loc_0032a4
	lsl.w #3,d0
	tst.b ($bc,a5)
	beq.b loc_02a8a8
	addq.w #2,d0

loc_02a8a8:
	moveq #0,d1
	movea.l ($e6,a4),a0
	move.w (a0,d0.w),d1
	beq.b loc_02a8be
	moveq #0,d2
	moveq #0,d3
	jmp loc_003956

loc_02a8be:
	jmp loc_00329c

loc_02a8c4:
	rts

;==============================================
loc_02a8c6:
	movea.w ($38,a6),a4

loc_02a8ca:
	subq.b #1,($32,a4)
	bne.b loc_02a8f8
	movea.l ($1c,a4),a0
	move.b (1,a0),d0
	beq.b loc_02a8f0
	bmi.b loc_02a8e8
	btst #6,d0
	beq.b loc_02a8f0
	st.b ($33,a4)
	bra.b loc_02a8f8

loc_02a8e8:
	movea.l ($14,a0),a0
	bra.w loc_02a856

loc_02a8f0:
	lea.l ($14,a0),a0
	bra.w loc_02a856

loc_02a8f8:
	rts

;==============================================
loc_02a8fa:
	moveq #6,d1
	move.b ($371,a6),d0
	andi.w #$f,d0
	btst.l d0,d1
	rts

;==============================================
loc_02a908:
	move.l #$2000402,(4,a6)
	bsr.w loc_02a924
	moveq #2,d0
	btst.b #1,($371,a6)
	bne.b loc_02a920
	moveq #3,d0

loc_02a920:
	bra.w loc_02a708

loc_02a924:
	moveq #0,d1
	moveq #0,d2
	btst.b #1,($371,a6)
	bne.b loc_02a934
	moveq #4,d1
	moveq #1,d2

loc_02a934:
	move.b d2,($3c,a6)
	move.b ($102,a6),d0
	ext.w d0
	lsl.w #3,d0
	add.w d1,d0
	movea.l ($2d0,a6),a0
	move.l (a0,d0.w),d0
	tst.b ($b,a6)
	beq.b loc_02a952
	neg.l d0

loc_02a952:
	move.l d0,($40,a6)
	rts

;==============================================
loc_02a958:
	move.b ($3c,a6),d0
	btst d0,($371,a6)
	beq.b loc_02a964
	bsr.b loc_02a908

loc_02a964:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	rts

;==============================================
loc_02a96e:
	move.b ($10e,a5),d0
	or.b ($10d,a5),d0
	or.b ($8a,a5),d0
	bne.b loc_02a988
	btst.b #3,($371,a6)
	beq.b loc_02a988
	moveq #1,d0
	rts

loc_02a988:
	moveq #0,d0
	rts

;==============================================
loc_02a98c:
	move.l #$2000600,(4,a6)
	clr.b ($2c8,a6)
	clr.b ($d2,a6)
	move.b #5,($23f,a6)
	bsr.w loc_02aa46
	move.b #1,($3c,a6)
	move.b ($371,a6),d1
	btst #1,d1
	bne.w loc_02a9ca
	move.b #$ff,($3c,a6)
	btst #0,d1
	bne.w loc_02a9ca
	clr.b ($3c,a6)

loc_02a9ca:
	moveq #$10,d0
	bra.w loc_02a708

;==============================================
loc_02a9d0:
	clr.b ($d2,a6)
	bsr.w loc_02aebc
	tst.b ($125,a6)
	beq.b loc_02a9ee
	tst.b ($2c5,a6)
	bne.w loc_02aa02
	tst.b ($2c0,a6)
	bne.w loc_02b320

loc_02a9ee:
	move.b ($102,a6),d0
	ext.w d0
	lsl.w #2,d0
	movea.l #loc_0dcf92,a0
	movea.l (a0,d0.w),a0
	jmp (a0)

loc_02aa02:
	jmp loc_03139c

;==============================================
loc_02aa08:
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($48,a6),d0
	add.l d0,($40,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	move.l ($4c,a6),d0
	add.l d0,($44,a6)
	moveq #0,d0
	movea.l ($1c,a6),a0
	move.b ($b,a0),d0
	add.w ($14,a6),d0
	addi.w #$100,d0
	move.w ($64,a6),d1
	addi.w #$100,d1
	cmp.w d1,d0
	rts

;==============================================
loc_02aa46:
	tst.b ($125,a6)
	beq.b loc_02aa60
	moveq #0,d1
	tst.b ($211,a6)
	beq.b loc_02aa76
	moveq #$30,d1
	tst.b ($211,a6)
	bmi.b loc_02aa76
	moveq #$20,d1
	bra.b loc_02aa76

loc_02aa60:
	moveq #0,d1
	move.b ($371,a6),d2
	andi.w #3,d2
	beq.b loc_02aa76
	moveq #$20,d1
	btst #1,d2
	bne.b loc_02aa76
	moveq #$30,d1

loc_02aa76:
	move.b ($102,a6),d0
	ext.w d0
	lsl.w #6,d0
	add.w d1,d0
	movea.l ($2d4,a6),a0
	lea.l (a0,d0.w),a0
	move.l (a0)+,d0
	move.l (a0)+,($44,a6)
	move.l (a0)+,d1
	move.l (a0),($4c,a6)
	tst.b ($b,a6)
	beq.b loc_02aa9e
	neg.l d0
	neg.l d1

loc_02aa9e:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	rts

;==============================================
loc_02aaa8:
	move.b ($371,a6),d0
	andi.b #3,d0
	rts

;==============================================
loc_02aab2:
	move.b ($2c9,a6),d0
	cmp.b ($b,a6),d0
	rts

;==============================================
loc_02aabc:
	tst.b ($10d,a5)
	bne.w loc_02aca0
	bsr.w loc_02af7a
	bne.w loc_02b002
	move.l #$2000800,(4,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #$a,d0
	tst.b ($2c8,a6)
	beq.b loc_02aaec
	move.l #$2000802,(4,a6)
	moveq #$d,d0

loc_02aaec:
	bra.w loc_02a708

;==============================================
loc_02aaf0:
	btst.b #2,($371,a6)
	rts

;==============================================
loc_02aaf8:
	move.l #$2000200,(4,a6)
	clr.b ($2c8,a6)
	moveq #7,d0
	bra.w loc_02a708

;==============================================
loc_02ab0a:
	btst.b #2,($371,a6)
	rts

;==============================================
loc_02ab12:
	move.l #$2000204,(4,a6)
	clr.b ($2c8,a6)
	moveq #4,d0
	bra.w loc_02a708

;==============================================
loc_02ab24:
	tst.b ($b9,a6)
	bne.w loc_02ac0c
	tst.b ($24e,a6)
	bne.w loc_02ac0c
	btst.b #0,($37d,a6)
	bne.b loc_02ab4e
	tst.b ($85,a5)
	beq.w loc_02ac0c
	btst.b #5,($1c1,a5)
	beq.w loc_02ac0c

loc_02ab4e:
	move.b #1,($2c6,a6)
	tst.b (PL_ism_choice,a6)
	bpl.b loc_02ab62
	tst.b ($31,a6)
	bne.w loc_02ac0c

loc_02ab62:
	moveq #$b,d6
	lea.l ($1400,a5),a4

loc_02ab68:
	cmpi.b #1,(a4)
	bne.b loc_02ab92
	tst.b ($68,a4)
	bmi.b loc_02ab92
	move.b ($59,a6),d0
	cmp.b ($59,a4),d0
	beq.b loc_02ab92
	move.w ($10,a4),d0
	sub.w ($10,a6),d0
	addi.w #$50,d0
	cmpi.w #$a0,d0
	bcs.w loc_02ac08

loc_02ab92:
	lea.l ($100,a4),a4
	dbra d6,loc_02ab68
	moveq #$b,d6
	lea.l ($2000,a5),a4

loc_02aba0:
	cmpi.b #1,(a4)
	bne.b loc_02abca
	tst.b ($68,a4)
	bmi.b loc_02abca
	move.b ($59,a6),d0
	cmp.b ($59,a4),d0
	beq.b loc_02abca
	move.w ($10,a4),d0
	sub.w ($10,a6),d0
	addi.w #$50,d0
	cmpi.w #$a0,d0
	bcs.w loc_02ac08

loc_02abca:
	lea.l ($100,a4),a4
	dbra d6,loc_02aba0
	movea.w ($38,a6),a4
	bra.w loc_02abda

loc_02abda:
	tst.b ($b9,a4)
	bne.w loc_02ac08
	tst.b ($216,a4)
	bne.b loc_02ac08
	tst.b ($a9,a4)
	bne.w loc_02ac10
	bra.w loc_02ac0c

loc_02abf4:
	move.w ($10,a4),d0
	sub.w ($10,a6),d0
	addi.w #$100,d0
	cmpi.w #$200,d0
	bhi.w loc_02ac0c

loc_02ac08:
	moveq #1,d0
	rts

loc_02ac0c:
	moveq #0,d0
	rts

loc_02ac10:
	movea.l ($1c,a4),a0
	tst.b ($c7,a4)
	bmi.b loc_02ac0c

loc_02ac1a:
	movea.l ($a0,a4),a1
	move.b (9,a0),d0
	beq.b loc_02ac50
	ext.w d0
	lsl.w #5,d0
	lea.l (a1,d0.w),a1
	move.w (a1),d0
	tst.b ($b,a4)
	beq.b loc_02ac36
	neg.w d0

loc_02ac36:
	add.w ($10,a4),d0
	sub.w ($10,a6),d0
	bpl.b loc_02ac42
	neg.w d0

loc_02ac42:
	move.w (4,a1),d1
	addi.w #$58,d1
	cmp.w d1,d0
	bhi.b loc_02ac50
	bra.b loc_02ac08

loc_02ac50:
	move.b (1,a0),d0
	andi.b #$c0,d0
	bne.b loc_02abf4
	lea.l ($14,a0),a0
	bra.b loc_02ac1a

;==============================================
loc_02ac60:
	move.b ($2c9,a6),($b,a6)
	clr.b ($d2,a6)
	moveq #0,d2
	move.l #$2000c00,d1
	moveq #$15,d0
	tst.b ($85,a5)
	beq.b loc_02ac82
	btst.b #5,($1c1,a5)
	bne.b loc_02ac94

loc_02ac82:
	btst.b #2,($371,a6)
	beq.b loc_02ac94
	moveq #1,d2
	move.l #$2000c04,d1
	moveq #$18,d0

loc_02ac94:
	move.b d2,($2c8,a6)
	move.l d1,(4,a6)
	bra.w loc_02a708

;==============================================
loc_02aca0:
	move.l #$20a0000,d1
	tst.w ($ba,a6)
	beq.b loc_02ace0
	clr.w ($ba,a6)
	clr.b ($b9,a6)
	cmpi.w #6,($138,a5)
	bne.b loc_02acd4
	cmpi.b #1,($101,a6)
	bne.b loc_02acd4
	lea.l (p1memory,a5),a0
	subi.w #$48,($11e,a0)
	bpl.b loc_02acd4
	clr.w ($11e,a0)

loc_02acd4:
	subi.w #$48,($11e,a6)
	bpl.b loc_02ace0
	clr.w ($11e,a6)

loc_02ace0:
	tst.b ($15a,a5)
	bne.b loc_02ad0c
	move.b ($59,a6),d0
	btst d0,($10c,a5)
	beq.b loc_02ad0c
	moveq #0,d0
	move.b ($126,a6),d0
	lea.l ($129,a6),a0
	lea.l (a0,d0.w),a0
	moveq #3,d0
	move.b d0,($b4,a6)
	move.b d0,(a0)
	move.l #$2080000,d1

loc_02ad0c:
	move.l d1,(4,a6)
	moveq #0,d0
	move.b d0,($b9,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	bsr.w loc_02a708
	bra.w loc_02b9a2

;==============================================
loc_02ad26:
	move.b ($102,a6),d0
	ext.w d0
	lsl.w #2,d0
	movea.l #loc_0dd092,a0
	move.l (a0,d0.w),($88,a6)
	movea.l #loc_0dd112,a0
	move.l (a0,d0.w),($c0,a6)
	movea.l #loc_0dd012,a0
	movea.l (a0,d0.w),a0
	moveq #0,d0
	tst.b (PL_ism_choice,a6)
	beq.b loc_02ad64
	moveq #4,d0
	cmpi.b #$ff,(PL_ism_choice,a6)
	beq.b loc_02ad64
	moveq #8,d0

loc_02ad64:
	movea.l (a0,d0.w),a0

loc_02ad68:
	movea.l a0,a1
	move.l a0,($60,a6)
	move.w (a0)+,d0
	lea.l (a1,d0.w),a2
	move.l a2,($90,a6)
	move.w (a0)+,d0
	lea.l (a1,d0.w),a2
	move.l a2,($94,a6)
	move.w (a0)+,d0
	lea.l (a1,d0.w),a2
	move.l a2,($98,a6)
	move.w (a0)+,d0
	lea.l (a1,d0.w),a2
	move.l a2,($9c,a6)
	move.w (a0)+,d0
	lea.l (a1,d0.w),a2
	move.l a2,($a0,a6)
	rts

;==============================================
loc_02ada2:
	clr.b ($ac,a6)
	tst.b ($2af,a6)
	bne.w loc_02ae32
	movea.w ($38,a6),a4
	move.w ($10,a4),d1
	sub.w ($10,a6),d1
	bpl.b loc_02adbe
	neg.w d1

loc_02adbe:
	jsr loc_01bd5c
	move.w ($a6,a6),d2
	move.w ($10,a6),d0
	sub.w d2,d0
	sub.w ($10,a3),d0
	bhi.b loc_02ade0
	sub.w d0,($10,a6)
	move.b #1,($ac,a6)
	bra.b loc_02adf4

loc_02ade0:
	add.w d2,d2
	add.w d2,d0
	subi.w #$180,d0
	bmi.b loc_02ae32
	sub.w d0,($10,a6)
	move.b #2,($ac,a6)

loc_02adf4:
	cmpi.w #$202,(4,a6)
	bne.w loc_02ae32
	tst.b ($239,a6)
	bne.w loc_02ae32
	tst.b ($31,a6)
	beq.b loc_02ae16
	tst.b ($23d,a6)
	beq.b loc_02ae32
	sub.w ($40,a6),d0

loc_02ae16:
	tst.b ($ad,a6)
	bne.b loc_02ae32
	tst.b ($2d9,a4)
	bne.b loc_02ae2e
	tst.b ($31,a4)
	bne.b loc_02ae32
	tst.b ($274,a4)
	bne.b loc_02ae32

loc_02ae2e:
	sub.w d0,($10,a4)

loc_02ae32:
	tst.b ($ac,a6)
	beq.b loc_02ae4a
	tst.b ($31,a6)
	bpl.b loc_02ae4a
	tst.b ($270,a6)
	bne.b loc_02ae4a
	move.b #1,($270,a6)

loc_02ae4a:
	rts

;==============================================
loc_02ae4c:
	tst.b ($2af,a6)
	bne.w loc_02aeba
	movea.w ($38,a6),a4
	movea.w ($38,a6),a0
	movea.l a6,a1
	clr.b ($ac,a4)
	move.w ($10,a4),d1
	cmp.w ($10,a6),d1
	bcs.b loc_02ae70
	movea.l a6,a0
	movea.l a4,a1

loc_02ae70:
	jsr loc_01bd5c
	move.w ($a6,a0),d2
	move.w ($10,a0),d0
	sub.w d2,d0
	sub.w ($10,a3),d0
	bpl.b loc_02ae98
	sub.w d0,($10,a6)
	sub.w d0,($10,a4)
	move.b #1,($ac,a4)
	bra.w loc_02aeba

loc_02ae98:
	move.w ($a6,a1),d2
	move.w ($10,a1),d0
	sub.w ($10,a3),d0
	add.w d2,d0
	subi.w #$180,d0
	bmi.b loc_02aeba
	sub.w d0,($10,a6)
	sub.w d0,($10,a4)
	move.b #2,($ac,a4)

loc_02aeba:
	rts

;==============================================
loc_02aebc:
	moveq #0,d0
	move.b d0,($2c8,a6)
	move.b d0,($5b,a6)
	bra.w loc_02f770

;==============================================
loc_02aeca:
	moveq #0,d1
	bra.b loc_02aed0

;==============================================
loc_02aece:
	moveq #1,d1

loc_02aed0:
	moveq #0,d0
	move.b ($29f,a6),d0
	lsl.w #2,d0
	add.b ($25f,a6),d0
	lea.l loc_02c39c(pc),a0
	move.b (a0,d0.w),d0
	andi.w #$ff,d0
	lsl.w #1,d0
	lea.l loc_02c4dc(pc),a0
	add.w d1,d0
	move.b (a0,d0.w),d0
	andi.w #$ff,d0
	lsl.w #4,d0
	lea.l loc_02c57c(pc),a0
	lea.l (a0,d0.w),a0
	move.l (a0)+,d0
	move.l (a0)+,d1
	tst.b ($66,a6)
	bne.b loc_02af10
	neg.l d0
	neg.l d1

loc_02af10:
	move.l d0,($40,a6)
	move.l d1,($48,a6)
	move.l (a0)+,($44,a6)
	move.l (a0),($4c,a6)
	rts

;==============================================
loc_02af22:
	move.l #$20c0000,(4,a6)
	moveq #0,d0
	move.b d0,($251,a6)
	move.b d0,($250,a6)
	move.b d0,($252,a6)
	move.b #1,($279,a6)
	movea.w ($38,a6),a4
	cmpi.b #8,($b4,a4)
	bcc.b loc_02af50
	jsr loc_02f490

loc_02af50:
	tst.b ($107,a5)
	bne.b loc_02af70
	clr.b ($5e,a6)
	tst.w ($138,a5)
	beq.b loc_02af70
	move.b #1,($263,a6)
	move.b #1,($2af,a6)
	clr.b ($26f,a6)

loc_02af70:
	moveq #$1b,d0
	bsr.w loc_02a75e
	bra.w loc_02b9a2

;==============================================
loc_02af7a:
	move.w ($138,a5),d0
	move.w loc_02af9e(pc,d0.w),d0
	jsr loc_02af9e(pc,d0.w)
	cmpi.w #$20c,(4,a0)
	bne.b loc_02af9a
	cmpi.w #$20c,(4,a1)
	bne.b loc_02af9a
	moveq #1,d0
	rts

loc_02af9a:
	moveq #0,d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02af9e:
	dc.w loc_02afa6-loc_02af9e
	dc.w loc_02afba-loc_02af9e
	dc.w loc_02afd2-loc_02af9e
	dc.w loc_02afea-loc_02af9e

;----------------------------------------------
loc_02afa6:
	lea.l (p1memory,a5),a0
	btst.b #0,($101,a6)
	bne.b loc_02afb6
	lea.l (p2memory,a5),a0

loc_02afb6:
	movea.l a0,a1
	rts

;----------------------------------------------
loc_02afba:
	lea.l (p1memory,a5),a0
	movea.l a0,a1
	btst.b #1,($101,a6)
	bne.b loc_02afd0
	lea.l (p3memory,a5),a0
	lea.l (p4memory,a5),a1

loc_02afd0:
	rts

;----------------------------------------------
loc_02afd2:
	lea.l (p2memory,a5),a0
	movea.l a0,a1
	btst.b #1,($101,a6)
	bne.b loc_02afe8
	lea.l (p3memory,a5),a0
	lea.l (p4memory,a5),a1

loc_02afe8:
	rts

;----------------------------------------------
loc_02afea:
	lea.l (p1memory,a5),a0
	lea.l (p2memory,a5),a1
	btst.b #1,($101,a6)
	bne.b loc_02b000
	lea.l (p3memory,a5),a0
	movea.l a0,a1

loc_02b000:
	rts

;==============================================
loc_02b002:
	move.l #$2080000,(4,a6)
	move.b #1,($d6,a6)
	tst.w ($ba,a6)
	beq.b loc_02b01e
	clr.w ($ba,a6)
	clr.b ($b9,a6)

loc_02b01e:
	movea.l a6,a4
	bsr.w loc_02b074
	moveq #0,d1
	tst.b ($125,a6)
	bne.b loc_02b060
	move.b ($370,a6),d0
	andi.w #$77,d0
	beq.b loc_02b060
	moveq #2,d1
	btst #0,d0
	bne.b loc_02b060
	moveq #4,d1
	btst #1,d0
	bne.b loc_02b060
	moveq #6,d1
	btst #2,d0
	bne.b loc_02b060
	moveq #8,d1
	btst #4,d0
	bne.b loc_02b060
	moveq #$a,d1
	btst #5,d0
	bne.b loc_02b060
	moveq #$c,d1

loc_02b060:
	move.b d1,($2c4,a6)
	move.b ($2c9,a6),($b,a6)
	moveq #0,d0
	bsr.w loc_02a708
	bra.w loc_02b9a2

;==============================================
loc_02b074:
	move.w ($138,a5),d0
	move.w loc_02b080(pc,d0.w),d0
	jmp loc_02b080(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02b080:
	dc.w loc_02b088-loc_02b080
	dc.w loc_02b09c-loc_02b080
	dc.w loc_02b09c-loc_02b080
	dc.w loc_02b0b0-loc_02b080

;----------------------------------------------
loc_02b088:
	moveq #0,d0
	move.b ($126,a4),d0
	lea.l ($129,a4),a0
	lea.l (a0,d0.w),a0
	move.b ($b4,a4),(a0)
	rts

;----------------------------------------------
loc_02b09c:
	btst.b #1,($101,a4)
	beq.b loc_02b088
	lea.l (p3memory,a5),a4
	bsr.b loc_02b088
	lea.l (p4memory,a5),a4
	bra.b loc_02b088

;----------------------------------------------
loc_02b0b0:
	btst.b #1,($101,a4)
	bne.b loc_02b088
	lea.l (p1memory,a5),a4
	bsr.b loc_02b088
	lea.l (p2memory,a5),a4
	bra.b loc_02b088

;==============================================
loc_02b0c4:
	moveq #3,d6

loc_02b0c6:
	jsr loc_085a74
	beq.b loc_02b0e6
	move.w d6,d0
	add.w d0,d0
	move.w loc_02b0e8(pc,d0.w),d1
	tst.b ($b,a6)
	beq.b loc_02b0de
	neg.w d1

loc_02b0de:
	add.w d1,($10,a4)
	dbra d6,loc_02b0c6

loc_02b0e6:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02b0e8:
	dc.w $fff4,$0000,$000c,$0018

;==============================================
loc_02b0f0:
	moveq #3,d6

loc_02b0f2:
	jsr loc_085a7e
	beq.b loc_02b0e6
	move.w d6,d0
	add.w d0,d0
	move.w loc_02b114(pc,d0.w),d1
	tst.b ($b,a6)
	beq.b loc_02b10a
	neg.w d1

loc_02b10a:
	add.w d1,($10,a4)
	dbra d6,loc_02b0f2
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02b114:
	dc.w $fff0,$0000,$0010,$0020

;==============================================
loc_02b11c:
	cmpi.b #5,($55,a6)
	bne.b loc_02b146
	jsr RNGFunction
	btst #0,d0
	beq.b loc_02b13c
	jsr loc_080dc6
	bne.w loc_02c164
	bra.b loc_02b146

loc_02b13c:
	jsr loc_080dbc
	bne.w loc_02c164

loc_02b146:
	rts

;==============================================
loc_02b148:
	jsr loc_02e336
	clr.b ($254,a6)
	moveq #0,d0
	move.b ($102,a6),d0
	ext.w d0
	lsl.w #2,d0
	movea.l #loc_0dd292,a0
	movea.l (a0,d0.w),a0
	jmp (a0)
	rts

;==============================================
;Unused AC code?
;==============================================
loc_02b16a:
	jsr loc_02e8c0
	move.b #4,($114,a0)
	tst.b ($89,a5)
	beq.b loc_02b182
	move.b #$a,($114,a0)

loc_02b182:
	move.b #1,($249,a6)
	subq.b #1,($24a,a6)
	clr.b ($d2,a6)
	move.w #$ffb8,d0
	jsr loc_02ef6c
	move.b ($102,a6),d0
	ext.w d0
	lsl.w #2,d0
	movea.l #loc_0dd312,a0
	movea.w ($38,a6),a4
	tst.b ($31,a4)
	bne.b loc_02b1b8
	movea.l #loc_0dd392,a0

loc_02b1b8:
	movea.l (a0,d0.w),a0
	jmp (a0)

;==============================================
loc_02b1be:
	move.b ($378,a6),d0
	andi.w #$77,d0
	rts

;==============================================
loc_02b1c8:
	move.l #$2000a00,(4,a6)
	clr.b ($d2,a6)
	move.b ($2c9,a6),($b,a6)
	bsr.w loc_02f770
	clr.b ($5b,a6)
	bsr.w loc_02b1fc
	moveq #0,d0
	bsr.w loc_02aaf0
	beq.b loc_02b1f0
	moveq #2,d0

loc_02b1f0:
	move.b d0,($2c8,a6)
	move.b d0,($80,a6)
	bra.w loc_0287b0

loc_02b1fc:
	tst.b ($125,a6)
	bne.b loc_02b214
	bsr.w loc_02b216
	move.b d1,($82,a6)
	move.b d2,($81,a6)
	move.b ($371,a6),($83,a6)

loc_02b214:
	rts

;==============================================
loc_02b216:
	move.b ($378,a6),d0
	moveq #0,d1
	moveq #0,d2
	btst #0,d0
	bne.b loc_02b248
	moveq #2,d1
	btst #1,d0
	bne.b loc_02b248
	moveq #4,d1
	btst #2,d0
	bne.b loc_02b248
	moveq #0,d1
	moveq #2,d2
	btst #4,d0
	bne.b loc_02b248
	moveq #2,d1
	btst #5,d0
	bne.b loc_02b248
	moveq #4,d1

loc_02b248:
	rts

;==============================================
loc_02b24a:
	move.b ($10e,a5),d0
	or.b ($10d,a5),d0
	or.b ($8a,a5),d0
	bne.w loc_02b2ce
	tst.b ($125,a6)
	bne.w loc_02b2ce
	moveq #0,d3
	move.b ($102,a6),d3
	move.b ($371,a6),d0
	andi.b #3,d0
	beq.b loc_02b2ce
	moveq #0,d1
	move.b ($378,a6),d0
	cmpi.b #3,d0
	beq.b loc_02b2ac
	cmpi.b #6,d0
	beq.b loc_02b2ac
	cmpi.b #5,d0
	beq.b loc_02b2ac
	cmpi.b #7,d0
	beq.b loc_02b2ac
	moveq #2,d1
	cmpi.b #$30,d0
	beq.b loc_02b2ac
	cmpi.b #$60,d0
	beq.b loc_02b2ac
	cmpi.b #$50,d0
	beq.b loc_02b2ac
	cmpi.b #$70,d0
	beq.b loc_02b2ac
	bra.b loc_02b2ce

loc_02b2ac:
	tst.b ($31,a6)
	bne.b loc_02b2f8
	btst.b #2,($371,a6)
	bne.w loc_02b2de
	moveq #0,d2
	tst.b d1
	beq.w loc_02b2d2
	move.l #$ed4be9ef,d0
	btst.l d3,d0
	bne.b loc_02b2d2

loc_02b2ce:
	moveq #0,d0
	rts

loc_02b2d2:
	move.b d1,($81,a6)
	move.b d2,($80,a6)
	moveq #1,d0
	rts

loc_02b2de:
	move.l #$5010000,d0
	tst.b d1
	beq.w loc_02b2f0
	move.l #$10000,d0

loc_02b2f0:
	moveq #2,d2
	btst.l d3,d0
	bne.b loc_02b2d2
	bra.b loc_02b2ce

loc_02b2f8:
	move.w ($14,a6),d0
	sub.w ($64,a6),d0
	cmpi.w #$20,d0
	bcs.b loc_02b2ce
	move.l #$f7619ffb,d0
	tst.b d1
	beq.w loc_02b318
	move.l #$fe4a602c,d0

loc_02b318:
	moveq #4,d2
	btst.l d3,d0
	bne.b loc_02b2d2
	bra.b loc_02b2ce

;==============================================
loc_02b320:
	move.l #$2040000,(4,a6)
	move.b ($2c9,a6),($b,a6)
	rts

;==============================================
loc_02b330:
	tst.w ($50,a6)
	bmi.w loc_02b374
	tst.b ($125,a6)
	bne.w loc_02b3ca
	tst.b ($f0,a6)
	bne.w loc_02b374
	tst.b ($27a,a6)
	bne.w loc_02b37e
	move.b ($378,a6),d0
	or.b ($37a,a6),d0
	andi.w #7,d0
	cmpi.b #3,d0
	beq.b loc_02b378
	cmpi.b #6,d0
	beq.b loc_02b378
	cmpi.b #5,d0
	beq.b loc_02b378
	cmpi.b #7,d0
	beq.b loc_02b378

loc_02b374:
	moveq #0,d0
	rts

loc_02b378:
	move.b #1,($27a,a6)

loc_02b37e:
	move.b ($10e,a5),d0
	or.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($2ce,a6),d0
	or.b ($26a,a6),d0
	or.b ($26b,a6),d0
	bne.b loc_02b374
	tst.b ($270,a6)
	beq.b loc_02b3a4
	tst.b ($32d,a6)
	bne.b loc_02b374

loc_02b3a4:
	moveq #$30,d1
	move.b ($371,a6),d2
	andi.w #3,d2
	beq.b loc_02b3ba
	moveq #$20,d1
	btst #1,d0
	bne.b loc_02b3ba
	moveq #$10,d1

loc_02b3ba:
	move.w ($14,a6),d0
	sub.w ($64,a6),d0
	cmp.w d0,d1
	bcc.b loc_02b374
	moveq #1,d0
	rts

loc_02b3ca:
	move.b ($10e,a5),d0
	or.b ($10d,a5),d0
	or.b ($8a,a5),d0
	or.b ($2ce,a6),d0
	or.b ($26a,a6),d0
	or.b ($26b,a6),d0
	or.b ($32d,a6),d0
	bne.b loc_02b374
	tst.b ($270,a6)
	bne.b loc_02b374
	movea.l #loc_0c95da,a1
	jsr loc_030a66
	beq.w loc_02b374
	move.w ($14,a6),d0
	sub.w ($64,a6),d0
	cmpi.w #$30,d0
	bcs.w loc_02b374
	moveq #1,d0
	rts

;==============================================
loc_02b412:
	move.l #$2000610,(4,a6)
	move.b #1,($31,a6)
	move.b #$ff,($3c,a6)
	move.b ($2c9,a6),($b,a6)
	jsr loc_02f490
	moveq #0,d0
	move.b d0,($5d,a6)
	move.b d0,($5e,a6)
	move.l d0,($b0,a6)
	move.b d0,($5f,a6)
	move.b d0,($282,a6)
	move.w d0,($280,a6)
	move.b d0,($250,a6)
	move.b d0,($251,a6)
	move.b d0,($252,a6)
	move.b d0,($26c,a6)
	move.b d0,($273,a6)
	move.b d0,($26f,a6)
	move.b d0,($2c0,a6)
	move.b d0,($d6,a6)
	move.b d0,($270,a6)
	move.b d0,($32a,a6)
	move.b d0,($274,a6)
	move.b d0,($2af,a6)
	move.b d0,($23a,a6)
	move.b d0,($23b,a6)
	move.b d0,($27a,a6)
	move.b d0,($26a,a6)
	move.b d0,($26b,a6)
	move.l d0,($48,a6)
	move.b #4,($2ad,a6)
	move.b #$e,($2ae,a6)
	move.b #0,($2a0,a6)
	move.b #1,($2c1,a6)
	move.b #0,($23f,a6)
	tst.b ($125,a6)
	bne.w loc_02b520
	moveq #$c,d4
	move.b ($37d,a6),d0
	andi.w #3,d0
	beq.b loc_02b508
	move.l #$10000,d1
	move.l #$40000,d2
	move.l #$ffffa000,d3
	moveq #$a,d4
	btst #1,d0
	bne.b loc_02b4f4
	move.l #$30000,d1
	move.l #$60000,d2
	move.l #$ffffa000,d3
	moveq #$e,d4

loc_02b4f4:
	tst.w ($40,a6)
	bpl.b loc_02b4fc
	neg.l d1

loc_02b4fc:
	move.l d1,($40,a6)
	move.l d2,($44,a6)
	move.l d3,($4c,a6)

loc_02b508:
	move.b d4,($25d,a6)
	move.b d4,($23f,a6)
	move.b d4,($3a,a6)
	jsr loc_003e2a
	moveq #$18,d0
	bra.w loc_02a75e

loc_02b520:
	jsr loc_032c9a
	moveq #8,d4
	jsr RNGFunction
	andi.w #3,d0
	beq.b loc_02b508
	btst #0,d0
	beq.b loc_02b508
	move.l #$10000,d1
	move.l #$40000,d2
	move.l #$ffffa000,d3
	moveq #6,d4
	btst #1,d0
	beq.b loc_02b4f4
	move.l #$30000,d1
	move.l #$60000,d2
	move.l #$ffffa000,d3
	moveq #6,d4
	bra.b loc_02b4f4

;==============================================
loc_02b56a:
	moveq #0,d6
	tst.b ($125,a6)
	bne.w loc_02b58c
	move.b ($371,a6),d5
	move.b ($373,a6),d4
	eor.b d4,d5
	beq.b loc_02b582
	addq.b #1,d6

loc_02b582:
	tst.b ($378,a6)
	beq.b loc_02b58a
	addq.b #1,d6

loc_02b58a:
	rts

loc_02b58c:
	movea.l #loc_0c96da,a1
	jsr loc_030a66
	beq.b loc_02b59c
	addq.b #1,d6

loc_02b59c:
	movea.l #loc_0c96da,a1
	jsr loc_030a66
	beq.b loc_02b5ac
	addq.b #1,d6

loc_02b5ac:
	rts

;==============================================
loc_02b5ae:
	clr.b ($23d,a6)
	btst.b #0,($269,a6)
	beq.b loc_02b5cc
	tst.b ($ac,a6)
	bne.b loc_02b5cc
	tst.b ($31,a6)
	bne.b loc_02b5cc
	jsr loc_085a74

loc_02b5cc:
	moveq #0,d0
	move.b ($57,a6),d0
	add.w d0,d0
	lea.l loc_02d0cc(pc),a0
	add.w d6,d0
	move.b (a0,d0.w),d0
	add.w d0,d0
	lea.l loc_02d102(pc),a0
	tst.b ($26c,a6)
	beq.b loc_02b5ee
	lea.l loc_02d402(pc),a0

loc_02b5ee:
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	move.w ($268,a6),d0
	move.b (a0,d0.w),d0
	bmi.b loc_02b622
	addq.w #1,($268,a6)
	move.b #1,($23d,a6)
	tst.b ($66,a6)
	bne.b loc_02b612
	neg.w d0

loc_02b612:
	tst.w ($50,a6)
	bpl.b loc_02b61a
	add.w d0,d0

loc_02b61a:
	add.w d0,($10,a6)
	moveq #0,d0
	rts

loc_02b622:
	moveq #1,d0
	rts

;==============================================
loc_02b626:
	bsr.w loc_02b684
	clr.b ($23d,a6)
	btst.b #0,($3b,a6)
	beq.b loc_02b648
	tst.b ($ac,a6)
	bne.b loc_02b648
	tst.b ($31,a6)
	bne.b loc_02b648
	jsr loc_085a74

loc_02b648:
	moveq #1,d0
	move.b #1,($23d,a6)
	tst.b ($66,a6)
	bne.b loc_02b658
	neg.w d0

loc_02b658:
	tst.w ($50,a6)
	bpl.b loc_02b660
	add.w d0,d0

loc_02b660:
	add.w d0,($10,a6)
	moveq #3,d0
	tst.b ($b,a6)
	bne.b loc_02b66e
	neg.w d0

loc_02b66e:
	btst.b #0,($5f,a6)
	beq.b loc_02b678
	neg.w d0

loc_02b678:
	add.w d0,($10,a6)

loc_02b67c:
	moveq #0,d0
	rts

loc_02b680:
	moveq #1,d0
	rts

loc_02b684:
	cmpi.b #2,($54,a6)
	bne.w loc_02b6aa
	tst.b ($5f,a6)
	beq.b loc_02b6aa
	movea.l ($1c,a6),a0
	tst.b ($d,a0)
	beq.b loc_02b6aa
	tst.b ($125,a6)
	bne.w loc_029416
	bra.w loc_0293d6

loc_02b6aa:
	rts

;==============================================
loc_02b6ac:
	cmpi.b #4,($102,a6)
	beq.b loc_02b6c4
	cmpi.b #$1c,($102,a6)
	beq.b loc_02b6c4
	cmpi.b #7,($102,a6)
	bne.b loc_02b710

loc_02b6c4:
	move.w ($64,a6),d0
	addi.w #$20,d0
	cmp.w ($14,a6),d0
	bcc.b loc_02b710
	move.b ($3c,a6),d1
	beq.b loc_02b710
	btst.b #2,($11b,a6)
	bne.b loc_02b710
	move.b ($ac,a6),d0
	beq.b loc_02b710
	tst.w ($40,a6)
	beq.b loc_02b710
	bmi.b loc_02b6fe
	cmpi.b #2,d0
	bne.b loc_02b710
	btst.b #1,($11b,a6)
	beq.b loc_02b710
	bra.b loc_02b70c

loc_02b6fe:
	cmpi.b #1,d0
	bne.b loc_02b710
	btst.b #0,($11b,a6)
	beq.b loc_02b710

loc_02b70c:
	moveq #1,d0
	rts

loc_02b710:
	moveq #0,d0
	rts

;==============================================
loc_02b714:
	move.b #$a,(7,a6)
	moveq #0,d0
	cmpi.b #1,($ac,a6)
	beq.b loc_02b726
	moveq #1,d0

loc_02b726:
	move.b d0,($b,a6)
	jsr loc_00369c
	moveq #$30,d0
	bra.w loc_02a708

;==============================================
loc_02b736:
	move.b #8,(7,a6)
	clr.b ($d2,a6)
	moveq #$1c,d0
	bra.w loc_02a708

;==============================================
loc_02b746:
	tst.b ($8a,a5)
	beq.b loc_02b7b4
	move.l #$2000006,(4,a6)
	move.b ($2c9,a6),($b,a6)
	cmpi.b #2,($102,a6)
	bne.b loc_02b768
	eori.b #1,($b,a6)

loc_02b768:
	moveq #$29,d0
	movea.w ($38,a6),a4
	move.w ($50,a4),d1
	cmp.w ($50,a6),d1
	beq.b loc_02b7ac
	bcs.b loc_02b77e
	moveq #$28,d0
	bra.b loc_02b7ac

loc_02b77e:
	moveq #$23,d0
	cmpi.b #$d,($102,a6)
	beq.b loc_02b790
	cmpi.b #$1d,($102,a6)
	bne.b loc_02b794

loc_02b790:
	moveq #$27,d0
	bra.b loc_02b7a6

loc_02b794:
	cmpi.b #$f,($102,a6)
	beq.b loc_02b7a4
	cmpi.b #$16,($102,a6)
	bne.b loc_02b7a6

loc_02b7a4:
	moveq #$25,d0

loc_02b7a6:
	move.b ($2c9,a6),($b,a6)

loc_02b7ac:
	bsr.w loc_02a708
	moveq #1,d0
	rts

loc_02b7b4:
	moveq #0,d0
	rts

;==============================================
loc_02b7b8:
	move.l #$a0000,d0
	move.b ($102,a6),d1
	btst.l d1,d0
	beq.w loc_02b852
	move.b (7,a6),d0
	move.w loc_02b7d4(pc,d0.w),d1
	jmp loc_02b7d4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02b7d4:
	dc.w loc_02b7d8-loc_02b7d4
	dc.w loc_02b7f6-loc_02b7d4

;----------------------------------------------
loc_02b7d8:
	addq.b #2,(7,a6)
	clr.b ($283,a6)
	eori.b #2,($102,a6)
	bsr.w loc_02fc4a
	jsr loc_02f15c
	moveq #$30,d0
	bra.w loc_02a708

;----------------------------------------------
loc_02b7f6:
	tst.b ($33,a6)
	bmi.w loc_02baf2
	tst.b ($125,a6)
	bne.b loc_02b81c
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02b1c8
	bsr.w loc_02ab24
	bne.w loc_02ac60

loc_02b81c:
	bsr.w loc_02aab2
	bne.w loc_02aabc
	bra.w loc_02a7ea

;==============================================
;
;==============================================
loc_02b828:
	btst.b #0,($283,a6)
	beq.b loc_02b852
	clr.b ($283,a6)
	move.l #$a0000,d0
	move.b ($102,a6),d1
	btst.l d1,d0
	beq.b loc_02b852
	eori.b #2,($102,a6)
	bsr.w loc_02fc4a
	jmp loc_02f15c

loc_02b852:
	rts

;==============================================
;
;==============================================
loc_02b854:
	tst.b ($bf,a5)
	bne.w loc_02b984
	tst.b ($15d,a5)
	bne.w loc_02b984
	tst.b ($159,a6)
	bpl.w loc_02b984
	tst.b ($125,a6)
	bne.w loc_02b928
	movea.w ($38,a6),a4
	tst.b ($125,a4)
	beq.w loc_02b984
	moveq #0,d0
	move.b ($102,a6),d0
	add.w d0,d0
	movea.l #loc_0dfa52,a0
	move.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	move.b ($102,a4),d1

loc_02b89a:
	move.b (a0)+,d2
	bmi.w loc_02b984
	cmp.b d1,d2
	beq.b loc_02b8a8
	move.b (a0)+,d2
	bra.b loc_02b89a

loc_02b8a8:
	moveq #0,d0
	move.b (a0)+,d0
	move.w loc_02b8b4(pc,d0.w),d1
	jmp loc_02b8b4(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02b8b4:
	dc.w loc_02b8d0-loc_02b8b4;1c
	dc.w loc_02b8d0-loc_02b8b4;1c
	dc.w loc_02b8d0-loc_02b8b4;1c
	dc.w loc_02b8d0-loc_02b8b4;1c
	dc.w loc_02b8d0-loc_02b8b4;1c
	dc.w loc_02b8d0-loc_02b8b4;1c
	dc.w loc_02b8d0-loc_02b8b4;1c
	dc.w loc_02b908-loc_02b8b4;54

	dc.w loc_02b908-loc_02b8b4;54
	dc.w loc_02b910-loc_02b8b4;5c
	dc.w loc_02b8d0-loc_02b8b4;1c
	dc.w loc_02b8d0-loc_02b8b4;1c
	dc.w loc_02b910-loc_02b8b4;5c
	dc.w loc_02b900-loc_02b8b4;4c

;----------------------------------------------
loc_02b8d0:
	move.b #2,($32b,a6)
	rts

loc_02b8d8:
	move.b #4,($32b,a6)
	rts

loc_02b8e0:
	move.b #6,($32b,a6)
	rts

loc_02b8e8:
	move.b #8,($32b,a6)
	rts

loc_02b8f0:
	move.b #$a,($32b,a6)
	rts

loc_02b8f8:
	move.b #$c,($32b,a6)
	rts

loc_02b900:
	move.b #$e,($32b,a6)
	rts

loc_02b908:
	move.b #$10,($32b,a6)
	rts

loc_02b910:
	move.b #$12,($32b,a6)
	rts

loc_02b918:
	move.b #$14,($32b,a6)
	rts

loc_02b920:
	move.b #$16,($32b,a6)
	rts

;----------------------------------------------
loc_02b928:
	movea.w ($38,a6),a4
	tst.b ($125,a4)
	bne.w loc_02b984
	moveq #0,d0
	move.b ($102,a4),d0
	add.w d0,d0
	movea.l #loc_0dfa52,a0
	move.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	move.b ($102,a6),d1

loc_02b94e:
	move.b (a0)+,d2
	bmi.w loc_02b984
	cmp.b d1,d2
	beq.b loc_02b95c
	move.b (a0)+,d2
	bra.b loc_02b94e

loc_02b95c:
	moveq #0,d0
	move.b (a0)+,d0
	move.w loc_02b968(pc,d0.w),d1
	jmp loc_02b968(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02b968:
	dc.w loc_02b8d0-loc_02b968
	dc.w loc_02b8d8-loc_02b968
	dc.w loc_02b8e0-loc_02b968
	dc.w loc_02b8e8-loc_02b968
	dc.w loc_02b8f0-loc_02b968
	dc.w loc_02b8f8-loc_02b968
	dc.w loc_02b900-loc_02b968
	dc.w loc_02b900-loc_02b968
	dc.w loc_02b8d0-loc_02b968
	dc.w loc_02b900-loc_02b968
	dc.w loc_02b918-loc_02b968
	dc.w loc_02b920-loc_02b968
	dc.w loc_02b920-loc_02b968
	dc.w loc_02b8d0-loc_02b968

;----------------------------------------------
loc_02b984:
	rts

;==============================================
loc_02b986:
	move.b ($13f,a5),d0
	moveq #1,d1
	cmpi.b #8,d0
	beq.b loc_02b99c
	moveq #3,d1
	cmpi.b #$a,d0
	beq.b loc_02b99c
	moveq #6,d1

loc_02b99c:
	btst d1,($149,a6)
	rts

;==============================================
loc_02b9a2:
	tst.b ($bf,a5)
	bne.b loc_02b984
	cmpi.w #6,($138,a5)
	beq.b loc_02b984
	tst.b ($15d,a5)
	bne.b loc_02b984
	tst.b ($105,a5)
	beq.b loc_02b984
	tst.b ($125,a6)
	bne.w loc_02ba4c
	movea.w ($38,a6),a4
	tst.b ($125,a4)
	beq.b loc_02b984
	cmpi.w #$208,(4,a6)
	bne.b loc_02b984
	moveq #0,d0
	move.b ($102,a6),d0
	add.w d0,d0
	movea.l #loc_0dfb7a,a0
	move.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	move.b ($102,a4),d1

loc_02b9f0:
	move.b (a0)+,d2
	bmi.b loc_02b984
	cmp.b d1,d2
	beq.b loc_02b9fc
	move.b (a0)+,d2
	bra.b loc_02b9f0

loc_02b9fc:
	moveq #0,d0
	move.b (a0)+,d0
	move.w loc_02ba08(pc,d0.w),d1
	jmp loc_02ba08(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02ba08:
	dc.w loc_02ba14-loc_02ba08
	dc.w loc_02ba14-loc_02ba08
	dc.w loc_02ba2c-loc_02ba08
	dc.w loc_02ba14-loc_02ba08
	dc.w loc_02ba3c-loc_02ba08
	dc.w loc_02ba44-loc_02ba08

;----------------------------------------------
loc_02ba14:
	move.b #2,($32c,a6)
	rts

loc_02ba1c:
	move.b #4,($32c,a6)
	rts

loc_02ba24:
	move.b #6,($32c,a6)
	rts

loc_02ba2c:
	move.b #8,($32c,a6)
	rts

loc_02ba34:
	move.b #$a,($32c,a6)
	rts

loc_02ba3c:
	move.b #$c,($32c,a6)
	rts

loc_02ba44:
	move.b #$e,($32c,a6)
	rts

;----------------------------------------------
loc_02ba4c:
	movea.w ($38,a6),a4
	tst.b ($125,a4)
	bne.w loc_02b984
	cmpi.w #$20c,(4,a6)
	beq.w loc_02ba6c
	cmpi.w #$20a,(4,a6)
	bne.w loc_02b984

loc_02ba6c:
	moveq #0,d0
	move.b ($102,a4),d0
	add.w d0,d0
	movea.l #loc_0dfb7a,a0
	move.w (a0,d0.w),d1
	lea.l (a0,d1.w),a0
	move.b ($102,a6),d1

loc_02ba86:
	move.b (a0)+,d2
	bmi.w loc_02b984
	cmp.b d1,d2
	beq.b loc_02ba94
	move.b (a0)+,d2
	bra.b loc_02ba86

loc_02ba94:
	moveq #0,d0
	move.b (a0)+,d0
	move.w loc_02baa0(pc,d0.w),d1
	jmp loc_02baa0(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02baa0:;178848
	dc.w loc_02ba1c-loc_02baa0
	dc.w loc_02ba24-loc_02baa0
	dc.w loc_02ba1c-loc_02baa0
	dc.w loc_02ba34-loc_02baa0
	dc.w loc_02ba24-loc_02baa0
	dc.w loc_02ba1c-loc_02baa0

;==============================================
loc_02baac:
	move.b ($13f,a5),d0
	moveq #2,d1
	cmpi.b #8,d0
	beq.b loc_02baba
	moveq #4,d1

loc_02baba:
	btst d1,($149,a6)
	rts

;==============================================
loc_02bac0:
	move.b ($2a0,a6),d0
	beq.b loc_02bade
	cmpi.b #2,d0
	beq.b loc_02bade
	cmpi.b #4,d0
	beq.b loc_02bade
	cmpi.b #6,d0
	beq.b loc_02bade
	move.b #0,($2a0,a6)

loc_02bade:
	rts

;==============================================
loc_02bae0:
	tst.b ($125,a6)
	bne.b loc_02baf2
	cmpi.b #$a,($102,a6)
	bne.b loc_02baf2
	moveq #$30,d0
	bra.b loc_02baf8

;==============================================
loc_02baf2:
	bsr.w loc_02b828
	moveq #0,d0

loc_02baf8:
	bsr.w loc_02a708
	move.l #$2000000,(4,a6)
	clr.b ($2c8,a6)
	bsr.w loc_02bb5a
	jsr loc_02f490
	moveq #0,d0
	move.l d0,($b0,a6)
	move.b d0,($5e,a6)
	move.b d0,($5d,a6)
	move.b d0,($23a,a6)
	rts

;==============================================
loc_02bb26:
	bsr.w loc_02b828
	move.l #$2000004,(4,a6)
	move.b #1,($2c8,a6)
	bsr.w loc_02bb5a
	jsr loc_02f490
	moveq #0,d0
	move.l d0,($b0,a6)
	move.b d0,($5e,a6)
	move.b d0,($5d,a6)
	move.b d0,($23a,a6)
	moveq #1,d0
	bra.w loc_02a708

;==============================================
loc_02bb5a:
	moveq #0,d0
	movea.w ($38,a6),a4
	tst.b ($270,a4)
	beq.b loc_02bb8c
	tst.b ($32d,a4)
	bne.b loc_02bb78
	cmpi.b #3,($270,a4)
	bne.b loc_02bb7e
	move.b d0,($270,a4)

loc_02bb78:
	move.b #1,($d6,a4)

loc_02bb7e:
	cmpi.b #1,($270,a4)
	bne.b loc_02bb8c
	move.b #2,($270,a4)

loc_02bb8c:
	tst.b ($32a,a4)
	beq.b loc_02bba0
	move.b #1,($d6,a4)
	clr.b ($270,a4)
	clr.b ($32a,a4)

loc_02bba0:
	move.b d0,($26a,a4)
	move.b d0,($26b,a4)
	move.b d0,($31,a6)
	move.b d0,($2ca,a6)
	move.b d0,($ab,a6)
	move.b d0,($ad,a6)
	move.b d0,($239,a6)
	move.b d0,($23d,a6)
	move.b d0,($23e,a6)
	move.w ($64,a6),($14,a6)
	move.w d0,($16,a6)
	move.b d0,($247,a6)
	move.b d0,($249,a6)
	move.b d0,($250,a6)
	move.b d0,($251,a6)
	move.b d0,($252,a6)
	move.b d0,($253,a6)
	move.b d0,($245,a6)
	move.b d0,($257,a6)
	move.b d0,($258,a6)
	move.b d0,($ce,a6)
	move.w d0,($280,a6)
	move.b d0,($282,a6)
	move.b d0,($283,a6)
	move.b d0,($2ac,a6)
	move.b d0,($28d,a6)
	move.b d0,($3e,a6)
	move.w d0,($16,a6)
	move.b d0,($3f,a6)
	move.b d0,($291,a6)
	move.b d0,($294,a6)
	move.b d0,($295,a6)
	move.b d0,($210,a6)
	move.b d0,($214,a6)
	move.b d0,($217,a6)
	move.b d0,($29b,a6)
	move.b d0,($d6,a6)
	move.b d0,($25f,a6)
	move.b d0,($26c,a6)
	move.b d0,($273,a6)
	move.b d0,(pl_blockstring_counter,a6)
	move.b d0,($24f,a6)
	move.b d0,($26f,a6)
	move.b d0,($de,a6)
	move.b d0,($dd,a6)
	move.b d0,($23b,a6)
	move.b d0,($2c1,a6)
	move.b d0,($270,a6)
	move.b d0,($32a,a6)
	move.b d0,($a8,a6)
	move.b d0,($274,a6)
	move.b d0,($2af,a6)
	move.b d0,($2c3,a6)
	move.b d0,($23a,a6)
	move.b d0,($27a,a6)
	move.w d0,($d4,a6)
	move.b d0,($2c5,a6)
	move.b d0,($27e,a6)
	move.b d0,($cc,a6)
	move.b d0,($ed,a6)
	move.b d0,($2d9,a6)
	move.b d0,($328,a6)
	move.b d0,($124,a6)
	move.b d0,($32d,a6)
	cmpi.b #$1c,($102,a6)
	bne.b loc_02bcb2
	move.b d0,($6f,a6)
	move.b d0,($70,a6)

loc_02bcb2:
	move.b #0,($2a0,a6)
	move.b ($2c9,a6),($b,a6)
	tst.b ($b9,a6)
	bne.b loc_02bcc8
	move.b d0,($a9,a6)

loc_02bcc8:
	movea.w ($38,a6),a4
	tst.b ($b9,a4)
	bne.b loc_02bcd6
	move.b d0,($216,a6)

loc_02bcd6:
	rts

;==============================================
loc_02bcd8:
	moveq #0,d0
	move.b d0,($a9,a6)
	move.b d0,($23d,a6)
	move.w d0,($268,a6)
	move.b d0,($216,a6)
	move.b d0,($65e,a5)
	move.b d0,($a5e,a5)
	move.b d0,($e5e,a5)
	move.b d0,($125e,a5)
	move.b d0,($d6,a6)
	move.b d0,($25d,a6)
	move.b d0,($294,a6)
	move.b d0,(PL_Reversal_Window,a6)
	move.b d0,($2ac,a6)
	move.b d0,($26f,a6)
	move.b d0,($de,a6)
	move.b d0,($dd,a6)
	move.b d0,($2c0,a6)
	move.b d0,($2c1,a6)
	move.b d0,($274,a6)
	move.b d0,($2af,a6)
	move.b d0,($252,a6)
	move.b d0,($2c5,a6)
	move.b d0,($24e,a6)
	move.b d0,($cc,a6)
	move.b d0,($ed,a6)
	move.b d0,($2d9,a6)
	move.b d0,($328,a6)
	move.l d0,($40,a6)
	move.l d0,($48,a6)
	move.l d0,($44,a6)
	move.l d0,($4c,a6)
	movea.w ($38,a6),a4
	move.b d0,($26a,a4)
	move.b d0,($26b,a4)
	rts

;==============================================
loc_02bd64:
	bsr.w loc_02b828
	move.l #$2000604,(4,a6)
	bsr.w loc_02bb5a
	jsr loc_00369c
	tst.b ($125,a6)
	bne.b loc_02bd98
	bsr.w loc_02b24a
	bne.w loc_02b320
	bsr.w loc_02b1be
	bne.w loc_02b1c8
	bsr.w loc_02ab24
	bne.w loc_02ac60

loc_02bd98:
	bsr.w loc_02aab2
	bne.w loc_02aabc
	moveq #$11,d0
	bra.w loc_02a708

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02bda6:
	dc.b $00,$01,$ff,$ff,$00,$ff,$01,$01
	dc.b $ff,$00,$01,$01,$00,$00,$01,$ff

loc_02bdb6:
	dc.b $00,$01,$ff,$ff,$00,$ff,$00,$01
	dc.b $ff,$01,$00,$01,$00,$01,$00,$ff

loc_02bdc6:
	dc.b $02,$01,$00,$00,$0c,$00,$01,$01
	dc.b $00,$0c,$02,$02,$04,$04,$03,$00

;==============================================
;Intro?
;==============================================
loc_02bdd6:
	move.w ($138,a5),d0
	add.w d0,d0
	add.b ($101,a6),d0
	move.b loc_02bda6(pc,d0.w),($59,a6)
	move.b loc_02bdb6(pc,d0.w),($5a,a6)
	move.b loc_02bdc6(pc,d0.w),($cf,a6)
	moveq #0,d0
	move.b ($102,a6),d0
	movea.l #loc_0df912,a0
	move.b (a0,d0.w),($2cd,a6)
	tst.b ($eb,a6)
	beq.b loc_02be14
	move.b ($2cd,a6),d1
	lsr.b #1,d1
	move.b d1,($2cd,a6)

loc_02be14:
	movea.l #loc_0df932,a0
	move.b (a0,d0.w),($24c,a6)
	moveq #8,d1
	cmpi.b #$ff,(PL_ism_choice,a6)
	beq.b loc_02be3c
	moveq #-8,d1
	tst.b (PL_ism_choice,a6)
	beq.b loc_02be3c
	cmpi.b #Cody_id,(PL_Charid,a6)
	bne.b loc_02be3c
	moveq #-24,d1

loc_02be3c:
	add.b d1,($24c,a6)
	tst.b ($eb,a6)
	beq.b loc_02be50
	move.b ($24c,a6),d1
	lsr.b #1,d1
	move.b d1,($24c,a6)

loc_02be50:
	movea.l #loc_0df992,a0
	move.b (a0,d0.w),($158,a6)
	movea.l #loc_0dcad2,a0
	add.w d0,d0
	move.w (a0,d0.w),($a6,a6)
	movea.l #AismWalkSpeed,a0
	movea.l #loc_0dd792,a1
	tst.b (PL_ism_choice,a6)
	beq.w loc_02be9e
	movea.l #XismWalkSpeed,a0
	movea.l #loc_0de792,a1
	cmpi.b #$ff,(PL_ism_choice,a6)
	beq.b loc_02be9e
	movea.l #VismWalkSpeed,a0
	movea.l #loc_0ddf92,a1

loc_02be9e:
	move.l a0,($2d0,a6)
	move.l a1,($2d4,a6)
	rts

;==============================================
loc_02bea8:
	moveq #0,d0
	move.b ($102,a6),d0
	movea.l #loc_0df892,a0
	lsl.w #2,d0
	move.l (a0,d0.w),($264,a6)
	movea.l #loc_0df812,a0
	move.l (a0,d0.w),($e6,a6)
	rts

;==============================================
loc_02beca:
	move.w (stageid,a5),d0
	move.b loc_02bed6+1(pc,d0.w),($e,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02bed6:
	dc.b $00,$08,$00,$08,$00,$08,$00,$08
	dc.b $00,$08,$00,$08,$00,$08,$00,$08
	dc.b $00,$08,$00,$08,$00,$08,$00,$08
	dc.b $00,$08,$00,$08,$00,$08,$00,$08
	dc.b $00,$08,$00,$08,$00,$08,$00,$08
	dc.b $00,$08,$00,$08,$00,$08,$00,$08
	dc.b $00,$08,$00,$08,$00,$08,$00,$08
	dc.b $00,$08,$00,$08,$00,$08,$00,$08

;==============================================
loc_02bf16:
	move.w (stageid,a5),d0
	add.w d0,d0
	move.w loc_02bf2a(pc,d0.w),($18,a6)
	move.w loc_02bf2a+2(pc,d0.w),($d0,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02bf2a:
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000
	dc.w $e000,$e000

;==============================================
loc_02bfaa:
	move.b #1,($b,a6)
	move.b #1,($2c9,a6)
	tst.b ($59,a6)
	beq.b loc_02bfc4
	clr.b ($b,a6)
	clr.b ($2c9,a6)

loc_02bfc4:
	cmpi.w #4,($138,a5)
	bcs.b loc_02bfe0
	btst.b #0,($ac,a5)
	bne.b loc_02bfe0
	eori.b #1,($b,a6)
	eori.b #1,($2c9,a6)

loc_02bfe0:
	move.w (stageid,a5),d0
	add.w d0,d0
	move.w loc_02c02c(pc,d0.w),($10,a6)
	move.w loc_02c02c+2(pc,d0.w),d1
	move.w d1,($14,a6)
	move.w d1,($64,a6)
	moveq #-96,d0
	cmpi.w #6,($138,a5)
	bne.b loc_02c00e
	cmpi.b #1,($101,a6)
	bne.b loc_02c01e
	moveq #-74,d0
	bra.b loc_02c01e

loc_02c00e:
	tst.w ($138,a5)
	beq.b loc_02c01e
	cmpi.b #2,($101,a6)
	bne.b loc_02c01e
	moveq #-$40,d0

loc_02c01e:
	tst.b ($b,a6)
	bne.b loc_02c026
	neg.w d0

loc_02c026:
	add.w d0,($10,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV/\
;Stage Spawn
loc_02c02c:
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028
	dc.w $0280,$0028

;==============================================
loc_02c0ac:
	move.w ($138,a5),d0
	add.w d0,d0
	add.b ($101,a6),d0
	move.b loc_02c0be(pc,d0.w),($d,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02c0be:
	dc.b $00,$05,$00,$00,$00,$00,$05,$0a
	dc.b $00,$00,$05,$0a,$00,$05,$0a,$00

;==============================================
loc_02c0ce:
	moveq #0,d0
	move.b (PL_charid,a6),d0
	lsl.w #2,d0
	add.b (PL_ism_choice,a6),d0
	addq.b #1,d0
	move.b loc_02c0e4(pc,d0.w),($271,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02c0e4:
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $02,$00,$00,$00,$00,$00,$00,$00
	dc.b $06,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $04,$04,$04,$00,$00,$00,$00,$00
	dc.b $08,$08,$08,$00,$08,$08,$08,$00

;==============================================
loc_02c164:
	moveq #0,d0
	move.b (PL_charid,a6),d0
	lsl.w #2,d0
	move.w loc_02c186(pc,d0.w),d1
	move.w loc_02c186+2(pc,d0.w),d2
	add.w d2,($14,a4)
	tst.b ($b,a6)
	beq.b loc_02c180
	neg.w d1

loc_02c180:
	add.w d1,($10,a4)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02c186:
	dc.w $0037,$004d,$0037,$004d,$0037,$004d,$0040,$004e
	dc.w $002f,$0048,$003e,$004f,$002e,$005d,$0025,$0054
	dc.w $0016,$0063,$0033,$0055,$0049,$0052,$003d,$0066
	dc.w $0037,$004d,$0037,$004d,$0037,$004d,$0037,$004d
	dc.w $0037,$004d,$0037,$004d,$0037,$004d,$0037,$004d
	dc.w $0037,$004d,$0037,$004d,$0037,$004d,$0037,$004d
	dc.w $0037,$004d,$0037,$004d,$0037,$004d,$0037,$004d
	dc.w $0037,$004d,$0037,$004d,$0037,$004d,$0037,$004d

;==============================================
loc_02c206:
	moveq #$1f,d7

loc_02c208:
	movea.l #loc_0dd112,a4
	move.w d7,d0
	lsl.w #2,d0
	movea.l (a4,d0.w),a4
	movea.l #CharAniPNTtable,a3
	movea.l (a3,d0.w),a3
	movea.l (8,a3),a2
	bsr.w loc_02c256
	movea.l ($c,a3),a2
	bsr.w loc_02c256
	movea.l ($18,a3),a2
	bsr.w loc_02c256
	movea.l ($1c,a3),a2
	bsr.w loc_02c256
	movea.l ($28,a3),a2
	bsr.w loc_02c256
	movea.l ($2c,a3),a2
	bsr.w loc_02c256
	dbra d7,loc_02c208
	rts

;==============================================
loc_02c256:
	moveq #0,d6

loc_02c258:
	move.w (a2,d6.w),d0
	beq.w loc_02c29a
	lea.l (a2,d0.w),a1

loc_02c264:
	tst.b (9,a1)
	beq.b loc_02c27a
	moveq #0,d0
	move.b ($a,a1),d0
	lsl.w #2,d0
	tst.b (3,a4,d0.w)
	bmi.w loc_02c292

loc_02c27a:
	move.b (1,a1),d0
	bmi.b loc_02c28e
	btst #6,d0
	bne.w loc_02c28e
	lea.l ($14,a1),a1
	bra.b loc_02c264

loc_02c28e:
	addq.w #2,d6
	bra.b loc_02c258

loc_02c292:
	move.l #$bc614e,1.w

loc_02c29a:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02c29c:
	dc.w $0000,$0001,$0000,$0001,$0000,$0001,$0000,$0001
	dc.w $0000,$0002,$0000,$0002,$0000,$0002,$0000,$0002
	dc.w $0000,$0002,$0000,$0002,$0000,$0002,$0000,$0002
	dc.w $0000,$0002,$0000,$0002,$0000,$0002,$0000,$0002
	dc.w $0000,$0002,$0000,$0002,$0000,$0002,$0000,$0002
	dc.w $0000,$0002,$0000,$0002,$0000,$0002,$0000,$0002
	dc.w $0000,$0002,$0000,$0002,$0000,$0002,$0000,$0002
	dc.w $0000,$0002,$0000,$0002,$0000,$0002,$0000,$0002
	dc.w $0000,$0002,$0000,$0002,$0000,$0002,$0000,$0002
	dc.w $0000,$0002,$0000,$0002,$0000,$0002,$0000,$0002
	dc.w $0000,$0002,$0000,$0002,$0000,$0002,$0000,$0002
	dc.w $0000,$0002,$0000,$0002,$0000,$0002,$0000,$0002
	dc.w $0000,$0002,$0000,$0002,$0000,$0002,$0000,$0002
	dc.w $0000,$0002,$0000,$0002,$0000,$0002,$0000,$0002
	dc.w $0000,$0002,$0000,$0002,$0000,$0002,$0000,$0002
	dc.w $0000,$0002,$0000,$0002,$0000,$0002,$0000,$0002

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02c39c:
	dc.b $00,$0a,$01,$0a,$01,$06,$01,$06,$02,$06,$01,$06,$03,$08,$01,$08
	dc.b $04,$08,$01,$08,$05,$0a,$01,$0a,$06,$0a,$03,$0a,$07,$0c,$05,$0c
	dc.b $08,$0c,$05,$0c,$09,$0c,$05,$0c,$0a,$0c,$05,$0c,$0b,$0c,$05,$0c
	dc.b $0c,$0c,$05,$0c,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b $10,$10,$10,$10,$11,$11,$11,$11,$12,$12,$12,$12,$13,$13,$13,$13
	dc.b $14,$14,$14,$14,$15,$15,$15,$15,$16,$16,$16,$16,$17,$17,$17,$17
	dc.b $18,$18,$18,$18,$19,$19,$19,$19,$1a,$1a,$1a,$1a,$1b,$1b,$1b,$1b
	dc.b $1c,$1c,$1c,$1c,$1d,$1d,$1d,$1d,$1e,$1e,$1e,$1e,$1f,$1f,$1f,$1f
	dc.b $20,$20,$20,$20,$21,$21,$21,$21,$22,$22,$22,$22,$23,$23,$23,$23
	dc.b $24,$24,$24,$24,$25,$25,$25,$25,$26,$26,$26,$26,$27,$27,$27,$27
	dc.b $28,$28,$28,$28,$29,$29,$29,$29,$2a,$2a,$2a,$2a,$2b,$2b,$2b,$2b
	dc.b $2c,$2c,$2c,$2c,$2d,$2d,$2d,$2d,$2e,$2e,$2e,$2e,$2f,$2f,$2f,$2f
	dc.b $30,$30,$30,$30,$31,$31,$31,$31,$32,$32,$32,$32,$33,$33,$33,$33
	dc.b $34,$34,$34,$34,$35,$35,$35,$35,$36,$36,$36,$36,$37,$37,$37,$37
	dc.b $38,$38,$38,$38,$39,$39,$39,$39,$3a,$3a,$3a,$3a,$3b,$3b,$3b,$3b
	dc.b $3c,$3c,$3c,$3c,$3d,$3d,$3d,$3d,$3e,$3e,$3e,$3e,$3f,$3f,$3f,$3f
	dc.b $40,$40,$40,$40,$41,$41,$41,$41,$42,$42,$42,$42,$43,$43,$43,$43
	dc.b $44,$44,$44,$44,$45,$45,$45,$45,$46,$46,$46,$46,$47,$47,$47,$47
	dc.b $48,$48,$48,$48,$49,$49,$49,$49,$4a,$4a,$4a,$4a,$4b,$4b,$4b,$4b
	dc.b $4c,$4c,$4c,$4c,$4d,$4d,$4d,$4d,$4e,$4e,$4e,$4e,$4f,$4f,$4f,$4f

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02c4dc:
	dc.b $00,$0f,$01,$0f,$02,$0f,$03,$0f,$04,$0f,$05,$0f,$06,$0f,$07,$0f
	dc.b $08,$0f,$09,$0f,$0a,$0f,$0b,$0f,$0c,$0f,$0d,$0f,$0e,$0f,$0f,$0f
	dc.b $10,$0f,$11,$0f,$12,$0f,$13,$0f,$14,$50,$15,$0f,$16,$0f,$17,$51
	dc.b $18,$0f,$19,$0f,$1a,$0f,$1b,$0f,$1c,$0f,$1d,$0f,$1e,$0f,$1f,$52
	dc.b $20,$0f,$21,$0f,$22,$0f,$23,$53,$24,$0f,$25,$0f,$26,$0f,$27,$0f
	dc.b $28,$0f,$29,$0f,$2a,$54,$2b,$0f,$2c,$0f,$2d,$55,$2e,$0f,$2f,$0f
	dc.b $30,$0f,$31,$0f,$32,$0f,$33,$56,$34,$0f,$35,$57,$36,$58,$37,$0f
	dc.b $38,$0f,$39,$0f,$3a,$0f,$3b,$0f,$3c,$0f,$3d,$0f,$3e,$0f,$3f,$0f
	dc.b $40,$0f,$41,$0f,$42,$0f,$43,$0f,$44,$0f,$45,$0f,$46,$0f,$47,$0f
	dc.b $48,$0f,$49,$0f,$4a,$0f,$4b,$0f,$4c,$0f,$4d,$0f,$4e,$0f,$4f,$0f

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02c57c:
	dc.w $0004,$0000,$0000,$0000,$0005,$4000,$ffff,$ac00
	dc.w $0006,$0000,$0000,$0000,$0004,$0000,$ffff,$ac00
	dc.w $0006,$0000,$ffff,$fd00,$0004,$0000,$ffff,$b800
	dc.w $0005,$0000,$0000,$0000,$0004,$a000,$ffff,$ac00
	dc.w $0005,$0000,$ffff,$fd00,$0004,$a000,$ffff,$b800
	dc.w $0004,$0000,$0000,$0000,$0005,$4000,$ffff,$ac00
	dc.w $0004,$0000,$ffff,$fe00,$0005,$4000,$ffff,$b800
	dc.w $0003,$0000,$0000,$0000,$0005,$e000,$ffff,$ac00
	dc.w $0003,$0000,$ffff,$fe00,$0005,$e000,$ffff,$b800
	dc.w $0002,$0000,$0000,$0000,$0006,$6000,$ffff,$ac00
	dc.w $0002,$0000,$ffff,$ff00,$0006,$6000,$ffff,$b800
	dc.w $0001,$0000,$0000,$0000,$0007,$0000,$ffff,$ac00
	dc.w $0001,$0000,$ffff,$ff00,$0007,$0000,$ffff,$b800
	dc.w $0004,$0000,$0000,$0000,$0005,$4000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$4000,$ffff,$b800
	dc.w $0002,$8000,$0000,$0000,$0002,$8000,$ffff,$b800
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$a800
	dc.w $0001,$0000,$0000,$0000,$0006,$8000,$ffff,$a800
	dc.w $0004,$0000,$0000,$0000,$0006,$8000,$ffff,$a800
	dc.w $0001,$0000,$0000,$0000,$0001,$0000,$ffff,$f800
	dc.w $0007,$0000,$0000,$0000,$0001,$0000,$ffff,$a000
	dc.w $0002,$0000,$0000,$8000,$0000,$1000,$ffff,$3800
	dc.w $0002,$8000,$0000,$0000,$0007,$0000,$ffff,$a800
	dc.w $0001,$0000,$0000,$0000,$0005,$c000,$ffff,$9e00
	dc.w $0002,$8000,$0000,$0000,$0002,$4000,$ffff,$ac00
	dc.w $0007,$0000,$0000,$0000,$0005,$c000,$ffff,$a800
	dc.w $0002,$0000,$0000,$0000,$0008,$0000,$ffff,$a800
	dc.w $000a,$0000,$0000,$0000,$0003,$0000,$ffff,$a800
	dc.w $0004,$0000,$0000,$0000,$0003,$0000,$ffff,$a800
	dc.w $0002,$0000,$0000,$0000,$0009,$0000,$ffff,$a000
	dc.w $0005,$0000,$0000,$0000,$fffe,$0000,$ffff,$8000
	dc.w $000c,$0000,$0000,$0000,$fffd,$0000,$ffff,$8000
	dc.w $0000,$0000,$0000,$0000,$0005,$0000,$ffff,$a800
	dc.w $0002,$0000,$0000,$0000,$0007,$0000,$ffff,$a800
	dc.w $0001,$4000,$0000,$0000,$0004,$8000,$ffff,$a800
	dc.w $000e,$0000,$0000,$0000,$fffa,$0000,$ffff,$8800
	dc.w $0002,$0000,$0000,$0000,$0005,$0000,$ffff,$d000
	dc.w $0001,$8000,$0000,$0000,$0005,$c000,$ffff,$a800
	dc.w $0003,$0000,$0000,$0000,$0007,$4000,$ffff,$a800
	dc.w $0001,$0000,$0000,$0000,$0003,$8000,$ffff,$a800
	dc.w $0008,$0000,$0000,$0000,$0004,$0000,$ffff,$a800
	dc.w $000e,$0000,$0000,$0000,$0002,$0000,$ffff,$a800
	dc.w $000a,$0000,$0000,$0000,$fffc,$0000,$ffff,$8000
	dc.w $0008,$0000,$0000,$0000,$0003,$0000,$ffff,$a800
	dc.w $0003,$0000,$0000,$0000,$0002,$0000,$ffff,$a800
	dc.w $0006,$0000,$0000,$0000,$0002,$0000,$ffff,$a800
	dc.w $0000,$0000,$0000,$0000,$fffd,$0000,$ffff,$9800
	dc.w $0002,$0000,$0000,$8000,$0000,$1000,$ffff,$5800
	dc.w $0004,$0000,$0000,$0000,$0006,$c000,$ffff,$9800
	dc.w $0004,$2000,$0000,$0000,$0007,$0000,$ffff,$9800
	dc.w $0004,$4000,$0000,$0000,$0007,$4000,$ffff,$9800
	dc.w $fffb,$c000,$0000,$0000,$0006,$c000,$ffff,$9800
	dc.w $0002,$0000,$0000,$a000,$0000,$1000,$ffff,$a800
	dc.w $0002,$0000,$0000,$8000,$0000,$1000,$ffff,$3800
	dc.w $0002,$0000,$0000,$0000,$0008,$8000,$ffff,$a800
	dc.w $0001,$0000,$0000,$0000,$0000,$8000,$ffff,$f800
	dc.w $0004,$0000,$0000,$0000,$0008,$0000,$ffff,$a800
	dc.w $0002,$4000,$0000,$0000,$0004,$8000,$ffff,$a800
	dc.w $0002,$0000,$0000,$0000,$0008,$8000,$ffff,$d000
	dc.w $0005,$0000,$0000,$0000,$fffc,$0000,$ffff,$8000
	dc.w $0003,$0000,$0000,$0000,$0005,$e000,$ffff,$b800
	dc.w $0008,$0000,$0000,$0000,$0002,$0000,$ffff,$a800
	dc.w $0002,$8000,$0000,$0000,$0002,$8000,$ffff,$ac00
	dc.w $0001,$0000,$0000,$0000,$0004,$0000,$ffff,$ac00
	dc.w $0006,$0000,$0000,$0000,$fffc,$0000,$ffff,$ac00
	dc.w $0001,$0000,$0000,$0000,$0004,$0000,$ffff,$a800
	dc.w $0000,$4000,$0000,$0000,$000b,$8000,$ffff,$8000
	dc.w $0008,$0000,$0000,$0000,$0005,$0000,$ffff,$a800
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$b800
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$b800
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$b800
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$b800
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$b800
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$b800
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$b800
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$b800
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$b800
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$b800
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$b800
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$b800
	dc.w $0005,$8000,$0000,$0000,$0001,$8000,$ffff,$b800
	dc.w $0001,$0000,$0000,$0000,$0001,$0000,$ffff,$b800
	dc.w $0008,$0000,$0000,$0000,$0002,$8000,$ffff,$8000
	dc.w $0006,$0000,$0000,$0000,$0002,$8000,$ffff,$b800
	dc.w $0004,$0000,$0000,$0000,$0005,$0000,$ffff,$8000
	dc.w $0003,$8000,$0000,$0000,$0001,$8000,$ffff,$b800
	dc.w $fffd,$8000,$0000,$0000,$0002,$8000,$ffff,$b800
	dc.w $0001,$8000,$0000,$0000,$0007,$c000,$ffff,$ac00
	dc.w $0002,$8000,$0000,$0000,$0002,$c000,$ffff,$b800
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$ac00
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$ac00
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$ac00
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$ac00
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$ac00
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$ac00
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$ac00
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$ac00
	dc.w $0003,$0000,$0000,$0000,$0006,$0000,$ffff,$ac00
	dc.w $0003,$0000,$0000,$0000,$0007,$0000,$ffff,$ac00
	dc.w $0001,$0000,$0000,$0000,$0007,$0000,$ffff,$ac00
	dc.w $0000,$4000,$0000,$0000,$0007,$0000,$ffff,$ac00
	dc.w $0000,$4000,$0000,$0000,$0008,$0000,$ffff,$ac00
	dc.w $0000,$4000,$0000,$0000,$0009,$0000,$ffff,$ac00
	dc.w $0000,$6000,$0000,$0000,$0007,$0000,$ffff,$ac00
	dc.w $0000,$6000,$0000,$0000,$0008,$0000,$ffff,$ac00
	dc.w $0000,$6000,$0000,$0000,$0009,$0000,$ffff,$ac00
	dc.w $0000,$8000,$0000,$0000,$0006,$0000,$ffff,$ac00
	dc.w $0000,$8000,$0000,$0000,$0007,$0000,$ffff,$ac00
	dc.w $0000,$8000,$0000,$0000,$0008,$0000,$ffff,$ac00
	dc.w $0000,$8000,$0000,$0000,$0009,$0000,$ffff,$ac00
	dc.w $0000,$6000,$0000,$0000,$0007,$0000,$ffff,$ac00
	dc.w $0003,$0000,$0000,$0000,$0005,$0000,$ffff,$ac00
	dc.w $0005,$0000,$0000,$0000,$0006,$0000,$ffff,$ac00
	dc.w $0002,$0000,$0000,$0000,$0007,$0000,$ffff,$ac00
	dc.w $0001,$4000,$0000,$0000,$0004,$8000,$ffff,$ac00
	dc.w $000e,$0000,$0000,$0000,$fffa,$0000,$ffff,$ac00
	dc.w $0002,$0000,$0000,$0000,$0005,$0000,$ffff,$ac00
	dc.w $0001,$8000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0003,$0000,$0000,$0000,$0007,$4000,$ffff,$ac00
	dc.w $0001,$0000,$0000,$0000,$0003,$8000,$ffff,$ac00
	dc.w $0008,$0000,$0000,$0000,$0004,$0000,$ffff,$ac00
	dc.w $000e,$0000,$0000,$0000,$0002,$0000,$ffff,$ac00
	dc.w $000a,$0000,$0000,$0000,$fffc,$0000,$ffff,$ac00
	dc.w $0008,$0000,$0000,$0000,$0003,$0000,$ffff,$ac00
	dc.w $0003,$0000,$0000,$0000,$0002,$0000,$ffff,$ac00
	dc.w $0006,$0000,$0000,$0000,$0002,$0000,$ffff,$ac00
	dc.w $0000,$0000,$0000,$0000,$fffe,$0000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0001,$0000,$0000,$0000,$0003,$0000,$ffff,$ac00
	dc.w $0001,$8000,$0000,$0000,$0004,$0000,$ffff,$ac00
	dc.w $0002,$0000,$0000,$0000,$0005,$0000,$ffff,$ac00
	dc.w $0001,$0000,$0000,$0000,$0005,$0000,$ffff,$ac00
	dc.w $0000,$4000,$0000,$0000,$0005,$0000,$ffff,$ac00
	dc.w $0000,$4000,$0000,$0000,$0006,$0000,$ffff,$ac00
	dc.w $0000,$4000,$0000,$0000,$0007,$0000,$ffff,$ac00
	dc.w $0000,$6000,$0000,$0000,$0005,$0000,$ffff,$ac00
	dc.w $0000,$6000,$0000,$0000,$0006,$0000,$ffff,$ac00
	dc.w $0000,$6000,$0000,$0000,$0007,$0000,$ffff,$ac00
	dc.w $0000,$8000,$0000,$0000,$0006,$0000,$ffff,$ac00
	dc.w $0000,$8000,$0000,$0000,$0006,$8000,$ffff,$ac00
	dc.w $0000,$8000,$0000,$0000,$0007,$0000,$ffff,$ac00
	dc.w $0000,$8000,$0000,$0000,$0006,$0000,$ffff,$ac00
	dc.w $0000,$6000,$0000,$0000,$0003,$0000,$ffff,$ac00
	dc.w $0000,$8000,$0000,$0000,$0002,$0000,$ffff,$ac00
	dc.w $0002,$8000,$0000,$0000,$0003,$0000,$ffff,$ac00
	dc.w $0002,$0000,$0000,$0000,$0007,$0000,$ffff,$ac00
	dc.w $0001,$4000,$0000,$0000,$0004,$8000,$ffff,$ac00
	dc.w $000e,$0000,$0000,$0000,$fffa,$0000,$ffff,$9c00
	dc.w $0002,$0000,$0000,$0000,$0005,$0000,$ffff,$d000
	dc.w $0001,$8000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0003,$0000,$0000,$0000,$0007,$4000,$ffff,$ac00
	dc.w $0001,$0000,$0000,$0000,$0003,$8000,$ffff,$ac00
	dc.w $0008,$0000,$0000,$0000,$0004,$0000,$ffff,$ac00
	dc.w $000e,$0000,$0000,$0000,$0002,$0000,$ffff,$ac00
	dc.w $000a,$0000,$0000,$0000,$fffc,$0000,$ffff,$8000
	dc.w $0008,$0000,$0000,$0000,$0003,$0000,$ffff,$ac00
	dc.w $0003,$0000,$0000,$0000,$0002,$0000,$ffff,$ac00
	dc.w $0006,$0000,$0000,$0000,$0002,$0000,$ffff,$ac00
	dc.w $0000,$0000,$0000,$0000,$fffe,$0000,$ffff,$9800
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00
	dc.w $0004,$0000,$0000,$0000,$0005,$c000,$ffff,$ac00

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02d0bc:
	dc.b $06,$07,$08,$07,$06,$07,$06,$08

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02d0c4:
	dc.b $09,$0a,$09,$0a,$09,$0a,$09,$0a

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02d0cc:
	dc.b $00,$00,$01,$01,$02,$02,$03,$03
	dc.b $04,$04,$05,$05,$06,$06,$07,$07
	dc.b $08,$08,$09,$09,$0a,$0a,$0b,$0b
	dc.b $0c,$00,$02,$00,$02,$01,$0d,$02
	dc.b $00,$0e,$0f,$0f,$10,$10,$11,$11
	dc.b $12,$12,$13,$13,$14,$14,$15,$15
	dc.b $16,$16,$17,$17,$18,$18

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02d102:
	dc.w loc_02d134-loc_02d102
	dc.w loc_02d140-loc_02d102
	dc.w loc_02d152-loc_02d102
	dc.w loc_02d168-loc_02d102
	dc.w loc_02d17e-loc_02d102
	dc.w loc_02d194-loc_02d102
	dc.w loc_02d1be-loc_02d102
	dc.w loc_02d1e0-loc_02d102

	dc.w loc_02d212-loc_02d102
	dc.w loc_02d228-loc_02d102
	dc.w loc_02d268-loc_02d102
	dc.w loc_02d27e-loc_02d102
	dc.w loc_02d296-loc_02d102
	dc.w loc_02d2ac-loc_02d102
	dc.w loc_02d2c6-loc_02d102
	dc.w loc_02d2d0-loc_02d102

	dc.w loc_02d2e2-loc_02d102
	dc.w loc_02d2f8-loc_02d102
	dc.w loc_02d310-loc_02d102
	dc.w loc_02d32a-loc_02d102
	dc.w loc_02d348-loc_02d102
	dc.w loc_02d368-loc_02d102
	dc.w loc_02d38a-loc_02d102
	dc.w loc_02d3b0-loc_02d102

	dc.w loc_02d3d8-loc_02d102

;----------------------------------------------
loc_02d134:
	dc.w $0605,$0404,$0302,$0201
	dc.w $0101,$01ff

;----------------------------------------------
loc_02d140:
	dc.w $0606,$0605,$0505,$0404
	dc.w $0303,$0201,$0101,$0101
	dc.w $ffff

;----------------------------------------------
loc_02d152:
	dc.w $0808,$0807,$0707,$0605
	dc.w $0504,$0302,$0101,$0101
	dc.w $0101,$0101,$ffff

;----------------------------------------------
loc_02d168:
	dc.w $0404,$0404,$0303,$0302
	dc.w $0101,$0100,$0000,$0000
	dc.w $0000,$0000,$ffff

;----------------------------------------------
loc_02d17e:
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000
	dc.w $0000,$0000,$ffff

;----------------------------------------------
loc_02d194:
	dc.w $0808,$0807,$0707,$0605,$0504,$0302,$0101,$0101
	dc.w $0101,$0101,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$ffff

;----------------------------------------------
loc_02d1be:
	dc.w $0404,$0404,$0303,$0302,$0101,$0100,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $ffff

;----------------------------------------------
loc_02d1e0:
	dc.w $0404,$0404,$0303,$0302,$0101,$0100,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $ffff

;----------------------------------------------
loc_02d212:
	dc.w $100f,$0e0d,$0c0b,$0a09,$0807,$0605,$0403,$0202
	dc.w $0101,$0101,$ffff

;----------------------------------------------
loc_02d228:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$00ff

;----------------------------------------------
loc_02d268:
	dc.w $0303,$0303,$0202,$0201,$0100,$0000,$0000,$0000
	dc.w $0000,$0000,$ffff

;----------------------------------------------
loc_02d27e:
	dc.w $0808,$0807,$0707,$0605,$0504,$0302,$0101,$0101
	dc.w $0101,$0101,$0000,$ffff

;----------------------------------------------
loc_02d296:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$ffff

;----------------------------------------------
loc_02d2ac:
	dc.w $0808,$0807,$0707,$0605,$0504,$0302,$0101,$0101
	dc.w $0101,$0101,$0000,$0000,$ffff

;----------------------------------------------
loc_02d2c6:
	dc.w $0605,$0404,$0303,$0302,$ffff

;----------------------------------------------
loc_02d2d0:
	dc.w $0404,$0404,$0303,$0303,$0202,$0202,$0101,$0101
	dc.w $00ff

;----------------------------------------------
loc_02d2e2:
	dc.w $0404,$0404,$0303,$0303,$0202,$0202,$0101,$0101
	dc.w $0000,$0000,$ffff

;----------------------------------------------
loc_02d2f8:
	dc.w $0404,$0404,$0404,$0404,$0303,$0303,$0202,$0202
	dc.w $0101,$0101,$0000,$00ff

;----------------------------------------------
loc_02d310:
	dc.w $0404,$0404,$0404,$0404,$0404,$0404,$0303,$0303
	dc.w $0202,$0202,$0101,$0101,$00ff

;----------------------------------------------
loc_02d32a:
	dc.w $0404,$0404,$0404,$0404,$0404,$0404,$0303,$0303
	dc.w $0202,$0202,$0101,$0101,$0000,$0000,$ffff

;----------------------------------------------
loc_02d348:
	dc.w $0404,$0404,$0404,$0404,$0404,$0404,$0404,$0404
	dc.w $0303,$0303,$0202,$0202,$0101,$0101,$0000,$00ff

;----------------------------------------------
loc_02d368:
	dc.w $0404,$0404,$0404,$0404,$0404,$0404,$0404,$0404
	dc.w $0404,$0404,$0303,$0303,$0202,$0202,$0101,$0101
	dc.w $00ff

;----------------------------------------------
loc_02d38a:
	dc.w $0404,$0404,$0404,$0404,$0404,$0404,$0404,$0404
	dc.w $0404,$0404,$0303,$0303,$0202,$0202,$0101,$0101
	dc.w $0000,$0000,$ffff

;----------------------------------------------
loc_02d3b0:
	dc.w $0404,$0404,$0404,$0404,$0404,$0404,$0404,$0404
	dc.w $0404,$0404,$0404,$0404,$0303,$0303,$0202,$0202
	dc.w $0101,$0101,$0000,$00ff

;----------------------------------------------
loc_02d3d8:
	dc.w $0404,$0404,$0404,$0404,$0404,$0404,$0404,$0404
	dc.w $0404,$0404,$0404,$0404,$0404,$0404,$0303,$0303
	dc.w $0202,$0202,$0101,$0101,$00ff

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02d402:;185346
	dc.w loc_02d434-loc_02d402
	dc.w loc_02d446-loc_02d402
	dc.w loc_02d45c-loc_02d402
	dc.w loc_02d472-loc_02d402
	dc.w loc_02d488-loc_02d402
	dc.w loc_02d49e-loc_02d402
	dc.w loc_02d4c8-loc_02d402
	dc.w loc_02d4ea-loc_02d402

	dc.w loc_02d51c-loc_02d402
	dc.w loc_02d532-loc_02d402
	dc.w loc_02d572-loc_02d402
	dc.w loc_02d588-loc_02d402
	dc.w loc_02d5a0-loc_02d402
	dc.w loc_02d2ac-loc_02d402;-342
	dc.w loc_02d134-loc_02d402;-718
	dc.w loc_02d2d0-loc_02d402;-306

	dc.w loc_02d2e2-loc_02d402;-288
	dc.w loc_02d2f8-loc_02d402;-266
	dc.w loc_02d310-loc_02d402;-242
	dc.w loc_02d32a-loc_02d402;-216
	dc.w loc_02d348-loc_02d402;-186
	dc.w loc_02d368-loc_02d402;-154
	dc.w loc_02d38a-loc_02d402;-120
	dc.w loc_02d3b0-loc_02d402;-82

	dc.w loc_02d3d8-loc_02d402;-42

;----------------------------------------------
loc_02d434:
	dc.w $0605,$0404,$0302,$0201,$0101,$0100,$0000,$0000
	dc.w $ffff

;----------------------------------------------
loc_02d446:
	dc.w $0606,$0605,$0505,$0404,$0303,$0201,$0101,$0101
	dc.w $0000,$0000,$ffff

;----------------------------------------------
loc_02d45c:
	dc.w $0808,$0807,$0707,$0605,$0504,$0302,$0101,$0101
	dc.w $0101,$0101,$ffff

;----------------------------------------------
loc_02d472:
	dc.w $0404,$0404,$0303,$0302,$0101,$0100,$0000,$0000
	dc.w $0000,$0000,$ffff

;----------------------------------------------
loc_02d488:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$ffff

;----------------------------------------------
loc_02d49e:
	dc.w $0808,$0807,$0707,$0605,$0504,$0302,$0101,$0101
	dc.w $0101,$0101,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$ffff

;----------------------------------------------
loc_02d4c8:
	dc.w $0404,$0404,$0303,$0302,$0101,$0100,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $ffff

;----------------------------------------------
loc_02d4ea:
	dc.w $0404,$0404,$0303,$0302,$0101,$0100,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $ffff

;----------------------------------------------
loc_02d51c:
	dc.w $100f,$0e0d,$0c0b,$0a09,$0807,$0605,$0403,$0202
	dc.w $0101,$0101,$ffff

;----------------------------------------------
loc_02d532:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$00ff

;----------------------------------------------
loc_02d572:
	dc.w $0303,$0303,$0202,$0201,$0100,$0000,$0000,$0000
	dc.w $0000,$0000,$ffff

;----------------------------------------------
loc_02d588:
	dc.w $0808,$0807,$0707,$0605,$0504,$0302,$0101,$0101
	dc.w $0101,$0101,$0000,$ffff

;----------------------------------------------
loc_02d5a0:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
	dc.w $ffff

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02d5b2:
	dc.w $0102,$0301,$0203,$0405,$0607,$0809,$1813,$1713
	dc.w $0306,$2203,$0613,$0306,$1313,$2123,$1d20,$2e21
	dc.w $1b2f,$0101,$0101,$0101,$0101,$0101,$0101,$0101

;==============================================
;Specal Move Commands
;==============================================
	include "char/Specialmoves.asm"

;==============================================
loc_02e322:
	lea.l (-$4fd8,a5),a0
	tst.b ($101,a6)
	beq.b loc_02e330
	lea.l (-$4dd8,a5),a0

loc_02e330:
	move.w #2,(a0)
	rts

;==============================================
loc_02e336:
	lea.l (-$4fd8,a5),a0
	tst.b $101(a6)
	beq.b loc_02e344
	lea.l (-$4dd8,a5),a0

loc_02e344:
	move.w (a0),d0
	move.w ($37c,a6),(a0,d0.w)
	addq.w #2,d0
	andi.w #$1fe,d0
	bne.b loc_02e356
	moveq #2,d0

loc_02e356:
	move.w d0,(a0)
	rts

;==============================================
loc_02e35a:
	movea.w ($38,a6),a4
	move.b #5,($23f,a4)
	rts

;==============================================
loc_02e366:
	tst.b ($3e,a6)
	beq.w loc_02e52a
	tst.b ($b9,a6)
	bne.b loc_02e37c
	tst.b ($10e,a5)
	bne.w loc_02e52a

loc_02e37c:
	movea.w ($38,a6),a1
	tst.w ($50,a1)
	bmi.w loc_02e52a
	tst.b ($25d,a1)
	bne.w loc_02e52a
	move.l ($c8,a1),d1
	andi.l #$ffffff00,d1
	beq.w loc_02e52a
	tst.b ($31,a1)
	bne.w loc_02e52a
	tst.b ($67,a1)
	bne.w loc_02e52a
	andi.w #$ff,d0
	lsl.w #5,d0
	movea.l ($a0,a6),a3
	lea.l (a3,d0.w),a3
	movea.l ($9c,a1),a2
	move.b ($cb,a1),d2
	beq.w loc_02e52a
	andi.w #$ff,d2
	lsl.w #3,d2
	lea.l (a2,d2.w),a2
	jsr loc_024936
	bhi.w loc_02e52a
	bra.w loc_02e4b6

;==============================================
loc_02e3e0:
	move.b d0,($32f,a6)
	movea.w ($38,a6),a1
	movea.l ($1c,a1),a0
	tst.b ($d,a0)
	bne.w loc_02e52a
	tst.b ($25d,a1)
	bne.w loc_02e52a
	bra.b loc_02e462

;==============================================
loc_02e3fe:
	move.b d0,($32f,a6)
	tst.b ($3e,a6)
	beq.w loc_02e422
	cmpi.w #$200,(4,a6)
	bne.w loc_02e52a
	cmpi.b #$e,(6,a6)
	bne.w loc_02e52a
	bra.w loc_02e366

;==============================================
loc_02e422:
	movea.w ($38,a6),a1
	tst.b ($23f,a1)
	bne.w loc_02e52a
	tst.b ($25d,a1)
	bne.w loc_02e52a
	cmpi.w #$204,(4,a1)
	beq.b loc_02e462
	cmpi.w #$200,(4,a1)
	beq.b loc_02e462
	tst.b ($24e,a1)
	bne.w loc_02e462
	cmpi.w #$202,(4,a1)
	bne.w loc_02e52a
	cmpi.b #$c,($54,a1)
	bne.w loc_02e52a

loc_02e462:
	tst.b ($10e,a5)
	bne.w loc_02e52a
	tst.b ($31,a1)
	bne.w loc_02e52a
	tst.b ($67,a1)
	bne.w loc_02e52a
	move.l ($c8,a1),d1
	andi.l #$ffffff00,d1
	beq.w loc_02e52a
	andi.w #$ff,d0
	lsl.w #5,d0
	movea.l ($a0,a6),a3
	lea.l (a3,d0.w),a3
	movea.l ($9c,a1),a2
	move.b ($cb,a1),d2
	beq.w loc_02e52a
	andi.w #$ff,d2
	lsl.w #3,d2
	lea.l (a2,d2.w),a2
	jsr loc_024936
	bhi.w loc_02e52a

loc_02e4b6:
	tst.b ($f,a3)
	bmi.b loc_02e4c2
	jsr loc_003608

loc_02e4c2:
	move.l #$2060000,(4,a1)
	move.b #$ff,($67,a1)
	move.b #1,($67,a6)
	move.b #1,($2ca,a1)
	move.b #4,($3a,a1)
	move.b #1,($263,a1)
	move.b #1,($23b,a1)
	move.w a6,($38,a1)
	jsr loc_02065c
	tst.b ($b9,a6)
	beq.b loc_02e504
	move.b #1,($3e,a6)

loc_02e504:
	moveq #0,d0
	move.b d0,($a9,a6)
	move.b d0,($a9,a1)
	move.b d0,($216,a6)
	move.b d0,($216,a1)
	move.b d0,($284,a6)
	move.b d0,($285,a6)
	move.b d0,($28f,a6)
	move.b d0,($294,a1)
	moveq #1,d0
	rts

;----------------------------------------------
loc_02e52a:
	moveq #0,d0
	rts

;----------------------------------------------
loc_02e52e:
	movea.w ($38,a6),a1
	bra.b loc_02e4c2

;----------------------------------------------
loc_02e534:
	movea.w ($38,a6),a1
	tst.b ($23f,a1)
	bne.b loc_02e52a
	tst.b ($25d,a1)
	bne.b loc_02e52a
	cmpi.w #$204,(4,a1)
	beq.b loc_02e56e
	cmpi.w #$200,(4,a1)
	beq.w loc_02e56e
	tst.b ($24e,a1)
	bne.w loc_02e56e
	cmpi.w #$202,(4,a1)
	bne.b loc_02e52a
	cmpi.b #$c,($54,a1)
	bne.b loc_02e52a

loc_02e56e:
	tst.b ($10e,a5)
	bne.b loc_02e52a
	tst.b ($31,a1)
	bne.b loc_02e52a
	tst.b ($67,a1)
	bne.b loc_02e52a
	move.l ($c8,a1),d1
	andi.l #$ffffff00,d1
	beq.b loc_02e52a
	andi.w #$ff,d0
	lsl.w #5,d0
	movea.l ($a0,a6),a3
	lea.l (a3,d0.w),a3
	movea.l ($9c,a1),a2
	move.b ($cb,a1),d2
	andi.w #$ff,d2
	lsl.w #3,d2
	lea.l (a2,d2.w),a2
	jsr loc_0248de
	bhi.w loc_02e52a
	movea.l ($1c,a1),a0
	move.b ($d,a0),d0
	beq.b loc_02e5d0
	cmpi.b #4,d0
	bcc.b loc_02e5d0
	tst.b ($2c8,a1)
	beq.b loc_02e5d0
	moveq #-1,d0
	rts

loc_02e5d0:
	bra.w loc_02e4b6

loc_02e5d4:
	move.b d0,($32f,a6)
	movea.w ($38,a6),a1
	tst.b ($25d,a1)
	bne.w loc_02e52a
	tst.b ($2ce,a1)
	bne.w loc_02e52a
	bra.w loc_02e6a8

loc_02e5f0:
	move.b d0,($32f,a6)
	movea.w ($38,a6),a1
	tst.b ($31,a1)
	beq.w loc_02e52a
	tst.b ($25d,a1)
	bne.w loc_02e52a
	tst.b ($2ce,a1)
	bne.w loc_02e52a
	bra.w loc_02e6b6

loc_02e614:
	move.b d0,($32f,a6)
	movea.w ($38,a6),a1
	tst.b ($31,a1)
	beq.w loc_02e52a
	tst.b ($25d,a1)
	bne.w loc_02e52a
	tst.b ($2ce,a1)
	bne.w loc_02e52a
	bra.b loc_02e6a8

loc_02e636:
	move.b d0,($32f,a6)
	movea.w ($38,a6),a1
	tst.b ($31,a1)
	beq.w loc_02e52a

loc_02e646:
	tst.b ($3e,a6)
	beq.w loc_02e66e
	tst.b ($24e,a1)
	bne.w loc_02e66e
	cmpi.w #$200,(4,a6)
	bne.w loc_02e52a
	cmpi.b #$e,(6,a6)
	bne.w loc_02e52a
	bra.w loc_02e366

loc_02e66e:
	tst.b ($25d,a1)
	bne.w loc_02e52a
	tst.b ($d6,a1)
	bne.w loc_02e52a
	tst.b ($23f,a1)
	bne.w loc_02e52a
	tst.b ($2ce,a1)
	bne.w loc_02e52a
	cmpi.w #$204,(4,a1)
	beq.b loc_02e6a8
	cmpi.w #$202,(4,a1)
	beq.b loc_02e6a8
	cmpi.w #$200,(4,a1)
	bne.w loc_02e52a

loc_02e6a8:
	move.l ($c8,a1),d1
	andi.l #$ffffff00,d1
	beq.w loc_02e52a

loc_02e6b6:
	tst.b ($67,a1)
	bne.w loc_02e52a
	andi.w #$ff,d0
	lsl.w #5,d0
	movea.l ($a0,a6),a3
	lea.l (a3,d0.w),a3
	movea.l ($9c,a1),a2
	move.b ($cb,a1),d2
	andi.w #$ff,d2
	lsl.w #3,d2
	lea.l (a2,d2.w),a2
	jsr loc_024936
	bhi.w loc_02e52a
	bra.w loc_02e4b6

loc_02e6ec:
	move.b d0,($32f,a6)
	movea.w ($38,a6),a1
	tst.b ($2c8,a1)
	bne.w loc_02e52a
	bra.w loc_02e646

loc_02e700:
	move.b d0,($32f,a6)
	movea.w ($38,a6),a1
	tst.b ($31,a1)
	bne.w loc_02e52a
	bra.w loc_02e646

loc_02e714:
	move.b d0,($32f,a6)
	movea.w ($38,a6),a1
	bra.w loc_02e646

loc_02e720:
	andi.w #$ff,d0
	lsl.w #5,d0
	movea.l ($a0,a6),a3
	lea.l (a3,d0.w),a3
	clr.b ($1af,a5)
	movea.w ($38,a6),a1
	move.w a6,(-$5cd2,a5)
	move.w a1,(-$5cd0,a5)
	move.l #$2020202,(4,a1)
	move.b #$e,($54,a1)
	move.b #$20,($55,a1)
	move.b #1,($23a,a1)
	clr.b ($31,a1)
	move.b #$1e,($28a,a6)
	move.b #$1e,($28a,a1)
	move.b #$40,($3a,a1)
	st.b ($258,a1)
	move.b #$5a,($24b,a1)
	jsr loc_023ecc
	jsr loc_02469e
	clr.b ($67,a6)
	clr.b ($67,a1)
	clr.b ($263,a1)
	clr.b ($25c,a1)
	move.b ($b,a6),($66,a1)
	moveq #$1b,d0
	moveq #4,d1
	jmp loc_02a838

loc_02e7a4:
	movea.w ($38,a6),a1
	move.l #$2000000,(4,a1)
	tst.b ($2c8,a1)
	beq.b loc_02e7be
	move.l #$2000004,(4,a1)

loc_02e7be:
	clr.b ($67,a1)
	clr.b ($67,a6)
	clr.b ($263,a1)
	rts

;==============================================
loc_02e7cc:
	movea.w ($38,a6),a1
	move.l #$2020200,(4,a1)
	move.b #$c,($54,a1)
	clr.b ($67,a1)
	clr.b ($67,a6)
	clr.b ($263,a1)
	move.w #$64,($3a,a1)
	rts

;==============================================
loc_02e7f2:
	clr.b ($1af,a5)
	movea.w ($38,a6),a1
	move.w a6,(-$5cd2,a5)
	move.w a1,(-$5cd0,a5)
	move.l #$2020000,(4,a1)
	andi.w #$ff,d0
	lsl.w #5,d0
	movea.l ($a0,a6),a3
	lea.l (a3,d0.w),a3
	move.b ($a,a3),($29f,a1)
	move.b (9,a3),($57,a1)
	move.b ($d,a3),($55,a1)
	move.b ($1c,a3),($df,a1)
	andi.b #$fd,($b,a1)
	move.b #1,($23a,a1)
	tst.b ($12,a3)
	beq.b loc_02e848
	move.b #1,($2ca,a1)

loc_02e848:
	jsr loc_023c8e
	jsr loc_023ecc
	jsr loc_02469e
	clr.b ($67,a1)
	clr.b ($67,a6)
	clr.b ($263,a1)
	clr.b ($25c,a1)
	clr.b ($28d,a1)
	move.b #$5a,($24b,a1)
	move.b #$18,($26a,a1)
	move.b ($1b,a3),d1
	add.b d1,($26a,a1)
	move.b ($26a,a1),d1
	lsr.b #2,d1
	move.b d1,($26b,a1)
	jsr loc_023c30
	st.b ($258,a1)
	move.b #$1e,($28a,a6)
	move.b #$1e,($28a,a1)
	tst.w ($50,a1)
	bpl.b loc_02e8ae
	move.b #1,($2ca,a1)

loc_02e8ae:
	tst.b ($2ca,a1)
	bne.b loc_02e8be
	bsr.w loc_02e8d0
	move.b #6,($114,a0)

loc_02e8be:
	rts

;==============================================
loc_02e8c0
	movea.w ($156,a5),a0
	tst.b ($59,a6)
	beq.b loc_02e8ce
	movea.w ($158,a5),a0

loc_02e8ce:
	rts

;==============================================
loc_02e8d0
	movea.w ($156,a5),a0
	tst.b ($59,a6)
	bne.b loc_02e8de
	movea.w ($158,a5),a0

loc_02e8de:
	rts

;==============================================
loc_02e8e0:
	move.w ($138,a5),d0
	move.w loc_02e8ec(pc,d0.w),d0
	jmp loc_02e8ec(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02e8ec:
	dc.w loc_02e8f4-loc_02e8ec
	dc.w loc_02e90a-loc_02e8ec
	dc.w loc_02e924-loc_02e8ec
	dc.w loc_02e93e-loc_02e8ec

;----------------------------------------------
loc_02e8f4:
	lea.l (p1memory,a5),a1
	lea.l (p2memory,a5),a2
	move.b ($5e,a1),($329,a2)
	move.b ($5e,a2),($329,a1)
	rts

;----------------------------------------------
loc_02e90a:
	movea.w ($158,a5),a1
	move.b ($45e,a5),($329,a1)
	movea.w ($156,a5),a2
	move.b ($c5e,a5),d0
	add.b ($105e,a5),d0
	bra.w loc_02e95e

;----------------------------------------------
loc_02e924:
	movea.w ($156,a5),a1
	move.b ($85e,a5),($329,a1)
	movea.w ($158,a5),a2
	move.b ($c5e,a5),d0
	add.b ($105e,a5),d0
	bra.w loc_02e95e

;----------------------------------------------
loc_02e93e:
	movea.w ($156,a5),a1
	movea.w ($158,a5),a2
	btst.b #0,($b9,a5)
	bne.b loc_02e950
	exg.l a1,a2

loc_02e950:
	move.b ($c5e,a5),($329,a1)
	move.b ($45e,a5),d0
	add.b ($85e,a5),d0

loc_02e95e:
	cmpi.b #$63,d0
	bls.b loc_02e966
	moveq #$63,d0

loc_02e966:
	move.b d0,($329,a2)
	rts

;==============================================
loc_02e96c:
	moveq #1,d2
	bra.b loc_02e972

loc_02e970:
	moveq #0,d2

loc_02e972:
	clr.b ($1af,a5)
	andi.w #$ff,d0
	lsl.w #5,d0
	movea.l ($a0,a6),a3
	lea.l (a3,d0.w),a3
	movea.w ($38,a6),a1
	move.w a6,(-$5cd2,a5)
	move.w a1,(-$5cd0,a5)
	tst.b d2
	bne.b loc_02e9a0
	jsr loc_024500
	jsr loc_080b82

loc_02e9a0:
	move.b ($10d,a5),d1
	or.b ($10e,a5),d1
	or.b ($8a,a5),d1
	bne.w loc_02e9da
	clr.w (-$5cca,a5)
	moveq #0,d2
	move.b (8,a3),d2
	beq.b loc_02e9c6
	jsr loc_0240ea
	move.w d2,(-$5cca,a5)

loc_02e9c6:
	jsr loc_0240bc
	jsr loc_02469e
	move.w ($50,a1),d0
	bmi.b loc_02e9e2
	bra.b loc_02e9de

loc_02e9da:
	moveq #1,d0
	rts

loc_02e9de:
	moveq #0,d0
	rts

loc_02e9e2:
	move.w #$ffff,($50,a1)
	move.b #1,($2ca,a1)
	jsr loc_025058
	move.w a6,(-$5cd2,a5)
	move.w a1,(-$5cd0,a5)
	jsr loc_023f5c
	moveq #1,d0
	rts

;==============================================
loc_02ea06:
	tst.b ($125,a6)
	bne.w loc_02ea3a
	move.w ($378,a6),d0
	beq.b loc_02ea38
	move.b #$10,($2ae,a6)
	move.b #1,($2ad,a6)
	tst.b ($378,a6)
	beq.b loc_02ea2c
	jsr loc_02a7ea

loc_02ea2c:
	tst.b ($379,a6)
	beq.b loc_02ea38
	jsr loc_02a7ea

loc_02ea38:
	rts

loc_02ea3a:
	movea.l #loc_0c94da,a1
	jsr loc_030a66
	beq.b loc_02ea5a
	move.b #$10,($2ae,a6)
	move.b #1,($2ad,a6)
	jsr loc_02a7ea

loc_02ea5a:
	movea.l #loc_0c94da,a1
	jsr loc_030a66
	beq.b loc_02ea38
	move.b #$10,($2ae,a6)
	move.b #1,($2ad,a6)
	jmp loc_02a7ea

loc_02ea7a:
	move.b ($10d,a5),d0
	bne.b loc_02eac4
	movea.w ($38,a6),a1
	tst.b ($125,a1)
	bne.b loc_02ead0
	move.w ($378,a1),d0
	beq.b loc_02eabe
	move.b #$10,($2ae,a1)
	move.b #2,($2ad,a1)
	move.b #2,($27b,a1)
	andi.b #$f,d0
	beq.b loc_02eaae
	subq.w #3,($ae,a6)
	bmi.b loc_02eac4

loc_02eaae:
	move.b ($378,a1),d0
	andi.b #$77,d0
	beq.b loc_02eabe

loc_02eab8:
	subq.w #1,($ae,a6)
	bmi.b loc_02eac4

loc_02eabe:
	subq.w #1,($ae,a6)
	bpl.b loc_02eacc

loc_02eac4:
	clr.w ($ae,a6)
	moveq #1,d0
	rts

loc_02eacc:
	moveq #0,d0
	rts

loc_02ead0:
	movea.l #loc_0c945a,a1
	jsr loc_030a66
	beq.b loc_02eabe
	movea.w ($38,a6),a1
	move.b #$10,($2ae,a1)
	move.b #2,($2ad,a1)
	move.b #2,($27b,a1)
	bra.b loc_02eab8

loc_02eaf6:
	move.b ($378,a4),d0
	andi.b #$77,d0
	beq.b loc_02eabe
	addq.w #1,($ae,a6)
	rts

;==============================================
loc_02eb06:
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	bne.b loc_02eb88
	jsr loc_02af7a
	bne.b loc_02eb88
	cmpi.b #$ff,($132,a6)
	bne.b loc_02eb30
	cmpi.b #Gen_id,(PL_charid,a6)
	beq.b loc_02eb88
	cmpi.b #GenStance_id,(PL_charid,a6)
	beq.b loc_02eb88

loc_02eb30:
	tst.b ($5b,a6)
	beq.b loc_02eb88
	move.b ($378,a6),d0
	andi.w #$77,d0
	beq.b loc_02eb88
	bsr.w loc_02eb8c
	jsr loc_02b216
	tst.b ($3e,a6)
	bne.b loc_02eb62
	tst.b ($28e,a6)
	beq.b loc_02eb88
	bsr.w loc_02ec0a
	beq.b loc_02eb88
	bsr.w loc_02ebbe
	beq.b loc_02eb88

loc_02eb62:
	move.b d1,($82,a6)
	move.b d2,($81,a6)
	clr.b ($80,a6)
	btst.b #2,($371,a6)
	beq.b loc_02eb7a
	addq.b #2,($80,a6)

loc_02eb7a:
	jsr loc_02070a
	bsr.w loc_02f770

loc_02eb84:
	moveq #1,d0
	rts

loc_02eb88:
	moveq #0,d0
	rts

;==============================================
loc_02eb8c:
	movea.l #loc_0dc9ea,a0
	move.b (PL_charid,a6),d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	moveq #0,d0
	tst.b ($80,a6)
	beq.b loc_02ebac
	addi.b #$c,d0

loc_02ebac:
	tst.b ($81,a6)
	beq.b loc_02ebb4
	addq.b #6,d0

loc_02ebb4:
	add.b ($82,a6),d0
	lea.l (a0,d0.w),a0
	rts

;==============================================
loc_02ebbe:
	move.b ($371,a6),d0
	andi.w #3,d0
	beq.b loc_02ec02
	movea.l #loc_0dca72,a0
	move.b (PL_charid,a6),d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0
	btst.b #2,($371,a6)
	beq.b loc_02ebe8
	lea.l (2,a0),a0

loc_02ebe8:
	move.w (a0),d3
	moveq #0,d0
	add.b d1,d0
	tst.b d2
	beq.b loc_02ebf4
	addq.b #6,d0

loc_02ebf4:
	btst.b #1,($371,a6)
	bne.b loc_02ebfe
	addq.b #1,d0

loc_02ebfe:
	btst.l d0,d3
	bne.b loc_02ec06

loc_02ec02:
	moveq #1,d0
	rts

loc_02ec06:
	moveq #0,d0
	rts

;==============================================
loc_02ec0a:
	move.w (a0),d0
	moveq #0,d3
	btst.b #2,($371,a6)
	beq.b loc_02ec18
	addq.b #6,d3

loc_02ec18:
	tst.b d2
	beq.b loc_02ec1e
	addq.b #3,d3

loc_02ec1e:
	move.b d1,d4
	lsr.b #1,d4
	add.b d4,d3
	btst.l d3,d0
	rts

;==============================================
;
;==============================================
loc_02ec28:
	move.b ($10d,a5),d0
	or.b ($8a,a5),d0
	bne.b loc_02eca0
	jsr loc_02af7a
	bne.b loc_02eca0
	move.b ($378,a6),d0
	andi.w #$11,d0
	beq.b loc_02eca0
	move.b ($2c9,a6),($b,a6)
	moveq #0,d2
	btst #0,d0
	bne.b loc_02ec54
	moveq #2,d2

loc_02ec54:
	move.b d2,($81,a6)
	clr.b ($80,a6)
	btst.b #2,($371,a6)
	beq.b loc_02ec6a
	move.b #2,($80,a6)

loc_02ec6a:
	bsr.w loc_02f770
	movea.w ($38,a6),a4
	move.b ($270,a4),d0
	beq.b loc_02ec94
	cmpi.b #1,d0
	bne.b loc_02ec84
	move.b #2,($270,a4)

loc_02ec84:
	cmpi.b #3,d0
	bne.b loc_02ec94
	move.b #1,($d6,a4)
	clr.b ($270,a4)

loc_02ec94:
	bsr.w loc_02eca8
	moveq #1,d0
	move.b d0,($247,a6)
	rts

loc_02eca0:
	moveq #0,d0
	move.b d0,($247,a6)
	rts

;==============================================
;CPS1Chain
;==============================================
loc_02eca8:
	cmpi.b #$ff,(PL_ism_choice,a6)
	bne.b loc_02ecca
	tst.b (PL_Attacktype,a6)
	beq.b loc_02ecca
	move.b ($378,a6),d0
	btst #2,d0
	beq.b loc_02ecca

	clr.b (PL_Attacktype,a6)
	move.b #4,(PL_ButtonStrength,a6);HP Attack Write

loc_02ecca:
	rts

;==============================================
;Reversal Check
;==============================================
ReversalCheck:
	tst.b (PL_Reversal_Window,a6)
	bne.w loc_02ed00
	bra.w loc_02edf4



;==============================================
loc_02ecd8:
	moveq #$30,d0
	tst.b (PL_ism_choice,a6)
	beq.b loc_02ecec
	move.w #$90,d0
	tst.b (PL_ism_choice,a6)
	bmi.b loc_02ecec
	moveq #$48,d0

loc_02ecec:
	cmp.w ($11e,a6),d0
	bhi.w loc_02edf4
	tst.b ($b9,a6)
	bne.w loc_02edf4
	moveq #1,d2
	bra.b loc_02ed02

loc_02ed00:
	moveq #0,d2

loc_02ed02:
	moveq #0,d1
	cmpi.l #$2020400,(4,a6)
	beq.w loc_02eda0
	moveq #1,d1
	tst.b ($31,a6)
	bne.w loc_02edf4
	bra.b loc_02ed38

loc_02ed1c:
	moveq #1,d2
	tst.b ($b9,a6)
	bne.w loc_02edf4
	bra.b loc_02ed2a

loc_02ed28:
	moveq #0,d2

loc_02ed2a:
	moveq #1,d1
	cmpi.l #$2000606,(4,a6)
	beq.w loc_02edf4

loc_02ed38:
	cmpi.w #$200,(4,a6)
	bne.w loc_02edf4
	tst.b ($b9,a6)
	beq.b loc_02ed5a
	tst.b ($ce,a6)
	bne.w loc_02edf4
	tst.b ($10d,a5)
	bne.w loc_02edf4
	bra.b loc_02ed64

loc_02ed5a:
	cmpi.b #$e,(6,a6)
	beq.w loc_02edf4

loc_02ed64:
	cmpi.b #$10,(6,a6)
	beq.w loc_02edf4
	cmpi.b #$12,(6,a6)
	beq.w loc_02edf4
	cmpi.b #$a,(6,a6)
	bne.w loc_02ed9a
	tst.w d2
	beq.w loc_02ed8e
	tst.b ($293,a6)
	bne.b loc_02ed9a

loc_02ed8e:
	tst.b ($23e,a6)
	bne.b loc_02ed9a
	tst.b ($3e,a6)
	beq.b loc_02edf4

loc_02ed9a:
	tst.b ($2ce,a6)
	bne.b loc_02edf4

loc_02eda0:
	clr.b ($5d,a6)
	clr.b ($5e,a6)
	jsr loc_02af7a
	bne.b loc_02edf4
	tst.b ($162,a5)
	beq.b loc_02edbc
	tst.b ($124,a5)
	beq.b loc_02edc2

loc_02edbc:
	tst.b ($b9,a6)
	bne.b loc_02edd0

loc_02edc2:
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.b loc_02edf4

loc_02edd0:
	tst.b d1
	bne.b loc_02edde
	bsr.w loc_02e8c0
	move.b #2,($114,a0)

loc_02edde:
	move.b ($254,a6),($3f,a6)
	clr.b ($2c8,a6)
	clr.b ($d6,a6)
	bsr.w loc_02f770
	moveq #1,d0
	rts

loc_02edf4:
	moveq #0,d0
	rts

;==============================================
;Alpha Counter Start
;==============================================
loc_02edf8:
	tst.b (PL_ism_choice,a6)
	bmi.b loc_02edf4
	moveq #$30,d6
	tst.b (PL_ism_choice,a6)
	beq.b loc_02ee08
	moveq #$48,d6

loc_02ee08:
	cmp.w ($11e,a6),d6
	bhi.b loc_02edf4
	tst.b ($24e,a6)
	bne.b loc_02edf4
	cmpi.w #$202,(4,a6)
	bne.b loc_02edf4
	cmpi.b #$ff,($55,a6)
	bne.b loc_02edf4
	tst.b ($31,a6)
	bne.b loc_02edf4
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.b loc_02edf4
	jsr loc_02af7a
	bne.b loc_02edf4
	cmpi.w #8,($268,a6)
	bcc.b loc_02edf4
	move.w d6,d0
	neg.w d0
	bsr.w loc_02ef6c
	bsr.w loc_02e8c0
	move.b #4,($114,a0)
	tst.b ($89,a5)
	beq.b loc_02ee66
	move.b #$a,($114,a0)

loc_02ee66:
	jsr loc_0206ae
	jsr loc_02c0ac
	move.b ($24c,a6),($296,a6)
	subi.b #$10,($24c,a6)
	move.b #1,($2c7,a6)
	cmpi.b #$10,($24c,a6)
	bcc.b loc_02ee92
	move.b #$10,($24c,a6)

loc_02ee92:
	move.b ($24c,a6),d0
	cmp.b ($24d,a6),d0
	bcc.b loc_02eea0
	move.b d0,($24d,a6)

loc_02eea0:
	moveq #0,d1
	bra.w loc_02edde

;==============================================
;Wake Up Check
;==============================================
loc_02eea6:
	cmpi.l #$2020202,(4,a6)
	bne.b loc_02eedc
	tst.b ($31,a6)
	beq.b loc_02eedc
	tst.b ($2ce,a6)
	bne.b loc_02eedc
	tst.w ($50,a6)
	bmi.b loc_02eedc
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.b loc_02eedc
	jsr loc_02af7a
	bne.b loc_02eedc
	moveq #1,d0
	rts
 
 loc_02eedc:
	moveq #0,d0
	rts

;==============================================
;Raging Demon supers
;==============================================
loc_02eee0:
	moveq #0,d1
	cmpi.l #$02020400,(4,a6)
	beq.b loc_02ef2e
	moveq #1,d1
	tst.b ($b9,a6)
	bne.w loc_02edf4
	tst.b ($31,a6)
	bne.w loc_02edf4
	cmpi.w #$200,(4,a6)
	bne.w loc_02edf4
	cmpi.b #$e,(6,a6)
	beq.w loc_02edf4
	cmpi.b #$10,(6,a6)
	beq.w loc_02edf4
	cmpi.b #$12,(6,a6)
	beq.w loc_02edf4
	tst.b ($2ce,a6)
	bne.w loc_02edf4

loc_02ef2e:
	clr.b ($5d,a6)
	clr.b ($5e,a6)
	move.b ($10d,a5),d0
	or.b ($10e,a5),d0
	or.b ($8a,a5),d0
	bne.w loc_02edf4
	jsr loc_02af7a
	bne.w loc_02edf4
	bra.w loc_02edd0

loc_02ef54:
	cmpi.w #$200,(4,a6)
	bne.b loc_02ef64
	cmpi.b #$a,(6,a6)
	beq.b loc_02ef68

loc_02ef64:
	moveq #1,d0
	rts

loc_02ef68:
	moveq #0,d0
	rts

;==============================================
;Meter Gain
;==============================================
loc_02ef6c:
	tst.b ($68,a6)
	bne.w loc_02f002
	tst.b ($f0,a6)
	bne.w loc_02f002
	tst.b ($107,a5)
	bne.w loc_02f002
	tst.w d0
	beq.b loc_02f002
	bmi.b loc_02efc0
	tst.b ($123,a6)
	bne.b loc_02efa6
	tst.b (PL_ism_choice,a6)
	bmi.b loc_02efa6
	beq.b loc_02efb0
	bra.b loc_02efb0
 
loc_02ef9a:
	move.b d0,(-$4b0a,a5)
	lsr.b #2,d0
	add.b (-$4b0a,a5),d0
	bra.b loc_02efb0

loc_02efa6:
	move.b d0,(-$4b0a,a5)
	lsr.b #1,d0
	add.b (-$4b0a,a5),d0

loc_02efb0:
	lsr.b #1,d0
	move.b d0,(-$4b0a,a5)
	lsr.b #1,d0
	add.b (-$4b0a,a5),d0
	bne.b loc_02efc0
	moveq #1,d0

loc_02efc0:
	tst.w ($138,a5)
	bne.w loc_02f004
	swap d0
	move.w ($11e,a6),d0
	swap d0
	add.w d0,($11e,a6)
	bpl.b loc_02efdc
	clr.w ($11e,a6)
	bra.b loc_02efea

loc_02efdc:
	cmpi.w #$90,($11e,a6)
	bcs.b loc_02efea
	move.w #$90,($11e,a6)

loc_02efea:
	swap d0
	cmp.w ($11e,a6),d0
	beq.b loc_02f000
	cmpi.w #$90,($11e,a6)
	bne.b loc_02f000
	jsr loc_003800

loc_02f000:
	swap d0

loc_02f002:
	rts

loc_02f004:
	cmpi.w #6,($138,a5)
	beq.b loc_02f040
	btst.b #1,($101,a6)
	bne.b loc_02f026
	move.l a0,(-$4b12,a5)
	movea.l a6,a0
	bsr.w loc_02f074
	movea.l (-$4b12,a5),a0
	swap d0
	rts

loc_02f026:
	move.l a0,(-$4b12,a5)
	lea.l (p3memory,a5),a0
	bsr.w loc_02f074
	movea.l (-$4b12,a5),a0
	move.w ($d1e,a5),($111e,a5)
	swap d0
	rts

loc_02f040:
	btst.b #1,($101,a6)
	bne.b loc_02f062
	move.l a0,(-$4b12,a5)
	lea.l (p1memory,a5),a0
	bsr.w loc_02f074
	movea.l (-$4b12,a5),a0
	move.w ($51e,a5),($91e,a5)
	swap d0
	rts

loc_02f062:
	move.l a0,(-$4b12,a5)
	movea.l a6,a0
	bsr.w loc_02f074
	movea.l (-$4b12,a5),a0
	swap d0
	rts

;==============================================
;
;==============================================
loc_02f074:
	swap d0
	move.w ($11e,a0),d0
	swap d0
	add.w d0,($11e,a0)
	bpl.b loc_02f088
	clr.w ($11e,a0)
	bra.b loc_02f096

loc_02f088:
	cmpi.w #$90,($11e,a0)
	bcs.b loc_02f096
	move.w #$90,($11e,a0)

loc_02f096:
	swap d0
	cmp.w ($11e,a0),d0
	beq.b loc_02f0ac
	cmpi.w #$90,($11e,a0)
	bne.b loc_02f0ac
	jmp loc_003800

loc_02f0ac:
	rts

;==============================================
loc_02f0ae:
	move.b ($10e,a5),d1
	or.b ($10d,a5),d1
	or.b ($8a,a5),d1
	bne.b loc_02f0d4
	move.w ($50,a6),d1
	bmi.b loc_02f0d4
	ext.w d0
	add.w d1,d0
	cmpi.w #$90,d0
	bcs.b loc_02f0d0
	move.w #$90,d0

loc_02f0d0:
	move.w d0,($50,a6)

loc_02f0d4:
	rts

;==============================================
;
;==============================================
loc_02f0d6:
	movea.w ($38,a6),a4
	move.w ($21c,a6),d0
	move.w ($14,a6),d1
	sub.w ($14,a4),d1
	bpl.b loc_02f0ea
	neg.w d1

loc_02f0ea:
	addi.w #$10,d0
	cmpi.w #$100,d0
	bhi.b loc_02f130
	cmpi.w #$80,d1
	bcc.b loc_02f130
	lsr.w #5,d0
	lsr.w #4,d1
	lsl.w #2,d1
	add.w d0,d1
	move.b loc_02f134(pc,d1.w),d0
	bmi.b loc_02f130
	ext.w d0
	add.w d0,d0
	add.w d0,d0
	lea.l loc_02f300(pc),a2
	lea.l (a2,d0.w),a2
	move.b (a2),($80,a6)
	move.b (1,a2),($81,a6)
	move.b (2,a2),($82,a6)
	move.b (3,a2),($83,a6)
	moveq #1,d0
	rts

loc_02f130:
	moveq #0,d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02f134:
	dc.b $15,$16,$17,$0b,$08,$01,$02,$03
	dc.b $0c,$0c,$13,$00,$07,$07,$08,$05
	dc.b $0c,$0d,$0d,$14,$07,$08,$ff,$ff
	dc.b $0d,$0d,$14,$ff,$ff,$ff,$ff,$ff
	dc.b $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff

;==============================================
;
;==============================================
loc_02f15c:
	movea.l ($2bc,a6),a0
	moveq #$b,d6

loc_02f162:
	movea.l a0,a2
	move.w d6,d0
	add.w d0,d0
	move.w (a2,d0.w),d0
	lea.l (a2,d0.w),a2
	moveq #0,d0
	moveq #0,d2

loc_02f174:
	move.b (9,a2),d1
	bne.b loc_02f190
	add.w (a2),d0
	tst.w (2,a2)
	bmi.b loc_02f18a
	addq.w #1,d2
	lea.l ($14,a2),a2
	bra.b loc_02f174

loc_02f18a:
	dbra d6,loc_02f162
	rts

loc_02f190:
	move.w d6,d3
	lsl.w #3,d3
	lea.l (-$4bd8,a5),a3
	tst.b ($101,a6)
	beq.b loc_02f1a2
	lea.l (-$4b78,a5),a3

loc_02f1a2:
	lea.l (a3,d3.w),a3
	move.w d0,(a3)
	move.b d1,d0
	movea.l ($a0,a6),a1
	bsr.w loc_02f240
	move.w d0,(4,a3)
	clr.w (-$4b18,a5)
	moveq #0,d0
	move.b (8,a2),d0
	lsl.w #2,d0
	movea.l ($88,a6),a1
	move.l (a1,d0.w),(-$4b0e,a5)
	move.b (-$4b0e,a5),d0
	beq.b loc_02f1de
	movea.l ($90,a6),a1
	bsr.w loc_02f22a
	move.w d0,(-$4b18,a5)

loc_02f1de:
	clr.w (-$4b16,a5)
	move.b (-$4b0d,a5),d0
	beq.b loc_02f1f4
	movea.l ($94,a6),a1
	bsr.w loc_02f22a
	move.w d0,(-$4b16,a5)

loc_02f1f4:
	clr.w (-$4b14,a5)
	move.b (-$4b0c,a5),d0
	beq.b loc_02f20a
	movea.l ($98,a6),a1
	bsr.w loc_02f22a
	move.w d0,(-$4b14,a5)

loc_02f20a:
	move.w (-$4b18,a5),d0
	cmp.w (-$4b16,a5),d0
	bcc.b loc_02f218
	move.w (-$4b16,a5),d0

loc_02f218:
	cmp.w (-$4b14,a5),d0
	bcc.b loc_02f222
	move.w (-$4b14,a5),d0

loc_02f222:
	move.w d0,(2,a3)
	bra.w loc_02f18a

;==============================================
loc_02f22a:
	andi.w #$ff,d0
	lsl.w #3,d0
	lea.l (a1,d0.w),a1
	move.w (a1),d0
	move.w (4,a1),d1
	sub.w d1,d0
	neg.w d0
	rts

;==============================================
loc_02f240:
	andi.w #$ff,d0
	lsl.w #5,d0
	lea.l (a1,d0.w),a1
	move.w (a1),d0
	move.w (4,a1),d1
	sub.w d1,d0
	neg.w d0
	rts


;==============================================
loc_02f256:
	movea.w ($38,a6),a4
	move.l (4,a4),d0
	andi.l #$ffffff00,d0
	cmpi.l #$2000a00,d0
	bne.w loc_02f2e4
	movea.l ($1c,a4),a2
	movea.l ($a0,a4),a1
	moveq #0,d0

loc_02f278:
	move.b (9,a2),d1
	beq.b loc_02f28c
	andi.w #$ff,d1
	lsl.w #5,d1
	lea.l (a1,d1.w),a1
	bra.w loc_02f29c

loc_02f28c:
	add.w (a2),d0
	tst.w (2,a2)
	bmi.w loc_02f2e4
	lea.l ($18,a2),a2
	bra.b loc_02f278

loc_02f29c:
	moveq #0,d5
	bsr.w loc_02f360
	bsr.w loc_02f388
	moveq #$b,d6

loc_02f2a8:
	moveq #0,d0
	move.b loc_02f2e8(pc,d6.w),d0
	tst.b ($80,a4)
	beq.b loc_02f2b8
	move.b loc_02f2f4(pc,d6.w),d0

loc_02f2b8:
	btst.l d0,d5
	beq.b loc_02f2e0
	lsl.w #2,d0
	lea.l loc_02f300(pc),a2
	lea.l (a2,d0.w),a2
	move.b (a2),($80,a6)
	move.b (1,a2),($81,a6)
	move.b (2,a2),($82,a6)
	move.b (3,a2),($83,a6)
	moveq #1,d0
	bra.b loc_02f2e6

loc_02f2e0:
	dbra d6,loc_02f2a8

loc_02f2e4:
	moveq #0,d0

loc_02f2e6:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02f2e8:
	dc.b $03,$09,$04,$0a
	dc.b $05,$0b,$00,$06
	dc.b $01,$07,$02,$08

loc_02f2f4:
	dc.b $00,$06,$01,$07
	dc.b $02,$08,$03,$09
	dc.b $04,$0a,$05,$0b

loc_02f300:
	dc.b $00,$00,$00,$01,$00,$00,$02,$01
	dc.b $00,$00,$04,$01,$02,$00,$00,$01
	dc.b $02,$00,$02,$01,$02,$00,$04,$01
	dc.b $00,$02,$00,$01,$00,$02,$02,$01
	dc.b $00,$02,$04,$01,$02,$02,$00,$01
	dc.b $02,$02,$02,$01,$02,$02,$04,$01
	dc.b $00,$00,$00,$02,$00,$00,$02,$02
	dc.b $00,$00,$04,$02,$02,$00,$00,$02
	dc.b $02,$00,$02,$02,$02,$00,$04,$02
	dc.b $00,$02,$00,$02,$00,$02,$02,$02
	dc.b $00,$02,$04,$02,$02,$02,$00,$02
	dc.b $02,$02,$02,$02,$02,$02,$04,$02

;==============================================
loc_02f360:
	moveq #0,d6
	lea.l (-$4bd8,a5),a2
	tst.b ($101,a6)
	beq.b loc_02f370
	lea.l (-$4b78,a5),a2

loc_02f370:
	lea.l (a2),a3

loc_02f372:
	move.w (a3),d1
	lea.l ($8,a3),a3
	cmp.w d0,d1
	bhi.b loc_02f37e
	bset d6,d5

loc_02f37e:
	addq.b #1,d6
	cmpi.w #$c,d6
	bcs.b loc_02f372
	rts

;==============================================
loc_02f388:
	lea.l (-$4bd8,a5),a1
	tst.b ($101,a4)
	beq.b loc_02f396
	lea.l (-$4b78,a5),a1

loc_02f396:
	moveq #0,d0
	tst.b ($81,a4)
	beq.b loc_02f3a2
	move.b #$30,d0

loc_02f3a2:
	moveq #0,d1
	tst.b ($80,a4)
	beq.b loc_02f3ae
	move.b #$18,d1

loc_02f3ae:
	add.w d1,d0
	moveq #0,d1
	move.b ($82,a4),d1
	lsl.w #2,d1
	add.w d1,d0
	move.w (2,a1,d0.w),d0
	tst.b ($b,a4)
	bne.b loc_02f3c6
	neg.w d0

loc_02f3c6:
	add.w ($10,a4),d0
	moveq #0,d6

loc_02f3cc:
	btst.l d6,d5
	beq.b loc_02f3f6
	move.w (4,a2),d1
	lea.l (8,a2),a2
	tst.b ($b,a6)
	bne.b loc_02f3e0
	neg.w d1

loc_02f3e0:
	add.w ($10,a6),d1
	tst.b ($b,a6)
	bne.b loc_02f3f0
	cmp.w d0,d1
	bls.b loc_02f3f6
	bra.b loc_02f3f4

loc_02f3f0:
	cmp.w d0,d1
	bcc.b loc_02f3f6

loc_02f3f4:
	bclr d6,d5

loc_02f3f6:
	addq.b #1,d6
	cmpi.b #$c,d6
	bcs.b loc_02f3cc
	rts

;==============================================
loc_02f400:
	movea.l #loc_3329d4,a0
	moveq #0,d0
	move.b ($102,a6),d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	add.w d1,d0
	lea.l (a0,d0.w),a0
	movea.l ($150,a6),a1

loc_02f41c:
	move.l (a1),d6
	andi.l #$f000f000,d6
	movem.l (a0)+,d0-d3
	or.l d6,d0
	or.l d6,d1
	or.l d6,d2
	or.l d6,d3
	movem.l d0-d3, (a1)
	lea.l ($10,a1),a1
	movem.l (a0)+,d0-d3
	or.l d6,d0
	or.l d6,d1
	or.l d6,d2
	or.l d6,d3
	movem.l d0-d3, (a1)
	lea.l ($10,a1),a1
	rts

;==============================================
loc_02f44e:
	tst.w ($138,a5)
	bne.b loc_02f48e
	lea.l (p1memory,a5),a1
	tst.b d1
	bmi.b loc_02f48e
	bne.b loc_02f462
	lea.l (p2memory,a5),a1

loc_02f462:
	movea.l #loc_01bbfc,a0
	ext.w d0
	lsl.w #2,d0
	lea.l (a0,d0.w),a0
	lea.l ($b4,a1),a1
	andi.b #$ef,ccr
	abcd.b -(a0),-(a1)
	abcd.b -(a0),-(a1)
	abcd.b -(a0),-(a1)
	abcd.b -(a0),-(a1)
	cmpi.l #$9999999,(a1)
	bcs.b loc_02f48e
	move.l #$9999999,(a1)

loc_02f48e:
	rts

;==============================================
loc_02f490:
	movea.w ($38,a6),a0
	tst.b ($125,a0)
	bne.b loc_02f4ba
	moveq #0,d0
	move.b ($5e,a6),d0
	beq.b loc_02f4ba
	cmpi.b #$63,d0
	bcs.b loc_02f4aa
	moveq #$63,d0

loc_02f4aa:
	lsl.w #2,d0
	lea.l loc_02fd5a(pc),a4
	move.l (a4,d0.w),d0
	jmp loc_01bb44

loc_02f4ba:
	rts

;==============================================
loc_02f4bc:
	tst.b ($3f,a6)
	bne.w loc_02f54a
	move.b ($378,a6),d0
	or.b ($37a,a6),d0
	andi.w #7,d0
	moveq #4,d1
	tst.b (PL_ism_choice,a6)
	bmi.w loc_02f520
	bra.b loc_02f4fc

loc_02f4dc:
	tst.b ($3f,a6)
	bne.w loc_02f54a
	move.b ($378,a6),d0
	or.b ($37a,a6),d0
	andi.w #$70,d0
	lsr.w #4,d0
	moveq #4,d1
	tst.b (PL_ism_choice,a6)
	bmi.w loc_02f520

loc_02f4fc:
	move.w ($11e,a6),d2
	btst #2,d0
	bne.b loc_02f50e
	btst #1,d0
	bne.b loc_02f516
	bra.b loc_02f51e

loc_02f50e:
	moveq #4,d1
	cmpi.w #$90,d2
	beq.b loc_02f520

loc_02f516:
	moveq #2,d1
	cmpi.w #$60,d2
	bcc.b loc_02f520

loc_02f51e:
	moveq #0,d1

loc_02f520:
	move.b d1,($82,a6)
	move.b d1,($248,a6)
	bra.w loc_02f770

VShadowPalWrite:
	move.b #1,($291,a6)
	move.b #$a,($2a0,a6)
	bra.w loc_02f770

loc_02f53c:
	tst.b ($125,a6)
	bne.b loc_02f56c
	moveq #0,d0
	move.b ($248,a6),d0
	bra.b loc_02f55e

loc_02f54a:
	move.b #4,($82,a6)
	move.b #4,($248,a6)
	bra.b loc_02f56c

;==============================================
loc_02f558:
	moveq #0,d0
	move.b ($82,a6),d0

loc_02f55e:
	move.w loc_02f566(pc,d0.w),d0
	jmp loc_02ef6c(pc)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02f566:
	dc.w $ffd0,$ffa0,$ff70

;==============================================
loc_02f56c:
	moveq #0,d0
	move.b ($82,a6),d0
	move.w loc_02f566(pc,d0.w),d0
	neg.w d0
	cmp.w ($11e,a6),d0
	bcs.w loc_02f5a0
	moveq #4,d2
	cmpi.w #$90,($11e,a6)
	bcc.b loc_02f596
	moveq #2,d2
	cmpi.w #$60,($11e,a6)
	bcc.b loc_02f596
	moveq #0,d2

loc_02f596:
	move.b d2,($82,a6)
	move.b d2,($248,a6)
	bra.b loc_02f558

loc_02f5a0:
	move.b ($82,a6),($248,a6)
	neg.w d0
	jmp loc_02ef6c(pc)

;==============================================
loc_02f5ac:
	tst.b ($33,a6)
	bmi.b loc_02f5e8
	tst.b ($125,a6)
	beq.b loc_02f5c6
	jsr loc_03071c
	beq.b loc_02f5e2
	clr.b (7,a6)
	bra.b loc_02f5e2

loc_02f5c6:
	tst.b ($35,a6)
	bpl.b loc_02f5d4
	bsr.w loc_02ec28
	bne.w loc_02f5da

loc_02f5d4:
	bsr.w loc_02eb06
	beq.b loc_02f5e2

loc_02f5da:
	clr.b (7,a6)
	st.b ($257,a6)

loc_02f5e2:
	jmp loc_02a7ea

loc_02f5e8:
	cmpi.b #7,($102,a6)
	bne.b loc_02f5f4
	clr.b ($1d0,a6)

loc_02f5f4
	tst.b ($80,a6)
	bne.w loc_02f602
	jmp loc_02baf2

loc_02f602:
	jmp loc_02bb26

;==============================================
loc_02f608:
	lea.l (p1memory,a5),a1
	lea.l (p2memory,a5),a2
	tst.b ($67,a1)
	beq.b loc_02f62c
	bmi.b loc_02f622
	tst.b ($cd,a2)
	bne.b loc_02f640
	exg.l a1,a2
	bra.b loc_02f640

loc_02f622:
	tst.b ($cd,a1)
	beq.b loc_02f640
	exg.l a1,a2
	bra.b loc_02f640

loc_02f62c:
	movea.l ($1c,a1),a0
	move.b ($f,a0),d1
	movea.l ($1c,a2),a0
	cmp.b ($f,a0),d1
	bcc.b loc_02f640
	exg.l a1,a2

loc_02f640:
	lea.l ($7002,a5),a0
	move.w a1,-(a0)
	move.w a2,-(a0)
	rts

;==============================================
loc_02f64a:
	move.w ($138,a5),d0
	move.w loc_02f656(pc,d0.w),d1
	jmp loc_02f656(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02f656:
	dc.w loc_02f608-loc_02f656
	dc.w loc_02f65e-loc_02f656
	dc.w loc_02f6da-loc_02f656
	dc.w loc_02f6e8-loc_02f656

;----------------------------------------------
loc_02f65e:
	lea.l (p1memory,a5),a1
	lea.l (p3memory,a5),a2
	lea.l (p4memory,a5),a3

loc_02f66a:
	tst.b ($67,a1)
	beq.b loc_02f696
	bmi.b loc_02f684
	tst.b ($67,a2)
	bne.b loc_02f67a
	exg.l a2,a3

loc_02f67a:
	tst.b ($cd,a2)
	bne.b loc_02f6ce
	exg.l a1,a2
	bra.b loc_02f6ce

loc_02f684:
	tst.b ($67,a2)
	bne.b loc_02f68c
	exg.l a2,a3

loc_02f68c:
	tst.b ($cd,a1)
	beq.b loc_02f6ce
	exg.l a1,a2
	bra.b loc_02f6ce

loc_02f696:
	movea.l ($1c,a1),a0
	move.b ($f,a0),d1
	movea.l ($1c,a2),a0
	move.b ($f,a0),d2
	movea.l ($1c,a3),a0
	move.b ($f,a0),d3
	cmp.b d1,d2
	bcs.b loc_02f6c2
	exg.l a1,a2
	cmp.b d1,d3
	bcs.b loc_02f6ce
	exg.l a2,a3
	cmp.b d2,d3
	bcs.b loc_02f6ce
	exg.l a1,a2
	bra.b loc_02f6ce

loc_02f6c2
	cmp.b d2,d3
	bcs.b loc_02f6ce
	exg.l a2,a3
	cmp.b d1,d3
	bcs.b loc_02f6ce
	exg.l a1,a2

loc_02f6ce:
	lea.l ($7004,a5),a0
	move.w a1,-(a0)
	move.w a2,-(a0)
	move.w a3,-(a0)
	rts

;----------------------------------------------
loc_02f6da:
	lea.l (p2memory,a5),a1
	lea.l (p3memory,a5),a2
	lea.l (p4memory,a5),a3
	bra.b loc_02f66a

;----------------------------------------------
loc_02f6e8:
	lea.l (p3memory,a5),a1
	lea.l (p1memory,a5),a2
	lea.l (p2memory,a5),a3
	bra.w loc_02f66a

;==============================================
loc_02f6f8:
	tst.b ($125,a6)
	bne.w loc_02f726
	tst.b ($3e,a6)
	beq.b loc_02f726
	tst.b ($ce,a6)
	bne.b loc_02f726
	movea.w ($38,a6),a4
	tst.w ($50,a4)
	bmi.w loc_02f726
	jsr loc_02b1be
	beq.b loc_02f726
	jmp loc_02b1c8

loc_02f726:
	rts

;==============================================
loc_02f728:
	bsr.w loc_02f770
	moveq #0,d1
	move.b ($378,a6),d0
	or.b ($37a,a6),d0
	btst #0,d0
	bne.b loc_02f746
	moveq #2,d1
	btst #1,d0
	bne.b loc_02f746
	moveq #4,d1

loc_02f746:
	move.b d1,($82,a6)
	rts

;==============================================
loc_02f74c:
	bsr.w loc_02f770
	moveq #0,d1
	move.b ($378,a6),d0
	or.b ($37a,a6),d0
	btst #4,d0
	bne.b loc_02f76a
	moveq #2,d1
	btst #5,d0
	bne.b loc_02f76a
	moveq #4,d1

loc_02f76a:
	move.b d1,($82,a6)
	rts

;==============================================
loc_02f770:
	moveq #0,d0
	move.b d0,($3e,a6)
	move.b d0,($294,a6)
	tst.b ($b9,a6)
	beq.b loc_02f784
	addq.b #1,($3e,a6)

loc_02f784:
	movea.w ($38,a6),a4
	lea.l ($280,a4),a4
	move.b ($5a,a6),d0
	clr.b (a4,d0.w)
	rts

;==============================================
loc_02f796:
	clr.b ($d6,a6)
	clr.b ($ab,a6)
	move.b #0,($2a0,a6)
	move.b #1,($b9,a6)
	movea.w ($38,a6),a4
	move.w #$9a,($ba,a6)
	move.w #3,($e2,a6)
	move.w #$1ce,($e4,a6)
	move.b #$12,($25d,a6)
	move.b #$a,($5f,a4)
	move.w ($11e,a6),d0
	cmpi.w #$90,d0
	beq.b loc_02f7f6
	move.w d0,d1
	add.w d1,d0
	add.w d1,d0
	move.w d1,($ba,a6)
	move.w d0,($e4,a6)
	lsr.w #4,d1
	addi.b #2,d1
	move.b d1,($5f,a4)
	addi.b #6,d1
	move.b d1,($25d,a6)

loc_02f7f6:
	move.b ($101,a6),d0
	jsr loc_080452
	clr.b ($80,a6)
	clr.b ($81,a6)
	clr.b ($82,a6)
	cmpi.b #2,($6eb9,a5)
	bcs.w loc_02f90e
	jsr loc_01c2c8
	lea.l (a4),a3
	jsr loc_01c2c8
	cmpa.l a3,a4
	bcc.b loc_02f82a
	exg.l a3,a4

loc_02f82a:
	addq.b #1,(a4)
	move.w #$1400,(2,a4)
	move.b ($e,a6),($e,a4)
	move.b d0,($3c,a4)
	move.w d1,($40,a4)
	move.w ($2a8,a6),d2
	move.b d2,($3a,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	move.b #1,($30,a4)
	addq.b #3,($d,a4)
	addq.b #1,(a3)
	move.w #$1401,(2,a3)
	move.b ($e,a6),($e,a3)
	move.b d0,($3c,a3)
	move.w d1,($40,a3)
	move.w ($2a8,a6),d2
	lsl.w #1,d2
	move.b d2,($3a,a3)
	move.w a6,($36,a3)
	move.w ($c,a6),($c,a3)
	move.b #1,($30,a3)
	addq.b #3,($d,a3)
	cmpi.b #8,($271,a6)
	bne.b loc_02f8a4
	move.b #1,($c,a4)
	move.b #1,($c,a3)

loc_02f8a4:
	jsr loc_01c1c8
	beq.b loc_02f90e
	addq.b #1,(a4)
	move.w #$2200,(2,a4)
	move.b ($e,a6),($e,a4)
	move.b d0,($3c,a4)
	move.w d1,($40,a4)
	move.w ($2a6,a6),d2
	move.b d2,($3a,a4)
	move.w a6,($36,a4)
	move.w ($c,a6),($c,a4)
	addq.b #4,($d,a4)
	move.b #$a,($bd,a4)
	move.b #1,($73,a4)
	move.b ($5a,a6),($5a,a4)
	move.b ($59,a6),($59,a4)
	move.b #1,($3e,a4)
	move.b ($3f,a6),($3f,a4)
	move.w a4,($27c,a6)
	cmpi.b #8,($271,a6)
	bne.b loc_02f90e
	move.b #1,($c,a4)

loc_02f90e:
	tst.b ($31,a6)
	bne.b loc_02f91a
	jmp loc_02baf2

loc_02f91a:
	rts

;==============================================
loc_02f91c:
	moveq #0,d2
	move.w (palrampointer,a5),d2
	lsl.l #8,d2
	movea.l d2,a0
	moveq #0,d2
	move.b ($d,a6),d2
	lsl.w #5,d2
	lea.l (a0,d2.w),a1
	moveq #0,d2
	move.b ($d,a4),d2
	lsl.w #5,d2
	lea.l (a0,d2.w),a0
	moveq #$f,d6

loc_02f940:
	move.w (a1)+,d0
	move.w d0,d1
	andi.w #$f00,d0
	lsr.w #1,d0
	andi.w #$f00,d0
	andi.w #$f0ff,d1
	or.w d0,d1
	move.w d1,d0
	andi.w #$f0,d0
	lsr.w #1,d0
	andi.w #$f0,d0
	andi.w #$ff0f,d1
	or.w d0,d1
	move.w d1,d0
	andi.w #$f,d0
	lsr.w #1,d0
	andi.w #$f,d0
	andi.w #$fff0,d1
	or.w d0,d1
	move.w d1,(a0)+
	dbra d6,loc_02f940
	rts

;==============================================
loc_02f980:
	move.w ($378,a6),d0
	or.w ($37a,a6),d0
	andi.w #$7700,d0
	moveq #0,d1
	moveq #$f,d2
	moveq #5,d3
	cmpi.w #$1100,d0
	beq.b loc_02f9aa
	moveq #0,d1
	moveq #$30,d2
	moveq #$10,d3
	cmpi.w #$2200,d0
	beq.b loc_02f9aa
	moveq #4,d1
	moveq #$51,d2
	moveq #$1b,d3

loc_02f9aa:
	move.b d1,($244,a6)
	move.w d2,($2a6,a6)
	move.w d3,($2a8,a6)
	move.b #1,($d6,a6)
	rts

;==============================================
loc_02f9be:
	movea.w ($38,a6),a4
	tst.b ($67,a6)
	beq.b loc_02fa34
	moveq #0,d0
	movea.l ($1c,a6),a0
	move.b ($10,a0),d0
	lsl.w #3,d0
	moveq #0,d1
	move.b ($102,a6),d1
	lsl.w #2,d1
	movea.l #loc_0dd212,a0
	movea.l (a0,d1.w),a0
	moveq #0,d1
	move.b ($102,a4),d1
	add.w d1,d1
	add.w (a0,d1.w),d0
	lea.l (a0,d0.w),a0
	move.w (a0)+,d0
	move.w (a0)+,d1
	tst.b ($b,a6)
	beq.b loc_02fa02
	neg.w d0

loc_02fa02:
	add.w ($10,a6),d0
	add.w ($14,a6),d1
	move.w d0,($10,a4)
	move.w d1,($14,a4)
	clr.b ($cd,a4)
	tst.b (a0)+
	bpl.b loc_02fa1e
	st.b ($cd,a4)

loc_02fa1e:
	move.b (a0)+,d0
	move.b ($b,a6),d1
	andi.w #3,d0
	eor.b d0,d1
	move.b d1,($b,a4)
	move.w (a0),d0
	bra.w loc_02fc36

loc_02fa34:
	rts

;==============================================
loc_02fa36:
	movea.w ($38,a6),a4
	tst.b ($67,a6)
	beq.b loc_02fa34
	moveq #0,d0
	movea.l ($1c,a6),a0
	move.b ($10,a0),d0
	lsl.w #3,d0
	moveq #0,d1
	move.b ($102,a6),d1
	lsl.w #2,d1
	movea.l #loc_0dd212,a0
	movea.l (a0,d1.w),a0
	moveq #0,d1
	move.b ($102,a4),d1
	add.w d1,d1
	add.w (a0,d1.w),d0
	lea.l (a0,d0.w),a0
	move.w (a0)+,d0
	move.w (a0)+,d1
	tst.b ($b,a6)
	bne.b loc_02fa7a
	neg.w d0

loc_02fa7a:
	neg.w d1
	add.w ($10,a4),d0
	add.w ($14,a4),d1
	move.w d0,($10,a6)
	move.w d1,($14,a6)
	clr.b ($cd,a4)
	tst.b (a0)+
	bpl.b loc_02fa98
	st.b ($cd,a4)

loc_02fa98:
	move.b (a0)+,d0
	move.b ($b,a6),d1
	andi.w #3,d0
	eor.b d0,d1
	move.b d1,($b,a4)
	move.w (a0),d0
	bra.w loc_02fc36

;==============================================
loc_02faae:
	movea.w ($38,a6),a4
	tst.b ($67,a6)
	beq.w loc_02fa34
	moveq #0,d0
	movea.l ($1c,a6),a0
	move.b ($10,a0),d0
	lsl.w #3,d0
	moveq #0,d1
	move.b ($102,a6),d1
	lsl.w #2,d1
	movea.l #loc_0dd212,a0
	movea.l (a0,d1.w),a0
	moveq #0,d1
	move.b ($102,a4),d1
	add.w d1,d1
	add.w (a0,d1.w),d0
	lea.l (a0,d0.w),a0
	move.w (a0)+,d0
	move.w (a0)+,d1
	tst.b ($b,a6)
	beq.b loc_02faf4
	neg.w d0

loc_02faf4:
	add.w ($10,a6),d0
	add.w ($14,a6),d1
	move.w d0,($10,a4)
	move.w d1,($14,a4)
	clr.b ($cd,a4)
	tst.b (a0)+
	bpl.b loc_02fb10
	st.b ($cd,a4)

loc_02fb10:
	move.b (a0)+,d0
	move.b ($b,a6),d1
	andi.w #3,d0
	eor.b d0,d1
	move.b d1,($b,a4)
	rts

;==============================================
loc_02fb22:
	movea.w ($38,a6),a4
	tst.b ($67,a6)
	beq.w loc_02fa34
	moveq #0,d0
	movea.l ($1c,a6),a0
	move.b ($10,a0),d0
	lsl.w #3,d0
	moveq #0,d1
	move.b ($102,a6),d1
	lsl.w #2,d1
	movea.l #loc_0dd212,a0
	movea.l (a0,d1.w),a0
	moveq #0,d1
	move.b ($102,a4),d1
	add.w d1,d1
	add.w (a0,d1.w),d0
	lea.l (a0,d0.w),a0
	move.w (a0)+,d0
	move.w (a0)+,d1
	tst.b ($b,a6)
	bne.b loc_02fb68
	neg.w d0

loc_02fb68:
	add.w ($10,a4),d0
	add.w ($14,a4),d1
	move.w d0,($10,a6)
	move.w d1,($14,a6)
	clr.b ($cd,a4)
	tst.b (a0)+
	bpl.b loc_02fb84
	st.b ($cd,a4)

loc_02fb84:
	move.b (a0)+,d0
	move.b ($b,a6),d1
	andi.w #3,d0
	eor.b d0,d1
	move.b d1,($b,a4)
	rts

;==============================================
loc_02fb96:
	movea.w ($38,a6),a4
	tst.b ($67,a6)
	beq.w loc_02fa34
	moveq #0,d0
	movea.l ($1c,a6),a0
	move.b ($10,a0),d0
	lsl.w #3,d0
	moveq #0,d1
	move.b ($102,a6),d1
	lsl.w #2,d1
	movea.l #loc_0dd212,a0
	movea.l (a0,d1.w),a0
	moveq #0,d1
	move.b ($102,a4),d1
	add.w d1,d1
	add.w (a0,d1.w),d0
	lea.l (a0,d0.w),a0
	clr.b ($cd,a4)
	tst.b (4,a0)
	bpl.b loc_02fbde
	st.b ($cd,a4)

loc_02fbde:
	move.b (5,a0),d0
	move.b ($b,a6),d1
	andi.w #3,d0
	eor.b d0,d1
	move.b d1,($b,a4)
	move.w (6,a0),d0
	bra.w loc_02fc36

;==============================================
loc_02fbf8:
	movea.w ($38,a6),a4
	tst.b ($67,a6)
	beq.w loc_02fa34
	moveq #0,d0
	movea.l ($1c,a6),a0
	move.b ($10,a0),d0
	lsl.w #3,d0
	moveq #0,d1
	move.b ($102,a6),d1
	lsl.w #2,d1
	movea.l #loc_0dd212,a0
	movea.l (a0,d1.w),a0
	moveq #0,d1
	move.b ($102,a4),d1
	add.w d1,d1
	add.w (a0,d1.w),d0
	lea.l (a0,d0.w),a0
	move.w ($8,a0),d0

loc_02fc36:
	movea.l ($2b8,a4),a0
	move.w (a0),d2
	lea.l (a0,d2.w),a0
	lea.l (a0,d0.w),a0
	jmp loc_02a856

;==============================================
loc_02fc4a:
	moveq #0,d0
	move.b ($102,a6),d0
	lsl.w #2,d0
	movea.l #CharAniPNTtable,a0
	movea.l (a0,d0.w),a0
	moveq #0,d0
	tst.b (PL_ism_choice,a6)
	beq.b loc_02fc6e
	moveq #$10,d0
	tst.b (PL_ism_choice,a6)
	bmi.b loc_02fc6e
	moveq #$20,d0

loc_02fc6e:
	lea.l (a0,d0.w),a0
	move.l (a0)+,($2b0,a6)
	move.l (a0)+,($2b8,a6)
	move.l (a0)+,($2b4,a6)
	move.l (a0),($2bc,a6)
	rts

;==============================================
;Sprite Bank
loc_02fc84:
	move.b ($102,a6),d0

loc_02fc88:
	ext.w d0
	add.w d0,d0
	move.w loc_02fc94(pc,d0.w),($1a,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02fc94:
	dc.w $0000,$0000,$0000,$0000;Ryu  ;Ken  ;Gki  ;Nsh
	dc.w $0000,$4000,$4000,$4000;Chn  ;Adn  ;Sdm  ;Guy
	dc.w $0000,$2000,$0000,$4000;Brd  ;Rse  ;Dic  ;Sag
	dc.w $0000,$4000,$4000,$0000;Dan  ;Sak  ;Rol  ;Sim
	dc.w $4000,$0000,$0000,$0000;Zan  ;Gen  ;$12  ;Gen
	dc.w $4000,$4000,$4000,$0000;$14  ;Box  ;Cam  ;$17
	dc.w $0000,$6000,$6000,$6000;Ehd  ;Blk  ;Rmk  ;Cdy
	dc.w $6000,$6000,$4000,$4000;Clw  ;Kar  ;Box  ;Box

;==============================================
loc_02fcd4:
	movea.w ($38,a6),a4
	moveq #3,d0
	tst.b ($eb,a6)
	bne.b loc_02fcec
	tst.b ($3f,a6)
	bne.b loc_02fcec
	move.b ($82,a6),d0
	lsr.b #1,d0

loc_02fcec:
	move.b loc_02fcf4(pc,d0.w),($5f,a4)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02fcf4:
	dc.b $00,$02,$05,$00

;==============================================
loc_02fcf8:
	move.w ($138,a5),d0
	move.w loc_02fd04(pc,d0.w),d1
	jmp loc_02fd04(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02fd04:
	dc.w loc_02fd0c-loc_02fd04
	dc.w loc_02fd14-loc_02fd04
	dc.w loc_02fd14-loc_02fd04
	dc.w loc_02fd24-loc_02fd04

;----------------------------------------------
loc_02fd0c:
	movea.w ($38,a6),a4
	bra.w loc_02fd28

;----------------------------------------------
loc_02fd14:
	lea.l (p3memory,a5),a4
	bsr.w loc_02fd28
	lea.l (p4memory,a5),a4
	bra.w loc_02fd28

;----------------------------------------------
loc_02fd24:
	lea.l (p3memory,a5),a4

loc_02fd28:
	cmpi.l #$2020202,(4,a4)
	bne.b loc_02fd58
	tst.w ($50,a4)
	bmi.b loc_02fd58
	tst.b ($31,a4)
	bne.b loc_02fd58
	tst.b ($54,a4)
	bne.w loc_02fd58
	cmpi.b #$a,($32,a4)
	bcs.b loc_02fd58
	clr.b ($5b,a4)
	move.b #$1e,($32,a4)

loc_02fd58:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_02fd5a:
	dc.l $00000000,$00000000,$00000300,$00000500
	dc.l $00001000,$00001200,$00001500,$00002000
	dc.l $00002300,$00002600,$00003000,$00003300
	dc.l $00003600,$00004000,$00004500,$00005000
	dc.l $00006000,$00007000,$00008000,$00009000
	dc.l $00010000,$00011000,$00012000,$00013000
	dc.l $00014000,$00015000,$00016000,$00017000
	dc.l $00018000,$00019000,$00020000,$00021000
	dc.l $00022000,$00023000,$00024000,$00025000
	dc.l $00026000,$00027000,$00028000,$00029000
	dc.l $00030000,$00031000,$00032000,$00033000
	dc.l $00034000,$00035000,$00036000,$00037000
	dc.l $00038000,$00039000,$00040000,$00041000
	dc.l $00042000,$00043000,$00044000,$00045000
	dc.l $00046000,$00047000,$00048000,$00049000
	dc.l $00050000,$00051000,$00052000,$00053000
	dc.l $00054000,$00055000,$00056000,$00057000
	dc.l $00058000,$00059000,$00060000,$00061000
	dc.l $00062000,$00063000,$00064000,$00065000
	dc.l $00066000,$00067000,$00068000,$00069000
	dc.l $00070000,$00071000,$00072000,$00073000
	dc.l $00074000,$00075000,$00076000,$00077000
	dc.l $00078000,$00079000,$00080000,$00081000
	dc.l $00082000,$00083000,$00084000,$00085000
	dc.l $00086000,$00087000,$00088000,$00089000

loc_02feea:
	dc.l $002a0040,$002a0040,$002a0040,$002a0040
	dc.l $002a0040,$002a0040,$002a0040,$002a0040
	dc.l $00320040,$002a0040,$002a0040,$002a0040
	dc.l $002a0040,$00260040,$00300040,$002a0040
	dc.l $00360040,$002a0040,$002a0040,$002a0040
	dc.l $002a0040,$00000000,$00000000,$002a0040
	dc.l $00000000,$00000000,$002a0040,$002a0040
	dc.l $002a0040,$00260040,$002a0040,$002a0040

loc_02ff6a:
	dc.l $00000000,$00000000,$04040404,$08080808
	dc.l $0c0c0c0c,$0c0c0c0c,$0c0c0c0c,$0c0c0c0c

;Deals with palettes
	include "unk2ff8a.asm"

;==============================================
	include "char/Part1AI.asm"

;==============================================
;Projectile code
loc_032e9c:
	lea.l ($1400,a5),a6
	move.b #$c,($b5,a5)

loc_032ea6:
	tst.b (a6)
	beq.b loc_032ee6
	tst.b ($dc,a6)
	beq.b loc_032ece
	move.w ($36,a6),d0
	beq.b loc_032ec8
	movea.w d0,a0
	tst.b ($23b,a0)
	beq.b loc_032ec8
	move.l #$6000000,(4,a6)
	bra.b loc_032ece

loc_032ec8:
	subq.b #1,($dc,a6)
	bra.b loc_032ee6

loc_032ece:
	bsr.w loc_032fda
	moveq #0,d0
	move.b (2,a6),d0
	add.w d0,d0
	add.w d0,d0
	movea.l loc_032f46(pc,d0.w),a0
	moveq #0,d0
	moveq #0,d7
	jsr (a0)

loc_032ee6:
	lea.l ($100,a6),a6
	subq.b #1,($b5,a5)
	bne.b loc_032ea6
	lea.l ($2000,a5),a6
	move.b #$c,($b5,a5)

loc_032efa:
	tst.b (a6)
	beq.b loc_032f3a
	tst.b ($dc,a6)
	beq.b loc_032f22
	move.w ($36,a6),d0
	beq.b loc_032f1c
	movea.w d0,a0
	tst.b ($23b,a0)
	beq.b loc_032f1c
	move.l #$6000000,(4,a6)
	bra.b loc_032f22

loc_032f1c:
	subq.b #1,($dc,a6)
	bra.b loc_032f3a

loc_032f22:
	bsr.w loc_032fda
	moveq #0,d0
	move.b (2,a6),d0
	add.w d0,d0
	add.w d0,d0
	movea.l loc_032f46(pc,d0.w),a0
	moveq #0,d0
	moveq #0,d7
	jsr (a0)

loc_032f3a:
	lea.l ($100,a6),a6
	subq.b #1,($b5,a5)
	bne.b loc_032efa
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_032f46:
	dc.l loc_072ba0,loc_0734f8,loc_073716,loc_074d2a;00
	dc.l loc_07509e,loc_07530a,loc_0753f2,loc_075aa4;04
	dc.l loc_075aaa,loc_075ab0,loc_0766d6,loc_07692c;08
	dc.l loc_0773ce,loc_077bb0,loc_07860e,loc_078bda;0c
	dc.l loc_079000,loc_0790ec,loc_0790f2,loc_0790f8;10
	dc.l loc_0790fe,loc_079104,loc_0791e4,loc_0793aa;14
	dc.l loc_079648,loc_079946,loc_079c82,loc_079c88;18
	dc.l loc_079f5e,loc_07a176,loc_07a270,loc_07ad34;1c
	dc.l loc_07ae70,loc_07b70e,loc_07baa8,loc_07bbd4;20
	dc.l loc_07bf60;24

;==============================================
loc_032fda:
	cmpi.b #1,(a6)
	bne.b loc_033004
	tst.b ($cc,a6)
	beq.b loc_033004
	tst.b ($ee,a6)
	beq.b loc_032ff8
	subq.b #1,($ee,a6)
	bne.b loc_033004
	move.b ($ef,a6),($ee,a6)

loc_032ff8:
	subq.b #1,($cc,a6)
	bne.b loc_033004
	move.b #1,($cc,a6)

loc_033004:
	rts


;==============================================
loc_033006:
	move.b ($125,a5),d0
	or.b ($15c,a5),d0
	bne.b loc_03302a
	move.l ($40,a6),d0
	add.l d0,($10,a6)
	move.l ($44,a6),d0
	add.l d0,($14,a6)
	bsr.w loc_033210
	jsr loc_01b490

loc_03302a:
	jmp loc_01b4d0

;==============================================
loc_033030:
	moveq #0,d0
	move.b ($125,a5),d0
	or.b ($15c,a5),d0
	bne.b loc_033048
	move.b (6,a6),d0
	move.w loc_03304e(pc,d0.w),d1
	jsr loc_03304e(pc,d1.w)

loc_033048:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03304e:
	dc.w loc_033052-loc_03304e
	dc.w loc_033060-loc_03304e

;----------------------------------------------
loc_033052:
	addq.b #2,(6,a6)
	move.b #2,($3a,a6)
	bra.w loc_033210

;----------------------------------------------
loc_033060:
	subq.b #1,($3a,a6)
	bne.b loc_033072
	move.b #1,(a6)
	move.l #$2000000,(4,a6)

loc_033072:
	rts

;==============================================
loc_033074:
	move.b ($125,a5),d0
	or.b ($15c,a5),d0
	bne.b loc_03308a
	move.b (6,a6),d0
	move.w loc_0330a0(pc,d0.w),d1
	jsr loc_0330a0(pc,d1.w)

loc_03308a:
	move.l #$2492492,d1
	move.b ($3a,a6),d0
	btst.l d0,d1
	beq.b loc_03309e
	jmp loc_01b4d0

loc_03309e:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0330a0:
	dc.w loc_0330a4-loc_0330a0
	dc.w loc_0330b2-loc_0330a0

;----------------------------------------------
loc_0330a4:
	addq.b #2,(6,a6)
	move.b #$18,($3a,a6)
	bra.w loc_033210

;----------------------------------------------
loc_0330b2:
	subq.b #1,($3a,a6)
	bpl.b loc_0330c0
	move.l #$6000000,(4,a6)

loc_0330c0:
	bra.w loc_033210

;==============================================
loc_0330c4:
	move.b ($125,a5),d0
	or.b ($15c,a5),d0
	bne.b loc_0330da
	move.b (6,a6),d0
	move.w loc_0330e0(pc,d0.w),d1
	jsr loc_0330e0(pc,d1.w)

loc_0330da:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0330e0:
	dc.w loc_0330e4-loc_0330e0
	dc.w loc_0330fe-loc_0330e0

;----------------------------------------------
loc_0330e4:
	addq.b #2,(6,a6)
	eori.b #1,($b,a6)
	jsr loc_0979fa
	move.b #2,($3a,a6)
	bra.w loc_033210

;----------------------------------------------
loc_0330fe:
	subq.b #1,($3a,a6)
	bne.b loc_03311c
	move.b #1,(a6)
	move.l #$2000000,(4,a6)
	neg.l ($40,a6)
	neg.l ($48,a6)
	clr.l ($44,a6)

loc_03311c:
	bra.w loc_033210

;==============================================
loc_033120:
	move.b ($125,a5),d0
	or.b ($15c,a5),d0
	bne.b loc_033136
	move.b (6,a6),d0
	move.w loc_03313c(pc,d0.w),d1
	jsr loc_03313c(pc,d1.w)

loc_033136:
	jmp loc_01b4d0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03313c:
	dc.w loc_033140-loc_03313c
	dc.w loc_033164-loc_03313c

;----------------------------------------------
loc_033140:
	addq.b #2,(6,a6)
	eori.b #1,($b,a6)
	jsr loc_0979fa
	move.b #2,($3a,a6)
	move.b ($70,a6),d0
	bmi.b loc_033160
	bra.w loc_0331d0

loc_033160:
	bra.w loc_033210

;----------------------------------------------
loc_033164:
	subq.b #1,($3a,a6)
	bpl.b loc_03318c
	move.b #1,(a6)
	move.l #$2000000,(4,a6)
	neg.l ($40,a6)
	neg.l ($48,a6)
	move.b ($72,a6),d0
	ext.w d0
	add.w d0,d0
	move.l loc_033190(pc,d0.w),($44,a6)

loc_03318c:
	bra.w loc_033210

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_033190:
	dc.l $00018000,$00020000,$00028000,$00028000
	dc.l $00028000,$00028000,$00028000,$00028000
	dc.l $00028000,$00028000,$00028000,$00018000
	dc.l $00020000,$00028000,$00028000,$00028000

;==============================================
loc_0331d0:
	move.b (2,a6),d1
	ext.w d1
	lsl.w #2,d1
	lea.l loc_03327a(pc),a0
	movea.l (a0,d1.w),a0
	andi.w #$ff,d0
	add.w d0,d0
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0

loc_0331ee:
	move.l a0,($1c,a6)
	move.l (a0),($32,a6)
	moveq #0,d0
	move.b (8,a0),d0
	lsl.w #2,d0
	movea.l ($88,a6),a0
	lea.l (a0,d0.w),a0
	move.l a0,($8c,a6)
	move.l (a0),($c8,a6)
	rts

;==============================================
loc_033210:
	subq.b #1,($32,a6)
	bne.b loc_033238
	movea.l ($1c,a6),a0
	move.b (1,a0),d0
	beq.b loc_033228
	bmi.b loc_03322e
	btst #6,d0
	bne.b loc_033234

loc_033228:
	lea.l ($14,a0),a0
	bra.b loc_0331ee

loc_03322e:
	movea.l ($14,a0),a0
	bra.b loc_0331ee

loc_033234:
	st.b ($33,a6)

loc_033238:
	rts

;==============================================
loc_03323a:
	movea.l ($60,a6),a0
	move.w (a0),d0
	lea.l (a0,d0.w),a1
	move.l a1,($90,a6)
	move.w (2,a0),d0
	lea.l (a0,d0.w),a1
	move.l a1,($94,a6)
	move.w (4,a0),d0
	lea.l (a0,d0.w),a1
	move.l a1,($98,a6)
	move.w (6,a0),d0
	lea.l (a0,d0.w),a1
	move.l a1,($9c,a6)
	move.w (8,a0),d0
	lea.l (a0,d0.w),a1
	move.l a1,($a0,a6)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03327a:
	dc.l loc_14aec0,loc_157994,loc_161a32,loc_16cb5c
	dc.l loc_17b76e,loc_250a4e,loc_1cf420,$00000000
	dc.l $00000000,loc_1c0994,loc_1cf420,loc_1e3c8c
	dc.l loc_1edabc,loc_1f6dc2,loc_204474,loc_212eae
	dc.l loc_220f6c,$00000000,$00000000,$00000000
	dc.l loc_14aec0,loc_17be58,loc_1c0994,loc_1c0994
	dc.l loc_204474,loc_212eae,loc_14aec0,loc_212eae
	dc.l loc_212eae,loc_23cd3c,loc_212eae,loc_204474
	dc.l loc_25adda,loc_276bc6,$00000000,loc_1cf420
	dc.l loc_276bc6

;==============================================
loc_03330e:
	lea.l ($3000,a5),a6
	move.b #$20,($b5,a5)

loc_033318:
	tst.b (a6)
	beq.b loc_033330
	moveq #0,d0
	move.b (2,a6),d0
	add.w d0,d0
	add.w d0,d0
	movea.l loc_03333c(pc,d0.w),a0
	moveq #0,d0
	moveq #0,d7
	jsr (a0)

loc_033330:
	lea.l ($80,a6),a6
	subq.b #1,($b5,a5)
	bne.b loc_033318
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03333c:
	dc.l loc_07ffbe,loc_080186,loc_0802de,loc_0803c0
	dc.l loc_08076a,loc_080d6a,loc_08114a,loc_082a60
	dc.l loc_08332e,loc_08351c,loc_0838c2,loc_083cb8
	dc.l loc_083f36,loc_084c98,loc_08405c,loc_0859b2
	dc.l loc_085b14,loc_08b28a,loc_08b3e8,loc_08db0a

	dc.l loc_090266,loc_0902de,loc_090dca,loc_09152e
	dc.l loc_091866,loc_091d36,loc_091f68,loc_092ef8
	dc.l loc_0931c4,loc_093752,loc_09380e,loc_09393a
	dc.l loc_0939b6,loc_093a56,loc_093b22,loc_094074
	dc.l loc_094c78,loc_09527e,loc_095326,loc_0964fe
	dc.l loc_09706c,loc_0972e4,loc_097b3e,loc_097c0e
	dc.l loc_097e06,loc_097ee6,loc_09806a,loc_0981a2
	dc.l loc_098392

	dc.l loc_0a0204,loc_0a03d8,loc_0a0a90
	dc.l loc_0a0b9a,loc_0a0c96,loc_0a0d02,loc_0a0d22
	dc.l loc_0a38f2,loc_0a39d2,loc_0a3fb4,loc_0a42fa
	dc.l loc_0a488a,loc_0a490c,loc_0a4b90,loc_0a4fb8
	dc.l loc_0a5068,loc_0a510c,loc_0a51f6,loc_03351c
	dc.l loc_03351c,loc_03351c,loc_0a57f6,loc_03351c
	dc.l loc_0a5ab8,loc_0a6284,loc_0a7464,loc_0a7562
	dc.l loc_0aa90c,loc_0aaa14,loc_0aacac,loc_0aae04
	dc.l loc_0ac15e

	dc.l loc_03351c,loc_03351c,loc_03351c
	dc.l loc_03351c,loc_03351c,loc_03351c,loc_03351c
	dc.l loc_03351c,loc_03351c,loc_03351c,loc_03351c
	dc.l loc_03351c,loc_03351c,loc_03351c,loc_03351c
	dc.l loc_03351c,loc_03351c,loc_03351c,loc_03351c
	dc.l loc_03351c,loc_03351c,loc_03351c,loc_03351c
	dc.l loc_03351c,loc_03351c,loc_03351c,loc_03351c
	dc.l loc_03351c,loc_03351c,loc_03351c,loc_03351c
	dc.l loc_03351c,loc_03351c,loc_03351c,loc_03351c
	dc.l loc_03351c,loc_03351c,loc_03351c

	dc.l loc_0acf00

;==============================================
loc_03351c:
	jmp loc_01c2de

;==============================================
loc_033522:
	lea.l ($4800,a5),a6
	move.b #$10,($b5,a5)

loc_03352c:
	tst.b (a6)
	beq.b loc_033544
	moveq #0,d0
	move.b (2,a6),d0
	add.w d0,d0
	add.w d0,d0
	movea.l loc_033550(pc,d0.w),a0
	moveq #0,d0
	moveq #0,d7
	jsr (a0)

loc_033544
	lea.l ($80,a6),a6
	subq.b #1,($b5,a5)
	bne.b loc_03352c
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_033550:
	dc.l loc_0b078e,loc_0b0830,loc_0b08d2,loc_0b0982
	dc.l loc_0b0a24,loc_0b0b32,loc_0b0bd4,loc_0b0c8a
	dc.l loc_0b0d2c,loc_0b0de2,loc_0b10ea,loc_0b11c2
	dc.l loc_0b127e,loc_0b131e,loc_0b13c0,loc_0b146e
	dc.l loc_0b1550,loc_0b15f2,loc_0b16a4,loc_0b173c
	dc.l loc_0b1f10,loc_0b20b8,$0000000c,$0000000c
	dc.l $0000000c,loc_0b221c,$0000000c,loc_0b22f4
	dc.l $0000000c,$0000000c,loc_0b23ea,loc_0b24e0
	dc.l loc_0b25d0,loc_0b2768,loc_0b2af0,loc_0b2d2a

;==============================================
loc_0335e0:
	lea.l ($4000,a5),a6
	move.b #$10,($b5,a5)

loc_0335ea:
	tst.b (a6)
	beq.b loc_033602
	moveq #0,d0
	move.b (2,a6),d0
	add.w d0,d0
	add.w d0,d0
	movea.l loc_03360e(pc,d0.w),a0
	moveq #0,d0
	moveq #0,d7
	jsr (a0)

loc_033602:
	lea.l ($80,a6),a6
	subq.b #1,($b5,a5)
	bne.b loc_0335ea
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03360e:
	dc.l loc_0ad518,loc_0ad590,loc_0ad60e,loc_0ad882
	dc.l loc_0adac4,loc_0add60,loc_0addea,loc_0ade5c
	dc.l loc_0aded8,loc_0adfa4,loc_0ae020,loc_0ae166
	dc.l loc_0ae230,loc_0ae720,loc_0ae764,loc_0ae832
	dc.l loc_0ae880,loc_0ae9aa,loc_0aec4e,loc_0aed8a
	dc.l loc_0aedf2,loc_0aef0a,loc_0aeffa,loc_0af2fc
	dc.l loc_0af39a,loc_0af40c,loc_0af4b2,loc_0af696
	dc.l loc_0af818,loc_0afa48,loc_0afb78,loc_0afe38
	dc.l loc_0aff98,loc_0b037a

;==============================================
loc_033696:
	lea.l ($2c00,a5),a6
	move.b #$8,($b5,a5)

loc_0336a0:
	tst.b (a6)
	beq.b loc_0336b6
	moveq #0,d0
	move.b (2,a6),d0
	add.w d0,d0
	add.w d0,d0
	movea.l loc_0336c2(pc,d0.w),a0
	moveq #0,d0
	jsr (a0)

loc_0336b6:
	lea.l ($80,a6),a6
	subq.b #1,($b5,a5)
	bne.b loc_0336a0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0336c2:
	dc.l loc_07c4c2,loc_07cf3c
	dc.l loc_07e506,loc_07ee5c
	dc.l loc_07f480

;==============================================
;Title Screen
loc_0336d6:
	lea.l ($5000,a5),a6
	move.b #7,($b5,a5)

loc_0336e0:
	tst.b (a6)
	beq.b loc_0336f8
	moveq #0,d0
	move.b (2,a6),d0
	add.w d0,d0
	add.w d0,d0
	movea.l loc_033704(pc,d0.w),a0
	moveq #0,d0
	moveq #0,d7
	jsr (a0)

loc_0336f8:
	lea.l ($200,a6),a6
	subq.b #1,($b5,a5)
	bne.b loc_0336e0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Title Screen Render Table
loc_033704:
	dc.l loc_0b2f26,loc_0b382e,loc_0b3b38,loc_0b4440
	dc.l loc_0b4ba0,loc_0b4df2,loc_0b8e88,loc_033744
	dc.l loc_0bb210,loc_0bb31c,loc_033744,loc_033744
	dc.l loc_033744,loc_033744,loc_033744,loc_0bd970

;==============================================
loc_033744:
	rts

;==============================================
loc_033746:
	lea.l ($5e00,a5),a6
	tst.b (a6)
	beq.b loc_033762
	moveq #0,d0
	move.b (2,a6),d0
	add.w d0,d0
	add.w d0,d0
	movea.l loc_033764(pc,d0.w),a0
	moveq #0,d0
	moveq #0,d7
	jmp (a0)

loc_033762:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_033764:
	dc.l loc_03376c,loc_033bc0

;==============================================
loc_03376c:
	move.b (4,a6),d0
	move.w loc_033778(pc,d0.w),d1
	jmp loc_033778(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_033778:
	dc.w loc_033780-loc_033778
	dc.w loc_03385c-loc_033778
	dc.w loc_033ba4-loc_033778
	dc.w loc_033ba4-loc_033778

;==============================================
loc_033780:
	addq.b #2,(4,a6)
	move.b #1,(1,a6)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.b d0,($e,a6)
	move.b d0,($f,a6)
	move.w d0,($26,a6)
	move.b d0,($3c,a6)
	move.w d0,($12,a6)
	move.b d0,($10,a6)
	move.b #$a,($11,a6)
	lea.l (p3memory,a5),a0
	cmpi.w #6,($138,a5)
	beq.b loc_0337cc
	lea.l (p1memory,a5),a0
	tst.b ($130,a5)
	beq.b loc_0337cc
	lea.l (p2memory,a5),a0

loc_0337cc:
	bsr.w loc_03383a
	lea.l loc_033f66(pc),a3
	lea.l ($20,a6),a4
	moveq #5,d6

loc_0337da:
	move.b #1,(a4)
	move.b #1,(1,a4)
	move.w (a3)+,(2,a4)
	move.w (a3)+,(4,a4)
	move.b (a3)+,($e,a4)
	move.b (a3)+,($f,a4)
	move.w (a3)+,d0
	cmpi.b #$c,d0
	bcc.b loc_033800
	add.w d4,d0
	bra.b loc_03380e

loc_033800:
	tst.b ($89,a5)
	beq.b loc_03380e
	cmpi.b #$e,d0
	bne.b loc_03380e
	moveq #$f,d0

loc_03380e:
	bsr.w loc_033f48
	lea.l ($10,a4),a4
	dbra d6,loc_0337da
	movea.l #loc_35f114,a0
	lsl.w #5,d5
	lea.l (a0,d5.w),a0
	lea.l $90c3c0,a1
	moveq #0,d7
	jsr loc_01fd9e
	jmp loc_00b522

;==============================================
;Ism Check for Ism Transition ;4D White, 4E Red, 4F Green, 50 Blue
loc_03383a:
	moveq #0,d4
	moveq #$4e,d5
	tst.b (PL_ism_choice,a0)
	bmi.b loc_03385a
	moveq #6,d4
	moveq #$50,d5
	tst.b (PL_ism_choice,a0)
	bne.b loc_03385a
	moveq #$3,d4
	moveq #$4f,d5
	tst.b ($89,a5)
	beq.b loc_03385a
	moveq #9,d4

loc_03385a:
	rts

;==============================================
loc_03385c:
	move.b (5,a6),d0
	move.w loc_033868(pc,d0.w),d1
	jmp loc_033868(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_033868:
	dc.w loc_03387c-loc_033868
	dc.w loc_033996-loc_033868
	dc.w loc_033a00-loc_033868
	dc.w loc_033a18-loc_033868
	dc.w loc_033a4c-loc_033868
	dc.w loc_033a96-loc_033868
	dc.w loc_033aaa-loc_033868
	dc.w loc_033ac2-loc_033868

	dc.w loc_033b00-loc_033868
	dc.w loc_033b44-loc_033868

;----------------------------------------------
loc_03387c:
	jsr loc_00af50
	bne.w loc_033b6a
	moveq #0,d0
	moveq #0,d1
	moveq #0,d2
	move.b ($13,a6),d0
	move.b loc_0338c8(pc,d0.w),d1
	lea.l (a6,d1.w),a4
	bsr.w loc_0338d0
	bne.b loc_0338c4
	subq.b #1,($11,a6)
	bpl.b loc_0338c4
	moveq #0,d0
	move.b ($13,a6),d0
	addq.b #1,($13,a6)
	move.b loc_0338c8+4(pc,d0.w),($11,a6)
	bpl.b loc_0338c4
	addq.b #2,(5,a6)
	moveq #0,d0
	move.w d0,($12,a6)
	move.w d0,($10,a6)

loc_0338c4:
	bra.w loc_033916

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0338c8:
	dc.b $20,$30,$40,$00
	dc.b $01,$0a,$ff,$ff

;----------------------------------------------
loc_0338d0:
	tst.b (1,a4)
	beq.b loc_033906
	subq.b #1,($10,a6)
	bpl.b loc_033908
	moveq #0,d0
	move.b ($12,a6),d0
	addq.b #2,($12,a6)
	move.b loc_03390c(pc,d0.w),d1
	move.b loc_03390c+1(pc,d0.w),($f,a4)
	move.b d1,($10,a6)
	bpl.b loc_033908
	moveq #0,d0
	move.b d0,(1,a4)
	move.b d0,($12,a6)
	move.w #$9280,($48,a5)

loc_033906:
	rts

loc_033908:
	moveq #1,d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_03390c:
	dc.b $01,$08,$02,$10,$02,$20,$02,$30
	dc.b $ff,$1e

;----------------------------------------------
loc_033916:
	lea.l ($20,a6),a4
	moveq #2,d6

loc_03391c:
	moveq #0,d0
	move.b ($f,a4),d0
	tst.b ($e,a4)
	bpl.b loc_03392a
	neg.w d0

loc_03392a:
	add.w (4,a4),d0
	tst.b (1,a4)
	bne.b loc_033946
	tst.w d0
	bpl.b loc_03393c
	addi.w #$f0,d0

loc_03393c:
	cmpi.w #$f0,d0
	blt.b loc_033946
	subi.w #$f0,d0

loc_033946:
	andi.w #$3ff,d0
	move.w d0,($4,a4)
	lea.l ($10,a4),a4
	dbra d6,loc_03391c
	moveq #2,d6

loc_033958:
	moveq #0,d0
	move.b ($f,a4),d0
	tst.b ($e,a4)
	bpl.b loc_033966
	neg.w d0

loc_033966:
	add.w (2,a4),d0
	tst.b (1,a4)
	bne.b loc_033984
	cmpi.w #$40,d0
	bge.b loc_03397a
	addi.w #$190,d0

loc_03397a:
	cmpi.w #$1d0,d0
	blt.b loc_033984
	subi.w #$190,d0

loc_033984:
	andi.w #$3ff,d0
	move.w d0,(2,a4)
	lea.l ($10,a4),a4
	dbra d6,loc_033958
	rts

;----------------------------------------------
loc_033996:
	jsr loc_00af50
	bne.w loc_033b6a
	subq.b #1,($10,a6)
	bpl.b loc_0339f6
	moveq #0,d0
	move.b ($12,a6),d0
	addq.b #2,($12,a6)
	move.b loc_0339fa(pc,d0.w),d1
	move.b loc_0339fa+1(pc,d0.w),d2
	lea.l ($20,a6),a4
	moveq #2,d6

loc_0339be:
	move.b d2,($f,a4)
	lea.l ($10,a4),a4
	dbra d6,loc_0339be
	move.b d1,($10,a6)
	bpl.b loc_0339f6
	addq.b #2,(5,a6)
	move.b #6,($10,a6)
	lea.l loc_033fbe(pc),a0
	lea.l ($20,a6),a4
	moveq #2,d6

loc_0339e4:
	move.w (a0)+,(2,a4)
	move.w (a0)+,(4,a4)
	lea.l ($10,a4),a4
	dbra d6,loc_0339e4
	rts

loc_0339f6:
	bra.w loc_033916

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0339fa:
	dc.b $01,$18,$01,$10,$ff,$08

;----------------------------------------------
loc_033a00:
	jsr loc_00af50
	bne.w loc_033b6a
	subq.b #1,($10,a6)
	bpl.b loc_033a14
	addq.b #2,(5,a6)

loc_033a14:
	bra.w loc_033916

;----------------------------------------------
loc_033a18:
	jsr loc_00af50
	bne.w loc_033b6a
	addq.b #2,(5,a6)
	move.b #4,($10,a6)
	lea.l ($20,a6),a4
	moveq #2,d6

loc_033a32:
	move.b ($f,a4),d0
	add.b d0,d0
	move.b d0,($f,a4)
	eori.b #$ff,($e,a4)
	lea.l ($10,a4),a4
	dbra d6,loc_033a32
	rts

;----------------------------------------------
loc_033a4c:
	jsr loc_00af50
	bne.w loc_033b6a
	subq.b #1,($10,a6)
	bpl.b loc_033a92
	addq.b #2,(5,a6)
	clr.w ($12,a6)
	move.w #whiteflash,(palrampointer,a5)
	move.w #$9280,($48,a5)
	lea.l loc_033fbe(pc),a0
	lea.l ($20,a6),a4
	moveq #5,d6

loc_033a7a:
	move.b #1,(1,a4)
	move.w (a0)+,(2,a4)
	move.w (a0)+,(4,a4)
	lea.l ($10,a4),a4
	dbra d6,loc_033a7a
	rts

loc_033a92:
	bra.w loc_033916

;----------------------------------------------
loc_033a96:
	addq.b #2,(5,a6)
	st.b ($f,a6)
	move.b #1,($10,a6)
	jmp loc_00353e

;----------------------------------------------
loc_033aaa:
	subq.b #1,($10,a6)
	bpl.b loc_033ac0
	addq.b #2,($5,a6)
	move.w #Mainpalette,(palrampointer,a5)
	jmp loc_00b522

loc_033ac0:
	rts

;----------------------------------------------
loc_033ac2:
	moveq #0,d0
	move.b ($12,a6),d0
	addq.b #1,($12,a6)
	move.b loc_033af2(pc,d0.w),d1
	bne.b loc_033adc
	addq.b #2,(5,a6)
	move.b #$17,($10,a6)

loc_033adc:
	ext.w d1
	lea.l ($20,a6),a4
	moveq #5,d6

loc_033ae4:
	add.w d1,(4,a4)
	lea.l ($10,a4),a4
	dbra d6,loc_033ae4
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_033af2:
	dc.b $f8,$08,$fc,$04,$fc,$04,$fe,$02
	dc.b $fe,$02,$fe,$02,$00,$00

;----------------------------------------------
loc_033b00:
	jsr loc_00af50
	bne.b loc_033b0e
	subq.b #1,($10,a6)
	bpl.b loc_033b42

loc_033b0e:
	addq.b #2,(5,a6)
	move.b #$13,($10,a6)
	clr.b ($60,a6)
	clr.b ($70,a6)
	lea.l ($50,a6),a4
	move.w #$100,(2,a4)
	move.w #$80,(4,a4)
	moveq #$36,d0
	movea.l #loc_2f3b20,a0
	bsr.w loc_033f54
	jmp loc_00b5d0

loc_033b42:
	rts

;----------------------------------------------
loc_033b44:
	lea.l ($20,a6),a4
	moveq #3,d6

loc_033b4a:
	bsr.w loc_033f1e
	tst.b ($7,a4)
	bpl.b loc_033b56
	clr.b (a4)

loc_033b56:
 	lea.l ($10,a4),a4
 	dbra d6,loc_033b4a
 	subq.b #1,($10,a6)
 	bpl.b loc_033b68
 	addq.b #2,(4,a6)

loc_033b68:
	rts

;==============================================
loc_033b6a:
	move.b #$a,(5,a6)
	move.b #$c,($12,a6)
	move.w #whiteflash,(palrampointer,a5)
	move.w #$9280,($48,a5)
	lea.l loc_033fbe(pc),a0
	lea.l ($20,a6),a4
	moveq #5,d6

loc_033b8c:
	move.b #1,(1,a4)
	move.w (a0)+,(2,a4)
	move.w (a0)+,(4,a4)
	lea.l ($10,a4),a4
	dbra d6,loc_033b8c
	rts

;==============================================
loc_033ba4:
	moveq #0,d0
	move.l d0,(a6)
	move.l d0,(4,a6)
	move.l d0,(8,a6)
	move.l d0,($c,a6)
	move.b #$20,(8,a6)
	move.b d0,($8c,a5)
	rts

;==============================================
loc_033bc0:
	move.b (4,a6),d0
	move.w loc_033bcc(pc,d0.w),d1
	jmp loc_033bcc(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_033bcc:
	dc.w loc_033bd4-loc_033bcc
	dc.w loc_033c56-loc_033bcc
	dc.w loc_033ba4-loc_033bcc
	dc.w loc_033ba4-loc_033bcc

;----------------------------------------------
loc_033bd4:
	addq.b #2,(4,a6)
	move.w #Mainpalette,(palrampointer,a5)
	moveq #0,d0
	move.b d0,(9,a6)
	move.b d0,($b,a6)
	move.b d0,($e,a6)
	move.b d0,($f,a6)
	move.w d0,($26,a6)
	move.b d0,($3c,a6)
	move.b d0,(1,a6)
	move.w d0,($12,a6)
	move.b d0,($10,a6)
	move.l d0,($70,a6)
	move.l d0,($74,a6)
	move.l d0,($78,a6)
	move.l d0,($7c,a6)
	lea.l loc_033f96(pc),a3
	lea.l ($20,a6),a4
	moveq #4,d6

loc_033c1e:
	move.b #1,(a4)
	move.b #1,(1,a4)
	move.w (a3)+,(2,a4)
	move.w (a3)+,(4,a4)
	move.b (a3)+,($e,a4)
	move.b (a3)+,($f,a4)
	move.w (a3)+,d0
	bsr.w loc_033f48
	lea.l ($10,a4),a4
	dbra d6,loc_033c1e
	jmp loc_00b53e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_033c4c:
	dc.w $1d40,$1ea0,$2000,$2160,$22c0

;----------------------------------------------
loc_033c56:
	move.b (5,a6),d0
	move.w loc_033c62(pc,d0.w),d1
	jmp loc_033c62(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_033c62:
	dc.w loc_033c74-loc_033c62
	dc.w loc_033c7a-loc_033c62
	dc.w loc_033ca6-loc_033c62
	dc.w loc_033d90-loc_033c62
	dc.w loc_033e06-loc_033c62
	dc.w loc_033e3c-loc_033c62
	dc.w loc_033e80-loc_033c62
	dc.w loc_033ed6-loc_033c62

	dc.w loc_033ee8-loc_033c62

;----------------------------------------------
loc_033c74:
	addq.b #2,(5,a6)
	rts

;----------------------------------------------
loc_033c7a:
	addq.b #2,(5,a6)
	move.b #1,(1,a6)
	move.w ($176,a5),d0
	add.w d0,d0
	move.w loc_033c4c(pc,d0.w),d0
	movea.l #loc_35cc34,a0
	lea.l (a0,d0.w),a0
	lea.l $90c3c0,a1
	moveq #0,d7
	jmp loc_01fd9e

;----------------------------------------------
loc_033ca6:
	bsr.w loc_033cc4
	bne.b loc_033cc0
	addq.b #2,(5,a6)
	jsr loc_003c7a
	moveq #0,d0
	move.w d0,($12,a6)
	move.w d0,($10,a6)

loc_033cc0:
	bra.w loc_033d10

;==============================================
loc_033cc4:
	tst.b ($41,a6)
	beq.b loc_033d06
	subq.b #1,($10,a6)
	bpl.b loc_033d08
	moveq #0,d0
	move.b ($12,a6),d0
	addq.b #2,($12,a6)
	move.b loc_033d0c(pc,d0.w),d1
	move.b loc_033d0c+1(pc,d0.w),d2
	move.b d2,($4f,a6)
	move.b d2,($5f,a6)
	move.b d2,($6f,a6)
	move.b d1,($10,a6)
	bpl.b loc_033d08
	moveq #0,d0
	move.b d0,($41,a6)
	move.b d0,($51,a6)
	move.b d0,($61,a6)
	move.b d0,($12,a6)

loc_033d06:
	rts

loc_033d08:
	moveq #1,d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_033d0c
	dc.b $09,$1e,$ff,$1e

;==============================================
loc_033d10:
	lea.l ($20,a6),a4
	moveq #1,d6

loc_033d16:
	moveq #0,d0
	move.b ($f,a4),d0
	tst.b ($e,a4)
	bpl.b loc_033d24
	neg.w d0

loc_033d24:
	add.w (4,a4),d0
	tst.b (1,a4)
	bne.b loc_033d40
	tst.w d0
	bpl.b loc_033d36
	addi.w #$f0,d0

loc_033d36
	cmpi.w #$f0,d0
	blt.b loc_033d40
	subi.w #$f0,d0

loc_033d40:
	andi.w #$3ff,d0
	move.w d0,(4,a4)
	lea.l ($10,a4),a4
	dbra d6,loc_033d16
	moveq #2,d6

loc_033d52:
	moveq #0,d0
	move.b ($f,a4),d0
	tst.b ($e,a4)
	bpl.b loc_033d60
	neg.w d0

loc_033d60:
	add.w (2,a4),d0
	tst.b (1,a4)
	bne.b loc_033d7e
	cmpi.w #$40,d0
	bge.b loc_033d74
	addi.w #$190,d0

loc_033d74:
	cmpi.w #$1d0,d0
	blt.b loc_033d7e
	subi.w #$190,d0

loc_033d7e:
	andi.w #$3ff,d0
	move.w d0,(2,a4)
	lea.l ($10,a4),a4
	dbra d6,loc_033d52
	rts

;----------------------------------------------
loc_033d90:
	subq.b #1,($10,a6)
	bpl.b loc_033df2
	moveq #0,d0
	move.b ($12,a6),d0
	addq.b #4,($12,a6)
	move.b loc_033df6(pc,d0.w),d1
	move.b loc_033df6+1(pc,d0.w),d2
	move.b loc_033df6+2(pc,d0.w),d3
	move.b d2,($2f,a6)
	move.b d2,($3f,a6)
	move.b d3,($4f,a6)
	move.b d3,($5f,a6)
	move.b d3,($6f,a6)
	move.b d1,($10,a6)
	bpl.b loc_033df2
	addq.b #2,(5,a6)
	clr.w ($12,a6)
	move.b #3,($10,a6)
	rts

;==============================================
loc_033dd6:
	lea.l loc_033fde(pc),a0
	lea.l ($40,a6),a4
	moveq #2,d6

loc_033de0:
	move.w (a0)+,(2,a4)
	move.w (a0)+,(4,a4)
	lea.l ($10,a4),a4
	dbra d6,loc_033de0
	rts

loc_033df2:
	bra.w loc_033d10

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_033df6:
	dc.b $01,$30,$12,$00
	dc.b $01,$20,$0a,$00
	dc.b $01,$10,$04,$00
	dc.b $ff,$10,$04,$00

;----------------------------------------------
loc_033e06:
	subq.b #1,($10,a6)
	bpl.b loc_033e34
	addq.b #2,(5,a6)
	move.b #2,($10,a6)
	lea.l ($40,a6),a4
	moveq #2,d6

loc_033e1c:
	move.b ($f,a4),d0
	add.b d0,d0
	move.b d0,($f,a4)
	eori.b #$ff,($e,a4)
	lea.l ($10,a4),a4
	dbra d6,loc_033e1c

loc_033e34:
	rts

;----------------------------------------------
loc_033e36:
	rts

;----------------------------------------------
loc_033e38:
	bra.w loc_033d10

;----------------------------------------------
loc_033e3c:
	subq.b #1,($10,a6)
	bpl.b loc_033e6c
	addq.b #2,(5,a6)
	clr.w ($12,a6)
	lea.l loc_033fd6(pc),a0
	lea.l ($20,a6),a4
	moveq #4,d6

loc_033e54:
	move.b #1,(1,a4)
	move.w (a0)+,(2,a4)
	move.w (a0)+,(4,a4)
	lea.l ($10,a4),a4
	dbra d6,loc_033e54
	rts

loc_033e6c:
	bra.w loc_033d10

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_033e70:
	dc.b $f8,$08,$f8,$08,$fa,$06,$fa,$06
	dc.b $fc,$04,$fe,$02,$fe,$02,$00,$00

;----------------------------------------------
loc_033e80:
	moveq #0,d0
	move.b ($12,a6),d0
	addq.b #1,($12,a6)
	move.b loc_033e70(pc,d0.w),d1
	bne.b loc_033e9a
	addq.b #2,(5,a6)
	move.b #$20,($10,a6)

loc_033e9a:
	ext.w d1
	lea.l ($20,a6),a4
	moveq #1,d6

loc_033ea2:
	move.w d1,d0
	tst.b ($e,a4)
	bpl.b loc_033eac
	neg.w d0

loc_033eac:
	add.w d0,(4,a4)
	lea.l ($10,a4),a4
	dbra d6,loc_033ea2
	lea.l ($40,a6),a4
	moveq #2,d6

loc_033ebe:
	move.w d1,d0
	tst.b ($e,a4)
	bmi.b loc_033ec8
	neg.w d0

loc_033ec8:
	add.w d0,($2,a4)
	lea.l ($10,a4),a4
	dbra d6,loc_033ebe
	rts

;----------------------------------------------
loc_033ed6:
	subq.b #1,($10,a6)
	bpl.b loc_033ee6
	addq.b #2,(5,a6)
	move.b #$20,($10,a6)

loc_033ee6:
	rts

;----------------------------------------------
loc_033ee8:
	jsr loc_00af76
	bne.b loc_033ef6
	subq.b #1,($10,a6)
	bpl.b loc_033f04

loc_033ef6:
	addq.b #2,(4,a6)
	st.b ($8b,a5)
	move.b #1,($10f,a5)

loc_033f04:
	rts

;==============================================
loc_033f06:
	tst.b ($5e00,a5)
	bne.b loc_033f1a
	move.b #1,($5e00,a5)
	move.b d0,($5e02,a5)
	moveq #-1,d0
	rts

loc_033f1a:
	moveq #0,d0
	rts

;==============================================
loc_033f1e:
	subq.b #1,(6,a4)
	bne.b loc_033f46
	movea.l ($a,a4),a0
	move.b (1,a0),d0
	beq.b loc_033f36
	bmi.b loc_033f3c
	btst #6,d0
	bne.b loc_033f42

loc_033f36:
	lea.l (8,a0),a0
	bra.b loc_033f5c

loc_033f3c:
	movea.l (8,a0),a0
	bra.b loc_033f5c

loc_033f42:
	st.b (7,a4)

loc_033f46:
	rts

;==============================================
loc_033f48:
	andi.w #$ff,d0
	add.w d0,d0
	movea.l #loc_30975c,a0

loc_033f54:
	move.w (a0,d0.w),d0
	lea.l (a0,d0.w),a0

loc_033f5c:
	move.l a0,($a,a4)
	move.l (a0),(6,a4)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_033f66:
	dc.w $0040,$0300,$0000,$0000
	dc.w $00c0,$0100,$ff00,$0001
	dc.w $0140,$0300,$0000,$0002
	dc.w $02d8,$0048,$0000,$000c
	dc.w $01c0,$0070,$ff00,$000d
	dc.w $02d0,$0098,$0000,$000e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_033f96:
	dc.w $0040,$0350,$0000,$0013
	dc.w $0040,$01f0,$ff00,$0013
	dc.w $0308,$0060,$0000,$0010
	dc.w $0208,$0078,$ff00,$0011
	dc.w $0308,$0090,$0000,$0012

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_033fbe:
	dc.w $0040,$0000,$00c0,$0000,$0140,$0000
	dc.w $0058,$0048,$0040,$0070,$0050,$0098

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_033fd6:
	dc.w $0040,$0050,$0040,$00f0

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_033fde:
	dc.w $0088,$0060,$0088
	dc.w $0078,$0088,$0090

;==============================================
;Character Programming
	include 'Char/Ryu/program.asm'
	include 'Char/Ken/program.asm'
	include 'Char/Akuma/program.asm'
	include 'Char/Charlie/program.asm'
	include 'Char/Chun/program.asm'
	include 'Char/Adon/program.asm'
	include 'Char/Sodom/program.asm'
	include 'Char/Guy/program.asm'
	include 'Char/Birdie/program.asm'
	include 'Char/Rose/program.asm'
	include 'Char/Dict/program.asm'
	include 'Char/Sagat/program.asm'
	include 'Char/Dan/program.asm'

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;A2 roster
	include 'Char/Sakura/program.asm'
	include 'Char/Rolento/program.asm'
	include 'Char/Dhalsim/program.asm'

loc_054122:
	rts

	include 'Char/Zangief/program.asm'
	include 'Char/Gen/program.asm'

loc_05990c:
	rts

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
;A3 Roster
	include 'Char/Boxer/program.asm'
	include 'Char/Cammy/program.asm'

	include 'Char/EHonda/program.asm'
	include 'Char/Blanka/program.asm'
	include 'Char/Mika/program.asm'
	include 'Char/Cody/program.asm'

	include 'Char/Claw/program.asm'
	include 'Char/Karin/program.asm'
	include 'Char/Juli/program.asm'
	include 'Char/Juni/program.asm'

	include 'Char/ProjectileProgramming.asm'

;==============================================
	include 'bank/bank07.asm'
	include 'bank/bank08.asm'
	include 'bank/bank09.asm'
	include 'bank/bank0a.asm'
	include 'bank/bank0b.asm'
	include 'bank/bank0c.asm'
	include 'bank/bank0d.asm'

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
	include "DataBanks.asm"
