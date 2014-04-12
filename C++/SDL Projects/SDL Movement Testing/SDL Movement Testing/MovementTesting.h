#include "SDL.h"
#include "SDL_Func.h"

//==========Global Constants==========\\

const int WINDOW_WIDTH = 750; 
const int WINDOW_HEIGHT = 500;
const char* WINDOW_TITLE = "SDL--Movement System Testing Area";

const float BAT_SPEED_X = 150.0; 
const float BAT_SPEED_Y = 50.0;

const float DOZER_SPEED_X = 20.0;
const float DOZER_SPEED_Y = 20.0;

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



//==========Game Specific Functions==========\\

void BatConstraintCheck(SSprite &Bat)
{
	  if(Bat.X < 0)
		 {
			 Bat.X = 0;
		 }
	  if(Bat.X > (WINDOW_WIDTH - Bat.width))
		 {
			 Bat.X = (WINDOW_WIDTH - Bat.width);
		 }
	  if(Bat.Y < 0)
		 {
			 Bat.Y = 0;
		 }
	  if(Bat.Y > (WINDOW_HEIGHT - Bat.height))
		 {
			 Bat.Y = (WINDOW_HEIGHT - Bat.height);
		 }
}

void DozerConstraintCheck(SSprite &Dozer)
{
	  if(Dozer.X < 0)
		 {
			 Dozer.X = 0;
		 }
	  if(Dozer.X > (WINDOW_WIDTH - Dozer.width))
		 {
			 Dozer.X = (WINDOW_WIDTH - Dozer.width);
		 }
	  if(Dozer.Y < 0)
		 {
			 Dozer.Y = 0;
		 }
	  if(Dozer.Y > (WINDOW_HEIGHT - Dozer.height))
		 {
			 Dozer.Y = (WINDOW_HEIGHT - Dozer.height);
		 }
}

void BatCollisionCheck(SSprite &Bat, SSprite &Dozer)
{
	//==========Bulldozer's Left Side==========\\
	
	if((Bat.Y > Dozer.Y) && (Bat.Y < (Dozer.Y + (Dozer.height))))
	{
		if((Bat.X < (Dozer.X + Dozer.width)) && (Bat.X > Dozer.X))
		{
			Bat.X = Bat.pX;
		}
	}
	if(((Bat.Y + (.5 * Bat.height)) > Dozer.Y) && (((Bat.Y + (.5 * Bat.height))) < (Dozer.Y + (Dozer.height))))
	{
		if((Bat.X < (Dozer.X + Dozer.width)) && (Bat.X > Dozer.X))
		{
			Bat.X = Bat.pX;
		}
	}
	if(((Bat.Y + Bat.height) > Dozer.Y) && ((Bat.Y + Bat.height) < (Dozer.Y + (Dozer.height))))
	{
		if((Bat.X < (Dozer.X + Dozer.width)) && (Bat.X > Dozer.X))
		{
			Bat.X = Bat.pX;
		}
	}

	//==========Bulldozer's Right Side==========\\

	if((Bat.Y > Dozer.Y) && (Bat.Y < (Dozer.Y + (Dozer.height))))
	{
		if(((Bat.X + Bat.width) > Dozer.X) && ((Bat.X + Bat.width) < (Dozer.X + Dozer.width)))
		{
			Bat.X = Bat.pX;
		}
	}
	if(((Bat.Y + (.5 * Bat.height)) > Dozer.Y) && (((Bat.Y + (.5 * Bat.height))) < (Dozer.Y + (Dozer.height))))
	{
		if(((Bat.X + Bat.width) > Dozer.X) && ((Bat.X + Bat.width) < (Dozer.X + Dozer.width)))
		{
			Bat.X = Bat.pX;
		}
	}
	if(((Bat.Y + Bat.height) > Dozer.Y) && ((Bat.Y + Bat.height) < (Dozer.Y + (Dozer.height))))
	{
		if(((Bat.X + Bat.width) > Dozer.X) && ((Bat.X + Bat.width) < (Dozer.X + Dozer.width)))
		{
			Bat.X = Bat.pX;
		}
	}

	//==========Bulldozer's Top Side==========\\

	if((Bat.X > Dozer.X) && (Bat.X < (Dozer.X + (Dozer.width))))
	{
		if(((Bat.Y + Bat.height) > Dozer.Y) && ((Bat.Y + Bat.height) < (Dozer.Y + Dozer.height)))
		{
			Bat.Y = Bat.pY;
		}
	}
	if(((Bat.X + (.5 * Bat.width)) > Dozer.X) && (((Bat.X + (.5 * Bat.width))) < (Dozer.X + (Dozer.width))))
	{
		if(((Bat.Y + Bat.height) > Dozer.Y) && ((Bat.Y + Bat.height) < (Dozer.Y + Dozer.height)))
		{
			Bat.Y = Bat.pY;
		}
	}
	if(((Bat.X + Bat.width) > Dozer.X) && ((Bat.X + Bat.width) < (Dozer.X + (Dozer.width))))
	{
		if(((Bat.Y + Bat.height) > Dozer.Y) && ((Bat.Y + Bat.height) < (Dozer.Y + Dozer.height)))
		{
			Bat.Y = Bat.pY;
		}
	}

	//==========Bulldozer's Bottom Side==========\\

	if((Bat.X > Dozer.X) && (Bat.X < (Dozer.X + (Dozer.width))))
	{
		if((Bat.Y < (Dozer.Y + Dozer.height)) && (Bat.Y > Dozer.Y))
		{
			Bat.Y = Bat.pY;
		}
	}
	if(((Bat.X + (.5 * Bat.width)) > Dozer.X) && (((Bat.X + (.5 * Bat.width))) < (Dozer.X + (Dozer.width))))
	{
		if((Bat.Y < (Dozer.Y + Dozer.height)) && (Bat.Y > Dozer.Y))
		{
			Bat.Y = Bat.pY;
		}
	}
	if(((Bat.X + Bat.width) > Dozer.X) && ((Bat.X + Bat.width) < (Dozer.X + (Dozer.width))))
	{
		if((Bat.Y < (Dozer.Y + Dozer.height)) && (Bat.Y > Dozer.Y))
		{
			Bat.Y = Bat.pY;
		}
	}
}

