loc_01cdd2:
	dc.w Boot_Text_Japan-loc_01cdd2
	dc.w Boot_Text_USA-loc_01cdd2
	dc.w Boot_Text_CentSouthAmerica-loc_01cdd2
	dc.w Boot_Text_Oceania-loc_01cdd2
	dc.w Boot_Text_Asia-loc_01cdd2
	dc.w Boot_Text_Europe-loc_01cdd2
	dc.w Boot_Text_Brazil-loc_01cdd2

	dc.w Japan_Warning-loc_01cdd2
	dc.w Canada_USA_Warning-loc_01cdd2
	dc.w CentSouth_America_Warning-loc_01cdd2
	dc.w Oceania_Warning-loc_01cdd2
	dc.w Asia_Warning-loc_01cdd2
	dc.w Europe_Warning-loc_01cdd2
	dc.w Brazil_Warning-loc_01cdd2

	dc.w Free_Play_Text-loc_01cdd2
	dc.w TwoCreditsStart_Text-loc_01cdd2
	dc.w One_Credit_Text-loc_01cdd2;20
	dc.w Two_Credit_Text-loc_01cdd2
	dc.w Three_Credit_Text-loc_01cdd2
	dc.w Four_Credit_Text-loc_01cdd2
	dc.w Five_Credit_Text-loc_01cdd2
	dc.w Six_Credit_Text-loc_01cdd2
	dc.w Seven_Credit_Text-loc_01cdd2
	dc.w Eight_Credit_Text-loc_01cdd2
	dc.w Nine_Credit_Text-loc_01cdd2;30
	dc.w loc_01da3c-loc_01cdd2
	dc.w loc_01da45-loc_01cdd2
	dc.w loc_01da4f-loc_01cdd2
	dc.w loc_01da5a-loc_01cdd2
	dc.w loc_01da66-loc_01cdd2
	dc.w loc_01da71-loc_01cdd2
	dc.w loc_01da7d-loc_01cdd2

	dc.w loc_01da86-loc_01cdd2;40
	dc.w loc_01da8f-loc_01cdd2
	dc.w loc_01da99-loc_01cdd2
	dc.w loc_01daa3-loc_01cdd2
	dc.w loc_01daae-loc_01cdd2
	dc.w loc_01dab9-loc_01cdd2
	dc.w loc_01dac5-loc_01cdd2
	dc.w loc_01dad1-loc_01cdd2

	dc.w loc_01dadc-loc_01cdd2;50
	dc.w loc_01dae7-loc_01cdd2
	dc.w loc_01daf3-loc_01cdd2
	dc.w loc_01daff-loc_01cdd2
	dc.w loc_01db16-loc_01cdd2
	dc.w loc_01db2d-loc_01cdd2
	dc.w loc_01db44-loc_01cdd2
	dc.w loc_01db5b-loc_01cdd2

	dc.w loc_01db72-loc_01cdd2;60
	dc.w loc_01db89-loc_01cdd2
	dc.w loc_01dba0-loc_01cdd2
	dc.w loc_01dbb7-loc_01cdd2
	dc.w loc_01dbcf-loc_01cdd2
	dc.w loc_01dbe1-loc_01cdd2
	dc.w loc_01dbf3-loc_01cdd2
	dc.w loc_01dc05-loc_01cdd2

	dc.w loc_01dc17-loc_01cdd2;70
	dc.w loc_01dc29-loc_01cdd2
	dc.w loc_01dc3b-loc_01cdd2
	dc.w loc_01dc4d-loc_01cdd2
	dc.w loc_01dc5f-loc_01cdd2
	dc.w loc_01dc71-loc_01cdd2
	dc.w loc_01dc83-loc_01cdd2
	dc.w loc_01dc95-loc_01cdd2

	dc.w loc_01dca7-loc_01cdd2;80
	dc.w loc_01dcb9-loc_01cdd2
	dc.w loc_01dccb-loc_01cdd2
	dc.w loc_01dcdd-loc_01cdd2
	dc.w loc_01dcef-loc_01cdd2
	dc.w loc_01dd01-loc_01cdd2
	dc.w loc_01dd13-loc_01cdd2
	dc.w loc_01dd25-loc_01cdd2

	dc.w loc_01dd37-loc_01cdd2;90
	dc.w loc_01dd49-loc_01cdd2
	dc.w loc_01dd5b-loc_01cdd2
	dc.w loc_01dd6d-loc_01cdd2
	dc.w loc_01dd7f-loc_01cdd2
	dc.w loc_01dd91-loc_01cdd2
	dc.w loc_01dda3-loc_01cdd2
	dc.w loc_01ddb5-loc_01cdd2

	dc.w loc_01ddc7-loc_01cdd2;a
	dc.w loc_01ddd9-loc_01cdd2
	dc.w loc_01ddeb-loc_01cdd2
	dc.w loc_01ddfd-loc_01cdd2
	dc.w loc_01de0f-loc_01cdd2
	dc.w loc_01de21-loc_01cdd2
	dc.w loc_01de33-loc_01cdd2
	dc.w loc_01de45-loc_01cdd2

	dc.w loc_01de57-loc_01cdd2;1085
	dc.w loc_01de71-loc_01cdd2;109f
	dc.w loc_01de89-loc_01cdd2;10b7
	dc.w loc_01dec1-loc_01cdd2;10ef
	dc.w loc_01de89-loc_01cdd2;10b7
	dc.w loc_01dec1-loc_01cdd2;10ef
	dc.w loc_01de57-loc_01cdd2;1085
	dc.w loc_01de71-loc_01cdd2;109f

	dc.w loc_01de57-loc_01cdd2;1085
	dc.w loc_01de71-loc_01cdd2;109f
	dc.w loc_01de57-loc_01cdd2;1085
	dc.w loc_01de71-loc_01cdd2;109f
	dc.w loc_01de89-loc_01cdd2;10b7
	dc.w loc_01dec1-loc_01cdd2;10ef
	dc.w loc_01ded9-loc_01cdd2;1107
	dc.w loc_01ded9-loc_01cdd2;1107

