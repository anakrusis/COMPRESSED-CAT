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

; drawLetters:
	; ld e, $15 ; number of letters being drawn
	
	; ; starting point of text
	; ld hl, text
	; ld a, [textPtr]
	; add a, l
	; ld l, a
	
	; ; if we reach the end of the text, we must loop back.
	; sub a, LOW(textEnd)
	; jp nz, :+
	; ; resets the text pointer and hl
	; ld hl, text
	; ld a, $00
	; ld [textPtr], a
; :
	; ld bc, $0090
	; ld a, [globalTimer]
	; xor a, $ff
	; ;inc a
	; and a, $07
	; ld b, a
	
; drawLettersLoop:
	; ld a, [hli]
	; ld d, a
	
	; ; space character: won't assign a sprite
	; sub a, $24
	; jp z, drawLettersLoopTail
	
	; push hl
	; ; ld hl, sine
	; ; ld a, [globalTimer]
	; ; add a, l
	; ; ld l, a
	; ; ld a, [hl]
	
	; ;srl a 
	; ;srl a
	; ;srl a
	
	; ld a, $80
	; add a, e
	; ld c, a
	; pop hl
	
	; call drawSprite

; drawLettersLoopTail:	
	; ld a, $08
	; add a, b
	; ld b, a
	
	; dec e
	; jp nz, drawLettersLoop
	
	; ret
	
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
	
	; add 8 to x
	ld a, b
	add $08
	ld b, a
	
	jp drawBigObjLoop

drawBigObjDone:	
	ret