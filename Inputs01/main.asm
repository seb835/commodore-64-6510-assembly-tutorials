
// --------------- Inputs01 ---------------

#import "/system/memoryMap.asm"
#import "/system/config.asm"
#import "/includes/constants.asm"
#import "/includes/macros.asm"

BasicUpstart2(main)

*=GAME_CODE_ADDRESS "Game Code"
#import "/includes/gameCode.asm"

*=VARIABLES_ADDRESS "Variables"
#import "/includes/variables.asm"

*=CHARSET_ATTRIB_ADDRESS "Charset Attrib"
.import binary "/charset/charsetAttrib.bin"

*=TILESET_ADDRESS "Tileset"
.import binary "/tileset/tileset.bin"

*=SPRITES_ADDRESS "Sprites"
.import binary "/sprites/sprites.bin"

*=CHARSET_ADDRESS "Charset"
.import binary "/charset/charset.bin"

*=TABLES_ADDRESS "Tables"
#import "/includes/tables.asm"

*=LIBRARIES_ADDRESS "Libraries"
#import "/includes/libraries.asm"

*=ROOMS_ADDRESS "Rooms"
.import binary "/rooms/rooms.bin"
