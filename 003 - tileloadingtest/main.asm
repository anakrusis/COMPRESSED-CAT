SECTION "Includes@home",ROM0

ROM_SIZE EQU 0 
RAM_SIZE EQU 0

; Macro for copying a rectangular region into VRAM
; Changes ALL registers
; Arguments:
; 1 - Height (number of rows)
; 2 - Width (number of columns)
; 3 - Source to copy from
; 4 - Destination to copy to
CopyRegionToVRAM: MACRO

I = 0
REPT \1

    ld bc, \2
    ld hl, \3+(I*\2)
    ld de, \4+(I*32)
    
    call mCopyVRAM
    
I = I+1
ENDR
ENDM 

funtus:
INCBIN "funtus.chr"
funtusEnd:

testchr:
INCBIN "test.chr"
testchrEnd:

INCLUDE "gingerbread.asm"

SECTION "data",ROM0, ALIGN[8]
sine:
	db $80, $83, $86, $89, $8C, $8F, $92, $95, $98, $9B, $9E, $A1, $A4, $A7, $AA, $AD, $B0, $B3, $B6, $B9, $BB, $BE, $C1, $C3, $C6, $C9, $CB, $CE, $D0, $D2, $D5, $D7, $D9, $DB, $DE, $E0, $E2, $E4, $E6, $E7, $E9, $EB, $EC, $EE, $F0, $F1, $F2, $F4, $F5, $F6, $F7, $F8, $F9, $FA, $FB, $FB, $FC, $FD, $FD, $FE, $FE, $FE, $FE, $FE, $FF, $FE, $FE, $FE, $FE, $FE, $FD, $FD, $FC, $FB, $FB, $FA, $F9, $F8, $F7, $F6, $F5, $F4, $F2, $F1, $F0, $EE, $EC, $EB, $E9, $E7, $E6, $E4, $E2, $E0, $DE, $DB, $D9, $D7, $D5, $D2, $D0, $CE, $CB, $C9, $C6, $C3, $C1, $BE, $BB, $B9, $B6, $B3, $B0, $AD, $AA, $A7, $A4, $A1, $9E, $9B, $98, $95, $92, $8F, $8C, $89, $86, $83, $80, $7C, $79, $76, $73, $70, $6D, $6A, $67, $64, $61, $5E, $5B, $58, $55, $52, $4F, $4C, $49, $46, $44, $41, $3E, $3C, $39, $36, $34, $31, $2F, $2D, $2A, $28, $26, $24, $21, $1F, $1D, $1B, $19, $18, $16, $14, $13, $11, $0F, $0E, $0D, $0B, $0A, $09, $08, $07, $06, $05, $04, $04, $03, $02, $02, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $02, $02, $03, $04, $04, $05, $06, $07, $08, $09, $0A, $0B, $0D, $0E, $0F, $11, $13, $14, $16, $18, $19, $1B, $1D, $1F, $21, $24, $26, $28, $2A, $2D, $2F, $31, $34, $36, $39, $3C, $3E, $41, $44, $46, $49, $4C, $4F, $52, $55, $58, $5B, $5E, $61, $64, $67, $6A, $6D, $70, $73, $76, $79, $7C

text:
; db $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $10, $1b, $0e, $0e, $1d, $12, $17, $10, $1c, $24, $0a, $15, $15, $24, $16, $22, $24, $0f, $1b, $12, $0e, $17, $0d, $1c, $24, $0a, $1d, $24, $1c, $19, $0a, $1b, $14, $15, $0e, $24, $14, $12, $1d, $1d, $22, $24, $11, $0e, $0a, $1f, $0e, $17, $26, $24, $1d, $11, $12, $1c, $24, $12, $1c, $24, $0a, $24, $1d, $0e, $1c, $1d, $24, $0f, $18, $1b, $24, $0d, $22, $17, $0a, $16, $12, $0c, $15, $22, $24, $0a, $15, $15, $18, $0c, $0a, $1d, $0e, $0d, $24, $1c, $19, $1b, $12, $1d, $0e, $1c, $24, $16, $18, $1f, $12, $17, $10, $24, $0a, $1b, $18, $1e, $17, $0d, $24, $18, $17, $24, $1c, $0c, $1b, $0e, $0e, $17, $26

