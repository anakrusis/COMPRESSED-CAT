SECTION "Includes@home",ROM0

ROM_SIZE EQU 1 
RAM_SIZE EQU 1

funtus:
INCBIN "funtus.chr"
funtusEnd:

INCLUDE "gingerbread.asm"

SECTION "start", ROM0
begin:
	ld hl, funtus
	ld de, TILEDATA_START
	ld bc, funtusEnd - funtus
	call mCopyVRAM
	
	call StartLCD
	
forever:
	halt
	nop
	jp forever