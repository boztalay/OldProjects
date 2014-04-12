/* 
	Ben Oztalay
	
	Some credit given to Aaron Cox 
	for the main structure of things
*/

//==========Includes==========\\
//====SDL_Func.h is Custom====\\

#include "MovementTesting.h"

int main(int argc, char **argv)
{
   //==========Filling Sprite Structs==========\\

	SSprite Bat;
	Bat.X = 200.0;
	Bat.Y = 100.0;
	Bat.pX = 0.0;
	Bat.pY = 0.0;
	Bat.speedX = 0.0;
	Bat.speedY = 0.0;
	Bat.imageX = 24;
	Bat.imageY = 63;
	Bat.width = 65;
	Bat.height = 44;

	SSprite Dozer;
	Dozer.X = 100.0;
	Dozer.Y = 100.0;
	Dozer.pX = 0.0;
	Dozer.pY = 0.0;
	Dozer.speedX = 0.0;
	Dozer.speedY = 0.0;
	Dozer.imageX = 0;
	Dozer.imageY = 0;
	Dozer.width = 48;
	Dozer.height = 38;
	
   //==========Initiation and Surface Creation==========\\
   
   TTF_Init();
   SDL_Init(SDL_INIT_VIDEO | SDL_INIT_TIMER);

   SDL_Surface* screen = SDL_SetVideoMode( WINDOW_WIDTH, WINDOW_HEIGHT, 0, SDL_HWSURFACE | SDL_DOUBLEBUF );
   SDL_WM_SetCaption( WINDOW_TITLE, 0 );

   SDL_Surface* BatImage = SDL_LoadBMP("bat.bmp");
   SDL_Surface* DozerImage = SDL_LoadBMP("dozer.bmp");
   
   Bat.Image = BatImage;
   Dozer.Image = DozerImage;

   SDL_SetColorKey(Bat.Image, SDL_SRCCOLORKEY, SDL_MapRGB(Bat.Image->format, 255, 0, 255));
   SDL_SetColorKey(Dozer.Image, SDL_SRCCOLORKEY, SDL_MapRGB(Dozer.Image->format, 255, 0, 255));

   //==========Game Loop==========\\
   
   while(gameRunning)
   {
	  thisTime = SDL_GetTicks();
      deltaTime = (float)(thisTime - lastTime) / 1000;
      lastTime = thisTime; 

      //==========Event Type Checking==========\\
	  
	  if(SDL_PollEvent(&event))
      {
         if(event.type == SDL_QUIT)
         {
            gameRunning = false;
         }

		 if(event.type == SDL_KEYDOWN)
		 {
			KeysHeld[event.key.keysym.sym] = true;
		 }

		 if(event.type == SDL_KEYUP)
		 {
		    KeysHeld[event.key.keysym.sym] = false;
			Bat.speedX = 0;
			Bat.speedY = 0;
			Dozer.speedX = 0;
			Dozer.speedY = 0;
		 }
	  }
	  
	  //==========Bat Controls==========\\
	  
	  if (KeysHeld[SDLK_ESCAPE])
      {
         gameRunning = false;
      }
      if (KeysHeld[SDLK_LEFT])
      {
		  Bat.speedX = -BAT_SPEED_X;
      }
      if (KeysHeld[SDLK_RIGHT])
      {
		  Bat.speedX = BAT_SPEED_X;
      }
      if (KeysHeld[SDLK_UP])
      {
		  Bat.speedY = -BAT_SPEED_Y;
      }
      if (KeysHeld[SDLK_DOWN])
      {
		  Bat.speedY = BAT_SPEED_Y;
      } 

	  //==========Bulldozer Controls==========\\

	  if (KeysHeld[SDLK_a])
      {
		  Dozer.speedX = -DOZER_SPEED_X;
      }
      if (KeysHeld[SDLK_d])
      {
		  Dozer.speedX = DOZER_SPEED_X;
      }
      if (KeysHeld[SDLK_w])
      {
		  Dozer.speedY = -DOZER_SPEED_Y;
      }
      if (KeysHeld[SDLK_s])
      {
		  Dozer.speedY = DOZER_SPEED_Y;
      }

	  Bat.pX = Bat.X;
	  Bat.pY = Bat.Y;
	  Dozer.pX = Dozer.X;
	  Dozer.pY = Dozer.Y;
	  
	  Bat.X += Bat.speedX * deltaTime;
      Bat.Y += Bat.speedY * deltaTime;
	  Dozer.X += Dozer.speedX * deltaTime;
      Dozer.Y += Dozer.speedY * deltaTime;
	  
	  //==========Wall Constraint Checks==========\\

	  BatConstraintCheck(Bat);	  
	  DozerConstraintCheck(Dozer);

      //==========Collision Checks==========\\

	  BatCollisionCheck(Bat, Dozer);
	  DozerCollisionCheck(Bat, Dozer);

	  //==========Drawing the Screen==========\\

	  SDL_FillRect(screen, NULL, SDL_MapRGB(screen->format, 0, 0, 0));

	  DrawSprite(Dozer.Image, screen, 0, 0, Dozer.X, Dozer.Y, Dozer.width, Dozer.height);
	  DrawSprite(Bat.Image, screen, 24, 63, Bat.X, Bat.Y, Bat.width, Bat.height);
	  
	  DrawText(screen, "Bat Speed X: 150 p/s", 12, 0, (WINDOW_HEIGHT - 60), 255, 255, 255, 0, 0, 0, false, true);
	  DrawText(screen, "Bat Speed Y: 50 p/s", 12, 0, (WINDOW_HEIGHT - 45), 255, 255, 255, 0, 0, 0, false, true);
	  DrawText(screen, "Bulldozer Speed X: 20 p/s", 12, 0, (WINDOW_HEIGHT - 30), 255, 255, 255, 0, 0, 0, false, true);
	  DrawText(screen, "Bulldozer Speed Y: 20 p/s", 12, 0, (WINDOW_HEIGHT - 15), 255, 255, 255, 0, 0, 0, false, true);
	  
	  SDL_Flip(screen);
   }
	
   //==========End of Program==========\\

   TTF_Quit();
   SDL_Quit();

   return 0;
}