;================================================
;	dc.b X_location,Y_Postion_times_4,Palette
;	dc.b "text here",$7f to start a new section
;	dc.b X_location,Y_Postion_times_4,Palette
;	dc.b "demo text",00 to end

Boot_Text_Japan:;00
	dc.b $0d,$24,$01
	dc.b 'STREET FIGHTER ZERO 3',$7f
	dc.b $12,$30,$01
	dc.b '9 8 0 9 0 4',$7f
	dc.b $13,$3c,$01
	dc.b 'J A P A N',$00

Boot_Text_USA:;02
	dc.b $0d,$24,$01
	dc.b 'STREET FIGHTER ALPHA 3',$7f
	dc.b $12,$30,$01
	dc.b '9 8 0 9 0 4',$7f
	dc.b $15,$3c,$01
	dc.b 'U S A',$00

Boot_Text_CentSouthAmerica:;04
	dc.b $0d,$24,$01
	dc.b 'STREET FIGHTER ALPHA 3',$7f
	dc.b $12,$30,$01
	dc.b '9 8 0 9 0 4',$7f
	dc.b $10,$3c,$01
	dc.b 'H I S P A N I C',$00

Boot_Text_Oceania:;06
	dc.b $0d,$24,$01
	dc.b 'STREET FIGHTER ALPHA 3',$7f
	dc.b $12,$30,$01
	dc.b '9 8 0 9 0 4',$7f
	dc.b $11,$3c,$01
	dc.b 'O C E A N I A',$00

Boot_Text_Asia:;08
	dc.b $0d,$24,$01
	dc.b 'STREET FIGHTER ZERO 3',$7f
	dc.b $12,$30,$01
	dc.b '9 8 0 9 0 4',$7f
	dc.b $14,$3c,$01
	dc.b 'A S I A',$00

Boot_Text_Europe:;0a
	dc.b $0d,$24,$01
	dc.b 'STREET FIGHTER ALPHA 3',$7f
	dc.b $12,$30,$01
	dc.b '9 8 0 9 0 4',$7f
	dc.b $14,$3c,$01
	dc.b 'E U R O',$00

Boot_Text_Brazil:;0c
	dc.b $0d,$24,$01
	dc.b 'STREET FIGHTER ALPHA 3',$7f
	dc.b $12,$30,$01
	dc.b '9 8 0 9 0 4',$7f
	dc.b $12,$3c,$01
	dc.b 'B R A Z I L',$00

