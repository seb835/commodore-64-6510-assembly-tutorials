BasicUpstart2(main)

.label JOYSTICK_2 = $dc00

.label UP		= %00000001
.label DOWN		= %00000010
.label LEFT		= %00000100
.label RIGHT	= %00001000
.label FIRE		= %00010000

.label JOYSTICK_2_IDLE = %01111111

.label SCREEN_RAM = $0400
.label SCREEN_CLEAR = $e544
.label SCREEN_BORDER_COLOUR = $d020

main:
	jsr SCREEN_CLEAR // Clear the C64 screen

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

gameLoop:
	ldx #0
	slowDownLoop:
		nop
		nop
		nop
		nop
		
		inx
		cpx #255
		bne slowDownLoop

	jsr readJoystick_2
	jmp gameLoop

readJoystick_2:
	lda JOYSTICK_2
	cmp #JOYSTICK_2_IDLE
	beq joy2_IDLE	
		jmp checkJoy2_UP
	
	joy2_IDLE:

		checkJoy2_UP:
			lda JOYSTICK_2
			and #UP
			beq joy2_UP
				jmp checkJoy2_DOWN
			joy2_UP:
				dec $d001

		checkJoy2_DOWN:
			lda JOYSTICK_2
			and #DOWN
			beq joy2_DOWN
				jmp checkJoy2_LEFT
			joy2_DOWN:
				inc $d001

		checkJoy2_LEFT:
			lda JOYSTICK_2
			and #LEFT
			beq joy2_LEFT
				jmp checkJoy2_RIGHT
			joy2_LEFT:
				dec $d000

		checkJoy2_RIGHT:
			lda JOYSTICK_2
			and #RIGHT
			beq joy2_RIGHT
				jmp checkJoy2_FIRE
			joy2_RIGHT:
				inc $d000

		checkJoy2_FIRE:
			lda JOYSTICK_2
			and #FIRE
			beq joy2_FIRE
				jmp doneReadJoystick_2
			joy2_FIRE:
				inc SCREEN_BORDER_COLOUR

doneReadJoystick_2:
	rts

*=$2000
.import binary "computerFace.bin"