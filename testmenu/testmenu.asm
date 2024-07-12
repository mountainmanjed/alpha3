;==============================================
;Start of test menu
;sample loc eb8a
;==============================================
loc_00dd7e:
	clr.b ($83,a5)
	clr.b ($ab,a5)
	jsr loc_0031ba
	move.b #1,($82,a5)
	clr.b ($181,a5)
	clr.b ($182,a5)
	jsr loc_01b0e6
	jsr loc_01bdd6
	bsr.w loc_010cc2
	move.w #$1b0e,($32,a5)
	move.w #$2461,($3a,a5)
	moveq #0,d0
	move.l d0,(0,a5)
	move.l d0,(4,a5)
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	move.w d0,(Main_stageid,a5)
	move.b d0,($8e,a5)
	move.b d0,(Active_Player,a5)
	move.b d0,($aa,a5)
	bsr.w loc_010ea4
	andi.b #$cc,($6b,a5)

loc_00ddea:
	moveq #1,d0

;debug code
;	tst.b (Dip_Debug_mode,a5)
;	beq.b sam_00ec0c
;	move.b (G_DebugDip_A,a5),d1
;	andi #$c0,d1
;	beq.b sam_00ec0c
;	rol.b #2,d1
;	lsl.w d1,d0

;sam_00ec0c
	jsr loc_001370
	move.w #$74,d0;ascii t
	moveq #$1e,d1
	jsr loc_00141a
	lea.l (-$6024,a5),a6
	move.w (0,a5),d0
	move.w loc_00de10(pc,d0.w),d0
	jsr loc_00de10(pc,d0.w)
	bra.b loc_00ddea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_00de10:
	dc.w loc_00de16-loc_00de10
	dc.w loc_00dea0-loc_00de10
	dc.w loc_00defe-loc_00de10

;==============================================
loc_00de16:
	addq.w #2,(0,a5)
	jsr loc_01b0e6
	bsr.w loc_010cc2
	move.w #Mainpalette,(palrampointer,a5)
	move.w #$90c0,(sub_palram,a5)
	move.b #$10,(a6)
	move.b #$10,(1,a6)
	moveq #0,d0
	move.w d0,($22,a5)
	move.w #$100,($24,a5)
	move.w d0,($26,a5)
	move.w #$300,($28,a5)
	move.w d0,($2a,a5)
	move.w #$700,($2c,a5)
	moveq #0,d0
	tst.w (Region,a5)
	bne.b loc_00de6a
	jsr loc_0168cc
	bra.b loc_00de70

loc_00de6a:
	jsr loc_01557c

loc_00de70:
	jsr loc_001b8e
	beq.b loc_00de9c
	tst.w (Region,a5)
	bne.b loc_00de8e
	lea.l $904264,a1
	moveq #$1d,d1
	moveq #1,d6
	bsr.w loc_010cb4
	bra.b loc_00de9c

loc_00de8e:
	lea.l $900948,a1
	moveq #$1d,d1
	moveq #$c,d6
	bsr.w loc_010ca6

loc_00de9c:
	bra.w render_menu_arrow


;==============================================
;
;==============================================
;sam_00ecc0
;	tst.b (Dip_Debug_mode,a5)
;	beq.b loc_00dea0
;	tst.b ($82,a5)
;	bpl.b loc_00dea0
;	jmp secret_test_start ;12368

loc_00dea0:
	bsr.w loc_010b64
	moveq #$10,d7
	move.w (4,a6),d6
	andi.w #$c,d6
	beq.b loc_00dedc
	bsr.w Clear_Menu_Arrow
	btst #3,d6
	beq.b loc_00dec4
	subq.w #2,(4,a5)
	bcc.b loc_00dec4
	move.w d7,(4,a5)

loc_00dec4:
	btst #2,d6
	beq.b loc_00ded8
	addq.w #2,(4,a5)
	cmp.w (4,a5),d7
	bcc.b loc_00ded8
	clr.w (4,a5)

loc_00ded8:
	bsr.w render_menu_arrow

loc_00dedc:
	btst.b #8,(6,a6)
	beq.b loc_00defc
	addq.w #2,(0,a5)
	moveq #0,d0
	move.l d0,(8,a5)
	move.l d0,($c,a5)
	move.l d0,($10,a5)
	move.l d0,($14,a5)
	rts

loc_00defc:
;	tst.b (Dip_Debug_mode,a5)
;	beq.b EndSecretCheck
;	move.w (INP_P1,a5),d0
;	andi.w #$600,d0
;	cmpi.w #$600,d0
;	bne.b EndSecretCheck
;	move.b #$ff.($82,a5)
;	moveq #0,d0
;	move.l d0,(8,a5)
;	move.l d0,($c,a5)
;	move.l d0,($10,a5)
;	move.l d0,($14,a5)

;EndSecretCheck
	rts

;==============================================
loc_00defe:
	move.w (4,a5),d0
	move.w ServiceMain_States(pc,d0.w),d1
	jmp ServiceMain_States(pc,d1.w)

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
ServiceMain_States:
	dc.w InputTest_Main-ServiceMain_States
	dc.w OutputTest_Main-ServiceMain_States
	dc.w SoundTest_Main-ServiceMain_States
	dc.w ColorBarTest_Main-ServiceMain_States
	dc.w DotCrossTest_Main-ServiceMain_States
	dc.w GameDataTest_Main-ServiceMain_States
	dc.w Configuration_Main-ServiceMain_States
	dc.w MemoryandRomCheck_Main-ServiceMain_States
	dc.w ExitService_Main-ServiceMain_States

;==============================================
Clear_Menu_Arrow:
	move.l #$200000,d1
	tst.w (Region,a5)
	bne.b loc_00df2e
	move.l #$6c200000,d1

loc_00df2e:
	movea.l ($c,a6),a1
	move.l d1,(a1)
	rts

;==============================================
render_menu_arrow:
	lea.l $900718,a1
	move.w (4,a5),d0
	lsl.w #2,d0
	move.l #$3e001f,d1
	tst.w (Region,a5)
	bne.b loc_00df68
	lea.l $90418c,a1
	move.w (4,a5),d0
	cmpi.w #$10,d0
	bne.b loc_00df60
	addq.w #2,d0

loc_00df60:
	add.w d0,d0
	move.l #$6d8c003f,d1

loc_00df68:
	lea.l (a1,d0.w),a1
	move.l a1,($c,a6)
	move.l d1,(a1)
	rts

