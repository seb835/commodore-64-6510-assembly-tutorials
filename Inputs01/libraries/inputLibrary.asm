
// --------------- Input Library ---------------

INPUT:
{
	readJoystick_2:
		ldx #0 // Player is sprite 0

		lda JOYSTICK_2 // $dc00
		cmp #JOY_2_IDLE // #%01111111
		beq joy2_IDLE
				jmp checkJoy2_UP
			joy2_IDLE:
				lda #%00000000
				sta Sprite_Direction,x
				jmp doneReadJoystick_2

			checkJoy2_UP:
				lda JOYSTICK_2
				and #JOY_UP
				beq joy2_UP
					lda Sprite_Direction,x
					and #%11111111 - UP
					sta Sprite_Direction,x
					jmp checkJoy2_DOWN
				joy2_UP:
					lda Sprite_Direction,x
					ora #UP
					sta Sprite_Direction,x

			checkJoy2_DOWN:
				lda JOYSTICK_2
				and #JOY_DOWN
				beq joy2_DOWN
					lda Sprite_Direction,x
					and #%11111111 - DOWN
					sta Sprite_Direction,x
					jmp checkJoy2_LEFT
				joy2_DOWN:
					lda Sprite_Direction,x
					ora #DOWN
					sta Sprite_Direction,x
				
			checkJoy2_LEFT:
				lda JOYSTICK_2
				and #JOY_LEFT
				beq joy2_LEFT
					lda Sprite_Direction,x
					and #%11111111 - LEFT
					sta Sprite_Direction,x
					jmp checkJoy2_RIGHT
				joy2_LEFT:
					lda Sprite_Direction,x
					ora #LEFT
					sta Sprite_Direction,x
				
			checkJoy2_RIGHT:
				lda JOYSTICK_2
				and #JOY_RIGHT
				beq joy2_RIGHT
					lda Sprite_Direction,x
					and #%11111111 - RIGHT
					sta Sprite_Direction,x
					jmp checkJoy2_FIRE
				joy2_RIGHT:
					lda Sprite_Direction,x
					ora #RIGHT
					sta Sprite_Direction,x
				
			checkJoy2_FIRE:
				lda JOYSTICK_2
				and #JOY_FIRE
				beq joy2_FIRE
					jmp doneReadJoystick_2
				joy2_FIRE:
					inc SCREEN_BORDER_COLOR
				
		doneReadJoystick_2:
			rts
}