db $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $11, $0e, $15, $18, $24, $0a, $10, $0a, $12, $17, $26, $24, $11, $0e, $1b, $0e, $24, $12, $1c, $24, $1d, $11, $0e, $24, $0a, $16, $0a, $23, $12, $17, $10, $24, $0a, $1b, $1d, $24, $0b, $22, $24, $0f, $1b, $0e, $0d, $26, $24, $1d, $11, $0e, $24, $0c, $0a, $1d, $24, $12, $1c, $24, $0c, $18, $16, $19, $1b, $0e, $1c, $1c, $26, $24, $16, $1e, $0a, $11, $0a, $11, $0a, $11, $0a, $11, $0a, $26, $26, $26
textEnd:
db $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24, $24

tilemap:
db $80, $80, $80, $81, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $82, $83, $84, $80, $80, $80, $80, $80, $80, $80, $85, $86, $87, $80, $80, $80, $80, $80, $80, $80, $88, $89, $8A, $8B, $80, $80, $80, $80, $80, $8C, $8D, $8E, $8F, $80, $80, $80, $80, $80, $80, $80, $90, $91, $92, $93, $94, $80, $95, $96, $97, $98, $99, $9A, $80, $80, $80, $80, $80, $80, $80, $9B, $9C, $9D, $9E, $9F, $A0, $A1, $A2, $A3, $A4, $A5, $84, $A6, $80, $80, $80, $80, $80, $80, $80, $A7, $A8, $A9, $AA, $9F, $AB, $AC, $AD, $AE, $9F, $AF, $B0, $B1, $80, $80, $80, $80, $80, $80, $80, $80, $80, $B2, $9F, $B3, $B4, $B5, $B6, $B7, $9F, $9F, $B8, $B9, $95, $80, $80, $80, $80, $80, $80, $80, $80, $BA, $9F, $BB, $BC, $9F, $BD, $BE, $9F, $9F, $9F, $BF, $C0, $80, $80, $80, $80, $80, $80, $80, $C1, $C2, $C3, $9F, $C4, $C5, $C6, $9F, $9F, $C7, $C8, $C9, $CA, $80, $80, $80, $80, $80, $80, $80, $CB, $CC, $CD, $CE, $CF, $D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $80, $80, $80, $80, $80, $80, $80, $D8, $D9, $9F, $DA, $DB, $DC, $9F, $DD, $9F, $9F, $DE, $DF, $E0, $80, $80, $80, $80, $80, $80, $80, $E1, $E2, $E3, $E4, $E5, $E6, $E7, $E8, $9F, $E9, $EA, $EB, $EC, $80, $80, $80, $80, $80, $80, $80, $ED, $EE, $EF, $F0, $F1, $F2, $F3, $F4, $9F, $F5, $F6, $F7, $F8, $F9, $80, $80, $80, $80, $80, $80, $FA, $FB, $FC, $FD, $FE, $FF, $00, $9F, $9F, $01, $02, $03, $04, $05, $06, $07, $80, $80, $80, $80, $80, $08, $09, $9F, $9F, $9F, $9F, $9F, $9F, $0A, $9F, $0B, $0C, $0D, $0E, $80, $80, $80, $80, $80, $80, $0F, $10, $9F, $9F, $9F, $9F, $9F, $9F, $9F, $11, $12, $13, $14, $15, $16, $80, $80, $80, $80, $17, $18, $19, $9F, $9F, $9F, $9F, $9F, $9F, $9F, $1A, $9F, $1B, $1C, $9F, $1D, $80, $80, $80, $80, $80, $1E, $1F, $20, $9F, $9F, $9F, $9F, $21, $22, $23, $9F, $24, $9F, $9F, $25, $80
tilemapEnd:

SECTION "vars", WRAM0[USER_RAM_START]
temp1: ds 1
temp2: ds 1
temp3: ds 1
temp4: ds 1
globalTimer: ds 1
textPtr: ds 1
spritesDrawnCount: ds 1 ; how many sprites have been drawned in this frame
	
