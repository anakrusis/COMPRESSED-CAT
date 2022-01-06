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
db $80, $80, $80, $81, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $82, $83, $84, $80, $80, $80, $80, $80, $80, $80, $85, $86, $87, $80, $80, $80, $80, $80, $80, $80, $88, $89, $8A, $8B, $80, $80, $80, $80, $80, $8C, $8D, $8E, $8F, $80, $80, $80, $80, $80, $80, $80, $90, $91, $92, $93, $94, $80, $95, $96, $97, $98, $99, $9A, $80, $80, $80, $80, $80, $80, $80, $9B, $9C, $9D, $9E, $9F, $A0, $A1, $A2, $A3, $A4, $A5, $84, $A6, $80, $80, $80, $80, $80, $80, $80, $A7, $A8, $A9, $AA, $9F, $AB, $AC, $AD, $AE, $9F, $AF, $B0, $B1, $80, $80, $80, $80, $80, $80, $80, $80, $80, $B2, $9F, $B3, $B4, $B5, $B6, $B7, $9F, $9F, $B8, $B9, $95, $80, $80, $80, $80, $80, $80, $80, $80, $BA, $9F, $BB, $BC, $9F, $BD, $BE, $9F, $9F, $9F, $BF, $C0, $80, $80, $80, $80, $80, $80, $80, $C1, $C2, $C3, $9F, $9F, $9F, $C4, $9F, $9F, $C5, $C6, $C7, $C8, $80, $80, $80, $80, $80, $80, $80, $C9, $CA, $9F, $9F, $9F, $9F, $9F, $9F, $9F, $CB, $CC, $CD, $CE, $80, $80, $80, $80, $80, $80, $80, $CF, $D0, $9F, $9F, $9F, $9F, $9F, $9F, $9F, $9F, $D1, $D2, $D3, $80, $80, $80, $80, $80, $80, $80, $D4, $D5, $D6, $9F, $9F, $9F, $9F, $9F, $9F, $D7, $D8, $D9, $DA, $80, $80, $80, $80, $80, $80, $80, $DB, $DC, $DD, $DE, $9F, $9F, $9F, $9F, $9F, $DF, $E0, $E1, $E2, $E3, $80, $80, $80, $80, $80, $80, $E4, $E5, $E6, $E7, $9F, $9F, $9F, $9F, $9F, $E8, $E9, $EA, $EB, $EC, $ED, $EE, $80, $80, $80, $80, $80, $EF, $F0, $9F, $9F, $9F, $9F, $9F, $9F, $F1, $9F, $F2, $F3, $F4, $F5, $80, $80, $80, $80, $80, $80, $F6, $F7, $9F, $9F, $9F, $9F, $9F, $9F, $9F, $F8, $F9, $FA, $FB, $FC, $FD, $80, $80, $80, $80, $FE, $FF, $00, $9F, $9F, $9F, $9F, $9F, $9F, $9F, $01, $9F, $02, $03, $9F, $04, $80, $80, $80, $80, $80, $05, $06, $07, $9F, $9F, $9F, $9F, $08, $09, $0A, $9F, $0B, $9F, $9F, $0C, $80, 
tilemapEnd:

metasprites:
ms00:
db $00, $02, $04, $FF, 
ms01:
db $06, $08, $0A, $FF, 
ms02:
db $0C, $0E, $10, $12, $14, $FF, 
ms03:
db $16, $18, $1A, $1C, $1E, $FF, 
ms04:
db $20, $0E, $10, $12, $22, $FF, 
ms05:
db $24, $26, $28, $2A, $2C, $FF, 
ms06:
db $2E, $30, $32, $FF, 
ms07:
db $34, $36, $38, $FF, 
ms08:
db $3A, $3A, $3C, $3E, $40, $FF, 
ms09:
db $42, $44, $46, $48, $4A, $FF, 
ms0A:
db $4C, $4C, $4E, $50, $52, $FF, 

metaspritePtrs:
db HIGH(ms00), LOW(ms00), HIGH(ms01), LOW(ms01), HIGH(ms02), LOW(ms02), HIGH(ms03), LOW(ms03), HIGH(ms04), LOW(ms04), HIGH(ms05), LOW(ms05), HIGH(ms06), LOW(ms06), HIGH(ms07), LOW(ms07), HIGH(ms08), LOW(ms08), HIGH(ms09), LOW(ms09), HIGH(ms0A), LOW(ms0A), 

SECTION "vars", WRAM0[USER_RAM_START]
temp1: ds 1
temp2: ds 1
temp3: ds 1
temp4: ds 1
globalTimer: ds 1
lastKeys: ds 1 ; key state last frame
textPtr: ds 1
spritesDrawnCount: ds 1 ; how many sprites have been drawned in this frame

