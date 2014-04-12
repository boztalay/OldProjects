// Ben Oztalay

#include "SDL.h"
#include "SDL_TTF.h"

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
}

void DrawText(SDL_Surface* screen, char* string, char* fontname, int size, int x, int y,
			  int fR, int fG, int fB, int bR, int bG, int bB, bool transf, bool transb)
{
   TTF_Font* font = TTF_OpenFont(fontname, size);

   SDL_Color foregroundColor = { fR, fG, fB };
   SDL_Color backgroundColor = { bR, bG, bB };

   SDL_Surface* textSurface = TTF_RenderText_Shaded(font, string,
      foregroundColor, backgroundColor);
   if(transf)
   {
	   SDL_SetColorKey(textSurface, SDL_SRCCOLORKEY, SDL_MapRGB(textSurface->format, fR, fG, fB));
   }
   if(transb)
   {
	   SDL_SetColorKey(textSurface, SDL_SRCCOLORKEY, SDL_MapRGB(textSurface->format, bR, bG, bB));
   }

   SDL_Rect textLocation = { x, y, 0, 0 };

   SDL_BlitSurface(textSurface, NULL, screen, &textLocation);

   SDL_FreeSurface(textSurface);

   TTF_CloseFont(font);
}