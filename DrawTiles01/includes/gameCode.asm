
// --------------- Game Code ---------------

main:
	ldx #$ff
	txs

	jsr SYSTEM.setup

gameSetup:

	/* Manual char positioning method
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
	*/

	DrawChar(2,5,7,YELLOW)


gameLoop:
	
	jmp gameLoop
