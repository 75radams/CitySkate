#include "myLib.h"
#include "game.h"

//var
int vOff;
int hOff;
OBJ_ATTR shadowOAM[128];
ANISPRITE player;
ANISPRITE enemy1;
ANISPRITE enemy2;
OBJECT enemies[OBJECTCOUNT];
int amJumping;
int score;

//Enemy states
enum {BARREL = 0, POLICE = 5, POLICE2 = 9};

//Player states
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



//Helper to randomly determine type (state) of enemy

void stateSel(int i) {
    int num = rand();
    if (num % 2 == 0) {
        enemies[i].aniState = BARREL;
    } else {
        enemies[i].aniState = POLICE;
    }
}


//Initialize functions

void initPlayer() {

    player.width = 32;
    player.height = 32;
    player.worldRow = SHIFTUP(SCREENHEIGHT - player.height);
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
    enemy1.worldRow = SCREENHEIGHT - enemy1.height;
    enemy1.worldCol = 0;
    enemy1.hide = 0;

    enemy2.width = 64;
    enemy2.height = 64;
    enemy2.aniState = POLICE;
    enemy2.worldRow = SCREENHEIGHT - enemy2.height;
    enemy2.worldCol = enemy1.width;
    enemy2.hide = 0;


    for (int i = 0; i < OBJECTCOUNT; i++) {
        enemies[i].width = 32;
        enemies[i].height = 32;
        enemies[i].worldRow = (SCREENHEIGHT - enemies[i].height);
        enemies[i].worldCol = SCREENWIDTH + 1;
        enemies[i].active = 0;
        
    }
    
}


//Update functions

void updateGame() {

    updatePlayer();


    if (player.worldCol > SCREENWIDTH / 2 - player.width / 2) {
        hOff += 2;
        enemy1.worldCol++;
        enemy2.worldCol++;

        for (int i = 0; i < OBJECTCOUNT; i++) {
        updateEnemies(&enemies[i]);
        }


        //Difficulty level increase
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

    //Boundary Checks
    if (player.worldRow < 0) {
        player.worldRow = 0;
    }

    //Colision check for police car
    if (player.enemyTimer > 120 && collision(player.worldCol, SHIFTDOWN(player.worldRow)
    , player.width, player.height, enemy2.worldCol, enemy2.worldRow, enemy2.width, enemy2.height)) {
        player.hide = 1;
        enemy1.hide = 1;
        enemy2.hide = 1;
        for(int i = 0; i < OBJECTCOUNT; i++) {
            enemies[i].active = 0;
        }
        goToLoseA();
        hOff = 0;
        REG_BG0HOFF = hOff;
    }
    
    //move player position
    if (!(player.isCollide)) {
        player.worldCol += 2;
    }


    //Implements initial animation for player
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
  

    //Gravity functions/animation functions
    if (SHIFTDOWN(player.worldRow + player.rdel) < (SCREENHEIGHT - player.height)) {

        player.worldRow += player.rdel;
    } else {

        player.rdel = 0;
        amJumping = 0;
        drawScore(0);
    }

    //Jump animation
    if (BUTTON_PRESSED(BUTTON_UP) && !(amJumping)) {
        if (!player.cheatState) {
            player.aniState = JUMP;
        }
        player.rdel -= JUMPPOWER;
        if (!(player.cheatState)) {
            amJumping = 1;
            score += 50;
            drawScore(1);
        }

    //Tail grab animation (TRICK1)
    } else if (BUTTON_PRESSED(BUTTON_A) && !(amJumping)) {
        player.aniState = TRICK1;
        player.rdel -= JUMPPOWER;
        if (!(player.cheatState)) {
            amJumping = 1;
            score += 100;
            drawScore(2);
        }

    //Back flip animation (TRICK2)
    } else if (BUTTON_PRESSED(BUTTON_B) && !(amJumping)) {
        player.aniState = TRICK2;
        if (!(player.cheatState)) {
            player.rdel -= JUMPPOWER;
            amJumping = 1;
            score += 200;
            drawScore(3);
        }


    //Cheat code animation
    } else if (BUTTON_HELD(BUTTON_A)) {
        if (BUTTON_PRESSED(BUTTON_B)) {
            player.cheatState = 1;
        }
    } else if (BUTTON_HELD(BUTTON_B)) {
        if (BUTTON_PRESSED(BUTTON_A)) {
            player.cheatState = 0;
        }
    }
    
    player.rdel += GRAVITY;

    player.enemyTimer++;
}





//Spawns enemy objects (via object pool)
void spawnEnemies() {

    for (int i = 0; i < OBJECTCOUNT; i++) {
        if (!(enemies[i].active)) {
            enemies[i].worldRow =(SCREENHEIGHT - enemies[i].height);
            enemies[i].worldCol = SCREENWIDTH + 1 + hOff;
            enemies[i].active = 1;
            stateSel(i);
            break;
        }
    }
}

void updateEnemies(OBJECT* e) {
    //Moves the police car
    if (enemy2.worldCol + enemy1.width - 24 - hOff < 0) {
        enemy2.worldCol += 2;
        enemy1.hide = 1;

    }



    //Collision check for enemy objects and player
    if(e->active && collision(e->worldCol, e->worldRow, e->width, e->height, player.worldCol, SHIFTDOWN(player.worldRow), player.width, player.height)) {
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
            REG_BG0HOFF = hOff;
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



//Draw functions

void drawGame() {

    drawPlayer();
    drawEnemies();

    waitForVBlank();

    DMANow(3, shadowOAM, OAM, 512);

    REG_BG0HOFF = hOff;
}

void drawPlayer() {

    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[0].attr0 = (ROWMASK & SHIFTDOWN(player.worldRow)) | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (COLMASK & (player.worldCol - hOff)) | ATTR1_MEDIUM;
        shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniState % 100, (player.aniState / 100) - 1);
    }
}

void drawEnemies() {

    //Draws first half of police car (enemy1)
    if (enemy1.hide) {
        shadowOAM[1].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[1].attr0 = (ROWMASK & (enemy1.worldRow)) | ATTR0_SQUARE;
        shadowOAM[1].attr1 = (COLMASK & (enemy1.worldCol - hOff)) | ATTR1_LARGE;
        shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(14, 16);
    }

    //Draws second half of police car (enemy2)
    if (enemy2.hide) {
        shadowOAM[2].attr0 |= ATTR0_HIDE;
    } else {
        shadowOAM[2].attr0 = (ROWMASK & (enemy2.worldRow)) | ATTR0_SQUARE;
        shadowOAM[2].attr1 = (COLMASK & (enemy2.worldCol - hOff)) | ATTR1_LARGE;
        shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 16);
    }

    //Draws enemy onjects
    for (int i = 3; i < OBJECTCOUNT + 3; i++) {

        if (!(enemies[i - 3].active)) {
            shadowOAM[i].attr0 |= ATTR0_HIDE;
        } else {
            shadowOAM[i].attr0 = (ROWMASK & (enemies[i - 3].worldRow)) | ATTR0_SQUARE;
            shadowOAM[i].attr1 = (COLMASK & (enemies[i - 3].worldCol - hOff)) | ATTR1_MEDIUM;
            shadowOAM[i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemies[i - 3].aniState, 21);
        }
    }
}


