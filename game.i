# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
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
# 3 "game.c" 2


int vOff;
int hOff;
OBJ_ATTR shadowOAM[128];
ANISPRITE player;
ANISPRITE enemy1;
ANISPRITE enemy2;
OBJECT enemies[5];
int amJumping;
int score;


enum {BARREL = 0, POLICE = 5, POLICE2 = 9};


enum {TRICK1 = 500, TRICK2 = 505, TRICK2LOW = 509, TRICK2HIGH = 514};
enum {START1 = 100, START2 = 105, SKATE = 109, JUMP = 114};
enum {CHEAT1 = 1000, CHEAT2 = 1005, CHEAT3 = 1009, CHEAT4 = 1013};



void initGame() {

    vOff = 0;
    hOff = 0;

    amJumping = 1;
    score = 0;


    initPlayer();
    initEnemies();
}





void stateSel(int i) {
    int num = rand();
    if (num % 2 == 0) {
        enemies[i].aniState = BARREL;
    } else {
        enemies[i].aniState = POLICE;
    }
}




void initPlayer() {

    player.width = 32;
    player.height = 32;
    player.worldRow = ((160 - player.height) << 8);
    player.worldCol = 0;
    player.rdel = 1;
    player.isCollide = 0;
    player.enemyTimer = 0;
    player.aniState = START1;
    player.hide = 0;
    player.cheatState = 0;

}

void initEnemies() {
    enemy1.width = 64;
    enemy1.height = 64;
    enemy1.aniState = POLICE;
    enemy1.worldRow = 160 - enemy1.height;
    enemy1.worldCol = 0;
    enemy1.hide = 0;

    enemy2.width = 64;
    enemy2.height = 64;
    enemy2.aniState = POLICE;
    enemy2.worldRow = 160 - enemy2.height;
    enemy2.worldCol = enemy1.width;
    enemy2.hide = 0;


    for (int i = 0; i < 5; i++) {
        enemies[i].width = 32;
        enemies[i].height = 32;
        enemies[i].worldRow = (160 - enemies[i].height);
        enemies[i].worldCol = 240 + 1;
        enemies[i].active = 0;

    }

}




void updateGame() {

    updatePlayer();


    if (player.worldCol > 240 / 2 - player.width / 2) {
        hOff += 2;
        enemy1.worldCol++;
        enemy2.worldCol++;

        for (int i = 0; i < 5; i++) {
        updateEnemies(&enemies[i]);
        }



        if (hOff > 3000) {
            if (player.enemyTimer % 50 == 0) {
            spawnEnemies();
            }
        } else if (hOff > 1000) {
            if (player.enemyTimer % 90 == 0) {
                spawnEnemies();
            }
        } else if (hOff > 0) {
            if (player.enemyTimer % 110 == 0) {
                spawnEnemies();
            }
        }
    }



}

void updatePlayer() {


    if (player.worldRow < 0) {
        player.worldRow = 0;
    }


    if (player.enemyTimer > 120 && collision(player.worldCol, ((player.worldRow) >> 8)
    , player.width, player.height, enemy2.worldCol, enemy2.worldRow, enemy2.width, enemy2.height)) {
        player.hide = 1;
        enemy1.hide = 1;
        enemy2.hide = 1;
        for(int i = 0; i < 5; i++) {
            enemies[i].active = 0;
        }
        goToLoseA();
        hOff = 0;
        (*(volatile unsigned short *)0x04000010) = hOff;
    }


    if (!(player.isCollide)) {
        player.worldCol += 2;
    }



    if (player.enemyTimer < 30) {
        if (player.enemyTimer < 15) {
            player.aniState = START1;
        } else {
            player.aniState = START2;
        }
    } else {
        if (player.worldRow + player.height > 160 && player.cheatState) {
            player.aniState = CHEAT4;
        } else if (!amJumping){
            player.aniState = SKATE;
        }
    }



    if (((player.worldRow + player.rdel) >> 8) < (160 - player.height)) {

        player.worldRow += player.rdel;
    } else {

        player.rdel = 0;
        amJumping = 0;
        drawScore(0);
    }


    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))) && !(amJumping)) {
        if (!player.cheatState) {
            player.aniState = JUMP;
        }
        player.rdel -= 1700;
        if (!(player.cheatState)) {
            amJumping = 1;
            score += 50;
            drawScore(1);
        }


    } else if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))) && !(amJumping)) {
        player.aniState = TRICK1;
        player.rdel -= 1700;
        if (!(player.cheatState)) {
            amJumping = 1;
            score += 100;
            drawScore(2);
        }


    } else if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1)))) && !(amJumping)) {
        player.aniState = TRICK2;
        if (!(player.cheatState)) {
            player.rdel -= 1700;
            amJumping = 1;
            score += 200;
            drawScore(3);
        }



    } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<0)))) {
        if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
            player.cheatState = 1;
        }
    } else if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<1)))) {
        if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
            player.cheatState = 0;
        }
    }

    player.rdel += 70;

    player.enemyTimer++;
}






void spawnEnemies() {

    for (int i = 0; i < 5; i++) {
        if (!(enemies[i].active)) {
            enemies[i].worldRow =(160 - enemies[i].height);
            enemies[i].worldCol = 240 + 1 + hOff;
            enemies[i].active = 1;
            stateSel(i);
            break;
        }
    }
}

