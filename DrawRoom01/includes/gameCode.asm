
// --------------- Game Code ---------------

main:
	ldx #$ff
	txs

	jsr SYSTEM.setup

gameSetup:

	lda #14
	sta roomNr
	jsr ROOM.load
	

gameLoop:
	
	jmp gameLoop
