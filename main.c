//With this milestone the game is all but complete.
//I added the final sprites, as well as the ability to do tricks.
//Sound was also imlemented in this milestone and I think it really brought my vision together
//for the game.
//Things to do before final due date:
//- add text to backgrounds
//-finish implementing the cheat, it is a little buggy right now
//-clean up the code, fix some bugs with lingering sprites

//Instructions:
//- skate away from the police using UP to jump over objects
//- skating into an officer isnt fatal but skating into 
// an oil barrell is.
//- you can also jump with A and B to do some cool tricks

//I still need to add music, refine the gameplay , and add a cheat.
#include "myLib.h"
#include "game.h"
//#include "splashScreen.h"
#include "background1.h"
#include "background2.h"
#include "alley.h"
#include "cityStreet.h"
#include "pauseScreen.h"
#include "lose.h"
#include "loseB.h"
#include "spritesheet.h"
#include "sound.h"
#include "gameSound.h"
#include "instrSound.h"
#include "pauseSound.h"
#include "loseSound.h"
#include "splashSound.h"
#include "explosion.h"

void initialize();

//States
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

//States
enum {SPLASH, INSTR, GAME, PAUSE, LOSEA, LOSEB};
int state;

//Buttons
unsigned short buttons;
unsigned short oldButtons;


//int hOff;
int hOff;
int tempHOff;




int main() {

    initialize();

    while(1) {

        oldButtons = buttons;
        buttons = BUTTONS;

        //State machine
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

    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(28) | BG_SIZE_WIDE;
    REG_BG1CNT = BG_SIZE_WIDE | BG_SCREENBLOCK(16) | BG_CHARBLOCK(0);

    shadowOAM[0].attr0 = (ROWMASK & (64)) | ATTR0_WIDE;
    shadowOAM[0].attr1 = (COLMASK & (56)) | ATTR1_LARGE;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 14);

    shadowOAM[1].attr0 = (ROWMASK & (64)) | ATTR0_WIDE;
    shadowOAM[1].attr1 = (COLMASK & (120)) | ATTR1_LARGE;
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 14);

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);


    hOff = 0;

    setupSounds();
    setupInterrupts();

    goToSplash();
    initGame();

}


//State functions
void goToSplash() {

    //waitForVBlank();
    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(28) | BG_SIZE_WIDE;
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(16) | BG_SIZE_WIDE;

    DMANow(3, background1Pal, PALETTE, 256);


    DMANow(3, background2Tiles, &CHARBLOCK[0], background2TilesLen);
    DMANow(3, background2Map, &SCREENBLOCK[16], background2MapLen);

    DMANow(3, background1Tiles, &CHARBLOCK[1], background1TilesLen);
    DMANow(3, background1Map, &SCREENBLOCK[28], background1MapLen);

    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);


    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    shadowOAM[0].attr0 = (ROWMASK & (64)) | ATTR0_WIDE;
    shadowOAM[0].attr1 = (COLMASK & (56)) | ATTR1_LARGE;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 14);

    shadowOAM[1].attr0 = (ROWMASK & (64)) | ATTR0_WIDE;
    shadowOAM[1].attr1 = (COLMASK & (120)) | ATTR1_LARGE;
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 14);

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);
    


    stopSound();
    playSoundA(splashSound_data, splashSound_length, 1);


    state = SPLASH;
}

void splashState() {

    hOff++;
    //waitForVBlank();

        shadowOAM[0].attr0 = (ROWMASK & (64)) | ATTR0_WIDE;
        shadowOAM[0].attr1 = (COLMASK & (40)) | ATTR1_LARGE;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 14);

        shadowOAM[1].attr0 = (ROWMASK & (64)) | ATTR0_WIDE;
        shadowOAM[1].attr1 = (COLMASK & (104)) | ATTR1_LARGE;
        shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(8, 14);

        shadowOAM[2].attr0 = (ROWMASK & (60)) | ATTR0_SQUARE;
        shadowOAM[2].attr1 = (COLMASK & (165)) | ATTR1_MEDIUM;
        shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 4);

        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 512);



    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        stopSound();
        playSoundA(pauseSound_data, pauseSound_length, 1);
        goToInstr();
        hOff = 0;
        REG_BG0HOFF = hOff;
    } else if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        playSoundA(gameSound_data, gameSound_length, 1);
        goToGame();
        initGame();
    } else if (BUTTON_PRESSED(BUTTON_L)) {
        muteSound(1);
    }

  
    REG_BG0HOFF = hOff;
    REG_BG1HOFF = 0.5 * hOff;
}



