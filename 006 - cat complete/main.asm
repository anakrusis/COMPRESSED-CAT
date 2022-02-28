SECTION "Includes@home",ROM0

ROM_SIZE EQU 1 
RAM_SIZE EQU 0
GBC_SUPPORT EQU 1

SAMPLE_COUNT EQU 3
FADE_TIME EQU 64
MEOW_COUNT_TO_ANGER EQU 8

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

textchr:
INCBIN "text.chr"
textchrEnd:

INCLUDE "gingerbread.asm"

SECTION "data",ROM0, ALIGN[8]
tilemap:
db $80, $80, $80, $81, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $80, $82, $83, $84, $80, $80, $80, $80, $80, $80, $80, $85, $86, $87, $80, $80, $80, $80, $80, $80, $80, $88, $89, $8A, $8B, $80, $80, $80, $80, $80, $8C, $8D, $8E, $8F, $80, $80, $80, $80, $80, $80, $80, $90, $91, $92, $93, $94, $80, $95, $96, $97, $98, $99, $9A, $80, $80, $80, $80, $80, $80, $80, $9B, $9C, $9D, $9E, $9F, $A0, $A1, $A2, $A3, $A4, $A5, $84, $A6, $80, $80, $80, $80, $80, $80, $80, $A7, $A8, $A9, $AA, $9F, $AB, $AC, $AD, $AE, $9F, $AF, $B0, $B1, $80, $80, $80, $80, $80, $80, $80, $80, $80, $B2, $9F, $B3, $B4, $B5, $B6, $B7, $9F, $9F, $B8, $B9, $95, $80, $80, $80, $80, $80, $80, $80, $80, $BA, $9F, $BB, $BC, $9F, $BD, $BE, $9F, $9F, $9F, $BF, $C0, $80, $80, $80, $80, $80, $80, $80, $C1, $C2, $C3, $9F, $9F, $9F, $C4, $9F, $9F, $C5, $C6, $C7, $C8, $80, $80, $80, $80, $80, $80, $80, $C9, $CA, $9F, $9F, $9F, $9F, $9F, $9F, $9F, $CB, $CC, $CD, $CE, $80, $80, $80, $80, $80, $80, $80, $CF, $D0, $9F, $9F, $9F, $9F, $9F, $9F, $9F, $9F, $D1, $D2, $D3, $80, $80, $80, $80, $80, $80, $80, $D4, $D5, $D6, $9F, $9F, $9F, $9F, $9F, $9F, $D7, $D8, $D9, $DA, $80, $80, $80, $80, $80, $80, $80, $DB, $DC, $DD, $DE, $9F, $9F, $9F, $9F, $9F, $DF, $E0, $E1, $E2, $E3, $80, $80, $80, $80, $80, $80, $E4, $E5, $E6, $E7, $9F, $9F, $9F, $9F, $9F, $E8, $E9, $EA, $EB, $EC, $ED, $EE, $80, $80, $80, $80, $80, $EF, $F0, $9F, $9F, $9F, $9F, $9F, $9F, $F1, $9F, $F2, $F3, $F4, $F5, $80, $80, $80, $80, $80, $80, $F6, $F7, $9F, $9F, $9F, $9F, $9F, $9F, $9F, $F8, $F9, $FA, $FB, $FC, $FD, $80, $80, $80, $80, $FE, $FF, $00, $9F, $9F, $9F, $9F, $9F, $9F, $9F, $01, $9F, $02, $03, $9F, $04, $80, $80, $80, $80, $80, $05, $06, $07, $9F, $9F, $9F, $9F, $08, $09, $0A, $9F, $0B, $9F, $9F, $0C, $80, 
tilemapEnd:

creditsTilemap:
db $80, $81, $82, $83, $84, $85, $86, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $88, $89, $81, $8A, $8B, $8C, $83, $8D, $81, $8E, $88, $8F, $90, $90, $91, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $82, $81, $80, $92, $93, $90, $8A, $8E, $94, $95, $83, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $87, $81, $80, $92, $80, $92, $93, $81, $93, $81, $87, $87, $87, $87, $87, $87, 
creditsTilemapEnd:

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
ms0B:
db $54, $56, $58, $FF, 
ms0C:
db $5A, $5C, $5E, $FF, 
ms0D:
db $0C, $0E, $10, $60, $62, $FF, 
ms0E:
db $16, $18, $1A, $1C, $1E, $FF, 
ms0F:
db $64, $66, $68, $6A, $6C, $FF, 
ms10:
db $6E, $70, $72, $74, $2C, $FF, 