;==============================================
;Code to Exit from Menus 
;loc df
;==============================================
ExitService_Main:
	moveq #0,d0
	move.w d0,(0,a5)
	move.w d0,(4,a5)
	move.w d0,(8,a5)
	move.w d0,($c,a5)
	move.w d0,($10,a5)
	move.w d0,($14,a5)
	move.b d0,($82,a5)
	move.b d0,($71,a5)
	move.b d0,($76,a5)
	move.b d0,($79,a5)
	move.b d0,($7e,a5)
	move.b d0,($6e,a5)
	move.b #1,($a9,a5)
	move.b d0,($181,a5)
	move.b d0,($182,a5)
	move.w #0,d0
	lea.l loc_003eba,a0
	jsr loc_001302
	jmp loc_001324

;==============================================
	include "testmenu/InputTest.68k"
	include "testmenu/OutputTest.68k"
	include "testmenu/SoundTest.68k"
	include "testmenu/Color_Bar.68k"
	include "testmenu/DotCross.68k"
	include "testmenu/Game_Data.68k"
	include "testmenu/ConfigMenu.68k"
	include "testmenu/MemoryCheck.68k"

;==============================================
;
;==============================================
loc_010b64:
	move.w (INP_P1,a5),d1
	move.w d1,d2
	move.w d1,d3
	andi.w #$c,d2
	bne.b loc_010b78
	move.b #$10,(a6)
	bra.b loc_010b7e

loc_010b78:
	subi.b #$10,(a6)
	beq.b loc_010b80

loc_010b7e:
	moveq #0,d2

loc_010b80:
	andi.w #3,d3
	bne.b loc_010b8e
	move.b #$10,(1,a6)
	bra.b loc_010b96

loc_010b8e:
	subi.b #$10,(1,a6)
	beq.b loc_010b98

loc_010b96:
	moveq #0,d3

loc_010b98:
	andi.w #$7f00,d1
	or.w d2,d1
	or.w d3,d1
	move.w d1,(4,a6)
	move.w (INP_P1_repeat,a5),d1
	not.w d1
	and.w (INP_P1,a5),d1
	move.w d1,(6,a6)
	rts

;==============================================
;
;==============================================
;sam_011e7a
loc_010bb4:
	move.w (INP_P2,a5),d1
	move.w d1,d2
	move.w d1,d3
	andi.w #$c,d2
	bne.b loc_010bca
	move.b #$10,(2,a6)
	bra.b loc_010bd2

loc_010bca:
	subi.b #$10,(2,a6)
	beq.b loc_010bd4

loc_010bd2:
	moveq #0,d2

loc_010bd4:
	andi.w #3,d3
	bne.b loc_010be2
	move.b #$10,(3,a6)
	bra.b loc_010bea

loc_010be2:
	subi.b #$10,(3,a6)
	beq.b loc_010bec

loc_010bea:
	moveq #0,d3

loc_010bec:
	andi.w #$7f00,d1
	or.w d2,d1
	or.w d3,d1
	move.w d1,(8,a6)
	move.w (INP_P2_repeat,a5),d1
	not.w d1
	and.w (INP_P2,a5),d1
	move.w d1,($a,a6)
	rts

;==============================================
;
;==============================================
loc_010c08:
	move.b ($60,a5),d0
	and.b (INP_P1,a5),d0
	btst #0,d0
	beq.b loc_010c70
	bsr.w loc_010f22
	beq.b loc_010c6c
	moveq #0,d1
	move.b loc_010c72(pc,d7.w),d1
	cmp.l ($ea,a5),d1
	bcs.b loc_010c6c
	moveq #0,d0
	move.b loc_010c76(pc,d7.w),d0
	cmp.b ($ef,a5),d0
	bne.b loc_010c6c
	move.l d1,($ea,a5)
	jsr loc_01b19c
	jsr loc_01b1ae
	moveq #$20,d0
	add.w d7,d0
	jsr loc_01557c
	moveq #1,d0
	jsr loc_0013f8
	jsr loc_001e24
	moveq #0,d0
	jsr loc_0013f8
	moveq #$60,d0
	jsr loc_001370

loc_010c6c:
	bra.w loc_010c88

loc_010c70:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_010c72:
	dc.w $101d,$329b

loc_010c76:
	dc.w $0001,$0203

;==============================================
loc_010c7a:
	move.b ($60,a5),d0
	and.b (INP_P1,a5),d0
	btst #0,d0
	beq.b loc_010ca4

loc_010c88:
	andi.b #$cc,($6b,a5)
	moveq #0,d0
	move.l d0,(0,a5)
	move.w d0,(Main_stageid,a5)
	move.w #$1b0e,($32,a5)
	move.w #$2461,($3a,a5)

loc_010ca4:
	rts

;==============================================
loc_010ca6:
	move.w d1,(2,a1)
	lea.l ($80,a1),a1
	dbra d6,loc_010ca6
	rts

;==============================================
loc_010cb4:
	move.w d1,(2,a1)
	lea.l ($40,a1),a1
	dbra d6,loc_010cb4
	rts

;==============================================
;sam_011fce
loc_010cc2:
	lea.l $90c7e0,a1
	movem.l loc_010d64(pc),d0-d7
	movem.l d0-d7,(a1)
	lea.l $90c720,a1
	movem.l loc_010d84(pc),d0-d7
	movem.l d0-d7,(a1)
	lea.l $90c7a0,a1
	movem.l loc_010da4(pc),d0-d7
	movem.l d0-d7,(a1)
	lea.l $90c7c0,a1
	movem.l loc_010dc4(pc),d0-d7
	movem.l d0-d7,(a1)
	lea.l $90c760,a1
	movem.l loc_010de4(pc),d0-d7
	movem.l d0-d7,(a1)
	lea.l $90cbe0,a1
	movem.l loc_010e04(pc),d0-d7
	movem.l d0-d7,(a1)
	lea.l $90cb20,a1
	movem.l loc_010e24(pc),d0-d7
	movem.l d0-d7,(a1)
	lea.l $90cba0,a1
	movem.l loc_010e44(pc),d0-d7
	movem.l d0-d7,(a1)
	lea.l $90cbc0,a1
	movem.l loc_010e64(pc),d0-d7
	movem.l d0-d7,(a1)
	lea.l $90cb60,a1
	movem.l loc_010e84(pc),d0-d7
	movem.l d0-d7,(a1)
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_010d64:
	dc.l $00000000,$0000fc60,$ff80fa40,$ff800000
	dc.l $00000000,$00000000,$00000000,$ffff0000

