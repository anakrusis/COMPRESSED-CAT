SECTION "Includes@home",ROM0

ROM_SIZE EQU 1 
RAM_SIZE EQU 1

funtus:
INCBIN "funtus.chr"
funtusEnd:

INCLUDE "gingerbread.asm"

SECTION "vars", WRAM0[USER_RAM_START]
spritesDrawnCount: ds 1 ; how many sprites have been drawned in this frame
	
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
	
; tile index in d
; x and y in b/c
drawSprite:
	; high byte of address always starts at c1xx
	ld h, $c1
	; low byte of address is 4 * spritesDrawnCount
	ld a, [spritesDrawnCount]
	sla a
	sla a
	ld l, a
	
	ld [hl], c   ; sprite y
	inc hl
	ld [hl], b   ; sprite x
	inc hl
	ld [hl], d   ; tile index
	inc hl
	ld [hl], $00 ; flags
	
	ld hl, spritesDrawnCount
	inc [hl]
	
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
	ld hl, spritesDrawnCount
	ld [hl], a

	; iterates from c100 to c19f and clears all the sprite table
	; TODO this can be rewritten a bit faster due to oam having the nicely aligned start index 
	ld b, $a0
	ld hl, $c100
allSpritesOffscreenLoop:
	ld a, $fe
	ld [hli], a
	dec b
	jp nz, allSpritesOffscreenLoop
	
	ld bc, $8080
	ld d,  $10
	call drawSprite
	call drawSprite
	
	ret