metaspritePtrs:
db HIGH(ms00), LOW(ms00), HIGH(ms01), LOW(ms01), HIGH(ms02), LOW(ms02), HIGH(ms03), LOW(ms03), HIGH(ms04), LOW(ms04), HIGH(ms05), LOW(ms05), HIGH(ms06), LOW(ms06), HIGH(ms07), LOW(ms07), HIGH(ms08), LOW(ms08), HIGH(ms09), LOW(ms09), HIGH(ms0A), LOW(ms0A), HIGH(ms0B), LOW(ms0B), HIGH(ms0C), LOW(ms0C), HIGH(ms0D), LOW(ms0D), HIGH(ms0E), LOW(ms0E), HIGH(ms0F), LOW(ms0F), HIGH(ms10), LOW(ms10), 

db $ff, $ff
bgPalette:
db $00, $00, $06, $18, $3e, $f8, $ff, $ff

fadePalettes:
db %00011011, %00000110, %00000001, %00000000, %00000000, %00000001, %00000110, %00011011, %00011011

spriteFadePalettes:
db %00101111, %00011010, %00000101, %00000000, %00000000, %00000101, %00011010, %00101111, %00101111

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
fadeTimer:             ds 1
; cant count during sample playback but immediately starts counting up when sample starts playing
betweenMeowTimer:      ds 2
; counts up starting at 1, then 2, then 3, and then back to 1
meowCounter:           ds 1
; a different meow counter that increments but doesnt loop back, it is used for very diferent purposes
meowCounterForAnger:   ds 1
; how long to remain in the grumpy state before resetting the meowCounterForAnger
grumpyTimer:           ds 2

; normally zero, but if a sample is queued next frame, we will play the sample of that index
sampleQueue:           ds 1
; 0 = main screen, 1 = credits screen
screenState:           ds 1
	
SECTION "start", ROM0
begin:
	call catScreen
	
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
fadeHandler:
	ld a, [fadeTimer]
	push af
	; pointer into fade table
	srl a
	srl a
	srl a
	ld b, 0
	ld c, a
	
	ld hl, fadePalettes
	add hl, bc
	ld a, [hl]
	ld [BG_PALETTE], a
	
	ld hl, spriteFadePalettes
	add hl, bc
	ld a, [hl]
	ld [SPRITE_PALETTE_1], a
	
	pop af
	cp 0
	jp z, fadeHandlerDone
	
	cp FADE_TIME/2
	jp z, screentransition
	
	dec a
	ld [fadeTimer], a
	jp fadeHandlerDone
	
screentransition:
	dec a
	ld [fadeTimer], a
	
	call StopLCD
	
	ld a, [screenState]
	cp 0
	jp nz, catbutton

creditbutton:	
	call creditScreen
	call StartLCD
	jp fadeHandlerDone	
catbutton:
	call catScreen
	call StartLCD
	
fadeHandlerDone:

; plays samples if the sample queue is not 0
sampleQueueHandle:
	ld a, [sampleQueue]
	cp 0
	jp z, sampleQueueHandleDone
	
	; set betweenMeowTimer to zero
	ld a, 0
	ld [betweenMeowTimer], a
	ld [betweenMeowTimer + 1], a
	; clears sample queue after finished playing
	ld a, 0
	ld [sampleQueue], a

	; if the cat is currently grumpy then a hiss routine will be executed
	; otherwise we will do all of this calculation to get the pointer to the sample, and then play the sample
	ld a, [meowCounterForAnger]
	cp MEOW_COUNT_TO_ANGER
	jp c, loadSample
	
loadHiss:	
	call playHiss
	jp sampleQueueHandleDone

