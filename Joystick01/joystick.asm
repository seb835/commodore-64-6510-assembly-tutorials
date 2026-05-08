BasicUpstart2(main)

main:

gameLoop:

	lda $dc00	// Read joystick in port 2
	sta $0400	// Store it in top left corner of the screen

	jmp gameLoop