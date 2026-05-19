
// --------------- Game Code ---------------

main:
	ldx #$ff
	txs

	jsr SYSTEM.setup

gameSetup:
	
	// Load room
	lda #14
	sta roomNr
	jsr ROOM.load

	// Initialise player
	ldx #0 // Sprite 0

	lda #100
	sta Sprite_X_Pos,x
	sta Sprite_Y_Pos,x

	lda #10
	sta Sprite_V_Speed,x
	sta Sprite_H_Speed,x

	lda #%00000001 // Enable multicolour for sprite 0
	sta SPRITE_MULTICOLOR // $d01c

	lda #BLACK
	sta SPRITE_EXTRA_COLOR_1 // $d025
	lda #WHITE
	sta SPRITE_EXTRA_COLOR_2 // $d026

	lda #LIGHT_RED
	sta SPRITE_COLOR,x // $d027,x

	lda #$80 // Sprite pointer index
	sta SPRITE_POINTER,x // $07f8 (SCREEN RAM + $03f8)

	lda #%00000001 // Enable sprite 0
	sta SPRITE_ENABLE // $d015

gameLoop:

	jsr INPUT.readJoystick_2
	jsr SPRITE.handler
	
	jmp gameLoop
