SECTION "Includes@home",ROM0

ROM_SIZE EQU 1 
RAM_SIZE EQU 1

funtus:
INCBIN "funtus.chr"
funtusEnd:

INCLUDE "gingerbread.asm"

SECTION "vars", WRAM0[USER_RAM_START]
spriteDrawCount: ds 1 ; how many sprites have been drawned per frame
	
SECTION "start", ROM0
begin:
	ld hl, funtus
	ld de, TILEDATA_START
	ld bc, funtusEnd - funtus
	call mCopyVRAM
	
	call clearNametable
	
	call StartLCD
	
	ld a, %00011011
	ld [BG_PALETTE], a
	
forever:
	call fillSprites
	
	halt
	nop
	jp forever
	
; tile in a
; x and y in b/c
drawSprite:
	
	
	ret
	
; just fills the whole dern thing with blank tiles
clearNametable:
	ld bc, $0400
	ld hl, BACKGROUND_MAPDATA_START
clearNametableLoop:
	ld a, $2f
	ld [hli], a
	dec bc
	; checking 
	ld a, b
	or a, c
	jp nz, clearNametableLoop

clearNametableDone:
	ret

fillSprites:
allSpritesOffscreen:
	ld a, $00
	ld hl, spriteDrawCount
	ld [hl], a

	; iterates from c100 to c19f and clears all the sprite table
	ld b, $a0
	ld hl, $c100
allSpritesOffscreenLoop:
	ld a, $fe
	ld [hli], a
	dec b
	jp nz, allSpritesOffscreenLoop
	
	ret
	
	;pop hl
	;pop de
	;pop bc
	;pop af
	;ret