void updateEnemies(OBJECT* e) {

    if (enemy2.worldCol + enemy1.width - 24 - hOff < 0) {
        enemy2.worldCol += 2;
        enemy1.hide = 1;

    }




    if(e->active && collision(e->worldCol, e->worldRow, e->width, e->height, player.worldCol, ((player.worldRow) >> 8), player.width, player.height)) {
        player.isCollide = 1;
        if (e->aniState == POLICE || e->aniState == POLICE2) {
            e->aniState = POLICE2;
            player.worldCol = e->worldCol - player.width - 1;
            hOff+=0.50;


        } else {
            e->active = 0;
            player.hide = 1;
            enemy1.hide = 1;
            enemy2.hide = 1;
            hOff = 0;
            (*(volatile unsigned short *)0x04000010) = hOff;
            goToLoseB();

        }
    } else {
        player.isCollide = 0;


    }

    if (e->active) {
  if (e->worldCol + e->width - hOff < 0) {
            e->active = 0;
        }
 }



}





void drawGame() {

    drawPlayer();
    drawEnemies();

    waitForVBlank();

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);

    (*(volatile unsigned short *)0x04000010) = hOff;
}

void drawPlayer() {

    if (player.hide) {
        shadowOAM[0].attr0 |= (2<<8);
    } else {
        shadowOAM[0].attr0 = (0xFF & ((player.worldRow) >> 8)) | (0<<14);
        shadowOAM[0].attr1 = (0x1FF & (player.worldCol - hOff)) | (2<<14);
        shadowOAM[0].attr2 = ((0)<<12) | (((player.aniState / 100) - 1)*32+(player.aniState % 100));
    }
}

void drawEnemies() {


    if (enemy1.hide) {
        shadowOAM[1].attr0 |= (2<<8);
    } else {
        shadowOAM[1].attr0 = (0xFF & (enemy1.worldRow)) | (0<<14);
        shadowOAM[1].attr1 = (0x1FF & (enemy1.worldCol - hOff)) | (3<<14);
        shadowOAM[1].attr2 = ((0)<<12) | ((16)*32+(14));
    }


    if (enemy2.hide) {
        shadowOAM[2].attr0 |= (2<<8);
    } else {
        shadowOAM[2].attr0 = (0xFF & (enemy2.worldRow)) | (0<<14);
        shadowOAM[2].attr1 = (0x1FF & (enemy2.worldCol - hOff)) | (3<<14);
        shadowOAM[2].attr2 = ((0)<<12) | ((16)*32+(22));
    }


    for (int i = 3; i < 5 + 3; i++) {

        if (!(enemies[i - 3].active)) {
            shadowOAM[i].attr0 |= (2<<8);
        } else {
            shadowOAM[i].attr0 = (0xFF & (enemies[i - 3].worldRow)) | (0<<14);
            shadowOAM[i].attr1 = (0x1FF & (enemies[i - 3].worldCol - hOff)) | (2<<14);
            shadowOAM[i].attr2 = ((0)<<12) | ((21)*32+(enemies[i - 3].aniState));
        }
    }
}



void drawScore(int trick) {

    if (trick == 0) {
        shadowOAM[9].attr0 |= (2<<8);
        shadowOAM[10].attr0 |= (2<<8);
        shadowOAM[11].attr0 |= (2<<8);
        shadowOAM[12].attr0 |= (2<<8);
    } else {

        shadowOAM[9].attr0 = (0xFF & (105)) | (0<<14);
        shadowOAM[9].attr1 = (0x1FF & (140)) | (1<<14);
        shadowOAM[9].attr2 = ((0)<<12) | ((28)*32+(22));


        if (trick == 1) {
            shadowOAM[12].attr0 |= (2<<8);

            shadowOAM[10].attr0 = (0xFF & (105)) | (0<<14);
            shadowOAM[10].attr1 = (0x1FF & (156)) | (1<<14);
            shadowOAM[10].attr2 = ((0)<<12) | ((28)*32+(9));

            shadowOAM[11].attr0 = (0xFF & (105)) | (0<<14);
            shadowOAM[11].attr1 = (0x1FF & (164)) | (1<<14);
            shadowOAM[11].attr2 = ((0)<<12) | ((28)*32+(20));
        } else if (trick == 2) {
            shadowOAM[10].attr0 = (0xFF & (105)) | (0<<14);
            shadowOAM[10].attr1 = (0x1FF & (156)) | (1<<14);
            shadowOAM[10].attr2 = ((0)<<12) | ((28)*32+(0));

            shadowOAM[11].attr0 = (0xFF & (105)) | (0<<14);
            shadowOAM[11].attr1 = (0x1FF & (164)) | (1<<14);
            shadowOAM[11].attr2 = ((0)<<12) | ((28)*32+(20));

            shadowOAM[12].attr0 = (0xFF & (105)) | (0<<14);
            shadowOAM[12].attr1 = (0x1FF & (172)) | (1<<14);
            shadowOAM[12].attr2 = ((0)<<12) | ((28)*32+(20));
        } else if (trick == 3) {
            shadowOAM[10].attr0 = (0xFF & (105)) | (0<<14);
            shadowOAM[10].attr1 = (0x1FF & (156)) | (1<<14);
            shadowOAM[10].attr2 = ((0)<<12) | ((28)*32+(2));

            shadowOAM[11].attr0 = (0xFF & (105)) | (0<<14);
            shadowOAM[11].attr1 = (0x1FF & (164)) | (1<<14);
            shadowOAM[11].attr2 = ((0)<<12) | ((28)*32+(20));

            shadowOAM[12].attr0 = (0xFF & (105)) | (0<<14);
            shadowOAM[12].attr1 = (0x1FF & (172)) | (1<<14);
            shadowOAM[12].attr2 = ((0)<<12) | ((28)*32+(20));
        }

        waitForVBlank();
        DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
    }


}
