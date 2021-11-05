//Constants
#define MAPHEIGHT 256
#define MAPWIDTH 512

//Var
extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern ANISPRITE square;
extern int score;

//prototypes
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

//Gravity Macros
#define GRAVITY 70
#define JUMPPOWER 1700
#define SHIFTUP(num)   ((num) << 8)
#define SHIFTDOWN(num) ((num) >> 8)

//Enemy object pool  (will implement later)
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

#define OBJECTCOUNT 5

extern OBJECT enemy[OBJECTCOUNT];