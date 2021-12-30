INCLUDE "hardware.inc"

SECTION "vblank", ROM0[$0040]
	call nmi
    reti

SECTION "header", ROM0[$100]
	jp start

	ds $150 - @, 0 ; Make room for the header

start:
	; audio off
	ld a, 0
	ld [rNR52], a

	; you MUST wait for vblank to turn off the lcd...
	; IT IS VERY IMPORTANT NOT TO FORGET THAT!!!
WaitVBlank:
	ld a, [rLY]
	cp 144
	jp c, WaitVBlank
	; Ok now you can turn off, good night lcd
	ld a, 0
	ld [rLCDC], a
	
	; TODO do init stuff while the lcd is off

	; set background palette
	ld a, %11100100
	ld [rBGP], a
	; enable vblank interrupt
	ld a, %00100000
	ld [rSTAT], a
	; Good morning lcd, time to wake up
	ld a, LCDCF_ON | LCDCF_BGON
	ld [rLCDC], a
forever:
	halt
	jp forever
	
nmi:
	ld hl, $c000
	inc hl
	ret
