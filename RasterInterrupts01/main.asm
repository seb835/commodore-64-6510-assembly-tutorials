
BasicUpstart2(main)

main:
	jsr setupRasterInterrupt

gameLoop:
	jmp gameLoop

#import "interrupt.asm"
