BasicUpstart2(main)

main:
	lda #100
	sta $d000	// X position of sprite 0

	lda #75
	sta $d001	// Y position of sprite 0

	lda #%00000001	// Enable sprite 0
	sta $d015	// Sprite enable memory address

	rts