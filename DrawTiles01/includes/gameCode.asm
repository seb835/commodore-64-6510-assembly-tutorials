
// --------------- Game Code ---------------

main:
	ldx #$ff
	txs

	jsr SYSTEM.setup

gameSetup:

	ldx #24 // Position at row number

	lda Row_LO,x
	sta ZP_ROW_LO
	lda Row_HI,x
	sta ZP_ROW_HI

	lda Row_Color_LO,x
	sta ZP_ROW_COLOR_LO
	lda Row_Color_HI,x
	sta ZP_ROW_COLOR_HI

	ldy #39 // Position at column number

	lda #1 // Screen code for A
	sta (ZP_ROW_LO),y

	lda #WHITE
	sta (ZP_ROW_COLOR_LO),y


gameLoop:
	
	jmp gameLoop