loc_010d84:
	dc.l $00000000,$0000f666,$f888f444,$ffff0000
	dc.l $00000000,$00000000,$00000000,$ffff0000

loc_010da4:
	dc.l $00000000,$0000fc00,$ff00fa00,$ff000000
	dc.l $00000000,$00000000,$00000000,$ffff0000

loc_010dc4:
	dc.l $00000000,$0000f06c,$f08ff04a,$f08f0000
	dc.l $00000000,$00000000,$00000000,$ffff0000

loc_010de4:
	dc.l $00000000,$0000f0a0,$f0c0f080,$f0c00000
	dc.l $00000000,$00000000,$00000000,$ffff0000

loc_010e04:
	dc.l $00000000,$00000000,$0000ffed,$00000000
	dc.l $0000ffed,$fcbafa98,$f765f432,$f2100000

loc_010e24:
	dc.l $00000000,$00000000,$0000ffff,$00000000
	dc.l $0000ffff,$fcccfaaa,$f777f444,$f2220000

loc_010e44:
	dc.l $00000000,$00000000,$0000ff00,$00000000
	dc.l $0000ff00,$fc00fa00,$f700f400,$f2000000

loc_010e64:
	dc.l $00000000,$00000000,$0000fdef,$00000000
	dc.l $0000fdef,$fabcf89a,$f567f234,$f0120000

loc_010e84:
	dc.l $00000000,$00000000,$0000fefe,$00000000
	dc.l $0000fefe,$fbcbf9a9,$f676f343,$f1210000

;==============================================
loc_010ea4:
	moveq #0,d0
	move.w d0,(-$5f04,a5)
	move.l d0,(-$5f44,a5)
	move.l d0,(-$5f40,a5)
	move.l d0,(-$5f3c,a5)
	move.l d0,(-$5f38,a5)
	move.l d0,(-$5f34,a5)
	move.l d0,(-$5f30,a5)
	move.l d0,(-$5f2c,a5)
	move.l d0,(-$5f28,a5)
	move.l d0,(-$5f24,a5)
	move.l d0,(-$5f20,a5)
	move.l d0,(-$5f1c,a5)
	move.l d0,(-$5f18,a5)
	move.l d0,(-$5f14,a5)
	move.l d0,(-$5f10,a5)
	move.l d0,(-$5f0c,a5)
	move.l d0,(-$5f08,a5)
	rts

;==============================================
;Exit Input Check
;==============================================
loc_010eec:
	move.w (INP_P1_repeat,a5),d0
	not.w d0
	and.w (INP_P1,a5),d0
	swap d0
	move.w (INP_P2_repeat,a5),d0
	not.w d0
	and.w (INP_P2,a5),d0
	andi.l #$770f770f,d0
	beq.b loc_010f20
	move.w (-$5f04,a5),d1
	cmpi.w #$40,d1
	beq.b loc_010f20
	lea.l (-$5f44,a5),a0
	move.l d0,(a0,d1.w)
	addq.w #4,(-$5f04,a5)

loc_010f20:
	rts

;==============================================
loc_010f22:
	tst.b ($bf,a5)
	bne.b loc_010f58
	cmpi.w #$40,(-$5f04,a5)
	beq.b loc_010f58
	move.w d7,d0
	lsl.w #6,d0
	move.w #0,d1
	moveq #$f,d6
	lea.l (-$5f44,a5),a0

loc_010f3e:
	move.l loc_010f5c(pc,d0.w),d2
	cmp.l (a0,d1.w),d2
	bne.b loc_010f58
	addq.w #4,d0
	addq.w #4,d1
	dbra d6,loc_010f3e
	bsr.w loc_010ea4
	moveq #1,d0
	rts

loc_010f58:
	moveq #0,d0
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_010f5c:
	dc.l $01000000,$01000000,$00010000,$10000000
	dc.l $04000000,$01000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $10000000,$00004000,$02000000,$00000200
	dc.l $00080000,$01000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000001,$00000004,$00020000,$00004000
	dc.l $00010000,$00040000,$00000100,$00080000
	dc.l $01000000,$00000000,$00000000,$00000000
	dc.l $00000000,$00000000,$00000000,$00000000
	dc.l $00000004,$20000000,$00000001,$00040000
	dc.l $00000001,$00000400,$00040000,$00000002
	dc.l $02000000,$00000001,$00080000,$00040000
	dc.l $00002000,$10000000,$01000000,$00000000

;=============================================
;Secret Menu
;==============================================
	include "testmenu/secretmenu/secret_menu.68k"

;==============================================
;Test Menu Text Render
;==============================================
loc_01557c:
	moveq #0,d2
	add.b d0,d0
	bcc.b loc_015584
	moveq #-1,d2

loc_015584:
	move.w loc_0155c4(pc,d0.w),d0
	lea.l loc_0155c4(pc,d0.w),a0

loc_01558c:
	moveq #0,d0
	lea.l $900000,a1
	move.b (a0)+,d0
	lsl.w #7,d0
	add.b (a0)+,d0
	lea.l (a1,d0.w),a1
	moveq #0,d1
	move.b (a0)+,d1

loc_0155a2:
	moveq #0,d0
	move.b (a0)+,d0
	beq.b loc_0155c2
	bmi.b loc_01558c
	addi.w #0,d0
	tst.b d2
	beq.b loc_0155b6
	move.w #$20,d0

loc_0155b6:
	move.w d0,(a1)
	move.w d1,(2,a1)
	lea.l ($80,a1),a1
	bra.b loc_0155a2

loc_0155c2:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0155c4:
	dc.w loc_01560c-loc_0155c4 ;00 Main Test Menu
	dc.w loc_0156d9-loc_0155c4 ;01 Input Test
	dc.w loc_015735-loc_0155c4 ;02 Debug Dipswitch
	dc.w loc_01575d-loc_0155c4 ;03 Output Test
	dc.w loc_0157da-loc_0155c4 ;04 Card Dispenser
	dc.w loc_0157fa-loc_0155c4 ;05 Q-Sound Debug Text
	dc.w loc_015a11-loc_0155c4 ;06 Digital Volume Text
	dc.w loc_015a29-loc_0155c4 ;07 Regular Sound Test Text
	dc.w loc_015aeb-loc_0155c4 ;08 Digital Volume Text
	dc.w loc_015b03-loc_0155c4 ;09 Color Bar Text
	dc.w loc_015b60-loc_0155c4 ;0a Dot Crosshatch Text
	dc.w loc_015b85-loc_0155c4 ;0b Game Data w card
	dc.w loc_015bda-loc_0155c4 ;0c Gdata Average Time w card 
	dc.w loc_015c3c-loc_0155c4 ;0d Game Data
	dc.w loc_015c91-loc_0155c4 ;0e GData Average time
	dc.w loc_015cf7-loc_0155c4 ;0f Config Main
	dc.w loc_015d74-loc_0155c4 ;10 System Config
	dc.w loc_015e43-loc_0155c4 ;11 System Config with Lang
	dc.w loc_015f21-loc_0155c4 ;12 System Config with Voice
	dc.w loc_016001-loc_0155c4 ;13 System Config with Card
	dc.w loc_016104-loc_0155c4 ;14 Game Config
	dc.w loc_0161e5-loc_0155c4 ;15 Saving
	dc.w loc_016211-loc_0155c4 ;16 Memory Check
	dc.w loc_0162cb-loc_0155c4 ;17 Exit option text

