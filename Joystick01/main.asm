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

gameLoop:
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
				lda #32 // Blank character
				sta SCREEN_RAM + 0
				jmp checkJoy2_DOWN
			joy2_UP:
				lda #21 // U character
				sta SCREEN_RAM + 0

		checkJoy2_DOWN:
			lda JOYSTICK_2
			and #DOWN
			beq joy2_DOWN
				lda #32 // Blank character
				sta SCREEN_RAM + 1
				jmp checkJoy2_LEFT
			joy2_DOWN:
				lda #4 // D character
				sta SCREEN_RAM + 1

		checkJoy2_LEFT:
			lda JOYSTICK_2
			and #LEFT
			beq joy2_LEFT
				lda #32 // Blank character
				sta SCREEN_RAM + 2
				jmp checkJoy2_RIGHT
			joy2_LEFT:
				lda #12 // L character
				sta SCREEN_RAM + 2

		checkJoy2_RIGHT:
			lda JOYSTICK_2
			and #RIGHT
			beq joy2_RIGHT
				lda #32 // Blank character
				sta SCREEN_RAM + 3
				jmp checkJoy2_FIRE
			joy2_RIGHT:
				lda #18 // R character
				sta SCREEN_RAM + 3

		checkJoy2_FIRE:
			lda JOYSTICK_2
			and #FIRE
			beq joy2_FIRE
				jmp doneReadJoystick_2
			joy2_FIRE:
				inc SCREEN_BORDER_COLOUR

	doneReadJoystick_2:
		rts