
;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
	include "EngTextdata/EndingText.asm"

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0dc9d4:
	dc.b $00,$04,$00,$00
	dc.b $47,"WIN THE CARD!!",00
	dc.b $70
	even

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Player Table
loc_0dc9ea:
	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea

	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca42-loc_0dc9ea

	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea

	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea

	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca5a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea

	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea

	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea

	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea
	dc.w loc_0dca2a-loc_0dc9ea

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0dca2a:
	dc.w $0000,$0000,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000

loc_0dca42:
	dc.w $0002,$0004,$0000,$0000,$0000,$0000
	dc.w $0000,$0000,$0000,$0000,$0000,$0000

loc_0dca5a:
	dc.w $07ff,$0534,$0020,$07b6,$0124,$0000
	dc.w $07ff,$0534,$0020,$07ff,$0124,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Player Table
loc_0dca72:
	dc.w loc_0dcab2-loc_0dca72
	dc.w loc_0dcac6-loc_0dca72
	dc.w loc_0dcab2-loc_0dca72
	dc.w loc_0dcab6-loc_0dca72
	dc.w loc_0dcaba-loc_0dca72
	dc.w loc_0dcac2-loc_0dca72
	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcabe-loc_0dca72

	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcac2-loc_0dca72
	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcac6-loc_0dca72
	dc.w loc_0dcac6-loc_0dca72
	dc.w loc_0dcaca-loc_0dca72

	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcace-loc_0dca72

	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcace-loc_0dca72
	dc.w loc_0dcace-loc_0dca72


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0dcab2:
	dc.b $01,$04,$00,$00

loc_0dcab6:
	dc.b $0f,$10,$00,$00

loc_0dcaba:
	dc.b $00,$00,$04,$00

loc_0dcabe:
	dc.b $00,$04,$04,$00

loc_0dcac2:
	dc.b $00,$00,$01,$00

loc_0dcac6:
	dc.b $01,$00,$00,$00

loc_0dcaca:
	dc.b $00,$02,$00,$00

loc_0dcace:
	dc.b $00,$00,$00,$00


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0dcad2:
	dc.w $0018
	dc.w $0018
	dc.w $0018
	dc.w $0020
	dc.w $0018
	dc.w $0020
	dc.w $0020
	dc.w $0018
	dc.w $0020
	dc.w $0018
	dc.w $0020
	dc.w $0020
	dc.w $0018
	dc.w $0018
	dc.w $0018
	dc.w $0018
	dc.w $0018
	dc.w $0018
	dc.w $0018
	dc.w $0018
	dc.w $0018
	dc.w $0018
	dc.w $0018
	dc.w $0018
	dc.w $0018
	dc.w $0018
	dc.w $0018
	dc.w $0018
	dc.w $0018
	dc.w $0018
	dc.w $0018
	dc.w $0018

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0dcb12:
	dc.l loc_0359e6,loc_0375f0,loc_03a2dc,loc_03bd1e
	dc.l loc_03da4c,loc_03f246,loc_0411f2,loc_043128
	dc.l loc_044be4,loc_046d74,loc_048e80,loc_04acce
	dc.l loc_04d282,loc_04efe2,loc_051d60,loc_054034
	dc.l loc_0569a2,loc_059790,loc_0359e6,loc_05984a
	dc.l loc_0359e6,loc_05ace2,loc_05dd34,loc_0359e6
	dc.l loc_05f7a0,loc_061a1e,loc_064ddc,loc_06769e
	dc.l loc_069a7e,loc_06b6de,loc_06f0da,loc_072b1e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Jump Table for programming of normals
loc_0dcb92:
	dc.l loc_034394,loc_035cf8,loc_0378de,loc_03a38e
	dc.l loc_03bf1c,loc_03dd1a,loc_03f324,loc_041652
	dc.l loc_04326c,loc_044f3a,loc_0472c2,loc_048f76
	dc.l loc_04afc6,loc_04d468,loc_04f60e,loc_051e88
	dc.l loc_054124,loc_056d86,loc_034394,loc_056f34
	dc.l loc_034394,loc_059b8c,loc_05ae5a,loc_034394
	dc.l loc_05de4c,loc_05ff52,loc_061f20,loc_0653d8
	dc.l loc_06795e,loc_069e56,loc_06b87c,loc_06f2b8

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;AI Special Moves Programming
loc_0dcc12:
	dc.l loc_034b52,loc_0363ae,loc_0382b8,loc_03aaaa
	dc.l loc_03c79e,loc_03e304,loc_03fa28,loc_041ec2
	dc.l loc_043a6a,loc_0455e4,loc_047984,loc_04957c
	dc.l loc_04b5e0,loc_04da52,loc_04fddc,loc_052c1a
	dc.l loc_054972,loc_057778,loc_034b52,loc_057778
	dc.l loc_034b52,loc_05a160,loc_05b4a8,loc_034b52
	dc.l loc_05e4c8,loc_0604f0,loc_0627aa,loc_065cf2
	dc.l loc_068124,loc_06a4a8,loc_06c0d8,loc_06fb1e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Player Special moves
loc_0dcc92:
	dc.l loc_034b52,loc_0363ae,loc_0382e4,loc_03aaca
	dc.l loc_03c79e,loc_03e304,loc_03fa28,loc_041ec2
	dc.l loc_043a6a,loc_0455e4,loc_0479a8,loc_04957c
	dc.l loc_04b5e0,loc_04da76,loc_04fddc,loc_052c1a
	dc.l loc_054972,loc_057778,loc_034b52,loc_057778
	dc.l loc_034b52,loc_05a160,loc_05b4ce,loc_034b52
	dc.l loc_05e4c8,loc_0604f0,loc_0627aa,loc_065cc6
	dc.l loc_068124,loc_06a4a8,loc_06c0d8,loc_06fb1e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Throw Table 1
loc_0dcd12:
	dc.l loc_03580c,loc_0371a8,loc_039ef4,loc_03b764
	dc.l loc_03d73e,loc_03ec14,loc_040c74,loc_042bca
	dc.l loc_044858,loc_04688c,loc_048b0a,loc_04a4d4
	dc.l loc_04cedc,loc_04e9d2,loc_05177a,loc_053b6e
	dc.l loc_055f4c,loc_0591cc,loc_03580c,loc_0591cc
	dc.l loc_03580c,loc_05aa36,loc_05d498,loc_03580c
	dc.l loc_05f53a,loc_06150a,loc_064502,loc_06717e
	dc.l loc_06986e,loc_06b29c,loc_06e7f4,loc_072252

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Throw Table 2
loc_0dcd92:
	dc.l loc_03580c,loc_0371a8,loc_039ef4,loc_03b764
	dc.l loc_03d73e,loc_03ec14,loc_040c74,loc_042bca
	dc.l loc_044858,loc_04688c,loc_048b0a,loc_04a4d4
	dc.l loc_04cedc,loc_04e9d2,loc_05177a,loc_053b6e
	dc.l loc_055f4c,loc_0591cc,loc_03580c,loc_0591cc
	dc.l loc_03580c,loc_05aa36,loc_05d498,loc_03580c
	dc.l loc_05f53a,loc_06150a,loc_064502,loc_06717e
	dc.l loc_06986e,loc_06b29c,loc_06e7f4,loc_072252

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Winposes
loc_0dce12:
	dc.l loc_033fea,loc_035b00,loc_03a0fc,loc_03bace
	dc.l loc_03be80,loc_03effa,loc_040f24,loc_04159e
	dc.l loc_0431c4,loc_044db8,loc_047084,loc_04a76e
	dc.l loc_04d02c,loc_04ee40,loc_04f152,loc_053dea
	dc.l loc_0565a2,loc_056c8a,loc_033fea,loc_056c8a
	dc.l loc_033fea,loc_059a9e,loc_05d938,loc_033fea
	dc.l loc_05ddb2,loc_05f82a,loc_061aa4,loc_064f6a
	dc.l loc_067760,loc_069b00,loc_06ed34,loc_072792

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Timer Over Animations
loc_0dce92:
	dc.l loc_029db6,loc_029db6,loc_03a1ce,loc_029db6
	dc.l loc_029db6,loc_029db6,loc_04111e,loc_029db6
	dc.l loc_029db6,loc_029db6,loc_029db6,loc_029db6
	dc.l loc_04d184,loc_029db6,loc_04f44a,loc_029db6
	dc.l loc_029db6,loc_056d1c,loc_029db6,loc_056d1c
	dc.l loc_029db6,loc_029db6,loc_029db6,loc_029db6
	dc.l loc_029db6,loc_029db6,loc_029db6,loc_029db6
	dc.l loc_0678d4,loc_029db6,loc_029db6,loc_029db6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Intro 1