;Debug Menu Code
	dc.w loc_0162e7-loc_0155c4 ;18 Secret Menu Main
	dc.w loc_016407-loc_0155c4 ;19 Object Test
	dc.w loc_0164c0-loc_0155c4 ;1a Scroll 1
	dc.w loc_0165d1-loc_0155c4 ;1b Scroll 2
	dc.w loc_0166ce-loc_0155c4 ;1c Scroll 3
	dc.w loc_0167a8-loc_0155c4 ;1d Scroll 1 Block
	dc.w loc_0167e0-loc_0155c4 ;1e Scroll 2 Block
	dc.w loc_016818-loc_0155c4 ;1f Scroll 3 Block

;Unlock Text
	dc.w loc_016850-loc_0155c4 ;20 Character Unlock
	dc.w loc_01686d-loc_0155c4 ;21 Classic Mode Unlock
	dc.w loc_016889-loc_0155c4 ;22 Saikyo and Mazi Unlock
	dc.w loc_0168a5-loc_0155c4 ;23 Survival and Dramatic Mode Unlock

loc_01560c:
	dc.b $0f,$0c,$1f
	dc.b 'T E S T   M E N U',$FF

	dc.b $10,$18,$1f
	dc.b '1 INPUT',$ff

	dc.b $10,$20,$1f
	dc.b '2 OUTPUT',$ff

	dc.b $10,$28,$1f
	dc.b '3 SOUND & VOICE',$ff

	dc.b $10,$30,$1f
	dc.b '4 COLOR',$ff

	dc.b $10,$38,$1f
	dc.b '5 DOT CROSS HATCH',$ff

	dc.b $10,$40,$1f
	dc.b '6 GAME DATA',$ff

	dc.b $10,$48,$1f
	dc.b '7 CONFIGURATION',$ff

	dc.b $10,$50,$1f
	dc.b '8 MEMORY CHECK',$ff

	dc.b $10,$58,$1f
	dc.b '9 EXIT',$ff

	dc.b $0d,$70,$1b
	dc.b 'SELECT = 1P UP or DOWN',$ff

	dc.b $0d,$74,$1b
	dc.b 'START  = 1P SHOT 1',$00

loc_0156d9:
	dc.b $0c,$0c,$1f
	dc.b '1 . I N P U T   T E S T',$ff

	dc.b $06,$18,$1f
	dc.b 'SERVICE',$ff

	dc.b $06,$1c,$1f
	dc.b 'TEST',$ff

	dc.b $10,$24,$1f
	dc.b '1P',$ff

	dc.b $20,$24,$1f
	dc.b '2P',$ff

	dc.b $06,$28,$1f
	dc.b 'COIN',$ff

	dc.b $06,$2c,$1f
	dc.b 'START',$ff

	dc.b $06,$34,$1f
	dc.b 'LEVER',$ff

	dc.b $06,$44,$1f
	dc.b 'SHOT',00

loc_015735:
	dc.b $06,$50,$1f
	dc.b 'DIP-SW     -12345678-',$ff

	dc.b $0a,$54,$1f
	dc.b 'A',$ff
	dc.b $0a,$58,$1f
	dc.b 'B',$ff
	dc.b $0a,$5c,$1f
	dc.b 'C',$00

loc_01575d:
	dc.b $0b,$0c,$1f
	dc.b '2 . O U T P U T   T E S T',$ff

	dc.b $0a,$1c,$1f
	dc.b 'COIN LOCK 1P      (1P SHOT1)',$ff

	dc.b $0a,$24,$1f
	dc.b 'COIN LOCK 2P      (2P SHOT1)',$ff

	dc.b $0a,$30,$1f
	dc.b 'ELECTRIC COUNTER  (1P SHOT2)',00

loc_0157da:
	dc.b $0a,$3c,$1f
	dc.b 'CARD DISPENSER    (2P SHOT2)',00

loc_0157fa:
	dc.b $0e,$0c,$1f
	dc.b 'Q S O U N D   T E S T',$ff

	dc.b $06,$14,$1f
	dc.b 'REQ-No.=(    H)',$ff

	dc.b $18,$14,$1b
	dc.b 'No.CHANGE(1P LEVER)',$ff

	dc.b $18,$18,$1b
	dc.b 'SOUND REQ(1P SHOT1)',$ff

	dc.b $18,$1c,$1b
	dc.b 'SOUND OFF(1P SHOT2)',$ff

	dc.b $05,$24,$1f
	dc.b '-MODE-  START DISTANCE SPEED1   SPEED2',$ff

	dc.b $08,$28,$1f
	dc.b '0    [  H]',$ff

	dc.b $08,$2c,$1f
	dc.b '1    [  H]          [    H]',$ff

	dc.b $08,$30,$1f
	dc.b '2    [  H]   [  H]  [    H]',$ff

	dc.b $08,$34,$1f
	dc.b '3    [  H]   [  H]  [    H]',$ff

	dc.b $08,$38,$1f
	dc.b '4    [  H]   [  H]  [    H]',$ff

	dc.b $08,$3c,$1f
	dc.b '5    [  H]   [  H]  [    H]  [    H]',$ff

	dc.b $08,$40,$1f
	dc.b '6    [  H]   [  H]  [    H]  [    H]',$ff

	dc.b $08,$44,$1f
	dc.b '7    [  H]   [  H]  [    H]',$ff

	dc.b $14,$4c,$1f
	dc.b 'POSITION',$ff

	dc.b $06,$64,$1b
	dc.b 'MODE SELECT      = 2P UP or DOWN',$ff

	dc.b $06,$68,$1b
	dc.b 'PALAMETER SELECT = 2P LEFT or RIGHT',$ff

	dc.b $06,$6c,$1b
	dc.b 'PALAMETER CHANGE = 2P SHOT1&(UP or DOWN)',00