;Warnings
Japan_Warning:;00
	dc.b $14,$10,$01
	dc.b 'WARNING',$7f
	dc.b $04,$20,$01
	dc.b 'This game is for use in Japan only.',$7f
	dc.b $03,$28,$01
	dc.b ' Sales, export or operation outside this',$7f
	dc.b $03,$30,$01
	dc.b 'country may be construed as copyright and',$7f
	dc.b $03,$38,$01
	dc.b 'trademark infringement and is strictly',$7f
	dc.b $03,$40,$01
	dc.b 'prohibited.',$7f
	dc.b $03,$48,$01
	dc.b ' Violators are subject to severe penalties',$7f
	dc.b $03,$50,$01
	dc.b 'and will be prosecuted to the full extent',$7f
	dc.b $03,$58,$01
	dc.b 'of the law.',$00

Canada_USA_Warning:;02
	dc.b $14,$10,$01
	dc.b 'WARNING',$7f
	dc.b $04,$20,$01
	dc.b 'This game is for use in the United States',$7f
	dc.b $03,$28,$01
	dc.b 'of America and Canada only.',$7f
	dc.b $04,$30,$01
	dc.b 'Sales, export or operation outside these',$7f
	dc.b $03,$38,$01
	dc.b 'countries may be construed as copyright',$7f
	dc.b $03,$40,$01
	dc.b 'and trademark infringement and is strictly',$7f
	dc.b $03,$48,$01
	dc.b 'prohibited.',$7f
	dc.b $04,$50,$01
	dc.b 'Violators are subject to severe penalties',$7f
	dc.b $03,$58,$01
	dc.b 'and will be prosecuted to the full extent',$7f
	dc.b $03,$60,$01
	dc.b 'of the law.',$00

CentSouth_America_Warning:;04
	dc.b $14,$10,$01
	dc.b 'WARNING',$7f
	dc.b $04,$20,$01
	dc.b 'This game is for use in the Western',$7f
	dc.b $03,$28,$01
	dc.b 'Hemisphere countries except the United',$7f
	dc.b $03,$30,$01
	dc.b 'States of America, Canada, and the',$7f
	dc.b $03,$38,$01
	dc.b 'Federative Republic of Brazil.',$7f
	dc.b $04,$40,$01
	dc.b 'Sales, export or operation outside these',$7f
	dc.b $03,$48,$01
	dc.b 'countries may be construed as copyright',$7f
	dc.b $03,$50,$01
	dc.b 'and trademark infringement and is strictly',$7f
	dc.b $03,$58,$01
	dc.b 'prohibited.',$7f
	dc.b $04,$60,$01
	dc.b 'Violators are subject to severe penalties',$7f
	dc.b $03,$68,$01
	dc.b 'and will be prosecuted to the full extent',$7f
	dc.b $03,$70,$01
	dc.b 'of the law.',$00

Oceania_Warning:;06
	dc.b $14,$10,$01
	dc.b 'WARNING',$7f
	dc.b $04,$20,$01
	dc.b 'This game is for use in the Oceanian',$7f
	dc.b $03,$28,$01
	dc.b 'countries only.',$7f
	dc.b $04,$30,$01
	dc.b 'Sales, export or operation outside these',$7f
	dc.b $03,$38,$01
	dc.b 'countries may be construed as copyright',$7f
	dc.b $03,$40,$01
	dc.b 'and trademark infringement and is strictly',$7f
	dc.b $03,$48,$01
	dc.b 'prohibited.',$7f
	dc.b $04,$50,$01
	dc.b 'Violators are subject to severe penalties',$7f
	dc.b $03,$58,$01
	dc.b 'and will be prosecuted to the full extent',$7f
	dc.b $03,$60,$01
	dc.b 'of the law.',$00