loc_0dcf12:
	dc.l loc_0341ec,loc_035a74,loc_0376a0,loc_03bb96
	dc.l loc_03bdea,loc_03db1c,loc_03f2ec,loc_04128e
	dc.l loc_0431be,loc_044cda,loc_046e42,loc_04a854
	dc.l loc_04adbe,loc_04d326,loc_04f0a2,loc_051e1e
	dc.l loc_0567e0,loc_056a50,loc_0341ec,loc_056a50
	dc.l loc_0341ec,loc_05993c,loc_05ad62,loc_0341ec
	dc.l loc_05ef22,loc_05f9de,loc_061e38,loc_065204
	dc.l loc_067946,loc_069bea,loc_06b7ea,loc_06f1e6

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Air Normal Jump Table
loc_0dcf92:
	dc.l loc_034664,loc_035f08,loc_037bc6,loc_03a6a2
	dc.l loc_03c24c,loc_03deb8,loc_03f5a4,loc_041ad8
	dc.l loc_0434f0,loc_045198,loc_0474b2,loc_049148
	dc.l loc_04b0fe,loc_04d626,loc_04f7e8,loc_052310
	dc.l loc_054446,loc_0570be,loc_034664,loc_057144
	dc.l loc_034664,loc_059c96,loc_05afaa,loc_034664
	dc.l loc_05e110,loc_06010a,loc_0623b6,loc_06577c
	dc.l loc_067c80,loc_069ff6,loc_06b9ec,loc_06f428

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0dd012:
	dc.l loc_100240,loc_102ff8,loc_104a9e,loc_1060b8
	dc.l loc_108458,loc_10b7f8,loc_10d698,loc_10fe42
	dc.l loc_112bd0,loc_116078,loc_11874c,loc_119ed8
	dc.l loc_11c64e,loc_11d808,loc_11f3fe,loc_121ccc
	dc.l loc_1244b6,loc_1295a0,loc_100240,loc_1295a0
	dc.l loc_100240,loc_12d506,loc_12ed0e,loc_100240
	dc.l loc_13322a,loc_1357ea,loc_137646,loc_13be4a
	dc.l loc_13e17a,loc_141acc,loc_12ed0e,loc_12ed0e

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0dd092:
	dc.l loc_100074,loc_102e3c,loc_1048ba,loc_105ef4
	dc.l loc_1082dc,loc_10b6d0,loc_10d57c,loc_10fc82
	dc.l loc_1129fc,loc_115f08,loc_118614,loc_119d6c
	dc.l loc_11c52e,loc_11d6a8,loc_11f2a6,loc_121b68
	dc.l loc_124306,loc_1293a0,loc_100074,loc_1293a0
	dc.l loc_100074,loc_12d43e,loc_12eaba,loc_100074
	dc.l loc_1330da,loc_135652,loc_13755e,loc_13bcb2
	dc.l loc_13e086,loc_141980,loc_12eaba,loc_12eaba

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0dd112:
	dc.l loc_100000,loc_102da0,loc_104812,loc_105e78
	dc.l loc_108248,loc_10b658,loc_10d4f4,loc_10fbfa
	dc.l loc_112964,loc_115e68,loc_118588,loc_119ce4
	dc.l loc_11c49e,loc_11d60c,loc_11f1f6,loc_121ad0
	dc.l loc_12429e,loc_129348,loc_100000,loc_129348
	dc.l loc_100000,loc_12d3fe,loc_12ea16,loc_100000
	dc.l loc_133042,loc_1355b2,loc_1374c2,loc_13bc16
	dc.l loc_13dffa,loc_141904,loc_12ea16,loc_12ea16

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Initialize character?
loc_0dd192:
	dc.l loc_03598c,loc_03750e,loc_037676,loc_03a36e
	dc.l loc_03bdac,loc_03dad8,loc_03f2cc,loc_041270
	dc.l loc_044bc4,loc_044c92,loc_046dfa,loc_04a830
	dc.l loc_04ad88,loc_04d300,loc_04f064,loc_051de2
	dc.l loc_056928,loc_056a2c,loc_0277dc,loc_056a2c
	dc.l loc_0277dc,loc_05990e,loc_05ad60,loc_0277dc
	dc.l loc_05f786,loc_06194a,loc_06499e,loc_06762e
	dc.l loc_0699cc,loc_06b64a,loc_06b760,loc_06f15c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Throw Opponent Movement
loc_0dd212:
	dc.l loc_10138e,loc_10138e,loc_10138e,loc_10721e
	dc.l loc_10af90,loc_10c87e,loc_10e4ae,loc_111048
	dc.l loc_113e4e,loc_11791c,loc_119582,loc_11b5fe
	dc.l loc_10138e,loc_11ea5e,loc_1200d4,loc_122c9a
	dc.l loc_1257f4,loc_12b856,loc_10138e,loc_12b856
	dc.l loc_10138e,loc_12e1d4,loc_130cdc,loc_10138e
	dc.l loc_1346b0,loc_136938,loc_138584,loc_13d0e0
	dc.l loc_140262,loc_142d2a,loc_130cdc,loc_130cdc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Special Move Input Table
loc_0dd292:
	dc.l loc_0346cc,loc_035f78,loc_037cba,loc_03a6e4
	dc.l loc_03c30c,loc_03e006,loc_03f5ec,loc_041bc4
	dc.l loc_04355c,loc_0451f0,loc_047504,loc_04918e
	dc.l loc_04b144,loc_04d668,loc_04f876,loc_0525e8
	dc.l loc_054604,loc_057228,loc_0346cc,loc_057228
	dc.l loc_0346cc,loc_059d0a,loc_05aff0,loc_0346cc
	dc.l loc_05e16a,loc_06014a,loc_062432,loc_06581c
	dc.l loc_067cc2,loc_06a038,loc_06ba32,loc_06f46e


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;A-ism Alpha Counter Jump Table
loc_0dd312:
	dc.l loc_03482a,loc_03611a,loc_037fb4,loc_03a94a
	dc.l loc_03c5ec,loc_03e194,loc_03f75c,loc_041e80
	dc.l loc_043916,loc_04534e,loc_047844,loc_049406
	dc.l loc_04b44c,loc_04d798,loc_04fc12,loc_0528b6
	dc.l loc_0548a4,loc_05759c,loc_03482a,loc_05759c
	dc.l loc_03482a,loc_059e5e,loc_05b37a,loc_03482a
	dc.l loc_05e318,loc_0603d2,loc_06258a,loc_065940
	dc.l loc_067f90,loc_06a386,loc_06bf62,loc_06f99c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;V-ism Alpha Counter Jump Table
