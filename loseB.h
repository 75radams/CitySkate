
//{{BLOCK(loseB)

//======================================================================
//
//	loseB, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 380 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 12160 + 2048 = 14720
//
//	Time-stamp: 2020-12-02, 09:48:56
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSEB_H
#define GRIT_LOSEB_H

#define loseBTilesLen 12160
extern const unsigned short loseBTiles[6080];

#define loseBMapLen 2048
extern const unsigned short loseBMap[1024];

#define loseBPalLen 512
extern const unsigned short loseBPal[256];

#endif // GRIT_LOSEB_H

//}}BLOCK(loseB)
