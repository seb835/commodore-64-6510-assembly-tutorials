
// --------------- Game Code ---------------

main:
	ldx #$ff
	txs

	jsr SYSTEM.setup

gameSetup:

	/*
	// Manual char positioning method
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

	/*
	// Basic drawing of single char macro
	DrawChar(2,5,7,YELLOW)
	*/

	// Draw tiles
	DrawTile(0,1,1)
	DrawTile(1,2,1)
	DrawTile(2,3,1)
	DrawTile(3,4,1)
	DrawTile(4,5,1)
	DrawTile(5,6,1)
	DrawTile(6,7,1)

gameLoop:
	
	jmp gameLoop
