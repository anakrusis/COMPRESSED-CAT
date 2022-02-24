SECTION "Includes@home",ROM0

ROM_SIZE EQU 0 
RAM_SIZE EQU 0
GBC_SUPPORT EQU 1

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

db $ff, $ff
bgPalette:
db $00, $00, $06, $18, $3e, $f8, $ff, $ff

samplePtrs:
db HIGH(data_meow1), LOW(data_meow1), HIGH(data_meow2), LOW(data_meow2), HIGH(data_meow3), LOW(data_meow3)
sampleLengths:
db HIGH(end_meow1 - data_meow1), LOW(end_meow1 - data_meow1), HIGH(end_meow2 - data_meow2), LOW(end_meow2 - data_meow2), HIGH(end_meow3 - data_meow3), LOW(end_meow3 - data_meow3)

SECTION "vars", WRAM0[USER_RAM_START]
temp1: ds 1
temp2: ds 1
temp3: ds 1
temp4: ds 1
globalTimer: ds 1
seed: ds 2
lastKeys: ds 1 ; key state last frame
textPtr: ds 1
spritesDrawnCount: ds 1 ; how many sprites have been drawned in this frame

; ANIMATION STATES
animframe_EYE_L:   ds 1
animframe_EYE_R:   ds 1
animframe_SNOOT_T: ds 1
animframe_SNOOT_B: ds 1
animframe_EAR_T:   ds 1
animframe_EAR_M:   ds 1
animframe_EAR_B:   ds 1

blinkTimer:            ds 1
; semi random time
betweenBlinkTimer:     ds 1
; the bit xxxx 1xxx to determine the ear frame 
earTwitchTimer:        ds 1
; we initialise it on startup to a high number like 3600
betweenEarTwitchTimer: ds 2
earTwitching:          ds 1

; counts up starting at 1, then 2, then 3, and then back to 1
meowCounter: ds 1

; normally zero, but if a sample is queued next frame, we will play the sample of that index
sampleQueue: ds 1
	
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
	
	; gbc background palette
	ld a, $80
	ld [GBC_BG_PALETTE_INDEX], a
	ld e, 8
	ld hl, bgPalette
gbcPaletteLoop:
	ld a, [hli]
	ld [GBC_BG_PALETTE], a	
	dec e
	jp nz, gbcPaletteLoop

	; gbc background palette
	ld a, $80
	ld [GBC_SPRITE_PALETTE_INDEX], a
	ld e, 8
	ld hl, bgPalette - 2
gbcPaletteLoop2:
	ld a, [hli]
	ld [GBC_SPRITE_PALETTE], a	
	dec e
	jp nz, gbcPaletteLoop2
	
	; gameboy palettes...
	ld a, %00011011
	ld [BG_PALETTE], a
	ld a, %00101111
	ld [SPRITE_PALETTE_1], a
	ld a, %01101111
	ld [SPRITE_PALETTE_2], a
	
	call StartLCD
	
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
	
	ld a, $60
	ld [betweenBlinkTimer], a
	ld a, $10
	ld [betweenEarTwitchTimer], a
	ld a, $0e
	ld [betweenEarTwitchTimer + 1], a
	ld a, $00
	ld [earTwitching], a
	
	ld a, $00
	ld [seed], a
	ld a, $01
	ld [seed+1], a
	
	ld a, 1
	ld [meowCounter], a
	