loc_0dd392:
	dc.l loc_034870,loc_036160,loc_037f70,loc_03a9ba
	dc.l loc_03c63c,loc_03e1e0,loc_03f7a4,loc_041e3c
	dc.l loc_043958,loc_04538e,loc_04780a,loc_04945c
	dc.l loc_04b408,loc_04d7da,loc_04fc4e,loc_0528f8
	dc.l loc_054856,loc_05753a,loc_034870,loc_05753a
	dc.l loc_034870,loc_059eac,loc_05b3c2,loc_034870
	dc.l loc_05e364,loc_06041a,loc_0625d2,loc_065982
	dc.l loc_067fd8,loc_06a3d2,loc_06bfaa,loc_06f9e4

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;dd412
CharAniPNTtable:
	dc.l loc_1461e8,loc_152da4,loc_15c5cc,loc_167cb0
	dc.l loc_1713a8,loc_185676,loc_18efcc,loc_1a5eec
	dc.l loc_1af7e6,loc_1bb3f2,loc_1ca1de,loc_1de87e
	dc.l loc_1e9472,loc_1f1112,loc_1fe362,loc_20d366
	dc.l loc_21bde4,loc_229418,loc_1461e8,loc_229448
	dc.l loc_1461e8,loc_2387ec,loc_23fe00,loc_1461e8
	dc.l loc_24be0a,loc_254b3c,loc_262344,loc_270f16
	dc.l loc_27dc4a,loc_28a274,loc_298f0c,loc_2a8270

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
AismWalkSpeed:
	dc.l $fffd0000,$00020000;Ryu
	dc.l $fffd0000,$00020000;Ken
	dc.l $fffd0000,$00020000;Akuma
	dc.l $fffce000,$00024000;Charlie
	dc.l $fffc0000,$00030000;Chun
	dc.l $fffd0000,$00020000;Adon
	dc.l $fffd0000,$00020000;Sodom
	dc.l $fffc8000,$00028000;Guy
	dc.l $fffdf000,$00024000;Birdie
	dc.l $fffd0000,$00020000;Rose
	dc.l $fffc0000,$00030000;Dict
	dc.l $fffd8000,$00030000;Sagat
	dc.l $fffd0000,$00020000;Dan
	dc.l $fffd0000,$00028000;Sakura
	dc.l $fffc8000,$00028000;Rolento
	dc.l $fffe0000,$00016000;Dhalsim
	dc.l $fffdc000,$00012000;Zangief
	dc.l $fffd4000,$00024000;Gen
	dc.l $fffc0000,$00030000;0x12
	dc.l $fffc8000,$0002c000;Gen
	dc.l $fffd0000,$00020000;0x14
	dc.l $fffd0000,$00028000;Boxer
	dc.l $fffc2000,$0002e000;Cammy
	dc.l $fffd0000,$00020000;0x17
	dc.l $fffda000,$0001a000;E.Honda
	dc.l $fffdc000,$0001e000;Blanka
	dc.l $fffd0000,$00020000;R.Mika
	dc.l $fffd4000,$00022000;Cody
	dc.l $fffbe000,$00034000;Vega
	dc.l $fffc0000,$00030000;Karin
	dc.l $fffc9000,$00027000;Juli
	dc.l $fffc9000,$00027000;Juni

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
VismWalkSpeed:
	dc.l $fffce000,$00022000;Ryu
	dc.l $fffce000,$00022000;Ken
	dc.l $fffce000,$00022000;Akuma
	dc.l $fffcc000,$00026000;Charlie
	dc.l $fffbe000,$00032000;Chun
	dc.l $fffce000,$00022000;Adon
	dc.l $fffce000,$00022000;Sodom
	dc.l $fffc6000,$0002a000;Guy
	dc.l $fffdd000,$00026000;Birdie
	dc.l $fffce000,$00022000;Rose
	dc.l $fffbe000,$00032000;Dict
	dc.l $fffd6000,$00032000;Sagat
	dc.l $fffce000,$00022000;Dan
	dc.l $fffce000,$0002a000;Sakura
	dc.l $fffc6000,$0002a000;Rolento
	dc.l $fffde000,$00018000;Dhalsim
	dc.l $fffda000,$00014000;Zangief
	dc.l $fffd2000,$00026000;Gen
	dc.l $fffbe000,$00032000;0x12
	dc.l $fffc6000,$0002e000;Gen
	dc.l $fffce000,$00022000;0x14
	dc.l $fffce000,$0002a000;Boxer
	dc.l $fffc0000,$00030000;Cammy
	dc.l $fffce000,$00022000;0x17
	dc.l $fffd8000,$0001c000;E.Honda
	dc.l $fffda000,$00020000;Blanka
	dc.l $fffce000,$00022000;R.Mika
	dc.l $fffd2000,$00024000;Cody
	dc.l $fffbc000,$00036000;Vega
	dc.l $fffbe000,$00032000;Karin
	dc.l $fffc7000,$00029000;Juli
	dc.l $fffc7000,$00029000;Juni

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
XismWalkSpeed:
	dc.l $fffcf000,$00021000;Ryu
	dc.l $fffcf000,$00021000;Ken
	dc.l $fffcf000,$00021000;Akuma
	dc.l $fffcd000,$00025000;Charlie
	dc.l $fffbf000,$00031000;Chun
	dc.l $fffcf000,$00021000;Adon
	dc.l $fffcf000,$00021000;Sodom
	dc.l $fffc7000,$00029000;Guy
	dc.l $fffde000,$00025000;Birdie
	dc.l $fffcf000,$00021000;Rose
	dc.l $fffbf000,$00031000;Dict
	dc.l $fffd7000,$00031000;Sagat
	dc.l $fffcf000,$00021000;Dan
	dc.l $fffcf000,$00029000;Sakura
	dc.l $fffc7000,$00029000;Rolento
	dc.l $fffdf000,$00017000;Dhalsim
	dc.l $fffdb000,$00013000;Zangief
	dc.l $fffd3000,$00025000;Gen
	dc.l $fffbf000,$00031000;0x12
	dc.l $fffc7000,$0002d000;Gen
	dc.l $fffcf000,$00021000;0x14
	dc.l $fffcf000,$00029000;Boxer
	dc.l $fffc1000,$0002f000;Cammy
	dc.l $fffcf000,$00021000;0x17
	dc.l $fffd9000,$0001b000;E.Honda
	dc.l $fffdb000,$0001f000;Blanka
	dc.l $fffcf000,$00021000;R.Mika
	dc.l $fffd3000,$00023000;Cody
	dc.l $fffbd000,$00035000;Vega
	dc.l $fffbf000,$00031000;Karin
	dc.l $fffc8000,$00028000;Juli
	dc.l $fffc8000,$00028000;Juni

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Aism Jump Data
loc_0dd792:
;Ryu
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Ken
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Akuma
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Charlie
	dc.l $00000000,$0006e000,$00000000,$ffffb000
	dc.l $00000000,$0006e000,$00000000,$ffffb000
	dc.l $fffc8000,$0006c000,$00000500,$ffffb000
	dc.l $00040000,$00070000,$fffffb00,$ffffb000

;Chun
	dc.l $00000000,$00080000,$00000000,$ffff9f00
	dc.l $00000000,$00080000,$00000000,$ffff9f00
	dc.l $fffbe000,$00080000,$00000500,$ffff9f00
	dc.l $00044000,$00080000,$fffffb00,$ffff9f00

;Adon
	dc.l $00000000,$00078000,$00000000,$ffffa000
	dc.l $00000000,$00078000,$00000000,$ffffa000
	dc.l $fffc0000,$00078000,$00000000,$ffffa000
	dc.l $00030000,$00078000,$00000000,$ffffa000

;Sodom
	dc.l $00000000,$00070000,$00000000,$ffffa000
	dc.l $00000000,$00070000,$00000000,$ffffa000
	dc.l $fffc0000,$00070000,$00000500,$ffffa000
	dc.l $00030000,$00070000,$fffffb00,$ffffa000

;Guy
	dc.l $00000000,$00084000,$00000000,$ffffaa00
	dc.l $00000000,$00084000,$00000000,$ffffaa00
	dc.l $fffb0000,$00082000,$00000500,$ffffaa00
	dc.l $00052000,$00082000,$fffffb00,$ffffaa00

;Birdie
	dc.l $00000000,$00074000,$00000000,$ffffa000
	dc.l $00000000,$00074000,$00000000,$ffffa000
	dc.l $fffd0000,$00068000,$00000000,$ffffa000
	dc.l $00030000,$00068000,$00000000,$ffffa000

