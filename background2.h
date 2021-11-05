
//{{BLOCK(background2)

//======================================================================
//
//	background2, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 380 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 12160 + 4096 = 16768
//
//	Time-stamp: 2020-12-02, 06:56:07
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BACKGROUND2_H
#define GRIT_BACKGROUND2_H

#define background2TilesLen 12160
extern const unsigned short background2Tiles[6080];

#define background2MapLen 4096
extern const unsigned short background2Map[2048];

#define background2PalLen 512
extern const unsigned short background2Pal[256];

#endif // GRIT_BACKGROUND2_H

//}}BLOCK(background2)
