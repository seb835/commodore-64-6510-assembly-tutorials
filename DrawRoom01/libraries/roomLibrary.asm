
// --------------- Room Library ---------------

ROOM:
{
	load:
		txa
		pha
		tya
		pha

		ldx roomNr
		lda Room_LO,x
		sta ZP_ROOM_LO
		lda Room_HI,x
		sta ZP_ROOM_HI

		lda #0
		sta tileCounter
		sta tileRow
		tax

		loadRoomRow:
			ldy #0
			sty tileCol

			loadRoomCol:
				sty tempY
				ldy tileCounter
				lda (ZP_ROOM_LO),y
				sta tileNr
				ldy tempY

				jsr TILE.drawTile
				inc tileCounter
				
				iny
				sty tileCol
				cpy #ROOM_WIDTH
				bne loadRoomCol

			inx
			stx tileRow
			cpx #ROOM_HEIGHT
			bne loadRoomRow

		pla
		tay
		pla
		tax

		rts
}