loc_015a11:
	dc.b $13,$58,$1f
	dc.b 'VOLUME',$ff

	dc.b $04,$58,$1f
	dc.b 'MIN',$ff

	dc.b $28,$58,$1f
	dc.b 'MAX',00

loc_015a29:
	dc.b $04,$0c,$1f
	dc.b '3 . S O U N D   &   V O I C E   T E S T',$ff

	dc.b $0e,$18,$1f
	dc.b 'SOUND CODE NO.',$ff

	dc.b $0e,$20,$1b
	dc.b 'CODE +01 = 1P UP',$ff

	dc.b $0e,$24,$1b
	dc.b 'CODE -01 = 1P DOWN',$ff

	dc.b $0e,$28,$1b
	dc.b 'CODE +10 = 1P RIGHT',$ff

	dc.b $0e,$2c,$1b
	dc.b 'CODE -10 = 1P LEFT',$ff

	dc.b $0e,$30,$1b
	dc.b 'REQUEST  = 1P SHOT1',$ff

	dc.b $0e,$34,$1b
	dc.b 'STOP     = 1P SHOT2',00

loc_015aeb:
	dc.b $15,$64,$1f
	dc.b 'VOLUME',$ff

	dc.b $03,$70,$1f 
	dc.b 'MIN',$ff

	dc.b $29,$70,$1f
	dc.b 'MAX',00

loc_015b03:
	dc.b $0d,$0c,$1f
	dc.b '4 . C O L O R   B A R',$ff

	dc.b $0b,$18,$1f
	dc.b '0 1 2 3 4 5 6 7 8 9 A B C D E F',$ff

	dc.b $06,$20,$1d
	dc.b 'RED',$ff
	dc.b $04,$34,$1b
	dc.b 'GREEN',$ff
	dc.b $05,$48,$1e
	dc.b 'BLUE',$ff
	dc.b $04,$5c,$19
	dc.b 'WHITE',00

loc_015b60:
	dc.b $07,$0c,$1f
	dc.b '5 . D O T   C R O S S   H A T C H',00

loc_015b85:
	dc.b $0d,$0c,$1f
	dc.b '6 . G A M E   D A T A',$ff
	dc.b $0b,$18,$1f
	dc.b 'COIN     COUNTER',$ff
	dc.b $0b,$20,$1f
	dc.b 'SERVICE  COUNTER',$ff
	dc.b $0b,$28,$1f
	dc.b 'CARD     COUNTER',00

loc_015bda:
	dc.b $0d,$0c,$1f
	dc.b '6 . G A M E   D A T A',$ff
	dc.b $0b,$18,$1f
	dc.b 'COIN    COUNTER',$ff
	dc.b $0b,$20,$1f
	dc.b 'SERVICE COUNTER',$ff
	dc.b $0b,$28,$1f
	dc.b 'CARD    COUNTER',$ff
	dc.b $0b,$30,$1f
	dc.b 'AVERAGE TIME',00

loc_015c3c:
	dc.b $0d,$0c,$1f
	dc.b '6 . G A M E   D A T A',$ff
	dc.b $0b,$18,$1f
	dc.b 'COIN     COUNTER',$ff
	dc.b $0b,$20,$1f
	dc.b 'SERVICE  COUNTER',$ff
	dc.b $0b,$28,$1f
	dc.b 'FREEPLAY COUNTER',00

loc_015c91:
	dc.b $0d,$0c,$1f
	dc.b '6 . G A M E   D A T A',$ff
	dc.b $0b,$18,$1f
	dc.b 'COIN     COUNTER',$ff
	dc.b $0b,$20,$1f
	dc.b 'SERVICE  COUNTER',$ff
	dc.b $0b,$28,$1f
	dc.b 'FREEPLAY COUNTER',$ff
	dc.b $0b,$30,$1f
	dc.b 'AVERAGE  TIME',00


loc_015cf7:
	dc.b $04,$0c,$1f
	dc.b '7 . C O N F I G U R A T I O N   M E N U',$ff

	dc.b $12,$1c,$1f
	dc.b '1. SYSTEM',$ff

	dc.b $12,$24,$1f
	dc.b '2. GAME',$ff

	dc.b $12,$2c,$1f
	dc.b '3. DEFAULT',$ff

	dc.b $12,$34,$1f
	dc.b '4. SAVE & EXIT',$ff

	dc.b $0d,$6c,$1b
	dc.b 'SELECT = 1P UP or DOWN',00

loc_015d74:
	dc.b $01,$0c,$1f
	dc.b '7-1 . S Y S T E M   C O N F I G U R A T I O N',$ff
	dc.b $03,$18,$1f
	dc.b '1. COIN MODE',$ff
	dc.b $03,$20,$1f
	dc.b '2. CONTINUE',$ff
	dc.b $03,$28,$1f
	dc.b '3. MONITOR',$ff
	dc.b $03,$30,$1f
	dc.b '4. DEMO SOUND',$ff
	dc.b $03,$38,$1f
	dc.b '5. SOUND MODE',$ff
	dc.b $03,$40,$1f
	dc.b '6. CHUTE TYPE',$ff
	dc.b $03,$48,$1f
	dc.b '7. REGULATION',$ff
	dc.b $03,$50,$1f
	dc.b '8. EXIT',$ff
	dc.b $07,$6c,$1b
	dc.b 'SELECT OPTION  = 1P UP or DOWN',00

loc_015e43:
	dc.b $01,$0c,$1f
	dc.b '7-1 . S Y S T E M   C O N F I G U R A T I O N',$ff
	dc.b $03,$18,$1f
	dc.b '1. COIN MODE',$ff
	dc.b $03,$20,$1f
	dc.b '2. CONTINUE',$ff
	dc.b $03,$28,$1f
	dc.b '3. MONITOR',$ff
	dc.b $03,$30,$1f
	dc.b '4. DEMO SOUND',$ff
	dc.b $03,$38,$1f
	dc.b '5. SOUND MODE',$ff
	dc.b $03,$40,$1f
	dc.b '6. CHUTE TYPE',$ff
	dc.b $03,$48,$1f
	dc.b '7. REGULATION',$ff
	dc.b $03,$50,$1f
	dc.b '8. LANGUAGE',$ff
	dc.b $09,$58,$1f
	dc.b '8. EXIT',$ff
	dc.b $07,$6c,$1b
	dc.b 'SELECT OPTION  = 1P UP or DOWN',00