frame:
; plays samples if the sample queue is not 0
sampleQueueHandle:
	ld a, [sampleQueue]
	cp 0
	jp z, :+

	; load sample length pointer
	ld d, 0
	ld a, [meowCounter]
	ld e, a
	sla e
	ld hl, sampleLengths
	add hl, de
	
	; now de has the pointer to the length of sample data
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	
	; load start sample pointer
	ld b, 0
	ld a, [meowCounter]
	ld c, a
	sla c
	ld hl, samplePtrs
	add hl, bc
	
	; bc has pointer to start of sample data
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	
	; transfers start pointer from bc to hl
	ld h, b
	ld l, c
	call playSample
	
	; clears sample queue after finished playing
	ld a, 0
	ld [sampleQueue], a
	
	; Snoot closes when sample is finished playing
	; flips between metasprites 02 and 04
	ld a, [animframe_SNOOT_T]
	xor $06
	ld [animframe_SNOOT_T], a
	; flips between metasprites 03 and 05
	ld a, [animframe_SNOOT_B]
	xor $06
	ld [animframe_SNOOT_B], a
	
	ld a, [meowCounter]
	inc a
	ld [meowCounter], a
	cp 4
	jp nz, :+

	; if the meowcounter is 4 then set it back to 1
	ld a, 1
	ld [meowCounter], a
	
:
; stepTxtPtr:
	; ld hl, globalTimer
	; inc [hl]
	; ld a, [hl]
	; and a, $07
	; jp nz, stepTxtPtrDone
	
	; ld hl, textPtr
	; inc [hl]
	
; stepTxtPtrDone:
	
	call ReadKeys
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
	
	; flips between metasprites 02 and 04
	ld a, [animframe_SNOOT_T]
	xor $06
	ld [animframe_SNOOT_T], a
	; flips between metasprites 03 and 05
	ld a, [animframe_SNOOT_B]
	xor $06
	ld [animframe_SNOOT_B], a
	
	; sample 1 queued to play on the next frame (after oam dma has updated the sprites)
	ld a, 1
	ld [sampleQueue], a
:

buttonReadDone:
	pop af
	ld [lastKeys], a

;
; EYE BLINKING HANDLING!!!!!!!!!!
;	
	ld hl, blinkTimer
	dec [hl]
	jp nz, handleBlinkDone
	
handleBlink:
; ends the blink here
	call rnJesus
	ld [betweenBlinkTimer], a
	
	; ; flips between metasprites 00 and 06
	ld a, [animframe_EYE_L]
	xor $06
	ld [animframe_EYE_L], a
	; flips between metasprites 01 and 07
	ld a, [animframe_EYE_R]
	xor $06
	ld [animframe_EYE_R], a	
	
handleBlinkDone:
	ld hl, betweenBlinkTimer
	dec [hl]
	jp nz, handleBetweenBlinkDone
	
handleBetweenBlink:
; initiates a new blink here
	ld a, 8
	ld [blinkTimer], a
	
	; ; flips between metasprites 00 and 06
	ld a, [animframe_EYE_L]
	xor $06
	ld [animframe_EYE_L], a
	; flips between metasprites 01 and 07
	ld a, [animframe_EYE_R]
	xor $06
	ld [animframe_EYE_R], a	
	
handleBetweenBlinkDone:

;
; EAR TWITCHING HANDLING!!!!!!!!!!
;
	ld hl, earTwitchTimer
	ld a, [hl]
	cp $ff
	jp z, handleTwitchDone
	
	dec [hl]
	jp nz, handleTwitchDone
	
handleTwitch:
; ends the ear twitch here, 3600 frames in between
	ld a, $10
	ld [betweenEarTwitchTimer], a
	ld a, $0e
	ld [betweenEarTwitchTimer + 1], a
	
	ld a, $00
	ld [earTwitching], a
	
	ld a, $ff
	ld [earTwitchTimer], a
	
handleTwitchDone:
	ld hl, betweenEarTwitchTimer
	
	; puts the value of betweenEarTwitchTimer in de without affecting hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	dec hl
	
	; 16-bit decrements and puts back in place still pointed at hl
	dec de
	ld [hl], e
	inc hl
	ld [hl], d
	
	ld a, d
	or a, e
	jp nz, handleBetweenTwitchDone
	
handleBetweenTwitch:
; initiates a new twitch here, 32 frames long
	ld a, $20
	ld [earTwitchTimer], a
	
	ld a, $01
	ld [earTwitching], a
	