; ANIMATION STATES
animframe_EYE_L:   ds 1
animframe_EYE_R:   ds 1
animframe_SNOOT_T: ds 1
animframe_SNOOT_B: ds 1
animframe_EAR_T: ds 1
animframe_EAR_M: ds 1
animframe_EAR_B: ds 1
	
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
	ld a, %01101111
	ld [SPRITE_PALETTE_2], a
	
	; Init the animation frames
	ld a, $00
	ld [animframe_EYE_L], a
	ld a, $01
	ld [animframe_EYE_R], a
	ld a, $02
	ld [animframe_SNOOT_T], a
	ld a, $03
	ld [animframe_SNOOT_B], a
	ld a, $08
	ld [animframe_EAR_T], a
	ld a, $09
	ld [animframe_EAR_M], a
	ld a, $0a
	ld [animframe_EAR_B], a
	
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
	
	call ReadKeys
	push af
	push af
	push af
	
	; is KEY_A pressed?
	and KEY_A
	ld b, a
	cp 0
	jp z, :+
	
	; is the state of KEY_A different from last frame?
	ld a, [lastKeys]
	and KEY_A
	cp b
	jp z, :+
	
	; flips between metasprites 00 and 06
	ld a, [animframe_EYE_L]
	xor $06
	ld [animframe_EYE_L], a
	; flips between metasprites 01 and 07
	ld a, [animframe_EYE_R]
	xor $06
	ld [animframe_EYE_R], a
	
:
	pop af
	; is KEY_B pressed?
	and KEY_B
	ld b, a
	cp 0
	jp z, :+
	
	; is the state of KEY_B different from last frame?
	ld a, [lastKeys]
	and KEY_B
	cp b
	jp z, :+
	
	; flips between metasprites 02 and 04
	ld a, [animframe_SNOOT_T]
	xor $06
	ld [animframe_SNOOT_T], a
	; flips between metasprites 03 and 05
	ld a, [animframe_SNOOT_B]
	xor $06
	ld [animframe_SNOOT_B], a
:

	pop af
	; is KEY_UP pressed?
	and KEY_UP
	ld b, a
	cp 0
	jp z, :+
	
	; is the state of KEY_UP different from last frame?
	ld a, [lastKeys]
	and KEY_UP
	cp b
	jp z, :+
	
	; flips between metasprites 08 and 88
	ld a, [animframe_EAR_T]
	xor $80
	ld [animframe_EAR_T], a
	; flips between metasprites 09 and 89
	ld a, [animframe_EAR_M]
	xor $80
	ld [animframe_EAR_M], a
	; flips between metasprites 0a and 8a
	ld a, [animframe_EAR_B]
	xor $80
	ld [animframe_EAR_B], a
:

buttonReadDone:
	pop af
	ld [lastKeys], a

	call fillSprites
	
	halt
	nop
	jp frame
	
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
	
	ld a, d
	cp $3a
	jp c, :+
	
	ld [hl], $10 ; writes object palette 2
:
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

; SNOUT
drawSnoot:	
	ld bc, $385f
	ld a, [animframe_SNOOT_T]
	ld e, a
	call drawBigObject
	
	ld bc, $386f
	ld a, [animframe_SNOOT_B]
	ld e, a
	call drawBigObject
	
; blinkCheck:
	; ld a, [globalTimer]
	; and $2f
	; sub $06
	; jp c, drawEyesDone

; EYES
drawEyes:
	; left eye
	ld bc, $2e4d
	
	; closed eyes are drawn 5 pixels lower
	ld a, [animframe_EYE_L]
	and $06
	jp z, :+
	
	ld a, c
	add a, $05
	ld c, a
:
	ld a, [animframe_EYE_L]
	ld e, a
	call drawBigObject
	
	; right eye
	ld bc, $584f
	
	; ditto
	ld a, [animframe_EYE_R]
	and $06
	jp z, :+
	
	ld a, c
	add a, $04
	ld c, a
:	
	
	ld a, [animframe_EYE_R]
	ld e, a
	call drawBigObject
drawEyesDone:

drawEar:
	
	ld a, [animframe_EAR_T]
	and $80
	jp nz, drawEarDone
	
	ld bc, $6018
	ld a, [animframe_EAR_T]
	ld e, a
	call drawBigObject
	ld bc, $6028
	ld a, [animframe_EAR_M]
	ld e, a
	call drawBigObject
	ld bc, $6038
	ld a, [animframe_EAR_B]
	ld e, a
	call drawBigObject
	
drawEarDone:

	ret
	; no more text (for now)

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
	
; iterates until it reaches value $ff
; bc: x and y of sprite
; (d)e: metasprite number

drawBigObject:
	; (d)e is an offset into the pointer table added to the base in hl
	ld d, $00
	sla e
	
	ld hl, metaspritePtrs
	add hl, de
	
	; now de has the pointer to the start of metatile data
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	
	ld h, d
	ld l, e
	
; internal
; d: tile index	
drawBigObjLoop:
	ld a, [hli]
	ld d, a
	
	; $ff = metasprite terminator
	sub a, $ff
	jp z, drawBigObjDone
	
	call drawSprite
	
	; ld a, e
	; and $01
	; jp nz, :+
	
  ; ; even index, add 8 to y of sprite
	; ld a, c
	; add $08
	; ld c, a
	
	; jp drawBigObjLoopTail
	
; : ; odd index, subtract 8 from y and add 8 to x
	; ld a, c
	; sub $08
	; ld c, a
	
	; ----
	
	; add 8 to x
	ld a, b
	add $08
	ld b, a
	
drawBigObjLoopTail:
	; inc d
	; inc d
	
	; dec e
	;jp nz, drawBigObjLoop
	
	jp drawBigObjLoop

drawBigObjDone:	
	ret