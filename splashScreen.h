
//{{BLOCK(splashScreen)

//======================================================================
//
//	splashScreen, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 1150 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 36800 + 4096 = 41408
//
//	Time-stamp: 2020-11-11, 19:24:48
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SPLASHSCREEN_H
#define GRIT_SPLASHSCREEN_H

#define splashScreenTilesLen 36800
extern const unsigned short splashScreenTiles[18400];

#define splashScreenMapLen 4096
extern const unsigned short splashScreenMap[2048];

#define splashScreenPalLen 512
extern const unsigned short splashScreenPal[256];

#endif // GRIT_SPLASHSCREEN_H

//}}BLOCK(splashScreen)
