;Memory Labels
	include "memory/Network_Memory.68k"

;==============================================
Loc_Test_Network:
	tst.b (NetworkEnabled,a5)
	beq.b loc_002582
	bsr.b loc_002584
	bra.b loc_0025a8

loc_002582:
	rts

;==============================================
loc_002584:
	bsr.w loc_0025c4
	bne.w loc_002c86
	bsr.w loc_002640
	bsr.w loc_0026d4
	bsr.w loc_002768
	bsr.w loc_0027fc
	bsr.w loc_002890
	bsr.w loc_002924
	bra.w loc_0029b8

;==============================================
loc_0025a8:
	bsr.w loc_002a92
	bsr.w loc_002adc
	bsr.w loc_002b26
	bsr.w loc_002b78
	bsr.w loc_002bbc
	bsr.w loc_002c38
	bra.w loc_002c74

;==============================================
loc_0025c4:
	lea $661140,a0
	lea $662140,a1
	lea $663140,a2
	moveq #$1f,d6
	bsr.w loc_002a2c
	move.w loc_0025e4(pc,d3.w),d0
	jmp loc_0025e4(pc,d0.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0025e4:
	dc.w loc_0025f4-loc_0025e4
	dc.w loc_00263c-loc_0025e4
	dc.w loc_00263c-loc_0025e4
	dc.w loc_002610-loc_0025e4

	dc.w loc_00263c-loc_0025e4
	dc.w loc_0025f4-loc_0025e4
	dc.w loc_002602-loc_0025e4
	dc.w loc_00263c-loc_0025e4


;==============================================
loc_0025f4:
	lea $661140,a1
	lea $662140,a2
	bra.b loc_00261c

;==============================================
loc_002602:
	lea $662140,a1
	lea $663140,a2
	bra.b loc_00261c

;==============================================
loc_002610:
	lea $663140,a1
	lea $661140,a2

loc_00261c:
	lea loc_002f68(pc),a0
	move.w (Region,a5),d6
	lsl.w #4,d6
	lea (a0,d6.w),a0
	moveq #$1f,d6

loc_00262c:
	move.w (a1)+,d0
	cmp.b (a0)+,d0
	bne.b loc_00263c
	move.w d0,(a2)+
	dbra d6,loc_00262c
	moveq #0,d0
	rts

loc_00263c:
	moveq #-1,d0
	rts

;==============================================
loc_002640:
	lea $661020,a0
	lea $662020,a1
	lea $663020,a2
	moveq #3,d6
	bsr.w loc_002a2c
	move.w loc_002682(pc,d3.w),d0
	jsr loc_002682(pc,d0.w)
	lea $661020,a0
	movep.l (1,a0),d0
	cmpi.l #$f423f,d0
	bls.b loc_002680
	moveq #0,d1
	movep.l d1,($1,a0)
	movep.l d1,($1001,a0)
	movep.l d1,($2001,a0)

loc_002680:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_002682:
	dc.w loc_0026d2-loc_002682
	dc.w loc_002ca6-loc_002682
	dc.w loc_002ca6-loc_002682
	dc.w loc_0026be-loc_002682
	dc.w loc_002ca6-loc_002682
	dc.w loc_002692-loc_002682
	dc.w loc_0026a8-loc_002682
	dc.w loc_002ca6-loc_002682

;==============================================
loc_002692:
	move.l $661020,$662020
	move.l $661024,$662024
	rts

loc_0026a8:
	move.l $662020,$663020
	move.l $662024,$663024
	rts

loc_0026be:
	move.l $663020,$661020
	move.l $663024,$661024

loc_0026d2:
	rts

;==============================================
loc_0026d4:
	lea $661028,a0
	lea $662028,a1
	lea $663028,a2
	moveq #3,d6
	bsr.w loc_002a2c
	move.w loc_002716(pc,d3.w),d0
	jsr loc_002716(pc,d0.w)
	lea $661028,a0
	movep.l (1,a0),d0
	cmpi.l #$f423f,d0
	bls.b loc_002714
	moveq #0,d1
	movep.l d1,($1,a0)
	movep.l d1,($1001,a0)
	movep.l d1,($2001,a0)

loc_002714:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_002716:
	dc.w loc_002766-loc_002716
	dc.w loc_002cd4-loc_002716
	dc.w loc_002cd4-loc_002716
	dc.w loc_002752-loc_002716
	dc.w loc_002cd4-loc_002716
	dc.w loc_002726-loc_002716
	dc.w loc_00273c-loc_002716
	dc.w loc_002cd4-loc_002716

;==============================================
loc_002726:
	move.l $661028,$662028
	move.l $66102c,$66202c
	rts

loc_00273c:
	move.l $662028,$663028
	move.l $66202c,$66302c
	rts

loc_002752:
	move.l $663028,$661028
	move.l $66302c,$66102c

loc_002766:
	rts

;==============================================
loc_002768:
	lea $661030,a0
	lea $662030,a1
	lea $663030,a2
	moveq #3,d6
	bsr.w loc_002a2c
	move.w loc_0027aa(pc,d3.w),d0
	jsr loc_0027aa(pc,d0.w)
	lea $661030,a0
	movep.l (1,a0),d0
	move.l #$127a3980,d1
	cmp.l d1,d0
	bls.b loc_0027a8
	movep.l d1,(1,a0)
	movep.l d1,($1001,a0)
	movep.l d1,($2001,a0)

loc_0027a8:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0027aa:
	dc.w loc_0027fa-loc_0027aa
	dc.w loc_002d02-loc_0027aa
	dc.w loc_002d02-loc_0027aa
	dc.w loc_0027e6-loc_0027aa
	dc.w loc_002d02-loc_0027aa
	dc.w loc_0027ba-loc_0027aa
	dc.w loc_0027d0-loc_0027aa
	dc.w loc_002d02-loc_0027aa

;==============================================
loc_0027ba:
	move.l $661030,$662030
	move.l $661034,$662034
	rts

loc_0027d0:
	move.l $662030,$663030
	move.l $662034,$663034
	rts

loc_0027e6:
	move.l $663030,$661030
	move.l $663034,$661034

loc_0027fa:
	rts

;==============================================
loc_0027fc:
	lea $661038,a0
	lea $662038,a1
	lea $663038,a2
	moveq #3,d6
	bsr.w loc_002a2c
	move.w loc_00283e(pc,d3.w),d0
	jsr loc_00283e(pc,d0.w)
	lea $661038,a0
	movep.l (1,a0),d0
	move.l #$4f5880,d1
	cmp.l d1,d0
	bls.b loc_00283c
	movep.l d1,(1,a0)
	movep.l d1,($1001,a0)
	movep.l d1,($2001,a0)

loc_00283c:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00283e:
	dc.w loc_00288e-loc_00283e; No Error
	dc.w loc_002d30-loc_00283e;
	dc.w loc_002d30-loc_00283e; 
	dc.w loc_00287a-loc_00283e; 
	dc.w loc_002d30-loc_00283e;
	dc.w loc_00284e-loc_00283e;
	dc.w loc_002864-loc_00283e;
	dc.w loc_002d30-loc_00283e;

;==============================================
loc_00284e:
	move.l $661038,$662038
	move.l $66103c,$66203c
	rts

loc_002864:
	move.l $662038,$663038
	move.l $66203c,$66303c
	rts

loc_00287a:
	move.l $663038,$661038
	move.l $66303c,$66103c

loc_00288e:
	rts

;==============================================
loc_002890:
	lea $661040,a0
	lea $662040,a1
	lea $663040,a2
	moveq #3,d6
	bsr.w loc_002a2c
	move.w loc_0028d2(pc,d3.w),d0
	jsr loc_0028d2(pc,d0.w)
	lea $661040,a0
	movep.l (1,a0),d0
	move.l #$4f5880,d1
	cmp.l d1,d0
	bls.b loc_0028d0
	movep.l d1,(1,a0)
	movep.l d1,($1001,a0)
	movep.l d1,($2001,a0)

loc_0028d0:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0028d2:
	dc.w loc_002922-loc_0028d2
	dc.w loc_002d5e-loc_0028d2
	dc.w loc_002d5e-loc_0028d2
	dc.w loc_00290e-loc_0028d2
	dc.w loc_002d5e-loc_0028d2
	dc.w loc_0028e2-loc_0028d2
	dc.w loc_0028f8-loc_0028d2
	dc.w loc_002d5e-loc_0028d2

;==============================================
loc_0028e2:
	move.l $661040,$662040
	move.l $661044,$662044
	rts

loc_0028f8:
	move.l $662040,$663040
	move.l $662044,$663044
	rts

loc_00290e:
	move.l $663040,$661040
	move.l $663044,$661044

loc_002922:
	rts

;==============================================
loc_002924:
	lea $661048,a0
	lea $662048,a1
	lea $663048,a2
	moveq #3,d6
	bsr.w loc_002a2c
	move.w loc_002966(pc,d3.w),d0
	jsr loc_002966(pc,d0.w)
	lea $661048,a0
	movep.l (1,a0),d0
	move.l #$4f5880,d1
	cmp.l d1,d0
	bls.b loc_002964
	movep.l d1,(1,a0)
	movep.l d1,($1001,a0)
	movep.l d1,($2001,a0)

loc_002964:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_002966:
	dc.w loc_0029b6-loc_002966
	dc.w loc_002d8c-loc_002966
	dc.w loc_002d8c-loc_002966
	dc.w loc_0029a2-loc_002966
	dc.w loc_002d8c-loc_002966
	dc.w loc_002976-loc_002966
	dc.w loc_00298c-loc_002966
	dc.w loc_002d8c-loc_002966

;==============================================
loc_002976:
	move.l $661048,$662048
	move.l $66104c,$66204c
	rts

loc_00298c:
	move.l $662048,$663048
	move.l $66204c,$66304c
	rts

loc_0029a2:
	move.l $663048,$661048
	move.l $66304c,$66104c

loc_0029b6:
	rts

;==============================================
loc_0029b8:
	lea Cab0_Rng,a0
	lea Cab1_Rng,a1
	lea Cab2_Rng,a2
	moveq #1,d6
	bsr.w loc_002a2c
	move.w loc_0029f8(pc,d3.w),d0
	jsr loc_0029f8(pc,d0.w)
	lea Cab0_Rng,a0
	movep.w (1,a0),d0
	tst.w d0
	bne.b loc_0029f6
	move.w #RngSeed,d1; Set Rng seed now in the network code
	movep.w d1,(1,a0)
	movep.w d1,($1001,a0)
	movep.w d1,($2001,a0)

loc_0029f6:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0029f8:
	dc.w loc_002a2a-loc_0029f8 ; No Error
	dc.w Net_ResetRNG-loc_0029f8
	dc.w Net_ResetRNG-loc_0029f8 
	dc.w loc_002a20-loc_0029f8 ; C2 overwrites C0
	dc.w Net_ResetRNG-loc_0029f8
	dc.w loc_002a08-loc_0029f8 ; C0 overwrites C1
	dc.w loc_002a14-loc_0029f8 ; C1 overwrites C2
	dc.w Net_ResetRNG-loc_0029f8

;==============================================
;RNG OverWrites
;==============================================
loc_002a08:
	move.l Cab0_Rng,Cab1_Rng
	rts

loc_002a14:
	move.l Cab1_Rng,Cab2_Rng
	rts

loc_002a20:
	move.l Cab2_Rng,Cab0_Rng

loc_002a2a:
	rts

;==============================================
;Comparing Values between Cabs
;d3 returns with error
;	Bit 2 Cab 1&2 Error
;	Bit 4 Cab 1&3 Error
;	Bit 8 Cab 2&3 Error

;d6 range in words

;a0 Cab0 Address
;a1 Cab1 Address
;a2 Cab2 Address

;==============================================
loc_002a2c:
	moveq #0,d3

loc_002a2e:
	move.w (a0)+,d0
	move.w (a1)+,d1
	move.w (a2)+,d2
	cmp.b d0,d1
	beq.b loc_002a3c
	ori.w #2,d3

loc_002a3c:
	cmp.b d0,d2
	beq.b loc_002a44
	ori.w #4,d3

loc_002a44:
	cmp.b d1,d2
	beq.b loc_002a4c
	ori.w #8,d3

loc_002a4c:
	cmpi.w #$e,d3
	beq.b loc_002a56
	dbra d6,loc_002a2e

loc_002a56:
	rts

;==============================================
loc_002a58:
	tst.b (NetworkEnabled,a5)
	beq.b loc_002aa0
	lea $661020,a0
	movep.l (1,a0),d1
	addq.l #1,d1
	movep.l d1,(1,a0)
	lea $662020,a0
	movep.l (1,a0),d1
	addq.l #1,d1
	movep.l d1,(1,a0)
	lea $663020,a0
	movep.l (1,a0),d1
	addq.l #1,d1
	movep.l d1,(1,a0)
	bsr.w loc_002640

loc_002a92:
	lea $661020,a0
	movep.l (1,a0),d1
	move.l d1,(-$727e,a5)

loc_002aa0:
	rts

;==============================================
loc_002aa2:
	tst.b (NetworkEnabled,a5)
	beq.b loc_002aea
	lea $661028,a0
	movep.l (1,a0),d1
	addq.l #1,d1
	movep.l d1,(1,a0)
	lea $662028,a0
	movep.l (1,a0),d1
	addq.l #1,d1
	movep.l d1,(1,a0)
	lea $663028,a0
	movep.l (1,a0),d1
	addq.l #1,d1
	movep.l d1,(1,a0)
	bsr.w loc_0026d4

loc_002adc:
	lea $661028,a0
	movep.l (1,a0),d1
	move.l d1,(-$727a,a5)

loc_002aea:
	rts

;==============================================
loc_002aec:
	tst.b (NetworkEnabled,a5)
	beq.b loc_002b34
	lea $661030,a0
	movep.l (1,a0),d0
	addq.l #1,d0
	movep.l d0,(1,a0)
	lea $662030,a0
	movep.l (1,a0),d0
	addq.l #1,d0
	movep.l d0,(1,a0)
	lea $663030,a0
	movep.l (1,a0),d0
	addq.l #1,d0
	movep.l d0,(1,a0)
	bsr.w loc_002768

loc_002b26:
	lea.l $661030,a0
	movep.l (1,a0),d0
	move.l d0,(-$7276,a5)

loc_002b34:
	rts

;==============================================
loc_002b36:
	tst.b (NetworkEnabled,a5)
	beq.b loc_002b86
	tst.b ($9c,a5)
	beq.b loc_002b44
	bsr.b loc_002b88

loc_002b44:
	lea.l $661038,a0
	movep.l (1,a0),d1
	addq.l #1,d1
	movep.l d1,(1,a0)
	lea.l $662038,a0
	movep.l (1,a0),d1
	addq.l #1,d1
	movep.l d1,(1,a0)
	lea.l $663038,a0
	movep.l (1,a0),d1
	addq.l #1,d1
	movep.l d1,(1,a0)
	bsr.w loc_0027fc

loc_002b78
	lea.l $661038,a0
	movep.l (1,a0),d1
	move.l d1,(-$7272,a5)

loc_002b86:
	rts

;==============================================
loc_002b88:
	lea.l $661040,a0
	movep.l (1,a0),d1
	addq.l #1,d1
	movep.l d1,(1,a0)
	lea.l $662040,a0
	movep.l (1,a0),d1
	addq.l #1,d1
	movep.l d1,(1,a0)
	lea.l $663040,a0
	movep.l (1,a0),d1
	addq.l #1,d1
	movep.l d1,(1,a0)
	bsr.w loc_002890

loc_002bbc:
	lea.l $661040,a0
	movep.l (1,a0),d1
	move.l d1,(-$726e,a5)
	rts

;==============================================
loc_002bcc:
	tst.b (NetworkEnabled,a5)
	beq.b loc_002c46
	lea.l $661048,a0
	movep.l (1,a0),d1
	addq.l #1,d1
	movep.l d1,(1,a0)
	lea.l $662048,a0
	movep.l (1,a0),d1
	addq.l #1,d1
	movep.l d1,(1,a0)
	lea.l $663048,a0
	movep.l (1,a0),d1
	addq.l #1,d1
	movep.l d1,(1,a0)
	bsr.w loc_002924
	bra.b loc_002c38

loc_002c08:
	tst.b (NetworkEnabled,a5)
	beq.b loc_002c46
	moveq #0,d0
	move.l d0,$661048
	move.l d0,$66104c
	move.l d0,$662048
	move.l d0,$66204c
	move.l d0,$663048
	move.l d0,$66304c
	bsr.w loc_002924

loc_002c38:
	lea.l $661048,a0
	movep.l (1,a0),d1
	move.l d1,(-$726a,a5)

loc_002c46:
	rts

;==============================================
;Sharing Rng across 3 cabinets
loc_002c48:
	tst.b (NetworkEnabled,a5)
	beq.b loc_002c82
	move.w (RngByte0,a5),d0
	lea.l Cab0_Rng,a0
	movep.w d0,(1,a0)
	lea.l Cab1_Rng,a0
	movep.w d0,(1,a0)
	lea.l Cab2_Rng,a0
	movep.w d0,(1,a0)
	bsr.w loc_0029b8

loc_002c74:
	lea.l Cab0_Rng,a0
	movep.w (1,a0),d1
	move.w d1,(RngByte0,a5)

loc_002c82:
	rts


;==============================================
loc_002c84:
	rts

;==============================================
loc_002c86:
	bsr.w loc_002ca6
	bsr.w loc_002cd4
	bsr.w loc_002d02
	bsr.w loc_002d30
	bsr.w loc_002d5e
	bsr.w loc_002d8c
	bsr.w loc_002dda
	bra.w Net_ResetRNG

;==============================================
loc_002ca6:
	WATCHDOG
	moveq #0,d0
	move.l d0,$661020
	move.l d0,$661024
	move.l d0,$662020
	move.l d0,$662024
	move.l d0,$663020
	move.l d0,$663024
	rts

;==============================================
loc_002cd4:
	WATCHDOG
	moveq #0,d0
	move.l d0,$661028
	move.l d0,$66102c
	move.l d0,$662028
	move.l d0,$66202c
	move.l d0,$663028
	move.l d0,$66302c
	rts

;==============================================
loc_002d02:
	WATCHDOG
	moveq #0,d0
	move.l d0,$661030
	move.l d0,$661034
	move.l d0,$662030
	move.l d0,$662034
	move.l d0,$663030
	move.l d0,$663034
	rts

;==============================================
loc_002d30:
	WATCHDOG
	moveq #0,d0
	move.l d0,$661038
	move.l d0,$66103c
	move.l d0,$662038
	move.l d0,$66203c
	move.l d0,$663038
	move.l d0,$66303c
	rts

;==============================================
loc_002d5e:
	WATCHDOG
	moveq #0,d0
	move.l d0,$661040
	move.l d0,$661044
	move.l d0,$662040
	move.l d0,$662044
	move.l d0,$663040
	move.l d0,$663044
	rts

;==============================================
loc_002d8c:
	WATCHDOG
	moveq #0,d0
	move.l d0,$661048
	move.l d0,$66104c
	move.l d0,$662048
	move.l d0,$66204c
	move.l d0,$663048
	move.l d0,$66304c
	rts

;==============================================
;When more than 1 Cab has the wrong RNG
;Reset it for everyone
;==============================================
Net_ResetRNG:
	WATCHDOG
	move.l #Net_Reset_Rngseed,d0
	move.l d0,Cab0_Rng
	move.l d0,Cab1_Rng
	move.l d0,Cab2_Rng
	rts

;==============================================
loc_002dda:
	lea.l $661140,a0
	bsr.b loc_002df0
	lea.l $662140,a0
	bsr.b loc_002df0
	lea.l $663140,a0

loc_002df0:
	lea.l loc_002f68(pc),a1
	move.w (Region,a5),d6
	lsl.w #4,d6
	lea.l (a1,d6.w),a1
	moveq #$1f,d6
	moveq #0,d0

loc_002e02:
	move.b (a1)+,d0
	move.w d0,(a0)+
	WATCHDOG
	dbra d6,loc_002e02
	rts

;==============================================
loc_002e12:
	tst.b (NetworkEnabled,a5)
	beq.b loc_002e3e
	bsr.w loc_002ca6
	bsr.w loc_002cd4
	bsr.w loc_002d02
	bsr.w loc_002d30
	bsr.w loc_002d5e
	bsr.w loc_002d8c
	bsr.b Net_ResetRNG
	bsr.b loc_002dda
	WATCHDOG
	bra.w loc_0025a8

loc_002e3e:
	rts

;==============================================
loc_002e40:
	tst.b (NetworkEnabled,a5)
	beq.b loc_002e5c
	move.w $664000,d0
	btst #0,d0
	bne.b loc_002e5c
	bset #0,d0
	move.w d0,$664000

loc_002e5c:
	rts