;Rose
	dc.l $00000000,$00080000,$00000000,$ffffa000
	dc.l $00000000,$00080000,$00000000,$ffffa000
	dc.l $fffc0000,$00080000,$00000000,$ffffa000
	dc.l $00030000,$00080000,$00000000,$ffffa000

;Dict
	dc.l $00000000,$00093000,$00000000,$ffff8800
	dc.l $00000000,$00093000,$00000000,$ffff8800
	dc.l $fffa8000,$00090000,$00000500,$ffff8800
	dc.l $00048000,$00096000,$fffffb00,$ffff8800

;Sagat
	dc.l $00000000,$00074000,$00000000,$ffffa800
	dc.l $00000000,$00074000,$00000000,$ffffa800
	dc.l $fffd6000,$00070000,$00000500,$ffffa800
	dc.l $0002c000,$00078000,$fffffb00,$ffffa800

;Dan
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Sakura
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$0006e000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Rolento
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Dhalsim
	dc.l $00000000,$00060000,$00000000,$ffffd000
	dc.l $00000000,$00060000,$00000000,$ffffd000
	dc.l $fffdc000,$00060000,$00000500,$ffffd000
	dc.l $00026000,$00062000,$fffffb00,$ffffd000

;Zangief
	dc.l $00000000,$00074000,$00000000,$ffffa000
	dc.l $00000000,$00074000,$00000000,$ffffa000
	dc.l $fffd3000,$00070000,$00000500,$ffffa000
	dc.l $0002c000,$00078000,$fffffb00,$ffffa000

;Gen
	dc.l $00000000,$00078000,$00000000,$ffffa800
	dc.l $00000000,$00078000,$00000000,$ffffa800
	dc.l $fffce000,$00078000,$00000500,$ffffa800
	dc.l $00028000,$00078000,$00000000,$ffffa800

;0x12
	dc.l $00000000,$00080000,$00000000,$ffff9f00
	dc.l $00000000,$00080000,$00000000,$ffff9f00
	dc.l $fffbe000,$00080000,$00000500,$ffff9f00
	dc.l $00044000,$00080000,$fffffb00,$ffff9f00

;Gen
	dc.l $00000000,$00088000,$00000000,$ffff9a00
	dc.l $00000000,$00088000,$00000000,$ffff9a00
	dc.l $fffc4000,$00088000,$00000000,$ffff9a00
	dc.l $00040000,$00088000,$00000000,$ffff9a00

;0x14
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Boxer
	dc.l $00000000,$00074000,$00000000,$ffffa000
	dc.l $00000000,$00074000,$00000000,$ffffa000
	dc.l $fffc8000,$00070000,$00000500,$ffffa000
	dc.l $00040000,$00078000,$fffffb00,$ffffa000

;Cammy
	dc.l $00000000,$00078000,$00000000,$ffffb000
	dc.l $00000000,$00078000,$00000000,$ffffb000
	dc.l $fffc8000,$00075000,$00000500,$ffffb000
	dc.l $00040000,$00079000,$fffffb00,$ffffb000

;0x17
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;E.Honda
	dc.l $00000000,$0005a000,$00000000,$ffffbc00
	dc.l $00000000,$0005a000,$00000000,$ffffbc00
	dc.l $fffcc000,$0005a000,$00000500,$ffffbc00
	dc.l $00036000,$0005a000,$fffffb00,$ffffbc00

;Blanka
	dc.l $00000000,$000b2000,$00000000,$ffff7000
	dc.l $00000000,$000b2000,$00000000,$ffff7000
	dc.l $fffc8000,$000b0000,$00000500,$ffff7000
	dc.l $00039800,$000b4000,$fffffb00,$ffff7000

;R.Mika
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Cody
	dc.l $00000000,$0006e000,$00000000,$ffffa400
	dc.l $00000000,$00070000,$00000000,$ffffa400
	dc.l $fffc8000,$00070000,$00000500,$ffffa400
	dc.l $00040000,$00072000,$fffffb00,$ffffa400

;Vega
	dc.l $00000000,$000c2000,$00000000,$ffff5800
	dc.l $00000000,$000c2000,$00000000,$ffff5800
	dc.l $fffa8000,$000c4000,$00001000,$ffff5800
	dc.l $00050000,$000c0000,$fffff000,$ffff5800

;Karin
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8800,$0007ec00,$00000500,$ffffa000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Juli
	dc.l $00000000,$00078000,$00000000,$ffffb000
	dc.l $00000000,$00078000,$00000000,$ffffb000
	dc.l $fffc8000,$00075000,$00000500,$ffffb000
	dc.l $00040000,$00079000,$fffffb00,$ffffb000

;Juni
	dc.l $00000000,$00078000,$00000000,$ffffb000
	dc.l $00000000,$00078000,$00000000,$ffffb000
	dc.l $fffc8000,$00075000,$00000500,$ffffb000
	dc.l $00040000,$00079000,$fffffb00,$ffffb000


;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Vism Jump Data
loc_0ddf92:
;Ryu
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Ken
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Akuma
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Charlie
	dc.l $00000000,$0006e000,$00000000,$ffffb000
	dc.l $00000000,$0006e000,$00000000,$ffffb000
	dc.l $fffc8000,$0006c000,$00000500,$ffffb000
	dc.l $00040000,$00070000,$fffffb00,$ffffb000

;Chun
	dc.l $00000000,$00080000,$00000000,$ffff9f00
	dc.l $00000000,$00080000,$00000000,$ffff9f00
	dc.l $fffbe000,$00080000,$00000500,$ffff9f00
	dc.l $00044000,$00080000,$fffffb00,$ffff9f00

;Adon
	dc.l $00000000,$00078000,$00000000,$ffffa000
	dc.l $00000000,$00078000,$00000000,$ffffa000
	dc.l $fffc0000,$00078000,$00000000,$ffffa000
	dc.l $00030000,$00078000,$00000000,$ffffa000

;Sodom
	dc.l $00000000,$00070000,$00000000,$ffffa000
	dc.l $00000000,$00070000,$00000000,$ffffa000
	dc.l $fffc0000,$00070000,$00000500,$ffffa000
	dc.l $00030000,$00070000,$fffffb00,$ffffa000

;Guy
	dc.l $00000000,$00084000,$00000000,$ffffaa00
	dc.l $00000000,$00084000,$00000000,$ffffaa00
	dc.l $fffb0000,$00082000,$00000500,$ffffaa00
	dc.l $00052000,$00082000,$fffffb00,$ffffaa00

;Birdie
	dc.l $00000000,$00074000,$00000000,$ffffa000
	dc.l $00000000,$00074000,$00000000,$ffffa000
	dc.l $fffd0000,$00068000,$00000000,$ffffa000
	dc.l $00030000,$00068000,$00000000,$ffffa000

;Rose
	dc.l $00000000,$00080000,$00000000,$ffffa000
	dc.l $00000000,$00080000,$00000000,$ffffa000
	dc.l $fffc0000,$00080000,$00000000,$ffffa000
	dc.l $00030000,$00080000,$00000000,$ffffa000

;Dict
	dc.l $00000000,$00093000,$00000000,$ffff8800
	dc.l $00000000,$00093000,$00000000,$ffff8800
	dc.l $fffa8000,$00090000,$00000500,$ffff8800
	dc.l $00048000,$00096000,$fffffb00,$ffff8800

;Sagat
	dc.l $00000000,$00074000,$00000000,$ffffa800
	dc.l $00000000,$00074000,$00000000,$ffffa800
	dc.l $fffd6000,$00070000,$00000500,$ffffa800
	dc.l $0002c000,$00078000,$fffffb00,$ffffa800

;Dan
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Sakura
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$0006e000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Rolento
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Dhalsim
	dc.l $00000000,$00060000,$00000000,$ffffd000
	dc.l $00000000,$00060000,$00000000,$ffffd000
	dc.l $fffdc000,$00060000,$00000500,$ffffd000
	dc.l $00026000,$00062000,$fffffb00,$ffffd000