void goToInstr() {


    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL;
    DMANow(3, alleyPal, PALETTE, 256);
    DMANow(3, alleyTiles, &CHARBLOCK[0], alleyTilesLen / 2);
    DMANow(3, alleyMap, &SCREENBLOCK[28], alleyMapLen / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    state = INSTR;

}

void instrState() {

    waitForVBlank();

    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToSplash();
    } else if(BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        playSoundA(gameSound_data, gameSound_length, 1);
        goToGame();
        initGame();
    } else if (BUTTON_PRESSED(BUTTON_L)) {
        muteSound(1);
    }

}



void goToGame() {

    waitForVBlank();

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_WIDE;
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    DMANow(3, cityStreetPal, PALETTE, 256);
    DMANow(3, cityStreetTiles, &CHARBLOCK[0], cityStreetTilesLen);
    DMANow(3, cityStreetMap, &SCREENBLOCK[28], cityStreetMapLen);

    

    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);



    state = GAME;


}

void gameState() {

    updateGame();
    drawGame();
    waitForVBlank();

    if(BUTTON_PRESSED(BUTTON_START)) {
        pauseGameSound();
        playSoundB(instrSound_data, instrSound_length, 1);
        goToPause();
        tempHOff = hOff;
        hOff = 0;
        REG_BG0HOFF = hOff;
    } else if (BUTTON_PRESSED(BUTTON_L)) {
        muteSound(1);
    }

}



void goToPause() {

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL;
    DMANow(3, pauseScreenPal, PALETTE, 256);
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen / 2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[28], pauseScreenMapLen / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    



    state = PAUSE;
}

void pauseState() {

    waitForVBlank();

    shadowOAM[0].attr0 = (ROWMASK & (70)) | ATTR0_TALL;
    shadowOAM[0].attr1 = (COLMASK & (70)) | ATTR1_MEDIUM;
    shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(5, 9);


    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);


    if(BUTTON_PRESSED(BUTTON_SELECT)) {
        goToSplash();
    } else if(BUTTON_PRESSED(BUTTON_START)) {
        unpauseGameSound();

        goToGame();
        hOff = tempHOff;
        REG_BG0HOFF = hOff;
    } else if (BUTTON_PRESSED(BUTTON_L)) {
        muteSound(2);
    }

}



void goToLoseA() {

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL;
    DMANow(3, losePal, PALETTE, 256);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[28], loseMapLen / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    stopSound();
    playSoundA(loseSound_data, loseSound_length, 1);
    playSoundB(explosion_data, explosion_length, 0);

    state = LOSEA;

}

void loseAState() {

    waitForVBlank();

    if(BUTTON_PRESSED(BUTTON_START)) {
        goToSplash();
    } else if (BUTTON_PRESSED(BUTTON_L)) {
        muteSound(1);
    }

}


void goToLoseB() {

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(28) | BG_SIZE_SMALL;
    DMANow(3, loseBPal, PALETTE, 256);
    DMANow(3, loseBTiles, &CHARBLOCK[0], loseBTilesLen / 2);
    DMANow(3, loseBMap, &SCREENBLOCK[28], loseBMapLen / 2);

    hideSprites();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 512);

    stopSound();
    playSoundA(loseSound_data, loseSound_length, 1);
    playSoundB(explosion_data, explosion_length, 0);

    state = LOSEB;

}

void loseBState() {

    waitForVBlank();

    if(BUTTON_PRESSED(BUTTON_START)) {
        goToSplash();
    } else if (BUTTON_PRESSED(BUTTON_L)) {
        muteSound(1);
    }

}