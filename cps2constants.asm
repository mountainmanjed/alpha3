;Shared memory with Z80 at 0xc000
Soundram = $618000
Sound_Test_end = $619ff9
Sound_END = $619fff

NetworkRam = $660000

ObjectRam0 = $700000
ObjectRam = $708000

CPSinput00 = 0x804000
CPSinput01 = 0x804010
CPSinput02 = 0x804020
QsoundVolume = 0x804030
Epprom = 0x804040

DebugDip = $8040b0
OBJram_Bank0 = $8040e0
OBJram_Bank1 = $8040e1

cps0_gpuregistera = 0x804100
cps0_gpuregisterb = 0x804102
cps1_gpuregister = 0x804104
cps2_gpuregister = 0x804106
raster_gpuregister = 0x804108
palette_gpuregister = 0x80410a
;0x80410c;4a
;0x80410e;4c
;0x804110;4e
;0x804112;50
;0x804114;52
;0x804116;54
;0x804118;56

;0x804122;
;0x804140;
;0x804166;
;0x804170;