;Zangief
	dc.l $00000000,$00074000,$00000000,$ffffa000
	dc.l $00000000,$00074000,$00000000,$ffffa000
	dc.l $fffd3000,$00070000,$00000500,$ffffa000
	dc.l $0002c000,$00078000,$fffffb00,$ffffa000

;Gen
	dc.l $00000000,$00078000,$00000000,$ffffa800
	dc.l $00000000,$00078000,$00000000,$ffffa800
	dc.l $fffce000,$00078000,$00000500,$ffffa800
	dc.l $00028000,$00078000,$00000000,$ffffa800

;0x12
	dc.l $00000000,$00080000,$00000000,$ffff9f00
	dc.l $00000000,$00080000,$00000000,$ffff9f00
	dc.l $fffbe000,$00080000,$00000500,$ffff9f00
	dc.l $00044000,$00080000,$fffffb00,$ffff9f00

;Gen
	dc.l $00000000,$00088000,$00000000,$ffff9a00
	dc.l $00000000,$00088000,$00000000,$ffff9a00
	dc.l $fffc4000,$00088000,$00000000,$ffff9a00
	dc.l $00040000,$00088000,$00000000,$ffff9a00

;0x14
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Boxer
	dc.l $00000000,$00074000,$00000000,$ffffa000
	dc.l $00000000,$00074000,$00000000,$ffffa000
	dc.l $fffc8000,$00070000,$00000500,$ffffa000
	dc.l $00040000,$00078000,$fffffb00,$ffffa000

;Cammy
	dc.l $00000000,$00078000,$00000000,$ffffb000
	dc.l $00000000,$00078000,$00000000,$ffffb000
	dc.l $fffc8000,$00075000,$00000500,$ffffb000
	dc.l $00040000,$00079000,$fffffb00,$ffffb000

;0x17
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;E.Honda
	dc.l $00000000,$0005a000,$00000000,$ffffbc00
	dc.l $00000000,$0005a000,$00000000,$ffffbc00
	dc.l $fffcc000,$0005a000,$00000500,$ffffbc00
	dc.l $00036000,$0005a000,$fffffb00,$ffffbc00

;Blanka
	dc.l $00000000,$000b2000,$00000000,$ffff7000
	dc.l $00000000,$000b2000,$00000000,$ffff7000
	dc.l $fffc8000,$000b0000,$00000500,$ffff7000
	dc.l $00039800,$000b4000,$fffffb00,$ffff7000

;R.Mika
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Cody
	dc.l $00000000,$0006e000,$00000000,$ffffa400
	dc.l $00000000,$00070000,$00000000,$ffffa400
	dc.l $fffc8000,$00070000,$00000500,$ffffa400
	dc.l $00040000,$00072000,$fffffb00,$ffffa400

;Vega
	dc.l $00000000,$000c2000,$00000000,$ffff5800
	dc.l $00000000,$000c2000,$00000000,$ffff5800
	dc.l $fffa8000,$000c4000,$00001000,$ffff5800
	dc.l $00050000,$000c0000,$fffff000,$ffff5800

;Karin
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8800,$0007ec00,$00000500,$ffffa000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Juli
	dc.l $00000000,$00078000,$00000000,$ffffb000
	dc.l $00000000,$00078000,$00000000,$ffffb000
	dc.l $fffc8000,$00075000,$00000500,$ffffb000
	dc.l $00040000,$00079000,$fffffb00,$ffffb000

;Juni
	dc.l $00000000,$00078000,$00000000,$ffffb000
	dc.l $00000000,$00078000,$00000000,$ffffb000
	dc.l $fffc8000,$00075000,$00000500,$ffffb000
	dc.l $00040000,$00079000,$fffffb00,$ffffb000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;Xism Jump Data
loc_0de792:
;Ryu
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Ken
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Akuma
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Charlie
	dc.l $00000000,$0006e000,$00000000,$ffffb000
	dc.l $00000000,$0006e000,$00000000,$ffffb000
	dc.l $fffc8000,$0006c000,$00000500,$ffffb000
	dc.l $00040000,$00070000,$fffffb00,$ffffb000

;Chun
	dc.l $00000000,$00080000,$00000000,$ffff9f00
	dc.l $00000000,$00080000,$00000000,$ffff9f00
	dc.l $fffbe000,$00080000,$00000500,$ffff9f00
	dc.l $00044000,$00080000,$fffffb00,$ffff9f00

;Adon
	dc.l $00000000,$00078000,$00000000,$ffffa000
	dc.l $00000000,$00078000,$00000000,$ffffa000
	dc.l $fffc0000,$00078000,$00000000,$ffffa000
	dc.l $00030000,$00078000,$00000000,$ffffa000

;Sodom
	dc.l $00000000,$00070000,$00000000,$ffffa000
	dc.l $00000000,$00070000,$00000000,$ffffa000
	dc.l $fffc0000,$00070000,$00000500,$ffffa000
	dc.l $00030000,$00070000,$fffffb00,$ffffa000

;Guy
	dc.l $00000000,$00084000,$00000000,$ffffaa00
	dc.l $00000000,$00084000,$00000000,$ffffaa00
	dc.l $fffb0000,$00082000,$00000500,$ffffaa00
	dc.l $00052000,$00082000,$fffffb00,$ffffaa00

;Birdie
	dc.l $00000000,$00074000,$00000000,$ffffa000
	dc.l $00000000,$00074000,$00000000,$ffffa000
	dc.l $fffd0000,$00068000,$00000000,$ffffa000
	dc.l $00030000,$00068000,$00000000,$ffffa000

;Rose
	dc.l $00000000,$00080000,$00000000,$ffffa000
	dc.l $00000000,$00080000,$00000000,$ffffa000
	dc.l $fffc0000,$00080000,$00000000,$ffffa000
	dc.l $00030000,$00080000,$00000000,$ffffa000

;Dict
	dc.l $00000000,$00093000,$00000000,$ffff8800
	dc.l $00000000,$00093000,$00000000,$ffff8800
	dc.l $fffa8000,$00090000,$00000500,$ffff8800
	dc.l $00048000,$00096000,$fffffb00,$ffff8800

;Sagat
	dc.l $00000000,$00074000,$00000000,$ffffa800
	dc.l $00000000,$00074000,$00000000,$ffffa800
	dc.l $fffd6000,$00070000,$00000500,$ffffa800
	dc.l $0002c000,$00078000,$fffffb00,$ffffa800

;Dan
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Sakura
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$0006e000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Rolento
	dc.l $00000000,$00072000,$00000000,$ffffa600
	dc.l $00000000,$00072000,$00000000,$ffffa600
	dc.l $fff88000,$00070000,$00000500,$ffffa600
	dc.l $00078000,$00074000,$fffffb00,$ffffa600

;Dhalsim
	dc.l $00000000,$00060000,$00000000,$ffffd000
	dc.l $00000000,$00060000,$00000000,$ffffd000
	dc.l $fffdc000,$00060000,$00000500,$ffffd000
	dc.l $00026000,$00062000,$fffffb00,$ffffd000

;Zangief
	dc.l $00000000,$00074000,$00000000,$ffffa000
	dc.l $00000000,$00074000,$00000000,$ffffa000
	dc.l $fffd3000,$00070000,$00000500,$ffffa000
	dc.l $0002c000,$00078000,$fffffb00,$ffffa000

;Gen
	dc.l $00000000,$00080000,$00000000,$ffffa100
	dc.l $00000000,$00080000,$00000000,$ffffa100
	dc.l $fffc9000,$00080000,$00000280,$ffffa100
	dc.l $00034000,$00080000,$00000000,$ffffa100

;0x12
	dc.l $00000000,$00080000,$00000000,$ffff9f00
	dc.l $00000000,$00080000,$00000000,$ffff9f00
	dc.l $fffbe000,$00080000,$00000500,$ffff9f00
	dc.l $00044000,$00080000,$fffffb00,$ffff9f00