loc_015f21:
	dc.b $01,$0c,$1f
	dc.b '7-1 . S Y S T E M   C O N F I G U R A T I O N',$ff
	dc.b $03,$18,$1f
	dc.b '1. COIN MODE',$ff
	dc.b $03,$20,$1f
	dc.b '2. CONTINUE',$ff
	dc.b $03,$28,$1f
	dc.b '3. MONITOR',$ff
	dc.b $03,$30,$1f
	dc.b '4. DEMO SOUND',$ff
	dc.b $03,$38,$1f
	dc.b '5. SOUND MODE',$ff
	dc.b $03,$40,$1f
	dc.b '6. CHUTE TYPE',$ff
	dc.b $03,$48,$1f
	dc.b '7. REGULATION',$ff
	dc.b $03,$50,$1f
	dc.b '8. VOICE TYPE',$ff
	dc.b $03,$58,$1f
	dc.b '9. EXIT',$ff
	dc.b $07,$6c,$1b
	dc.b 'SELECT OPTION  = 1P UP or DOWN',00

loc_016001:
	dc.b $01,$0c,$1f
	dc.b '7-1 . S Y S T E M   C O N F I G U R A T I O N',$ff
	dc.b $03,$18,$1f
	dc.b '1. COIN MODE',$ff
	dc.b $03,$20,$1f
	dc.b '2. CONTINUE',$ff
	dc.b $03,$28,$1f
	dc.b '3. MONITOR',$ff
	dc.b $03,$30,$1f
	dc.b '4. DEMO SOUND',$ff
	dc.b $03,$38,$1f
	dc.b '5. SOUND MODE',$ff
	dc.b $03,$40,$1f
	dc.b '6. CHUTE TYPE',$ff
	dc.b $03,$48,$1f
	dc.b '7. REGULATION',$ff
	dc.b $03,$50,$1f
	dc.b '8. C.DISPENSER',$ff
	dc.b $03,$58,$1f
	dc.b '9. WIN POINT',$ff
	dc.b $02,$60,$1f
	dc.b '10. WIN POINT',$ff
	dc.b $02,$68,$1f
	dc.b '11. EXIT',$ff
	dc.b $07,$6c,$1b
	dc.b 'SELECT OPTION  = 1P UP or DOWN',00

loc_016104:
	dc.b $03,$0c,$1f
	dc.b '7-2 . G A M E   C O N F I G U R A T I O N',$ff
	dc.b $03,$18,$1f
	dc.b '1. DIFFICULTY',$ff
	dc.b $03,$20,$1f
	dc.b '2. DAMAGE LEVEL',$ff
	dc.b $03,$28,$1f
	dc.b '3. TIMER SPEED',$ff
	dc.b $03,$30,$1f
	dc.b '4. GAME SPEED',$ff
	dc.b $03,$38,$1f
	dc.b '5. 1P MAX ROUND',$ff
	dc.b $03,$40,$1f
	dc.b '6. 2P MAX ROUND',$ff
	dc.b $03,$48,$1f
	dc.b '7. EVENT',$ff
	dc.b $03,$50,$1f
	dc.b '8. JOIN-IN',$ff
	dc.b $03,$58,$1f
	dc.b '9. EXIT',$ff
	dc.b $07,$6c,$1b
	dc.b 'SELECT OPTION  = 1P UP or DOWN',00

loc_0161e5:
	dc.b $0a,$30,$1d
	dc.b 'SAVING NEW CONFIGURATION',$ff

	dc.b $1a,$38,$1d
	dc.b 'IN EEPROM...',00

loc_016211:
	dc.b $0a,$0c,$1f
	dc.b '8 . M E M O R Y   C H E C K',$ff
	dc.b $10,$1c,$1f
	dc.b 'W O R K RAM',$ff
	dc.b $10,$24,$1f
	dc.b 'C P S   RAM',$ff
	dc.b $10,$2c,$1f
	dc.b 'OBJECT  RAM',$ff
	dc.b $10,$34,$1f
	dc.b 'QSOUND  RAM',$ff
	dc.b $10,$3c,$1f
	dc.b 'E E P   ROM',$ff
	dc.b $10,$44,$1f
	dc.b 'PROGRAM ROM 0',$ff
	dc.b $18,$48,$1f
	dc.b 'ROM 1',$ff
	dc.b $18,$4c,$1f
	dc.b 'ROM 2',$ff
	dc.b $18,$50,$1f
	dc.b 'ROM 3',$ff
	dc.b $18,$54,$1f
	dc.b 'ROM 4',$ff
	dc.b $18,$58,$1f
	dc.b 'ROM 5',$ff
	dc.b $18,$5c,$1f
	dc.b 'ROM 6',$ff
	dc.b $18,$60,$1f
	dc.b 'ROM 7',00

loc_0162cb:
	dc.b $0c,$74,$1d
	dc.b 'EXIT = 1P START & SHOT 1',00

loc_0162e7:
	dc.b $0d,$0c,$1f
	dc.b 'S E C R E T   T E S T',$ff
	dc.b $06,$20,$1f
	dc.b '1 OBJECT TEST',$ff
	dc.b $06,$28,$1f
	dc.b '2 SCROLL 1 TEST',$ff
	dc.b $06,$30,$1f
	dc.b '3 SCROLL 2 TEST',$ff
	dc.b $06,$38,$1f
	dc.b '4 SCROLL 3 TEST',$ff
	dc.b $06,$40,$1f
	dc.b '5 CHARACTER TEST',$ff
	dc.b $06,$48,$1f
	dc.b '6 BLOCK 1 TEST',$ff
	dc.b $06,$50,$1f
	dc.b '7 BLOCK 2 TEST',$ff
	dc.b $06,$58,$1f
	dc.b '8 BLOCK 3 TEST',$ff
	dc.b $1c,$20,$1f
	dc.b '9 MESSAGE TEST',$ff
	dc.b $1b,$28,$1f
	dc.b '10 ATTACK CHECK',$ff
	dc.b $1b,$30,$1f
	dc.b '11 SCROLL MOVE TEST',$ff
	dc.b $1b,$38,$1f
	dc.b '12 EXIT',$ff
	dc.b $1b,$40,$1f
	dc.b '13 EXIT',$ff
	dc.b $1b,$48,$1f
	dc.b '14 EXIT',$ff
	dc.b $1b,$50,$1f
	dc.b '15 EXIT',$ff
	dc.b $1b,$58,$1f
	dc.b '16 EXIT',$00