Asia_Warning:;08
	dc.b $14,$10,$01
	dc.b 'WARNING',$7f
	dc.b $04,$20,$01
	dc.b 'This game is for use in the south-east',$7f
	dc.b $03,$28,$01
	dc.b 'Asian countries only.',$7f
	dc.b $04,$30,$01
	dc.b 'Sales, export or operation outside these',$7f
	dc.b $03,$38,$01
	dc.b 'countries may be construed as copyright',$7f
	dc.b $03,$40,$01
	dc.b 'and trademark infringement and is strictly',$7f
	dc.b $03,$48,$01
	dc.b 'prohibited.',$7f
	dc.b $04,$50,$01
	dc.b 'Violators are subject to severe penalties',$7f
	dc.b $03,$58,$01
	dc.b 'and will be prosecuted to the full extent',$7f
	dc.b $03,$60,$01
	dc.b 'of the law.',$00

Europe_Warning:;0a
	dc.b $14,$10,$01
	dc.b 'WARNING',$7f
	dc.b $04,$20,$01
	dc.b 'This game is for use in the European',$7f
	dc.b $03,$28,$01
	dc.b 'countries only.',$7f
	dc.b $04,$30,$01
	dc.b 'Sales, export or operation outside these',$7f
	dc.b $03,$38,$01
	dc.b 'countries may be construed as copyright',$7f
	dc.b $03,$40,$01
	dc.b 'and trademark infringement and is strictly',$7f
	dc.b $03,$48,$01
	dc.b 'prohibited.',$7f
	dc.b $04,$50,$01
	dc.b 'Violators are subject to severe penalties',$7f
	dc.b $03,$58,$01
	dc.b 'and will be prosecuted to the full extent',$7f
	dc.b $03,$60,$01
	dc.b 'of the law.',$00

Brazil_Warning:;0c
	dc.b $14,$10,$01
	dc.b 'WARNING',$7f
	dc.b $04,$20,$01
	dc.b 'This game is for use in the Federative',$7f
	dc.b $03,$28,$01
	dc.b 'Republic of Brazil only.',$7f
	dc.b $04,$30,$01
	dc.b 'Sales, export or operation outside this',$7f
	dc.b $03,$38,$01
	dc.b 'country may be construed as copyright and',$7f
	dc.b $03,$40,$01
	dc.b 'trademark infringement and is strictly',$7f
	dc.b $03,$48,$01
	dc.b 'prohibited.',$7f
	dc.b $04,$50,$01
	dc.b 'Violators are subject to severe penalties',$7f
	dc.b $03,$58,$01
	dc.b 'and will be prosecuted to the full extent',$7f
	dc.b $03,$60,$01
	dc.b 'of the law.',$00


;Coin Text
Free_Play_Text:
	dc.b $13,$64,$1f
	dc.b 'FREE PLAY',00

TwoCreditsStart_Text:
	dc.b $11,$64,$1f
	dc.b 'INSERT 2 COINS',$7f
	dc.b $09,$6c,$1f
	dc.b 'CONTINUE REQUIRES ONLY 1 COIN',$00

One_Credit_Text:
	dc.b $12,$64,$1f
	dc.b 'INSERT COIN',$00

Two_Credit_Text:
	dc.b $11,$64,$1f
	dc.b 'INSERT 2 COINS',$00

Three_Credit_Text:
	dc.b $11,$64,$1f
	dc.b 'INSERT 3 COINS',$00

Four_Credit_Text:
	dc.b $11,$64,$1f
	dc.b 'INSERT 4 COINS',$00

Five_Credit_Text:
	dc.b $11,$64,$1f
	dc.b 'INSERT 5 COINS',$00

Six_Credit_Text:
	dc.b $11,$64,$1f
	dc.b 'INSERT 6 COINS',$00

Seven_Credit_Text:
	dc.b $11,$64,$1f
	dc.b 'INSERT 7 COINS',$00

Eight_Credit_Text:
	dc.b $11,$64,$1f
	dc.b 'INSERT 8 COINS',$00

Nine_Credit_Text:
	dc.b $11,$64,$1f
	dc.b 'INSERT 9 COINS',$00

loc_01da3c:
	dc.b $15,$74,$1f
	dc.b 'COIN:',$00

loc_01da45:
	dc.b $14,$74,$1f
	dc.b 'COINS:',$00

loc_01da4f:
	dc.b $14,$74,$1f
	dc.b 'CREDIT:',$00

loc_01da5a:
	dc.b $13,$74,$1f
	dc.b 'CREDITS:',$00

