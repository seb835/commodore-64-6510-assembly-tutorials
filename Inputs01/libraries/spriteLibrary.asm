
// --------------- Sprite Library ---------------

SPRITE:
{
	handler:
		ldx #0
		handlerLoop:

			// ---------------- Move Sprite START ----------------

			checkVspeedTimer:
				lda Sprite_V_Speed_Timer,x
				cmp Sprite_V_Speed,x
				beq vSpeedTimerReached
					inc Sprite_V_Speed_Timer,x
					jmp checkHspeedTimer
				vSpeedTimerReached:
					lda #0 // Reset timer
					sta Sprite_V_Speed_Timer,x

			checkUpDirection:
				lda Sprite_Direction,x
				and #UP
				bne moveUp
					jmp checkDownDirection
				moveUp:
					dec Sprite_Y_Pos,x

			checkDownDirection:
				lda Sprite_Direction,x
				and #DOWN
				bne moveDown
					jmp checkHspeedTimer
				moveDown:
					inc Sprite_Y_Pos,x

			checkHspeedTimer:
				lda Sprite_H_Speed_Timer,x
				cmp Sprite_H_Speed,x
				beq hSpeedTimerReached
					inc Sprite_H_Speed_Timer,x
					jmp nextSpriteToHandle
				hSpeedTimerReached:
					lda #0 // Reset timer
					sta Sprite_H_Speed_Timer,x

			checkLeftDirection:
				lda Sprite_Direction,x
				and #LEFT
				bne moveLeft
					jmp checkRightDirection
				moveLeft:
					dec Sprite_X_Pos,x

			checkRightDirection:
				lda Sprite_Direction,x
				and #RIGHT
				bne moveRight
					jmp doneMoveSprite
				moveRight:
					inc Sprite_X_Pos,x

			doneMoveSprite:

			// ---------------- Move Sprite END ----------------

			nextSpriteToHandle:
				inx
				cpx #8 // Max sprites
				beq doneHandler
					jmp handlerLoop

		doneHandler:
			rts


	updateSprite_X_Y:
		ldx #0
		updateSprite_X_Y_loop:
			lda Sprite_X_Pos,x
			sta tempXpos
			lda Sprite_Y_Pos,x
			sta tempYpos

			txa
			pha
			asl
			tax

			lda tempXpos
			sta SPRITE_X,x
			lda tempYpos
			sta SPRITE_Y,x

			pla
			tax

			inx
			cpx #8 // Max sprites
			bne updateSprite_X_Y_loop
		rts
}
