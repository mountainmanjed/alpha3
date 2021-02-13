;==============================================================================
loc_002578:
	tst.b ($86,a5)
	beq.b loc_002582
	bsr.b loc_002584
	bra.b loc_0025a8

loc_002582:
	rts

;==============================================================================
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

loc_0025a8:
	bsr.w loc_002a92
	bsr.w loc_002adc
	bsr.w loc_002b26
	bsr.w loc_002b78
	bsr.w loc_002bbc
	bsr.w loc_002c38
	bra.w loc_002c74


loc_0025c4:
	lea $661140,a0
	lea $662140,a1
	lea $663140,a2
	moveq #$1f,d6
	bsr.w loc_002a2c
	move.w loc_0025e4(pc,d3.w),d0
	jmp loc_0025e4(pc,d0.w)

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0025e4:
	dc.w loc_0025f4-loc_0025e4
	dc.w loc_00263c-loc_0025e4
	dc.w loc_00263c-loc_0025e4
	dc.w loc_002610-loc_0025e4

	dc.w loc_00263c-loc_0025e4
	dc.w loc_0025f4-loc_0025e4
	dc.w loc_002602-loc_0025e4
	dc.w loc_00263c-loc_0025e4


;==============================================================================
loc_0025f4:
	lea $661140,a1
	lea $662140,a2
	bra.b loc_00261c

;==============================================================================
loc_002602:
	lea $662140,a1
	lea $663140,a2
	bra.b loc_00261c

;==============================================================================
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

;==============================================================================
loc_002640:
	lea $661020,a0
	lea $662020,a1
	lea $663020,a2
	moveq #3,d6
	bsr.w loc_002a2c
	move.w loc_002682(pc,d3.w),d0
	jsr loc_002682(pc,d0.w)
	lea $661020.l,a0
	movep.l (1,a0),d0
	cmpi.l #$f423f,d0
	bls.b loc_002680
	moveq #0,d1
	movep.l d1,($1,a0)
	movep.l d1,($1001,a0)
	movep.l d1,($2001,a0)

loc_002680:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_002682:
	dc.w $0050,$0624,$0624,$003c
	dc.w $0624,$0010,$0026,$0624

;==============================================================================
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
	rts

;==============================================================================
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

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_002716:
	dc.w $0050,$05be,$05be,$003c,$05be,$0010,$0026,$05be

;==============================================================================
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
	rts

;==============================================================================
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

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0027aa:
	dc.w $0050,$0558,$0558,$003c,$0558,$0010,$0026,$0558

;==============================================================================
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
	rts

;==============================================================================
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

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_00283e:
	dc.w $0050,$04f2,$04f2,$003c,$04f2,$0010,$0026,$04f2

;==============================================================================
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
	rts

;==============================================================================
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

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0028d2:
	dc.w $0050,$048c,$048c,$003c,$048c,$0010,$0026,$048c

;==============================================================================
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
	rts

;==============================================================================
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

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_002966:
	dc.w $0050,$0426,$0426,$003c,$0426,$0010,$0026,$0426

;==============================================================================
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
	rts

;==============================================================================
loc_0029b8:
	lea $661200,a0
	lea $662200,a1
	lea $663200,a2
	moveq #1,d6
	bsr.w loc_002a2c
	move.w loc_0029f8(pc,d3.w),d0
	jsr loc_0029f8(pc,d0.w)
	lea $661200,a0
	movep.w (1,a0),d0
	tst.w d0
	bne.b loc_0029f6
	move.w #$1c3,d1
	movep.w d1,(1,a0)
	movep.w d1,($1001,a0)
	movep.w d1,($2001,a0)

loc_0029f6:
	rts

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_0029f8:
	dc.w $0032,$03c2,$03c2,$0028,$03c2,$0010,$001c,$03c2

;==============================================================================
loc_002a08:
	move.l $661200,$662200
	rts

loc_002a14:
	move.l $662200,$663200
	rts

loc_002a20:
	move.l $663200,$661200
	rts

;==============================================================================
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

;==============================================================================
loc_002a58:
	tst.b ($86,a5)
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

;==============================================================================
loc_002aa2:
	tst.b ($86,a5)
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

;==============================================================================
loc_002aec:
	tst.b ($86,a5)
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

;==============================================================================
loc_002b36:
	tst.b ($86,a5)
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

;==============================================================================
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

;==============================================================================
loc_002bcc:
	tst.b ($86,a5)
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
	tst.b ($86,a5)
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

;==============================================================================
loc_002c48:
	tst.b ($86,a5)
	beq.b loc_002c82
	move.w (RngByte0,a5),d0
	lea.l $661200,a0
	movep.w d0,(1,a0)
	lea.l $662200,a0
	movep.w d0,(1,a0)
	lea.l $663200,a0 
	movep.w d0,(1,a0)
	bsr.w loc_0029b8

loc_002c74:
	lea.l $661200,a0
	movep.w (1,a0),d1
	move.w d1,(RngByte0,a5)

loc_002c82:
	rts

loc_002c84:
	rts

;==============================================================================
loc_002c86:
	bsr.w loc_002ca6
	bsr.w loc_002cd4
	bsr.w loc_002d02
	bsr.w loc_002d30
	bsr.w loc_002d5e
	bsr.w loc_002d8c
	bsr.w loc_002dda
	bra.w loc_002dba

;==============================================================================
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

;==============================================================================
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

;==============================================================================
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

;==============================================================================
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

;==============================================================================
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

;==============================================================================
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

;==============================================================================
loc_002dba:
	WATCHDOG
	move.l #$100c3,d0
	move.l d0,$661200
	move.l d0,$662200
	move.l d0,$663200
	rts

;==============================================================================
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

;==============================================================================
loc_002e12:
	tst.b ($86,a5)
	beq.b loc_002e3e
	bsr.w loc_002ca6
	bsr.w loc_002cd4
	bsr.w loc_002d02
	bsr.w loc_002d30
	bsr.w loc_002d5e
	bsr.w loc_002d8c
	bsr.b loc_002dba
	bsr.b loc_002dda
	WATCHDOG
	bra.w loc_0025a8

loc_002e3e:
	rts

;==============================================================================
loc_002e40:
	tst.b ($86,a5)
	beq.b loc_002e5c
	move.w $664000,d0
	btst #0,d0
	bne.b loc_002e5c
	bset #0,d0
	move.w d0,$664000

loc_002e5c:
	rts
