BasicUpstart2(main)

main:

	ldx #0
	loop:
		txa
		sta $0400,x
		inx
		cpx #255
		bne loop

	rts