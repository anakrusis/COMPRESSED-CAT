INCLUDE "hardware.inc"

SECTION "vblank", ROM0[$0040]
	call vblank
    reti

SECTION "header", ROM0[$100]
	jp start

	ds $150 - @, 0 ; Make room for the header

start:
	; interrupts off, stack init
	di
	ld sp, $fffe
	
	; audio off
	ld a, 0
	ld [rNR52], a

	; you MUST wait for vblank to turn off the lcd...
	; IT IS VERY IMPORTANT NOT TO FORGET THAT!!!
waitVblank:
	ld a, [rLY]
	cp 144
	jp c, waitVblank
	; Ok now you can turn off, good night lcd
	ld a, 0
	ld [rLCDC], a
	
	ld b, $ff
clrmem:
	
	
	dec b
	jp z,clrmem

	; set background palette
	ld a, %11100100
	ld [rBGP], a
	; enable vblank interrupt
	ld a, %00000001
	ld [rIE], a
	; Good morning lcd, time to wake up
	ld a, LCDCF_ON | LCDCF_BGON
	ld [rLCDC], a
	
	; enable interrupts
	ei
forever:
	halt
	jp forever
	
vblank:
	push af
	push bc
	push de
	push hl

	inc hl
	
	pop hl
	pop de
	pop bc
	pop af
	ret
	
SECTION "funtus", ROM0
INCBIN "funtus.chr"
