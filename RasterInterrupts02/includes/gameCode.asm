
// --------------- Game Code ---------------

main:
	ldx #$ff
	txs

	jsr SYSTEM.setup

gameSetup:


gameLoop:
	
	jmp gameLoop