loc_016407:
	dc.b $0b,$0c,$1f
	dc.b '1 . O B J E C T   T E S T',$ff
	dc.b $06,$18,$1f
	dc.b '0123456789ABCDEF',$ff
	dc.b $1b,$18,$1f
	dc.b 'STAGE  =   H',$ff
	dc.b $1b,$1c,$1f
	dc.b 'COLOR  =   H',$ff
	dc.b $1b,$20,$1f
	dc.b 'H-FLIP = ',$ff
	dc.b $1b,$24,$1f
	dc.b 'V-FLIP = ',$ff
	dc.b $0a,$2c,$1e
	dc.b '0 1 2 3 4 5 6 7 8 9 A B C D E F',$ff
	dc.b $46,$0c,$1f
	dc.b '0123456789ABCDEF',$ff
	dc.b $5d,$10,$1f
	dc.b 'CODE =      H',$ff
	dc.b $67,$10,$1e
	dc.b 'XX',00

loc_0164c0:
	dc.b $0b,$0c,$1f
	dc.b '2 . S C R O L L 1   T E S T',$ff
	dc.b $06,$18,$1f
	dc.b '0123456789ABCDEF',$ff
	dc.b $1b,$18,$1f
	dc.b 'STAGE  =   H',$ff
	dc.b $1b,$1c,$1f
	dc.b 'COLOR  =   H',$ff
	dc.b $1b,$20,$1f
	dc.b 'H-FLIP = ',$ff
	dc.b $1b,$24,$1f
	dc.b 'V-FLIP = ',$ff
	dc.b $10,$2c,$1e
	dc.b '0123456789ABCDEF',$ff
	dc.b $4b,$0c,$1f
	dc.b '2 . S C R O L L 1   T E S T',$ff
	dc.b $46,$18,$1f
	dc.b '0123456789ABCDEF',$ff
	dc.b $5b,$18,$1f
	dc.b 'STAGE  =   H',$ff
	dc.b $5b,$1c,$1f
	dc.b 'COLOR  =   H',$ff
	dc.b $5b,$20,$1f
	dc.b 'H-FLIP = ',$ff
	dc.b $5b,$24,$1f
	dc.b 'V-FLIP = ',$ff
	dc.b $4a,$2c,$1e
	dc.b '0 1 2 3 4 5 6 7 8 9 A B C D E F',$00

loc_0165d1:
	dc.b $0b,$0c,$1f
	dc.b '3 . S C R O L L 2   T E S T',$ff
	dc.b $06,$18,$1f
	dc.b '0123456789ABCDEF',$ff
	dc.b $1b,$18,$1f
	dc.b 'STAGE  =   H',$ff
	dc.b $1b,$1c,$1f
	dc.b 'COLOR  =   H',$ff
	dc.b $1b,$20,$1f
	dc.b 'H-FLIP = ',$ff
	dc.b $1b,$24,$1f
	dc.b 'V-FLIP = ',$ff
	dc.b $0a,$2c,$1e
	dc.b '0 1 2 3 4 5 6 7 8 9 A B C D E F',$ff
	dc.b $4a,$0c,$1f
	dc.b '3 . S C R O L L 2   T E S T',$ff
	dc.b $46,$18,$1f
	dc.b '0123456789ABCDEF',$ff
	dc.b $5b,$18,$1f
	dc.b 'STAGE  =   H',$ff
	dc.b $5b,$1c,$1f
	dc.b 'COLOR  =   H',$ff
	dc.b $5b,$20,$1f
	dc.b 'H-FLIP = ',$ff
	dc.b $5b,$24,$1f
	dc.b 'V-FLIP = ',$00

loc_0166ce:
	dc.b $0b,$0c,$1f
	dc.b '4 . S C R O L L 3   T E S T',$ff
	dc.b $06,$18,$1f
	dc.b '0123456789ABCDEF',$ff
	dc.b $1b,$18,$1f
	dc.b 'STAGE  =   H',$ff
	dc.b $1b,$1c,$1f
	dc.b 'COLOR  =   H',$ff
	dc.b $1b,$20,$1f
	dc.b 'H-FLIP = ',$ff
	dc.b $1b,$24,$1f
	dc.b 'V-FLIP = ',$ff
	dc.b $4b,$0c,$1f
	dc.b '4 . S C R O L L 3   T E S T',$ff
	dc.b $46,$18,$1f
	dc.b '0123456789ABCDEF',$ff
	dc.b $5b,$18,$1f
	dc.b 'STAGE  =   H',$ff
	dc.b $5b,$1c,$1f
	dc.b 'COLOR  =   H',$ff
	dc.b $5b,$20,$1f
	dc.b 'H-FLIP = ',$ff
	dc.b $5b,$24,$1f
	dc.b 'V-FLIP = ',00

loc_0167a8:
	dc.b $23,$14,$1f
	dc.b 'SCROLL 1',$ff
	dc.b $24,$18,$1f
	dc.b 'BLOCK TEST',$ff
	dc.b $23,$28,$1f
	dc.b 'BLOCK =   H',$ff
	dc.b $23,$2c,$1f
	dc.b 'STAGE =   H',00

loc_0167e0:
	dc.b $23,$14,$1f
	dc.b 'SCROLL 2',$ff
	dc.b $24,$18,$1f
	dc.b 'BLOCK TEST',$ff
	dc.b $23,$28,$1f
	dc.b 'BLOCK =   H',$ff
	dc.b $23,$2c,$1f
	dc.b 'STAGE =   H',00

loc_016818:
	dc.b $23,$14,$1f
	dc.b 'SCROLL 3',$ff
	dc.b $24,$18,$1f
	dc.b 'BLOCK TEST',$ff
	dc.b $23,$28,$1f
	dc.b 'BLOCK =   H',$ff
	dc.b $23,$2c,$1f
	dc.b 'STAGE =   H',00

loc_016850:
	dc.b $0b,$34,$1d
	dc.b 'HERE COME NEW CHALLENGERS',00

loc_01686d:
	dc.b $0c,$34,$1d
	dc.b 'TRADITIONAL FIGHT BEGINS',00

loc_016889:
	dc.b $0c,$34,$1d
	dc.b 'ENJOY NEW FIGHTING STYLE',00

loc_0168a5:
	dc.b $07,$34,$1d
	dc.b 'THANK YOU SO MUCH FOR LONG PLAYING',00
	even