loc_01da66:
	dc.b $12,$74,$1f
	dc.b 'CREDIT:',$00

loc_01da71:
	dc.b $11,$74,$1f
	dc.b 'CREDITS:',$00

loc_01da7d:
	dc.b $09,$74,$1f
	dc.b 'COIN:',$00

loc_01da86:
	dc.b $21,$74,$1f
	dc.b 'COIN:',$00

loc_01da8f:
	dc.b $08,$74,$1f
	dc.b 'COINS:',$00

loc_01da99:
	dc.b $20,$74,$1f
	dc.b 'COINS:',$00

loc_01daa3:
	dc.b $08,$74,$1f
	dc.b 'CREDIT:',$00

loc_01daae:
	dc.b $20,$74,$1f
	dc.b 'CREDIT:',$00

loc_01dab9:
	dc.b $07,$74,$1f
	dc.b 'CREDITS:',$00

loc_01dac5:
	dc.b $1f,$74,$1f
	dc.b 'CREDITS:',$00

loc_01dad1:
	dc.b $06,$74,$1f
	dc.b 'CREDIT:',$00

loc_01dadc:
	dc.b $1e,$74,$1f
	dc.b 'CREDIT:',$00

loc_01dae7:
	dc.b $05,$74,$1f
	dc.b 'CREDITS:',$00

loc_01daf3:
	dc.b $1d,$74,$1f
	dc.b 'CREDITS:',$00

loc_01daff:
	dc.b $0e,$64,$1f
	dc.b 'INSERT 1 MORE COIN ',$00

loc_01db16:
	dc.b $0e,$64,$1f
	dc.b 'INSERT 2 MORE COINS',$00

loc_01db2d:
	dc.b $0e,$64,$1f
	dc.b 'INSERT 3 MORE COINS',$00

loc_01db44:
	dc.b $0e,$64,$1f
	dc.b 'INSERT 4 MORE COINS',$00

loc_01db5b:
	dc.b $0e,$64,$1f
	dc.b 'INSERT 5 MORE COINS',$00

loc_01db72:
	dc.b $0e,$64,$1f
	dc.b 'INSERT 6 MORE COINS',$00

loc_01db89:
	dc.b $0e,$64,$1f
	dc.b 'INSERT 7 MORE COINS',$00

loc_01dba0:
	dc.b $0e,$64,$1f
	dc.b 'INSERT 8 MORE COINS',$00

loc_01dbb7:
	dc.b $0e,$64,$1f
	dc.b 'PRESS 1P OR 2P START',$00

loc_01dbcf:
	dc.b $05,$64,$1f
	dc.b ' PRESS START  ',$00

loc_01dbe1:
	dc.b $1d,$64,$1f
	dc.b ' PRESS START  ',$00

loc_01dbf3:
	dc.b $05,$64,$1f
	dc.b ' INSERT COIN  ',$00

loc_01dc05:
	dc.b $1d,$64,$1f
	dc.b ' INSERT COIN  ',$00

loc_01dc17:
	dc.b $05,$64,$1f
	dc.b 'INSERT 2 COINS',$00

loc_01dc29:
	dc.b $1d,$64,$1f
	dc.b 'INSERT 2 COINS',$00

loc_01dc3b:
	dc.b $05,$64,$1f
	dc.b 'INSERT 3 COINS',$00

loc_01dc4d:
	dc.b $1d,$64,$1f
	dc.b 'INSERT 3 COINS',$00

loc_01dc5f:
	dc.b $05,$64,$1f
	dc.b 'INSERT 4 COINS',$00

loc_01dc71:
	dc.b $1d,$64,$1f
	dc.b 'INSERT 4 COINS',$00

loc_01dc83:
	dc.b $05,$64,$1f
	dc.b 'INSERT 5 COINS',$00

loc_01dc95:
	dc.b $1d,$64,$1f
	dc.b 'INSERT 5 COINS',$00

loc_01dca7:
	dc.b $05,$64,$1f
	dc.b 'INSERT 6 COINS',$00

loc_01dcb9:
	dc.b $1d,$64,$1f
	dc.b 'INSERT 6 COINS',$00

loc_01dccb:
	dc.b $05,$64,$1f
	dc.b 'INSERT 7 COINS',$00

