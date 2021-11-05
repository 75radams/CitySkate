# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 17 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern volatile unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();






typedef struct {
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
    int isCollide;
    int enemyTimer;
    int cheatState;
} ANISPRITE;
# 201 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 212 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 252 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 288 "myLib.h"
typedef void (*ihp)(void);
# 308 "myLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 18 "main.c" 2
# 1 "game.h" 1





extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE square;
extern int score;


void initGame();
void initPlayer();
void initEnemies();
void updateGame();
void updatePlayer();
void updateEnemies();
void drawGame();
void drawPlayer();
void drawEnemies();
void drawScore(int trick);
void stateSel();
# 32 "game.h"
typedef struct {
    int width;
    int height;
    int worldRow;
    int worldCol;
    int aniState;
    int enemyType;
    int hide;
    int active;
} OBJECT;



extern OBJECT enemy[5];
# 19 "main.c" 2

# 1 "background1.h" 1
# 22 "background1.h"
extern const unsigned short background1Tiles[12336];


extern const unsigned short background1Map[2048];


extern const unsigned short background1Pal[256];
# 21 "main.c" 2
# 1 "background2.h" 1
# 22 "background2.h"
extern const unsigned short background2Tiles[6080];


extern const unsigned short background2Map[2048];


extern const unsigned short background2Pal[256];
# 22 "main.c" 2
# 1 "alley.h" 1
# 22 "alley.h"
extern const unsigned short alleyTiles[8256];


extern const unsigned short alleyMap[1024];


extern const unsigned short alleyPal[256];
# 23 "main.c" 2
# 1 "cityStreet.h" 1
# 22 "cityStreet.h"
extern const unsigned short cityStreetTiles[11408];


extern const unsigned short cityStreetMap[2048];


extern const unsigned short cityStreetPal[256];
# 24 "main.c" 2
# 1 "pauseScreen.h" 1
# 22 "pauseScreen.h"
extern const unsigned short pauseScreenTiles[5968];


extern const unsigned short pauseScreenMap[1024];


extern const unsigned short pauseScreenPal[256];
# 25 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[7264];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 26 "main.c" 2
# 1 "loseB.h" 1
# 22 "loseB.h"
extern const unsigned short loseBTiles[6080];


extern const unsigned short loseBMap[1024];


extern const unsigned short loseBPal[256];
# 27 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 28 "main.c" 2
# 1 "sound.h" 1
void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
void muteSound();
# 50 "sound.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 29 "main.c" 2
# 1 "gameSound.h" 1


extern const unsigned int gameSound_sampleRate;
extern const unsigned int gameSound_length;
extern const signed char gameSound_data[];
# 30 "main.c" 2
# 1 "instrSound.h" 1


extern const unsigned int instrSound_sampleRate;
extern const unsigned int instrSound_length;
extern const signed char instrSound_data[];
# 31 "main.c" 2
# 1 "pauseSound.h" 1


extern const unsigned int pauseSound_sampleRate;
extern const unsigned int pauseSound_length;
extern const signed char pauseSound_data[];
# 32 "main.c" 2
# 1 "loseSound.h" 1


extern const unsigned int loseSound_sampleRate;
extern const unsigned int loseSound_length;
extern const signed char loseSound_data[];
# 33 "main.c" 2
# 1 "splashSound.h" 1


extern const unsigned int splashSound_sampleRate;
extern const unsigned int splashSound_length;
extern const signed char splashSound_data[];
# 34 "main.c" 2
# 1 "explosion.h" 1


extern const unsigned int explosion_sampleRate;
extern const unsigned int explosion_length;
extern const signed char explosion_data[];
# 35 "main.c" 2

void initialize();


void goToSplash();
void splashState();
void goToInstr();
void instrState();
void goToGame();
void gameState();
void goToPause();
void pauseState();
void goToLoseA();
void loseAState();
void goToLoseB();
void loseBState();


enum {SPLASH, INSTR, GAME, PAUSE, LOSEA, LOSEB};
int state;


unsigned short buttons;
unsigned short oldButtons;



int hOff;
int tempHOff;




int main() {

    initialize();

    while(1) {

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        switch(state) {
            case SPLASH:
            splashState();
            break;

            case INSTR:
            instrState();
            break;

            case GAME:
            gameState();
            break;

            case PAUSE:
            pauseState();
            break;

            case LOSEA:
            loseAState();
            break;

            case LOSEB:
            loseBState();
            break;
        }
    }

}

void initialize () {

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9) | (1<<12);
    (*(volatile unsigned short*)0x4000008) = ((1)<<2) | ((28)<<8) | (1<<14);
    (*(volatile unsigned short*)0x400000A) = (1<<14) | ((16)<<8) | ((0)<<2);

    shadowOAM[0].attr0 = (0xFF & (64)) | (1<<14);
    shadowOAM[0].attr1 = (0x1FF & (56)) | (3<<14);
    shadowOAM[0].attr2 = ((0)<<12) | ((14)*32+(0));

    shadowOAM[1].attr0 = (0xFF & (64)) | (1<<14);
    shadowOAM[1].attr1 = (0x1FF & (120)) | (3<<14);
    shadowOAM[1].attr2 = ((0)<<12) | ((14)*32+(8));

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);


    hOff = 0;

    setupSounds();
    setupInterrupts();

    goToSplash();
    initGame();

}