;Gen
	dc.l $00000000,$00080000,$00000000,$ffffa100
	dc.l $00000000,$00080000,$00000000,$ffffa100
	dc.l $fffc9000,$00080000,$00000280,$ffffa100
	dc.l $00034000,$00080000,$00000000,$ffffa100

;0x14
	dc.l $00000000,$00080000,$00000000,$ffff9f00
	dc.l $00000000,$00080000,$00000000,$ffff9f00
	dc.l $fffbe000,$00080000,$00000500,$ffff9f00
	dc.l $00044000,$00080000,$fffffb00,$ffff9f00

;Boxer
	dc.l $00000000,$00074000,$00000000,$ffffa000
	dc.l $00000000,$00074000,$00000000,$ffffa000
	dc.l $fffc8000,$00070000,$00000500,$ffffa000
	dc.l $00040000,$00078000,$fffffb00,$ffffa000

;Cammy
	dc.l $00000000,$00078000,$00000000,$ffffb000
	dc.l $00000000,$00078000,$00000000,$ffffb000
	dc.l $fffc8000,$00075000,$00000500,$ffffb000
	dc.l $00040000,$00079000,$fffffb00,$ffffb000

;0x17
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;E.Honda
	dc.l $00000000,$0005a000,$00000000,$ffffbc00
	dc.l $00000000,$0005a000,$00000000,$ffffbc00
	dc.l $fffcc000,$0005a000,$00000500,$ffffbc00
	dc.l $00036000,$0005a000,$fffffb00,$ffffbc00

;Blanka
	dc.l $00000000,$000b2000,$00000000,$ffff7000
	dc.l $00000000,$000b2000,$00000000,$ffff7000
	dc.l $fffc8000,$000b0000,$00000500,$ffff7000
	dc.l $00039800,$000b4000,$fffffb00,$ffff7000

;R.Mika
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8000,$00070000,$00000500,$ffffb000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Cody
	dc.l $00000000,$0006e000,$00000000,$ffffa400
	dc.l $00000000,$00070000,$00000000,$ffffa400
	dc.l $fffc8000,$00070000,$00000500,$ffffa400
	dc.l $00040000,$00072000,$fffffb00,$ffffa400

;Vega
	dc.l $00000000,$000c2000,$00000000,$ffff5800
	dc.l $00000000,$000c2000,$00000000,$ffff5800
	dc.l $fffa8000,$000c4000,$00001000,$ffff5800
	dc.l $00050000,$000c0000,$fffff000,$ffff5800

;Karin
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $00000000,$00072000,$00000000,$ffffb000
	dc.l $fffc8800,$0007ec00,$00000500,$ffffa000
	dc.l $00040000,$00074000,$fffffb00,$ffffb000

;Juli
	dc.l $00000000,$00078000,$00000000,$ffffb000
	dc.l $00000000,$00078000,$00000000,$ffffb000
	dc.l $fffc8000,$00075000,$00000500,$ffffb000
	dc.l $00040000,$00079000,$fffffb00,$ffffb000

;Juni
	dc.l $00000000,$00078000,$00000000,$ffffb000
	dc.l $00000000,$00078000,$00000000,$ffffb000
	dc.l $fffc8000,$00075000,$00000500,$ffffb000
	dc.l $00040000,$00079000,$fffffb00,$ffffb000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0def92:
