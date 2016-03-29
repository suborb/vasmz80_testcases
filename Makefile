
EXEC=../vasmz80_oldstyle -quiet  -dotdir


all: t8080 tz80 trcm2000 t64180 trcm3000 trcm4000 tgbz80

t8080: valid8080 invalid8080_z80
tz80: validz80
trcm2000: validrcm2000 invalidrcm2000_z80
trcm3000: validrcm3000 
trcm4000: validrcm4000 
t64180: valid64180 invalid64180_z80
tgbz80: validgbz80

valid8080: 
	$(EXEC) -8080 -Fbin 8080validopcodes.asm
	cmp -bl a.out 8080validopcodes.bin

valid64180: 
	$(EXEC) -hd64180 -Fbin z180validopcodes.asm
	cmp -bl a.out z180validopcodes.bin

invalid8080_z80:
	./invalidcodes "$(EXEC)" 8080 z80validopcodes

validz80:
	$(EXEC) -Fbin z80validopcodes.asm
	cmp -bl a.out z80validopcodes.bin

validgbz80:
	$(EXEC) -gbz80 -Fbin gbz80validopcodes.asm
	cmp -bl a.out gbz80validopcodes.bin

validrcm2000:
	$(EXEC) -rcm2000 -rcmemu -Fbin rcm2000validopcodes.asm
	cmp -bl a.out rcm2000validopcodes.bin

validrcm3000:
	$(EXEC) -rcm3000 -rcmemu -Fbin rcm3000validopcodes.asm
	cmp -bl a.out rcm3000validopcodes.bin

validrcm4000:
	$(EXEC) -rcm4000 -rcmemu -Fbin rcm4000validopcodes.asm
	cmp -bl a.out rcm4000validopcodes.bin

invalidrcm2000_z80:
	./invalidcodes "$(EXEC)" rcm2000 z80validopcodes

invalid64180_z80:
	./invalidcodes "$(EXEC)" hd64180 z80validopcodes
