
BasicUpstart2(main)

#import "memoryMap.asm"

*=GAME_CODE_ADDRESS "Game Code"
#import "gameCode.asm"

*=VARIABLES_ADDRESS "Variables"
#import "variables.asm"

*=TILESET_ADDRESS "Tileset"
.import binary "tileset.bin"

*=CHARSET_ATTRIB_ADDRESS "Charset Attrib"
.import binary "charsetAttrib.bin"

*=HUD_ADDRESS "HUD"
.import binary "hud.bin"