;Ryu
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Ken
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Akuma
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Charlie
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Chun
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Adon
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Sodom
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Guy
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Birdie
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Rose
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Dict
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Sagat
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Dan
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Sakura
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Rolento
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Dhalsim
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Zangief
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Gen
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;0x12
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Gen
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;0x14
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Boxer
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Cammy
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;0x17
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;E.Honda
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Blanka
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;R.Mika
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Cody
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Vega
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Karin
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Juli
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;Juni
	dc.b $00,$00,$00,$00,$00,$00,$00,$00
	dc.b $00,$01,$01,$01,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$03,$03,$03,$03
	dc.b $03,$03,$03,$03,$03,$04,$04,$04

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0df392:
	dc.l loc_2d3cea,loc_2d463e,loc_2d51bc,loc_2d5c58
	dc.l loc_2d793a,loc_2d85f2,loc_2d9102,loc_2da562
	dc.l loc_2dbba0,loc_2dca1e,loc_2dd302,loc_2de1f6
	dc.l loc_2de4fa,loc_2deb1c,loc_2df356,loc_2df6d4
	dc.l loc_2e0144,loc_2e17de,loc_2d3cea,loc_2e17de
	dc.l loc_2d3cea,loc_2e1dda,loc_2e26fa,loc_2d3cea
	dc.l loc_2e2cae,loc_2e355a,loc_2e423a,loc_2e46f0
	dc.l loc_2e48f2,loc_2e4c3e,loc_2e4e34,loc_2e5060

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
;AI Move Checks
loc_0df412:
	dc.l loc_034aae,loc_036308,loc_0381a0,loc_03aa0c
	dc.l loc_03c702,loc_03e28c,loc_03f972,loc_041b46
	dc.l loc_0439f6,loc_045530,loc_0478d6,loc_04a6fc
	dc.l loc_04b556,loc_04d9c8,loc_04fd20,loc_052af8
	dc.l loc_05491e,loc_057658,loc_034aae,loc_057658
	dc.l loc_034aae,loc_05a100,loc_05b402,loc_034aae
	dc.l loc_05e47a,loc_060482,loc_062754,loc_065c0e
	dc.l loc_068040,loc_06a454,loc_06bfea,loc_06fa24

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0df492:
	dc.l loc_2ba5b6,loc_2bba6e,loc_2bc25c,loc_2bd64c
	dc.l loc_2be30a,loc_2c1152,loc_2c23e2,loc_2c5914
	dc.l loc_2c6b8e,loc_2c9d70,loc_2cabec,loc_2cb550
	dc.l loc_2cc43c,loc_2cca52,loc_2ccc94,loc_2cd72e
	dc.l loc_2cdc00,loc_2ce91c,loc_2ba5b6,loc_2ce91c
	dc.l loc_2ba5b6,loc_2cf654,loc_2cfb2e,loc_2ba5b6
	dc.l loc_2d046c,loc_2d0878,loc_2d0e88,loc_2d1540
	dc.l loc_2d1b52,loc_2d229a,loc_2d25c8,loc_2d285c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0df512:
	dc.l loc_2ba6b0,loc_2bbbf4,loc_2bc316,loc_2bd720
	dc.l loc_2be42c,loc_2c123a,loc_2c25c8,loc_2c5a1c
	dc.l loc_2c6cf8,loc_2c9e60,loc_2cac9a,loc_2cb606
	dc.l loc_2cc530,loc_2ccb4c,loc_2ccd84,loc_2cd7e4
	dc.l loc_2cdd28,loc_2cea22,loc_2ba6b0,loc_2cea22
	dc.l loc_2ba6b0,loc_2cf76e,loc_2cfc2c,loc_2ba6b0
	dc.l loc_2d059c,loc_2d09e2,loc_2d0f64,loc_2d1640
	dc.l loc_2d1c6e,loc_2d2394,loc_2d26c2,loc_2d29ae

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0df592:
	dc.l loc_2d2a56,loc_2d3d2a,loc_2d467e,loc_2d51fc
	dc.l loc_2d5c98,loc_2d797a,loc_2d8632,loc_2d9142
	dc.l loc_2da5a2,loc_2dbbe0,loc_2dca5e,loc_2dd342
	dc.l loc_2de236,loc_2de53a,loc_2deb5c,loc_2df396
	dc.l loc_2df714,loc_2e0184,loc_2d2a56,loc_2e0184
	dc.l loc_2d2a56,loc_2e181e,loc_2e1e1a,loc_2d2a56
	dc.l loc_2e273a,loc_2e2cee,loc_2e359a,loc_2e427a
	dc.l loc_2e4730,loc_2e4932,loc_2e4c7e,loc_2e4e74

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0df612:
	dc.l loc_2d3b30,loc_2d44a0,loc_2d4f9c,loc_2d5abe
	dc.l loc_2d76f8,loc_2d8432,loc_2d8ee8,loc_2da390
	dc.l loc_2db998,loc_2dc7c6,loc_2dd1e4,loc_2ddf04
	dc.l loc_2de456,loc_2de982,loc_2df0e0,loc_2df594
	dc.l loc_2dfe74,loc_2e14ea,loc_2d3b30,loc_2e14ea
	dc.l loc_2d3b30,loc_2e1ce2,loc_2e2580,loc_2d3b30
	dc.l loc_2e2b06,loc_2e339c,loc_2e4098,loc_2e457a
	dc.l loc_2e4898,loc_2e4ad2,loc_2e4de6,loc_2e4fdc

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0df692:
	dc.l loc_102b86,loc_102b86,loc_102b86,loc_108006
	dc.l loc_10b368,loc_10d2ce,loc_10f9c6,loc_1126d0
	dc.l loc_115c06,loc_11831c,loc_119aca,loc_11c276
	dc.l loc_102b86,loc_11efa6,loc_121814,loc_124042
	dc.l loc_1290fc,loc_12d106,loc_10b368,loc_12d106
	dc.l loc_10f9c6,loc_12e7d4,loc_132d74,loc_102b86
	dc.l loc_135328,loc_137218,loc_13b984,loc_13dd58
	dc.l loc_141552,loc_1442fa,loc_132d74,loc_132d74

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0df712:
	dc.l loc_102ba0,loc_102ba0,loc_102ba0,loc_108020
	dc.l loc_10b384,loc_10d2e8,loc_10f9ea,loc_1126ec
	dc.l loc_115c20,loc_118338,loc_119ae4,loc_11c28e
	dc.l loc_102ba0,loc_11efc2,loc_121830,loc_12405e
	dc.l loc_12911c,loc_12d122,loc_10b384,loc_12d122
	dc.l loc_10f9ea,loc_12e7ee,loc_132d92,loc_102ba0
	dc.l loc_135342,loc_137232,loc_13b99e,loc_13dd72
	dc.l loc_14156c,loc_144316,loc_132d92,loc_132d92

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0df792:
	dc.l loc_102c80,loc_102c80,loc_102c80,loc_108100
	dc.l loc_10b474,loc_10d3c8,loc_10faca,loc_1127dc
	dc.l loc_115d00,loc_118428,loc_119bc4,loc_11c35e
	dc.l loc_102c80,loc_11f0b2,loc_121920,loc_12414e
	dc.l loc_12922c,loc_12d212,loc_10b474,loc_12d212
	dc.l loc_10faca,loc_12e8ce,loc_132e92,loc_102c80
	dc.l loc_135422,loc_137312,loc_13ba9e,loc_13de52
	dc.l loc_14164c,loc_144406,loc_132e92,loc_132e92

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0df812:
	dc.l loc_102c90,loc_10472e,loc_105dbc,loc_108110
	dc.l loc_10b484,loc_10d3d8,loc_10fada,loc_1127ec
	dc.l loc_115d10,loc_118438,loc_119bd4,loc_11c36e
	dc.l loc_11d52c,loc_11f0c2,loc_121930,loc_12415e
	dc.l loc_12923c,loc_12d222,loc_10b484,loc_12d222
	dc.l loc_10fada,loc_12e8de,loc_132ea2,loc_102c90
	dc.l loc_135432,loc_137322,loc_13baae,loc_13de62
	dc.l loc_14165c,loc_144416,loc_132ea2,loc_132ea2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0df892:
	dc.l loc_102d20,loc_102d20,loc_102d20,loc_1081b0
	dc.l loc_10b554,loc_10d488,loc_10fbba,loc_1128a4
	dc.l loc_115e28,loc_118548,loc_119ca4,loc_11c436
	dc.l loc_102d20,loc_11f1b2,loc_121a50,loc_12425e
	dc.l loc_1292ec,loc_12d2b2,loc_10b554,loc_12d2b2
	dc.l loc_10fbba,loc_12e996,loc_132fa2,loc_102d20
	dc.l loc_135542,loc_137422,loc_13bbb6,loc_13dfaa
	dc.l loc_14186c,loc_144516,loc_132fa2,loc_132fa2

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0df912:
	dc.b $28,$28,$22,$28,$28,$28,$2e,$28
	dc.b $30,$28,$28,$28,$28,$28,$28,$28
	dc.b $32,$28,$28,$28,$2e,$28,$28,$28
	dc.b $2c,$2b,$28,$28,$28,$28,$28,$28

;Guard Meter Values
;0xdf932
Guard_meter_table:
	dc.b $44;Ryu
	dc.b $44;Ken
	dc.b $44;Akuma
	dc.b $40;Charlie
	dc.b $40;Chun
	dc.b $48;Adon
	dc.b $48;Sodom
	dc.b $44;Guy
	dc.b $50;Birdie
	dc.b $44;Rose
	dc.b $48;Dict
	dc.b $44;Sagat
	dc.b $44;Dan
	dc.b $4c;Sakura
	dc.b $44;Rolento
	dc.b $44;Dhalsim
	dc.b $50;Zangief
	dc.b $48;Gen
	dc.b $40;0x12
	dc.b $48;Gen
	dc.b $48;0x14
	dc.b $4c;Boxer
	dc.b $40;Cammy
	dc.b $48;0x17
	dc.b $48;E.Honda
	dc.b $44;Blanka
	dc.b $48;R.Mika
	dc.b $48;Cody
	dc.b $40;Vega
	dc.b $4c;Karin
	dc.b $40;Juli
	dc.b $40;Juni

loc_0df952:
	dc.b $01,$01,$01,$00,$00,$02,$02,$01
	dc.b $04,$01,$02,$01,$01,$03,$01,$01
	dc.b $04,$02,$00,$02,$02,$03,$00,$02
	dc.b $02,$01,$02,$02,$00,$03,$00,$00

loc_0df972:
	dc.b $03,$03,$03,$03,$02,$02,$02,$03
	dc.b $01,$02,$03,$03,$03,$02,$02,$03
	dc.b $01,$02,$02,$02,$02,$03,$02,$02
	dc.b $03,$03,$02,$03,$02,$02,$02,$02

loc_0df992:
	dc.b $02,$02,$04,$02,$00,$02,$02,$02
	dc.b $02,$00,$04,$04,$02,$00,$02,$02
	dc.b $02,$04,$00,$04,$02,$02,$02,$02
	dc.b $02,$02,$02,$02,$02,$00,$00,$00

