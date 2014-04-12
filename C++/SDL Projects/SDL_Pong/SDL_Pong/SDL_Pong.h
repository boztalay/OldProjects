#include "SDL.h"
#include "SDL_Func.h"

//==========Defines==========\\

#define WINDOW_WIDTH 800 
#define WINDOW_HEIGHT 600
#define WINDOW_TITLE "SDL Pong"

#define PADDLE_SPEED_X 250.0
#define BALL_SPEED_Y 250

#define FRAMES_PER_SECOND 30
#define FRAME_RATE 1000 / FRAMES_PER_SECOND

#define MENU 1
#define TWOPGAME 2
#define GAMEOVER 3
#define LOSE 4
#define SCOREBOARD 5
#define ONEPGAME 6
#define CONTROLS 7
#define DIFFICULTY 8

#define EASIER 9
#define HARDER 10

#define NOT_PLAYING 11

//==========Variables==========\\

float deltaTime = 0.0;
int thisTime = 0;
int lastTime = 0;

SDL_Event event;
bool gameRunning = true;
   
bool KeysHeld[323] = {false};

//==========Sprite Struct Prototype==========\\

struct SSprite
{
	float X;
	float Y;
	float pX;
	float pY;
	float speedX;
	float speedY;
	int imageX;
	int imageY;
	int width;
	int height;
	SDL_Surface* Image;
};