void DozerCollisionCheck(SSprite &Bat, SSprite &Dozer)
{
	//==========Bat's Left Side==========\\
	
	if((Dozer.Y > Bat.Y) && (Dozer.Y < (Bat.Y + (Bat.height))))
	{
		if((Dozer.X < (Bat.X + Bat.width)) && (Dozer.X > Bat.X))
		{
			Dozer.X = Dozer.pX;
		}
	}
	if(((Dozer.Y + (.5 * Dozer.height)) > Bat.Y) && (((Dozer.Y + (.5 * Dozer.height))) < (Bat.Y + (Bat.height))))
	{
		if((Dozer.X < (Bat.X + Bat.width)) && (Dozer.X > Bat.X))
		{
			Dozer.X = Dozer.pX;
		}
	}
	if(((Dozer.Y + Dozer.height) > Bat.Y) && ((Dozer.Y + Dozer.height) < (Bat.Y + (Bat.height))))
	{
		if((Dozer.X < (Bat.X + Bat.width)) && (Dozer.X > Bat.X))
		{
			Dozer.X = Dozer.pX;
		}
	}

	//==========Bat's Right Side==========\\

	if((Dozer.Y > Bat.Y) && (Dozer.Y < (Bat.Y + (Bat.height))))
	{
		if(((Dozer.X + Dozer.width) > Bat.X) && ((Dozer.X + Dozer.width) < (Bat.X + Bat.width)))
		{
			Dozer.X = Dozer.pX;
		}
	}
	if(((Dozer.Y + (.5 * Dozer.height)) > Bat.Y) && (((Dozer.Y + (.5 * Dozer.height))) < (Bat.Y + (Bat.height))))
	{
		if(((Dozer.X + Dozer.width) > Bat.X) && ((Dozer.X + Dozer.width) < (Bat.X + Bat.width)))
		{
			Dozer.X = Dozer.pX;
		}
	}
	if(((Dozer.Y + Dozer.height) > Bat.Y) && ((Dozer.Y + Dozer.height) < (Bat.Y + (Bat.height))))
	{
		if(((Dozer.X + Dozer.width) > Bat.X) && ((Dozer.X + Dozer.width) < (Bat.X + Bat.width)))
		{
			Dozer.X = Dozer.pX;
		}
	}

	//==========Bat's Top Side==========\\

	if((Dozer.X > Bat.X) && (Dozer.X < (Bat.X + (Bat.width))))
	{
		if(((Dozer.Y + Dozer.height) > Bat.Y) && ((Dozer.Y + Dozer.height) < (Bat.Y + Bat.height)))
		{
			Dozer.Y = Dozer.pY;
		}
	}
	if(((Dozer.X + (.5 * Dozer.width)) > Bat.X) && (((Dozer.X + (.5 * Dozer.width))) < (Bat.X + (Bat.width))))
	{
		if(((Dozer.Y + Dozer.height) > Bat.Y) && ((Dozer.Y + Dozer.height) < (Bat.Y + Bat.height)))
		{
			Dozer.Y = Dozer.pY;
		}
	}
	if(((Dozer.X + Dozer.width) > Bat.X) && ((Dozer.X + Dozer.width) < (Bat.X + (Bat.width))))
	{
		if(((Dozer.Y + Dozer.height) > Bat.Y) && ((Dozer.Y + Dozer.height) < (Bat.Y + Bat.height)))
		{
			Dozer.Y = Dozer.pY;
		}
	}

	//==========Bat's Bottom Side==========\\

	if((Dozer.X > Bat.X) && (Dozer.X < (Bat.X + (Bat.width))))
	{
		if((Dozer.Y < (Bat.Y + Bat.height)) && (Dozer.Y > Bat.Y))
		{
			Dozer.Y = Dozer.pY;
		}
	}
	if(((Dozer.X + (.5 * Dozer.width)) > Bat.X) && (((Dozer.X + (.5 * Dozer.width))) < (Bat.X + (Bat.width))))
	{
		if((Dozer.Y < (Bat.Y + Bat.height)) && (Dozer.Y > Bat.Y))
		{
			Dozer.Y = Dozer.pY;
		}
	}
	if(((Dozer.X + Dozer.width) > Bat.X) && ((Dozer.X + Dozer.width) < (Bat.X + (Bat.width))))
	{
		if((Dozer.Y < (Bat.Y + Bat.height)) && (Dozer.Y > Bat.Y))
		{
			Dozer.Y = Dozer.pY;
		}
	}
}
