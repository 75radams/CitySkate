
//{{BLOCK(alley)

//======================================================================
//
//	alley, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 516 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 16512 + 2048 = 19072
//
//	Time-stamp: 2020-12-02, 01:05:09
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_ALLEY_H
#define GRIT_ALLEY_H

#define alleyTilesLen 16512
extern const unsigned short alleyTiles[8256];

#define alleyMapLen 2048
extern const unsigned short alleyMap[1024];

#define alleyPalLen 512
extern const unsigned short alleyPal[256];

#endif // GRIT_ALLEY_H

//}}BLOCK(alley)
