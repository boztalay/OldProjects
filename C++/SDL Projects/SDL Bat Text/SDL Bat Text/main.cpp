#include "SDL.h"
#include "SDL_TTF.h"
#include <windows.h>

const int WINDOW_WIDTH = 640;
const int WINDOW_HEIGHT = 480;
const char* WINDOW_TITLE = "Flying Bat with Text";
int sleep = 100;

void DrawSprite(SDL_Surface* imageSurface, SDL_Surface* screenSurface,
				int srcX, int srcY, int dstX, int dstY, int width, int height);

void drawText(SDL_Surface* screen, char* string, int size, int x, int y,
              int fR, int fG, int fB, int bR, int bG, int bB);

int main(int argc, char **argv)
{
   SDL_Init( SDL_INIT_VIDEO );

   TTF_Init();

   SDL_Surface* screen = SDL_SetVideoMode( WINDOW_WIDTH, WINDOW_HEIGHT, 0,
      SDL_HWSURFACE | SDL_DOUBLEBUF );
   SDL_WM_SetCaption( WINDOW_TITLE, 0 );

   SDL_Surface* bitmap = SDL_LoadBMP("bat.bmp");
   SDL_SetColorKey( bitmap, SDL_SRCCOLORKEY, SDL_MapRGB(bitmap->format, 255, 0, 255) );

   SDL_Event event;
   bool gameRunning = true;

   while (gameRunning)
   {
      if (SDL_PollEvent(&event))
      {
         if (event.type == SDL_QUIT)
         {
            gameRunning = false;
         }
      }
	  SDL_FillRect(screen, NULL,  SDL_MapRGB(screen->format, 0, 0, 0));
	  drawText(screen, "A flying bat!", 18, 200, 155, 255, 255, 255, 0, 0, 0);
	  DrawSprite(bitmap, screen, 24, 63, 100, 100, 65, 44);
	  Sleep(sleep);
	  SDL_FillRect(screen, NULL,  SDL_MapRGB(screen->format, 0, 0, 0));
	  drawText(screen, "a FLying bat!", 18, 200, 155, 255, 255, 255, 0, 0, 0);
	  DrawSprite(bitmap, screen, 156, 63, 100, 100, 65, 44);
	  Sleep(sleep);
	  SDL_FillRect(screen, NULL,  SDL_MapRGB(screen->format, 0, 0, 0));
	  drawText(screen, "a flYIng bat!", 18, 200, 155, 255, 255, 255, 0, 0, 0);
	  DrawSprite(bitmap, screen, 288, 63, 100, 100, 65, 44);
	  Sleep(sleep);
	  SDL_FillRect(screen, NULL,  SDL_MapRGB(screen->format, 0, 0, 0));
	  drawText(screen, "a flyiNG bat!", 18, 200, 155, 255, 255, 255, 0, 0, 0);
	  DrawSprite(bitmap, screen, 419, 63, 100, 100, 65, 44);
	  Sleep(sleep);
	  SDL_FillRect(screen, NULL,  SDL_MapRGB(screen->format, 0, 0, 0));
	  drawText(screen, "a flying Bat!", 18, 200, 155, 255, 255, 255, 0, 0, 0);
	  DrawSprite(bitmap, screen, 23, 202, 100, 100, 65, 44);
	  Sleep(sleep);
	  SDL_FillRect(screen, NULL,  SDL_MapRGB(screen->format, 0, 0, 0));
	  drawText(screen, "a flying bAt!", 18, 200, 155, 255, 255, 255, 0, 0, 0);
	  DrawSprite(bitmap, screen, 419, 63, 100, 100, 65, 44);
	  Sleep(sleep);
	  SDL_FillRect(screen, NULL,  SDL_MapRGB(screen->format, 0, 0, 0));
	  drawText(screen, "a flying baT!", 18, 200, 155, 255, 255, 255, 0, 0, 0);
	  DrawSprite(bitmap, screen, 288, 63, 100, 100, 65, 44);
	  Sleep(sleep);
   }

   SDL_FreeSurface(bitmap);

   TTF_Quit();
   SDL_Quit();

   return 0;
}

void DrawSprite(SDL_Surface* imageSurface, SDL_Surface* screenSurface,
				int srcX, int srcY, int dstX, int dstY, int width, int height)
{
	SDL_Rect srcRect;
	srcRect.x = srcX;
	srcRect.y = srcY;
	srcRect.w = width;
	srcRect.h = height;

	SDL_Rect dstRect;
	dstRect.x = dstX;
	dstRect.y = dstY;
	dstRect.w = width;
	dstRect.h = height;

	SDL_BlitSurface(imageSurface, &srcRect, screenSurface, &dstRect);
    SDL_Flip(screenSurface);
}

void drawText(SDL_Surface* screen,
              char* string,
              int size,
              int x, int y,
              int fR, int fG, int fB,
              int bR, int bG, int bB)
{
   TTF_Font* font = TTF_OpenFont("ARIAL.TTF", size);

   SDL_Color foregroundColor = { fR, fG, fB };
   SDL_Color backgroundColor = { bR, bG, bB };

   SDL_Surface* textSurface = TTF_RenderText_Shaded(font, string,
      foregroundColor, backgroundColor);

   SDL_Rect textLocation = { x, y, 0, 0 };

   SDL_BlitSurface(textSurface, NULL, screen, &textLocation);

   SDL_FreeSurface(textSurface);

   TTF_CloseFont(font);
}