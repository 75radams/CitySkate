
//{{BLOCK(instrScreen)

//======================================================================
//
//	instrScreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 11 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 352 + 2048 = 2912
//
//	Time-stamp: 2020-11-04, 18:37:01
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRSCREEN_H
#define GRIT_INSTRSCREEN_H

#define instrScreenTilesLen 352
extern const unsigned short instrScreenTiles[176];

#define instrScreenMapLen 2048
extern const unsigned short instrScreenMap[1024];

#define instrScreenPalLen 512
extern const unsigned short instrScreenPal[256];

#endif // GRIT_INSTRSCREEN_H

//}}BLOCK(instrScreen)