void goToSplash() {


    (*(volatile unsigned short*)0x4000008) = ((1)<<2) | ((28)<<8) | (1<<14);
    (*(volatile unsigned short*)0x400000A) = ((0)<<2) | ((16)<<8) | (1<<14);

    DMANow(3, background1Pal, ((unsigned short *)0x5000000), 256);


    DMANow(3, background2Tiles, &((charblock *)0x6000000)[0], 12160);
    DMANow(3, background2Map, &((screenblock *)0x6000000)[16], 4096);

    DMANow(3, background1Tiles, &((charblock *)0x6000000)[1], 24672);
    DMANow(3, background1Map, &((screenblock *)0x6000000)[28], 4096);

    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 256);
    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);


    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    shadowOAM[0].attr0 = (0xFF & (64)) | (1<<14);
    shadowOAM[0].attr1 = (0x1FF & (56)) | (3<<14);
    shadowOAM[0].attr2 = ((0)<<12) | ((14)*32+(0));

    shadowOAM[1].attr0 = (0xFF & (64)) | (1<<14);
    shadowOAM[1].attr1 = (0x1FF & (120)) | (3<<14);
    shadowOAM[1].attr2 = ((0)<<12) | ((14)*32+(8));

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);



    stopSound();
    playSoundA(splashSound_data, splashSound_length, 1);


    state = SPLASH;
}

void splashState() {

    hOff++;


        shadowOAM[0].attr0 = (0xFF & (64)) | (1<<14);
        shadowOAM[0].attr1 = (0x1FF & (40)) | (3<<14);
        shadowOAM[0].attr2 = ((0)<<12) | ((14)*32+(0));

        shadowOAM[1].attr0 = (0xFF & (64)) | (1<<14);
        shadowOAM[1].attr1 = (0x1FF & (104)) | (3<<14);
        shadowOAM[1].attr2 = ((0)<<12) | ((14)*32+(8));

        shadowOAM[2].attr0 = (0xFF & (60)) | (0<<14);
        shadowOAM[2].attr1 = (0x1FF & (165)) | (2<<14);
        shadowOAM[2].attr2 = ((0)<<12) | ((4)*32+(0));

        waitForVBlank();
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);



    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        stopSound();
        playSoundA(pauseSound_data, pauseSound_length, 1);
        goToInstr();
        hOff = 0;
        (*(volatile unsigned short *)0x04000010) = hOff;
    } else if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        stopSound();
        playSoundA(gameSound_data, gameSound_length, 1);
        goToGame();
        initGame();
    } else if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {
        muteSound(1);
    }


    (*(volatile unsigned short *)0x04000010) = hOff;
    (*(volatile unsigned short *)0x04000014) = 0.5 * hOff;
}



void goToInstr() {


    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<14);
    DMANow(3, alleyPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, alleyTiles, &((charblock *)0x6000000)[0], 16512 / 2);
    DMANow(3, alleyMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    state = INSTR;

}

void instrState() {

    waitForVBlank();

    if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        goToSplash();
    } else if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        stopSound();
        playSoundA(gameSound_data, gameSound_length, 1);
        goToGame();
        initGame();
    } else if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {
        muteSound(1);
    }

}



void goToGame() {

    waitForVBlank();

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (1<<14);
    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);

    DMANow(3, cityStreetPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, cityStreetTiles, &((charblock *)0x6000000)[0], 22816);
    DMANow(3, cityStreetMap, &((screenblock *)0x6000000)[28], 4096);



    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 256);
    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);



    state = GAME;


}

void gameState() {

    updateGame();
    drawGame();
    waitForVBlank();

    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        pauseGameSound();
        playSoundB(instrSound_data, instrSound_length, 1);
        goToPause();
        tempHOff = hOff;
        hOff = 0;
        (*(volatile unsigned short *)0x04000010) = hOff;
    } else if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {
        muteSound(1);
    }

}



void goToPause() {

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<14);
    DMANow(3, pauseScreenPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, pauseScreenTiles, &((charblock *)0x6000000)[0], 11936 / 2);
    DMANow(3, pauseScreenMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);





    state = PAUSE;
}

void pauseState() {

    waitForVBlank();

    shadowOAM[0].attr0 = (0xFF & (70)) | (2<<14);
    shadowOAM[0].attr1 = (0x1FF & (70)) | (2<<14);
    shadowOAM[0].attr2 = ((0)<<12) | ((9)*32+(5));


    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);


    if((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        goToSplash();
    } else if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        unpauseGameSound();

        goToGame();
        hOff = tempHOff;
        (*(volatile unsigned short *)0x04000010) = hOff;
    } else if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {
        muteSound(2);
    }

}



void goToLoseA() {

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<14);
    DMANow(3, losePal, ((unsigned short *)0x5000000), 256);
    DMANow(3, loseTiles, &((charblock *)0x6000000)[0], 14528 / 2);
    DMANow(3, loseMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    stopSound();
    playSoundA(loseSound_data, loseSound_length, 1);
    playSoundB(explosion_data, explosion_length, 0);

    state = LOSEA;

}

void loseAState() {

    waitForVBlank();

    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToSplash();
    } else if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {
        muteSound(1);
    }

}


void goToLoseB() {

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<14);
    DMANow(3, loseBPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, loseBTiles, &((charblock *)0x6000000)[0], 12160 / 2);
    DMANow(3, loseBMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    stopSound();
    playSoundA(loseSound_data, loseSound_length, 1);
    playSoundB(explosion_data, explosion_length, 0);

    state = LOSEB;

}

void loseBState() {

    waitForVBlank();

    if((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToSplash();
    } else if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {
        muteSound(1);
    }

}