loadSample:
	; load sample length pointer
	ld d, 0
	ld a, [meowCounter]
	ld e, a
	dec e ; minus 1 because meowCounter ranges from 1-3 and pointers from 0-2
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
	dec c ; ditto as above
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
	
	; increment meow counter for the annoyed grouchy cat reaction
	ld a, [meowCounterForAnger]
	inc a
	ld [meowCounterForAnger], a
	
	; if you reach the eighth meow in a row, the cat will blink in a bit, to transition to the next eye anim
	cp MEOW_COUNT_TO_ANGER
	jp nz, noBlinkAfterMeow
	ld a, $05
	ld [betweenBlinkTimer], a
	
noBlinkAfterMeow:
	; increment meow counter for sample purposes
	ld a, [meowCounter]
	inc a
	ld [meowCounter], a
	cp SAMPLE_COUNT + 1
	jp nz, sampleQueueHandleDone

	; if the meowcounter is 4 then set it back to 1
	ld a, 1
	ld [meowCounter], a
	
sampleQueueHandleDone:
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
	push af
	
; A BUTTON 
	and KEY_A
	ld b, a
	cp 0
	jp z, :+
	
	; is the state of KEY_A different from last frame?
	ld a, [lastKeys]
	and KEY_A
	cp b
	jp z, :+
	
	; can't meow on the credits screen
	ld a, [screenState]
	cp 0
	jp nz, :+
	
	; ; flips between metasprites 02 and 04
	; ld a, [animframe_SNOOT_T]
	; xor $06
	; ld [animframe_SNOOT_T], a
	; ; flips between metasprites 03 and 05
	; ld a, [animframe_SNOOT_B]
	; xor $06
	; ld [animframe_SNOOT_B], a
	
	; sample 1 queued to play on the next frame (after oam dma has updated the sprites)
	ld a, 1
	ld [sampleQueue], a
:

; SELECT BUTTON
	pop af
	and KEY_SELECT
	ld b, a
	cp 0
	jp z, :+
	
	ld a, [lastKeys]
	and KEY_SELECT
	cp b
	jp z, :+
	
	ld a, [fadeTimer]
	cp 0
	jp nz, :+
	
	ld a, FADE_TIME
	ld [fadeTimer], a
	
:
buttonReadDone:
	pop af
	ld [lastKeys], a
	
; GRUMPY HANDLING!!!!
	; ld a, [meowCounterForAnger]
	; cp 5
	; jp c, grumpyHandlerDone 
; grumpyHandler:
	; ld hl, grumpyTimer
	; ld a, [hl]
	; ld e, a
	; inc hl
	; ld a, [hl]
	; ld d, a
	; dec hl
	
	; inc de

	; ld [hl], e
	; inc hl
	; ld [hl], d
	
	; ; compare the high byte to $02 (512 ticks)
	; ld a, d
	; cp $02
	; jp c, grumpyHandlerDone

	; ; if grumpyTimer exceeds 512 ticks then reset it back to zero
	; ld a, 0
	; ld [meowCounterForAnger], a
	; ld [grumpyTimer], a
	; ld [grumpyTimer + 1], a

; grumpyHandlerDone:

catHandler:
	ld a, [screenState]
	cp 0
	jp nz, catHandlerDone
	
betweenMeowHandler:
	ld hl, betweenMeowTimer
	ld a, [hl]
	ld e, a
	inc hl
	ld a, [hl]
	ld d, a
	dec hl
	
	inc de

	ld [hl], e
	inc hl
	ld [hl], d
	
	ld a, d
	cp $02
	jp c, betweenMeowHandlerDone
	
	; if betweenMeowTimer exceeds 512 ticks then cat is no longer grumpy, if it was, and meow counter resets
	ld a, 0
	ld [meowCounterForAnger], a
	ld [grumpyTimer], a
	ld [grumpyTimer + 1], a
	
betweenMeowHandlerDone:
decideSnootFrame:
	ld a, [meowCounterForAnger]
	cp MEOW_COUNT_TO_ANGER
	jp nc, grumpySnoot
	
	ld a, [sampleQueue]
	cp 0
	jp z, closedSnoot
	