handleBetweenTwitchDone:

	; by default ears will be hidden
	ld a, $80
	ld [animframe_EAR_T], a 
	ld [animframe_EAR_M], a 
	ld [animframe_EAR_B], a 
	
	ld a, [earTwitching]
	cp 0
	jp z, decideEarFramesDone 

	ld a, [earTwitchTimer]
	and $08
	cp 0
	jp z, decideEarFramesDone
	
	ld a, $08
	ld [animframe_EAR_T], a
	ld a, $09
	ld [animframe_EAR_M], a
	ld a, $0a
	ld [animframe_EAR_B], a

decideEarFramesDone:

	call fillSprites
	
	halt
	nop
	jp frame
	
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
	
; puts a random number in a
; (this is ported over from the nesdev wiki prng)
; http://wiki.nesdev.com/w/index.php/Random_number_generator
rnJesus:
	ld e, 8
	ld a, [seed]
rnJesus1:
	sla a
	ld hl, seed+1
	rl [hl]
	jp nc, rnJesus2
	xor $39
rnJesus2:
	dec e
	jp nz, rnJesus1
	ld [seed], a
	cp 0
	ret
	
; de: length of sample
; hl: pointer to sample
playSample:
	; we must turn off vblank interrupt here so that vblank doesnt pop our sound off and clobber our regs
	ld	a, $00 
    ld	[rIE], a

	ld a, $f0
	ld [SOUND_CH1_ENVELOPE], a
	ld a, %11000000
	ld [SOUND_CH1_LENGTH], a
	ld a, $87
	ld [SOUND_CH1_HIGHFREQ], a
	ld a, $fe
	ld [SOUND_CH1_LOWFREQ], a

	; we will gobble up 380 cpu cycles per sample for a sample rate of 11025
playSampleLoop:
	; reinitiate envelope
	ld a, $87                   ; + 2 = 2
	ld [SOUND_CH1_HIGHFREQ], a  ; + 4 = 6
	
	; high nybble is masked and put in
	ld a, [hl]                  ; + 2 = 8
	and $f0                     ; + 2 = 10
	or a, $0f
	
	ld [SOUND_CH1_ENVELOPE], a  ; + 4 = 14
	
	; now we must waste 366 cycles lol
	ld bc, $0009         ; 3
cycleWaster1:
	dec bc               ; + (40 * 2) = 83
	ld a, b              ; + (40 * 1) = 123
	or a, c              ; + (40 * 2) = 203
	jp nz, cycleWaster1  ; + (39 * 4) = 359 + 3 = 362
	
	nop
	nop
	nop
	nop ; + 4 = 366
	
	ld a, $87                 
	ld [SOUND_CH1_HIGHFREQ], a
	
	; low nybble is now shifted and put in
	ld a, [hli]                 ; + 2 = 2
	and $0f                     ; + 2 = 4
	sla a                       ; + 2 = 6
	sla a                       ; + 2 = 8
	sla a                       ; + 2 = 10
	sla a                       ; + 2 = 12
	
	or a, $0f
	
	ld [SOUND_CH1_ENVELOPE], a  ; + 4 = 16

	; now we must to waste 339 cycles (the tail end of the loop wastes some too)
	ld bc, $0008         ; 3
cycleWaster2:
	dec bc               ; + (37 * 2) = 74
	ld a, b              ; + (37 * 1) = 114
	or a, c              ; + (37 * 2) = 188
	jp nz, cycleWaster2  ; + (36 * 4) = 332 + 3 = 335

	nop
	nop
	nop
	nop ; + 4 = 339

playSampleLoopTail:
	dec de                      ; + 2 =
	ld a, d                     ; + 1 =
	or a, e                     ; + 2 =
	jp nz, playSampleLoop       ; + 4 = 

	; sample playback is now done. lets set the volume back to zero so it doesnt hang
	ld a, $87
	ld [SOUND_CH1_HIGHFREQ], a
	ld a, $00
	ld [SOUND_CH1_ENVELOPE], a

	ld	a, $01 
    ld	[rIE], a

	ret
	
INCLUDE "sample_meow1.asm"
INCLUDE "sample_meow2.asm"
INCLUDE "sample_meow3.asm"
INCLUDE "sprite.asm"