loc_0df9b2:
	dc.b $32,$32,$32,$32,$32,$32,$32,$32
	dc.b $32,$32,$32,$32,$32,$32,$32,$32
	dc.b $32,$32,$32,$32,$32,$32,$32,$32
	dc.b $32,$32,$32,$32,$32,$32,$32,$32
	dc.b $0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c
	dc.b $0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c
	dc.b $0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c
	dc.b $0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c
	dc.b $0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c
	dc.b $0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c
	dc.b $0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c
	dc.b $0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c
	dc.b $0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c
	dc.b $0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c
	dc.b $0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c
	dc.b $0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c
	dc.b $0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c
	dc.b $0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c
	dc.b $0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c
	dc.b $0c,$0c,$0c,$0c,$0c,$0c,$0c,$0c

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0dfa52:
	dc.w loc_0dfa92-loc_0dfa52
	dc.w loc_0dfa9a-loc_0dfa52
	dc.w loc_0dfaa2-loc_0dfa52
	dc.w loc_0dfaaa-loc_0dfa52
	dc.w loc_0dfab0-loc_0dfa52
	dc.w loc_0dfaba-loc_0dfa52
	dc.w loc_0dfac2-loc_0dfa52
	dc.w loc_0dfaca-loc_0dfa52

	dc.w loc_0dfad2-loc_0dfa52
	dc.w loc_0dfadc-loc_0dfa52
	dc.w loc_0dfae6-loc_0dfa52
	dc.w loc_0dfaf6-loc_0dfa52
	dc.w loc_0dfafe-loc_0dfa52
	dc.w loc_0dfb08-loc_0dfa52
	dc.w loc_0dfb10-loc_0dfa52
	dc.w loc_0dfb1a-loc_0dfa52

	dc.w loc_0dfb26-loc_0dfa52
	dc.w loc_0dfb2e-loc_0dfa52
	dc.w loc_0dfab0-loc_0dfa52
	dc.w loc_0dfb2e-loc_0dfa52
	dc.w loc_0dfac2-loc_0dfa52
	dc.w loc_0dfaee-loc_0dfa52
	dc.w loc_0dfb34-loc_0dfa52
	dc.w loc_0dfb78-loc_0dfa52

	dc.w loc_0dfb40-loc_0dfa52
	dc.w loc_0dfb48-loc_0dfa52
	dc.w loc_0dfb52-loc_0dfa52
	dc.w loc_0dfb5c-loc_0dfa52
	dc.w loc_0dfb64-loc_0dfa52
	dc.w loc_0dfb6c-loc_0dfa52
	dc.w loc_0dfaee-loc_0dfa52
	dc.w loc_0dfaee-loc_0dfa52

loc_0dfa92:
	dc.w $0102,$0900,$0a04,$ffff

loc_0dfa9a:
	dc.w $0a00,$0d00,$1d00,$ffff

loc_0dfaa2:
	dc.w $0500,$0700,$0a00,$ffff

loc_0dfaaa:
	dc.w $0e00,$1600,$ffff

loc_0dfab0:
	dc.w $0800,$1606,$1e16,$1f16,$ffff

loc_0dfaba:
	dc.w $0100,$0900,$0a00,$ffff

loc_0dfac2:
	dc.w $0400,$0a00,$0e00,$ffff

loc_0dfaca:
	dc.w $0a00,$1100,$1300,$ffff

loc_0dfad2:
	dc.w $0a00,$150c,$1800,$1900,$ffff

loc_0dfadc:
	dc.w $0700,$1b00,$1e16,$1f16,$ffff

loc_0dfae6:
	dc.w $0000,$0200,$0b00,$ffff

loc_0dfaee:
	dc.w $001a,$021a,$0b1a,$ffff

loc_0dfaf6:
	dc.w $0008,$0a00,$0c14,$ffff

loc_0dfafe:
	dc.w $0400,$0a00,$0b00,$150c,$ffff

loc_0dfb08:
	dc.w $000a,$0a00,$1800,$ffff

loc_0dfb10:
	dc.w $0600,$0a00,$150c,$1b00,$ffff

loc_0dfb1a:
	dc.w $0800,$0900,$0a00,$1e16,$1f16,$ffff

loc_0dfb26:
	dc.w $0400,$0a00,$0e00,$ffff

loc_0dfb2e:
	dc.w $0000,$0a00,$ffff

loc_0dfb34:
	dc.w $0a00,$0f00,$1c00,$1e16,$1f16,$ffff

loc_0dfb40:
	dc.w $0000,$0600,$0a00,$ffff

loc_0dfb48:
	dc.w $0a00,$0c00,$1000,$150c,$ffff

loc_0dfb52:
	dc.w $0a10,$1000,$150e,$1d14,$ffff

loc_0dfb5c:
	dc.w $0700,$0800,$0a00,$ffff

loc_0dfb64:
	dc.w $0a00,$1000,$1600,$ffff

loc_0dfb6c:
	dc.w $0a00,$0d00,$1900,$1e18,$1f18,$ffff

loc_0dfb78:
	dc.w $ffff

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
loc_0dfb7a:
	dc.w loc_0dfbba-loc_0dfb7a
	dc.w loc_0dfbc2-loc_0dfb7a
	dc.w loc_0dfbca-loc_0dfb7a
	dc.w loc_0dfbce-loc_0dfb7a
	dc.w loc_0dfbd4-loc_0dfb7a
	dc.w loc_0dfbda-loc_0dfb7a
	dc.w loc_0dfbe0-loc_0dfb7a
	dc.w loc_0dfbe6-loc_0dfb7a

	dc.w loc_0dfbf0-loc_0dfb7a
	dc.w loc_0dfbf8-loc_0dfb7a
	dc.w loc_0dfc00-loc_0dfb7a
	dc.w loc_0dfc08-loc_0dfb7a
	dc.w loc_0dfc0e-loc_0dfb7a
	dc.w loc_0dfc16-loc_0dfb7a
	dc.w loc_0dfc1c-loc_0dfb7a
	dc.w loc_0dfc24-loc_0dfb7a

	dc.w loc_0dfc2c-loc_0dfb7a
	dc.w loc_0dfc32-loc_0dfb7a
	dc.w loc_0dfbd4-loc_0dfb7a
	dc.w loc_0dfc32-loc_0dfb7a
	dc.w loc_0dfbe0-loc_0dfb7a
	dc.w loc_0dfc04-loc_0dfb7a
	dc.w loc_0dfc3a-loc_0dfb7a
	dc.w loc_0dfc6e-loc_0dfb7a

	dc.w loc_0dfc42-loc_0dfb7a
	dc.w loc_0dfc4a-loc_0dfb7a
	dc.w loc_0dfc52-loc_0dfb7a
	dc.w loc_0dfc5a-loc_0dfb7a
	dc.w loc_0dfc60-loc_0dfb7a
	dc.w loc_0dfc66-loc_0dfb7a
	dc.w loc_0dfc04-loc_0dfb7a
	dc.w loc_0dfc04-loc_0dfb7a

loc_0dfbba:
	dc.w $0100,$0902,$0a00,$ffff

loc_0dfbc2:
	dc.w $0d02,$1d02,$0a00,$ffff

loc_0dfbca:
	dc.w $0a00,$ffff

loc_0dfbce:
	dc.w $1604,$0a00,$ffff

loc_0dfbd4:
	dc.w $0800,$0a00,$ffff

loc_0dfbda:
	dc.w $0100,$0a00,$ffff

loc_0dfbe0:
	dc.w $0e02,$0a00,$ffff

loc_0dfbe6:
	dc.w $1100,$1300,$1d00,$0a00,$ffff

loc_0dfbf0:
	dc.w $1802,$1900,$0a00,$ffff

loc_0dfbf8:
	dc.w $0702,$1c00,$0a00,$ffff

loc_0dfc00:
	dc.w $0200,$ffff

loc_0dfc04:
	dc.w $020a,$ffff

loc_0dfc08:
	dc.w $0c00,$0a00,$ffff

loc_0dfc0e:
	dc.w $0408,$0b00,$0a00,$ffff

loc_0dfc16:
	dc.w $1802,$0a00,$ffff

loc_0dfc1c:
	dc.w $0602,$1b00,$0a00,$ffff

loc_0dfc24:
	dc.w $0800,$0902,$0a00,$ffff

loc_0dfc2c:
	dc.w $0e00,$0a00,$ffff

loc_0dfc32:
	dc.w $0000,$0200,$0a00,$ffff

loc_0dfc3a:
	dc.w $0f02,$1c02,$0a00,$ffff

loc_0dfc42:
	dc.w $0002,$0606,$0a00,$ffff

loc_0dfc4a:
	dc.w $0c02,$1000,$0a00,$ffff

loc_0dfc52:
	dc.w $1002,$1d02,$0a00,$ffff

loc_0dfc5a:
	dc.w $0702,$0a00,$ffff

loc_0dfc60:
	dc.w $1604,$0a00,$ffff

loc_0dfc66:
	dc.w $0d02,$1900,$0a00,$ffff

loc_0dfc6e:
	dc.w $ffff,$0000

;VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
endofcryptroms: ;dfc72
	dcb.b $100000-endofcryptroms,$ff