loc_01dcdd:
	dc.b $1d,$64,$1f
	dc.b 'INSERT 7 COINS',$00

loc_01dcef:
	dc.b $05,$64,$1f
	dc.b 'INSERT 8 COINS',$00

loc_01dd01:
	dc.b $1d,$64,$1f
	dc.b 'INSERT 8 COINS',$00

loc_01dd13:
	dc.b $05,$64,$1f
	dc.b 'INSERT 9 COINS',$00

loc_01dd25:
	dc.b $1d,$64,$1f
	dc.b 'INSERT 9 COINS',$00

loc_01dd37:
	dc.b $05,$64,$1f
	dc.b ' 1 MORE COIN  ',$00

loc_01dd49:
	dc.b $1d,$64,$1f
	dc.b ' 1 MORE COIN  ',$00

loc_01dd5b:
	dc.b $05,$64,$1f
	dc.b ' 2 MORE COINS ',$00

loc_01dd6d:
	dc.b $1d,$64,$1f
	dc.b ' 2 MORE COINS ',$00

loc_01dd7f:
	dc.b $05,$64,$1f
	dc.b ' 3 MORE COINS ',$00

loc_01dd91:
	dc.b $1d,$64,$1f
	dc.b ' 3 MORE COINS ',$00

loc_01dda3:
	dc.b $05,$64,$1f
	dc.b ' 4 MORE COINS ',$00

loc_01ddb5:
	dc.b $1d,$64,$1f
	dc.b ' 4 MORE COINS ',$00

loc_01ddc7:
	dc.b $05,$64,$1f
	dc.b ' 5 MORE COINS ',$00

loc_01ddd9:
	dc.b $1d,$64,$1f
	dc.b ' 5 MORE COINS ',$00

loc_01ddeb:
	dc.b $05,$64,$1f
	dc.b ' 6 MORE COINS ',$00

loc_01ddfd:
	dc.b $1d,$64,$1f
	dc.b ' 6 MORE COINS ',$00

loc_01de0f:
	dc.b $05,$64,$1f
	dc.b ' 7 MORE COINS ',$00

loc_01de21:
	dc.b $1d,$64,$1f
	dc.b ' 7 MORE COINS ',$00

loc_01de33:
	dc.b $05,$64,$1f
	dc.b ' 8 MORE COINS ',$00

loc_01de45:
	dc.b $1d,$64,$1f
	dc.b ' 8 MORE COINS ',$00

loc_01de57:
	dc.b $03,$74,$1f
	dc.b '@CAPCOM CO., LTD. 1998',$00

loc_01de71:
	dc.b $1a,$74,$1f
	dc.b 'ALL RIGHTS RESERVED.',$00

loc_01de89:
	dc.b $01,$70,$1f
	dc.b '@CAPCOM CO., LTD. 1998,',$7f
	dc.b $01,$74,$1f
	dc.b '@CAPCOM U.S.A., INC. 1998',$00

loc_01dec1:
	dc.b $1b,$74,$1f
	dc.b 'ALL RIGHTS RESERVED.',$00

loc_01ded9:
	dc.b $00

;/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
loc_01deda:
	dc.w CapcomWebsite-loc_01deda
	dc.w Zero3Email-loc_01deda

;Junk
	dc.w loc_01df34-loc_01deda
	dc.w loc_01df34-loc_01deda
	dc.w loc_01df34-loc_01deda
	dc.w loc_01df34-loc_01deda
	dc.w loc_01df34-loc_01deda
	dc.w loc_01df34-loc_01deda

	dc.w loc_01df34-loc_01deda
	dc.w loc_01df34-loc_01deda
	dc.w loc_01df34-loc_01deda
	dc.w loc_01df34-loc_01deda
	dc.w loc_01df34-loc_01deda
	dc.w loc_01df34-loc_01deda
	dc.w loc_01df34-loc_01deda
	dc.w loc_01df34-loc_01deda

CapcomWebsite:
	dc.b $0c,$70,$1f
	dc.b 'http://www.capcom.co.jp/',$00

Zero3Email:
	dc.b $0b,$70,$1f
	dc.b 'mailto:zero3@ capcom.co.jp',00