//Animates the points as the player jumps/does tricks
void drawScore(int trick) {

    if (trick == 0) {
        shadowOAM[9].attr0 |= ATTR0_HIDE;
        shadowOAM[10].attr0 |= ATTR0_HIDE;
        shadowOAM[11].attr0 |= ATTR0_HIDE;
        shadowOAM[12].attr0 |= ATTR0_HIDE;
    } else {

        shadowOAM[9].attr0 = (ROWMASK & (105)) | ATTR0_SQUARE;
        shadowOAM[9].attr1 = (COLMASK & (140)) | ATTR1_SMALL;
        shadowOAM[9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(22, 28);


        if (trick == 1) {
            shadowOAM[12].attr0 |= ATTR0_HIDE;

            shadowOAM[10].attr0 = (ROWMASK & (105)) | ATTR0_SQUARE;
            shadowOAM[10].attr1 = (COLMASK & (156)) | ATTR1_SMALL;
            shadowOAM[10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(9, 28);

            shadowOAM[11].attr0 = (ROWMASK & (105)) | ATTR0_SQUARE;
            shadowOAM[11].attr1 = (COLMASK & (164)) | ATTR1_SMALL;
            shadowOAM[11].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 28);
        } else if (trick == 2) {
            shadowOAM[10].attr0 = (ROWMASK & (105)) | ATTR0_SQUARE;
            shadowOAM[10].attr1 = (COLMASK & (156)) | ATTR1_SMALL;
            shadowOAM[10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(0, 28);

            shadowOAM[11].attr0 = (ROWMASK & (105)) | ATTR0_SQUARE;
            shadowOAM[11].attr1 = (COLMASK & (164)) | ATTR1_SMALL;
            shadowOAM[11].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 28);

            shadowOAM[12].attr0 = (ROWMASK & (105)) | ATTR0_SQUARE;
            shadowOAM[12].attr1 = (COLMASK & (172)) | ATTR1_SMALL;
            shadowOAM[12].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 28);
        } else if (trick == 3) {
            shadowOAM[10].attr0 = (ROWMASK & (105)) | ATTR0_SQUARE;
            shadowOAM[10].attr1 = (COLMASK & (156)) | ATTR1_SMALL;
            shadowOAM[10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(2, 28);

            shadowOAM[11].attr0 = (ROWMASK & (105)) | ATTR0_SQUARE;
            shadowOAM[11].attr1 = (COLMASK & (164)) | ATTR1_SMALL;
            shadowOAM[11].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 28);

            shadowOAM[12].attr0 = (ROWMASK & (105)) | ATTR0_SQUARE;
            shadowOAM[12].attr1 = (COLMASK & (172)) | ATTR1_SMALL;
            shadowOAM[12].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 28);
        }

        waitForVBlank();
        DMANow(3, shadowOAM, OAM, 512);
    }

    
}