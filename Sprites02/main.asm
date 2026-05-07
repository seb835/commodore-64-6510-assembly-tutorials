BasicUpstart2(main)

main:

	lda #150
	sta $d000	// X position of sprite 0

	lda #100
	sta $d001	// Y position of sprite 0

	lda #LIGHT_RED
	sta $d027	// Sprite 0 colour

	lda #BLACK
	sta $d025	// Sprite extra colour 1

	lda #WHITE
	sta $d026	// Sprite extra colour 2

	lda #$80
	sta $07f8	// Sprite 0 sprite pointer index

	lda #%00000001	// Enable multicolour for sprite 0
	sta $d01c

	lda #%00000001	// Enable sprite 0
	sta $d015

	rts

*=$2000
.import binary "computerFace.bin"