normalSnoot:
	ld a, $04
	ld [animframe_SNOOT_T], a
	ld a, $05
	ld [animframe_SNOOT_B], a
	jp decideSnootFrameDone

grumpySnoot:
	ld a, [sampleQueue]
	cp 0
	jp nz, hissSnoot

	ld a, $0d
	ld [animframe_SNOOT_T], a
	ld a, $0e
	ld [animframe_SNOOT_B], a
	jp decideSnootFrameDone
	
hissSnoot:
	ld a, $0f
	ld [animframe_SNOOT_T], a
	ld a, $10
	ld [animframe_SNOOT_B], a
	jp decideSnootFrameDone
	
closedSnoot:
	ld a, $02
	ld [animframe_SNOOT_T], a
	ld a, $03
	ld [animframe_SNOOT_B], a
	
decideSnootFrameDone:

;
; EYE BLINKING HANDLING!!!!!!!!!!
;	
	ld hl, blinkTimer
	dec [hl]
	jp nz, handleAfterBlinkDone
	
handleAfterBlink:
; ends the blink here
	; (setting up timer for the interval between blinks)
	call rnJesus
	ld [betweenBlinkTimer], a
	
	; if the meow counter for anger is 8 or greater, then we will use grumpy eyes
	; otherwise normal eyes
	ld a, [meowCounterForAnger]
	cp MEOW_COUNT_TO_ANGER
	jp nc, afterBlinkSetGrumpyEyes
	
afterBlinkSetNormalEyes:
	ld a, $00
	ld [animframe_EYE_L], a
	ld a, $01
	ld [animframe_EYE_R], a	
	jp handleAfterBlinkDone
	
afterBlinkSetGrumpyEyes:
	ld a, $0b
	ld [animframe_EYE_L], a
	ld a, $0c
	ld [animframe_EYE_R], a	
	
handleAfterBlinkDone:
	ld hl, betweenBlinkTimer
	dec [hl]
	jp nz, handleDuringBlinkDone
	
handleDuringBlink:
; blink lasts for 8 frames
	ld a, 8
	ld [blinkTimer], a
	
	; 06 = left eye closed 
	ld a, $06
	ld [animframe_EYE_L], a
	; 07 = right eye closed
	ld a, $07
	ld [animframe_EYE_R], a	
	
handleDuringBlinkDone:

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
handleBetweenMeow:
	ld hl, betweenMeowTimer
	; puts the value of betweenMeowTimer in de without affecting hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	dec hl
	; 16-bit decrements and puts back in place still pointed at hl
	inc de
	ld [hl], e
	inc hl
	ld [hl], d

handleBetweenMeowTimer:
catHandlerDone:
	call fillSprites
	
	halt
	nop
	jp frame
	
; just fills the whole dern thing with blank tiles
clearNametable:
	ld bc, $0400
	ld hl, BACKGROUND_MAPDATA_START
clearNametableLoop:
	ld a, $87
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

SECTION "secondbank", ROMX, BANK[1]

catScreen:
	ld a, 0
	ld [screenState], a

	; loads sprite tiles
	ld hl, funtus
	ld de, TILEDATA_START
	ld bc, funtusEnd - funtus
	call mCopyVRAM
	
	call clearNametable
	
	; loads background tiles
	ld hl, testchr
    ld de, $8800
    ld bc, testchrEnd - testchr
    call mCopyVRAM
	
	CopyRegionToVRAM 18, 20, tilemap, BACKGROUND_MAPDATA_START
	
	ret
	
creditScreen:
	ld a, 1
	ld [screenState], a

	call clearNametable
	
	; loads background tiles
	ld hl, textchr
    ld de, $8800
    ld bc, textchrEnd - textchr
    call mCopyVRAM
	
	CopyRegionToVRAM 7, 15, creditsTilemap, BACKGROUND_MAPDATA_START + 128 + 2	

	ret
	
playHiss:
	ld a, 63
	ld [SOUND_CH4_LENGTH], a
	
	ld a, %10000000
	ld [SOUND_CH4_ENVELOPE], a
	
	ld a, %11000000
	ld [SOUND_CH4_OPTIONS], a
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