;==============================================
loc_0168cc:
	moveq #0,d2
	add.b d0,d0
	bcc.b loc_0168d4
	moveq #-1,d2

loc_0168d4:
	move.w loc_01690a(pc,d0.w),d0
	lea.l loc_01690a(pc,d0.w),a0

loc_0168dc:
	lea.l $904000,a1
	move.w (a0)+,d0
	lea.l (a1,d0.w),a1
	move.w (a0)+,d1

loc_0168ea:
	move.w (a0)+,d0
	beq.b loc_016908
	bmi.b loc_0168dc
	addi.w #$6c00,d0
	tst.b d2
	beq.b loc_0168fc
	move.w #$6c20,d0

loc_0168fc:
	move.w d0,(a1)
	move.w d1,(2,a1)
	lea.l ($40,a1),a1
	bra.b loc_0168ea

loc_016908:
	rts

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;JP Test Menu Text
loc_01690a:
	dc.w $0008,$0108,$0190,$024c,$0204,$001f,$2bd3,$2bcd
	dc.w $2bd4,$2be2,$2bd6,$2c0f,$2bbd,$ffff,$01cc,$001f
	dc.w $2c26,$2c50,$2c73,$2c74,$2bd3,$2bcd,$2bd4,$ffff
	dc.w $01d0,$001f,$2c27,$2c50,$2c7e,$2c74,$2bd3,$2bcd
	dc.w $2bd4,$ffff,$01d4,$001f,$2c28,$2c50,$2c02,$2be8
	dc.w $2c0f,$2bbd,$2be1,$2bd3,$2bcd,$2bd4,$ffff,$01d8
	dc.w $001f,$2c29,$2c50,$2bc6,$2be7,$2bbd,$2bd3,$2bcd
	dc.w $2bd4,$ffff,$01dc,$001f,$2c2a,$2c50,$2b7b,$2b96
	dc.w $2b80,$2bd3,$2bcd,$2bd4,$ffff,$01e0,$001f,$2c2b
	dc.w $2c50,$2bf2,$2bbd,$2be1,$2bfc,$2bbd,$2bd0,$ffff
	dc.w $01e4,$001f,$2c2c,$2c50,$2c71,$2c72,$ffff,$01e8
	dc.w $001f,$2c2d,$2c50,$2be2,$2be3,$2be8,$2bbd,$2bd3
	dc.w $2bcd,$2bd4,$ffff,$01f0,$001f,$2c2e,$2c50,$2bf2
	dc.w $2bbd,$2be1,$2b76,$2c76,$2b89,$ffff,$00f8,$001b
	dc.w $2c26,$2c41,$2bea,$2bfe,$2bbd,$2c77,$2c78,$2b9c
	dc.w $2c79,$2c7a,$2bb2,$2bcc,$2c10,$2c0d,$2bd4,$2c26
	dc.w $2b9c,$2c75,$2c72,$0000,$0244,$001f,$2c71,$2c72
	dc.w $2be2,$2bd6,$2c0f,$2bbd,$ffff,$01cc,$001f,$2c26
	dc.w $2c50,$2bcc,$2bcd,$2bd3,$2be1,$2c71,$2c72,$ffff
	dc.w $01d0,$001f,$2c27,$2c50,$2bf2,$2bbd,$2be1,$2c71
	dc.w $2c72,$ffff,$01d4,$001f,$2c28,$2c50,$2be8,$2bce
	dc.w $2c0d,$2bd4,$ffff,$01dc,$001f,$2c29,$2c50,$2bce
	dc.w $2bbd,$2c00,$2b6c,$2b73,$2bd3,$2bcd,$2bd4,$2b76
	dc.w $2c76,$2b89,$ffff,$01f4,$001b,$2c26,$2c41,$2bea
	dc.w $2bfe,$2bbd,$2c77,$2c78,$2b9c,$2c79,$2c7a,$0000
	dc.w $0244,$001f,$2bcc,$2bcd,$2bd3,$2be1,$2c71,$2c72
	dc.w $ffff,$004c,$001f,$2bca,$2bc2,$2bee,$2c71,$2c72
	dc.w $ffff,$0050,$001f,$2bca,$2bee,$2bd3,$2c09,$2bd6
	dc.w $2c0f,$2bbd,$ffff,$0054,$001f,$2be3,$2bd6,$2bd0
	dc.w $2bbd,$ffff,$0058,$001f,$2bfc,$2be3,$2bcb,$2bc3
	dc.w $2bee,$2bfd,$ffff,$005c,$001f,$2c42,$2bcb,$2bc3
	dc.w $2bee,$2bfd,$ffff,$0060,$001f,$2bca,$2bc2,$2bee
	dc.w $2bcc,$2c0f,$2bbd,$2bd0,$2bbd,$ffff,$0064,$001f
	dc.w $2c8e,$2c8f,$2c90,$2c91,$ffff,$006c,$001f,$2c71
	dc.w $2c72,$2be2,$2bd6,$2c0f,$2bbd,$2b76,$2c76,$2b89
	dc.w $ffff,$01f4,$001b,$2c26,$2c41,$2bea,$2bfe,$2bbd
	dc.w $2c77,$2c78,$2b9c,$2c79,$2c7a,$0000,$0244,$001f
	dc.w $2bf2,$2bbd,$2be1,$2c71,$2c72,$ffff,$004c,$001f
	dc.w $2c87,$2c86,$2c97,$ffff,$0050,$001f,$2c88,$2c89
	dc.w $2c74,$ffff,$0054,$001f,$2bd0,$2bc2,$2bdf,$2bbd
	dc.w $ffff,$0058,$001f,$2bf2,$2bbd,$2be1,$2bcd,$2c04
	dc.w $2bbd,$2bfd,$ffff,$005c,$001f,$2c7f,$2c34,$2c41
	dc.w $2c46,$2c7c,$2c7d,$2c81,$ffff,$0060,$001f,$2c27
	dc.w $2c41,$2c7f,$2c80,$2c7c,$2c7d,$2c81,$ffff,$0064
	dc.w $001f,$2bc2,$2c01,$2bee,$2bd4,$ffff,$0068,$001f
	dc.w $2c98,$2c73,$ffff,$0070,$001f,$2c71,$2c72,$2be2
	dc.w $2bd6,$2c0f,$2bbd,$2b76,$2c76,$2b89,$ffff,$01f4
	dc.w $001b,$2c26,$2c41,$2bea,$2bfe,$2bbd,$2c77,$2c78
	dc.w $2b9c,$2c79,$2c7a,$0000