SECTION "start", ROM0
begin:
	ld hl, funtus
	ld de, TILEDATA_START
	ld bc, funtusEnd - funtus
	call mCopyVRAM
	
	call clearNametable
	
	ld hl, testchr
    ld de, $8800
    ld bc, testchrEnd - testchr
    call mCopyVRAM
	
	CopyRegionToVRAM 18, 20, tilemap, BACKGROUND_MAPDATA_START
	
	call StartLCD
	
	ld a, %00011011
	ld [BG_PALETTE], a
	
	ld a, %00101111
	ld [SPRITE_PALETTE_1], a
	
frame:
stepTxtPtr:
	ld hl, globalTimer
	inc [hl]
	ld a, [hl]
	and a, $07
	jp nz, stepTxtPtrDone
	
	ld hl, textPtr
	inc [hl]
	
stepTxtPtrDone:
	call fillSprites
	
	halt
	nop
	jp frame
	
; This is only for bulk drawing right now, don't use it while lcd is on or corruption will probably happen	
; hl: pointer to start
; de: pointer to copy to
; bc: length of copy
copyTilesToVRAM:	
copyTilesLoop:
	ld a, [de]
	ld [hli], a
	inc de
	dec bc
	
	ld a, b
	or a, c
	jp nz, copyTilesLoop
	ret
	
; tile index in d
; x and y in b/c
drawSprite:
	push hl ; hl clobber prevention
	
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
	
	pop hl
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

	ret

fillSprites:
allSpritesOffscreen:
	ld a, $00
	ld hl, spritesDrawnCount
	ld [hl], a

	; iterates from c100 to c19f and clears all the sprite table
	; TODO this can be rewritten a bit faster due to oam having the nicely aligned start index 
	ld b, $80
	ld hl, $c100
allSpritesOffscreenLoop:
	ld a, $fe
	ld [hli], a
	dec b
	jp nz, allSpritesOffscreenLoop
	
	ld a, [globalTimer]
	and $2f
	sub $06
	jp c, eyesdone
	
; EYES
	ld bc, $2d4d
	ld d, $2b
	call drawEyes
	
	ld bc, $584f
	ld d, $31
	call drawEyes

eyesdone:

drawLetters:
	ld e, $15 ; number of letters being drawn
	
	; starting point of text
	ld hl, text
	ld a, [textPtr]
	add a, l
	ld l, a
	
	; if we reach the end of the text, we must loop back.
	sub a, LOW(textEnd)
	jp nz, :+
	; resets the text pointer and hl
	ld hl, text
	ld a, $00
	ld [textPtr], a
:
	ld bc, $0090
	ld a, [globalTimer]
	xor a, $ff
	;inc a
	and a, $07
	ld b, a
	
drawLettersLoop:
	ld a, [hli]
	ld d, a
	
	; space character: won't assign a sprite
	sub a, $24
	jp z, drawLettersLoopTail
	
	push hl
	; ld hl, sine
	; ld a, [globalTimer]
	; add a, l
	; ld l, a
	; ld a, [hl]
	
	;srl a 
	;srl a
	;srl a
	
	ld a, $80
	add a, e
	ld c, a
	pop hl
	
	call drawSprite

drawLettersLoopTail:	
	ld a, $08
	add a, b
	ld b, a
	
	dec e
	jp nz, drawLettersLoop
	
	ret
	
; iterates from 0 to 5, on each odd index it will render 8 pixels below
; bc: x and y of sprite
; d: tile index
drawEyes:
	ld e, $06
drawEyesLoop:
	call drawSprite
	
	ld a, e
	and $01
	jp nz, :+
	
  ; even index, add 8 to y of sprite
	ld a, c
	add $08
	ld c, a
	
	jp drawEyesLoopTail
	
: ; odd index, subtract 8 from y and add 8 to x
	ld a, c
	sub $08
	ld c, a
	
	ld a, b
	add $08
	ld b, a
	
drawEyesLoopTail:
	inc d
	dec e
	jp nz, drawEyesLoop
	
	ret