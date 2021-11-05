
//{{BLOCK(gameScreen)

//======================================================================
//
//	gameScreen, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 6 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 192 + 4096 = 4800
//
//	Time-stamp: 2020-11-04, 23:05:50
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESCREEN_H
#define GRIT_GAMESCREEN_H

#define gameScreenTilesLen 192
extern const unsigned short gameScreenTiles[96];

#define gameScreenMapLen 4096
extern const unsigned short gameScreenMap[2048];

#define gameScreenPalLen 512
extern const unsigned short gameScreenPal[256];

#endif // GRIT_GAMESCREEN_H

//}}BLOCK(gameScreen)
