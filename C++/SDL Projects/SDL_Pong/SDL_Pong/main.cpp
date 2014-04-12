/* 
	Ben Oztalay 2008
*/

//==========Includes==========\\

#include "SDL_Pong.h"
#include <cstdlib>
#include <fstream>

using namespace std;

//===============================\\
//==========Global Data==========\\
//===============================\\

//Variables
SDL_Surface* screen = 0;
SDL_Surface* temp = 0;
int ScrChk = MENU;
int timer = 0;
bool started = false;
bool checked = false;
bool controls = false;
int PlayerScore = 0;
int ComputerScore = 0;
int Player2Score = 0;
int difficulty = 0;
fstream finout;
char* P1Wins;
char* P1Loses;
char* P2Wins;
char* P2Loses;
char* CWins;
char* CLoses;

//Sprite Declarations

SSprite PlayerPaddle = {337.5, 550.0, 400.0, 550.0, 0.0, 0.0, 0, 0, 125, 20};
SSprite ComputerPaddle = {337.5, 30.0, 400.0, 30.0, 0.0, 0.0, 0, 20, 125, 20};
SSprite Player2Paddle = {337.5, 30.0, 400.0, 30.0, 0.0, 0.0, 0, 20, 125, 20};
SSprite Ball = {390.0, 290.0, 400.0, 300.0, 0.0, 0.0, 125, 0, 20, 20};

//============================================================\\
//==========Prototype Declaration and Function Index==========\\
//============================================================\\

//State Functions
void Menu();
void TwoPGame();
void OnePGame();
void GameOver();
void Scoreboard();
void Controls();
void Difficulty();

//Input Functions
void HandleMenuInput();
void Handle2PGameInput();
void Handle1PGameInput();
void HandleGameOverInput();
void HandleSandCInput();
void HandleDifficultyInput();

//All things AI
void AICore();

//Init and Shutdown
void Init();
void Shutdown();

//Collision Detection and Ball Speed Manipulation
void CheckConstraints();
void CheckPaddleCollision();
void CheckWallCollision();
void BallspeedXManipulation(int PadCenter, int BallCenter);

//Scores and Winning
void CheckWin();
void Scored();
void DrawScores();

//File Reading and Writing
void GetScores();

//Miscellaneous Helper Functions
void ClearScreen();
void Reset();



//=================================\\
//==========Main Function==========\\
//=================================\\

int main(int argc, char **argv)
{	
   Init();
	GetScores();
   //Game Loop  
   while(gameRunning)
   {
	  if(ScrChk == MENU)
	  {
		  Menu();
	  }
	  if(ScrChk == TWOPGAME)
	  {
		  TwoPGame();
	  }
	  if(ScrChk == ONEPGAME)
	  {
		  OnePGame();
	  }
	  if(ScrChk == GAMEOVER)
	  {
		  GameOver();
	  }
	  if(ScrChk == SCOREBOARD)
	  {
		  Scoreboard();
	  }
	  if(ScrChk == CONTROLS)
	  {
		  Controls();
	  }
	  if(ScrChk == DIFFICULTY)
	  {
		  Difficulty();
	  }
   }	
   Shutdown();
   return 0;
}

//================================\\
//=========State Functions========\\
//================================\\

//Menu State Function
void Menu()
{
	if(SDL_GetTicks() - timer >= FRAME_RATE)
	{
		HandleMenuInput();

		SDL_Surface* temp = SDL_LoadBMP("menu.bmp");
		SDL_SetColorKey(temp, SDL_SRCCOLORKEY, SDL_MapRGB(temp->format, 255, 0, 255));

		//==========Drawing Screen==========\\

		ClearScreen();

		DrawSprite(temp, screen, 0, 0, ((WINDOW_WIDTH / 2) - (175 / 2)), 
			((WINDOW_HEIGHT / 2) - (415 / 2)), 175, 415);

		SDL_Flip(screen);
		
		timer = SDL_GetTicks();
	}
}

//Two Player Game State Function
void TwoPGame()
{
	ComputerScore = NOT_PLAYING;
	
	if(SDL_GetTicks() - timer >= FRAME_RATE)
	{
	  thisTime = SDL_GetTicks();
      deltaTime = (float)(thisTime - lastTime) / 1000;
      lastTime = thisTime;

	  Handle2PGameInput();
	  CheckPaddleCollision();
	  CheckConstraints();
	  CheckWallCollision ();

	  //==========Drawing the Screen==========\\

	  ClearScreen();

	  DrawSprite(Player2Paddle.Image, screen, Player2Paddle.imageX, Player2Paddle.imageY, 
				Player2Paddle.X, Player2Paddle.Y, Player2Paddle.width, Player2Paddle.height);
	  DrawSprite(PlayerPaddle.Image, screen, PlayerPaddle.imageX, PlayerPaddle.imageY, 
				PlayerPaddle.X, PlayerPaddle.Y, PlayerPaddle.width, PlayerPaddle.height);
	  DrawSprite(Ball.Image, screen, Ball.imageX, Ball.imageY, Ball.X, Ball.Y, Ball.width, Ball.height);

	  DrawScores();
	  
	  SDL_Flip(screen);

	  timer = SDL_GetTicks();
	}
}

//One Player Game State Function
void OnePGame()
{
	Player2Score = NOT_PLAYING;

	if(SDL_GetTicks() - timer >= FRAME_RATE)
	{
	  thisTime = SDL_GetTicks();
      deltaTime = (float)(thisTime - lastTime) / 1000;
      lastTime = thisTime;

	  Handle1PGameInput();
	  CheckPaddleCollision();
	  CheckConstraints();
	  CheckWallCollision ();

	  //==========Drawing the Screen==========\\

	  ClearScreen();

	  DrawSprite(ComputerPaddle.Image, screen, ComputerPaddle.imageX, ComputerPaddle.imageY, 
				ComputerPaddle.X, ComputerPaddle.Y, ComputerPaddle.width, ComputerPaddle.height);
	  DrawSprite(PlayerPaddle.Image, screen, PlayerPaddle.imageX, PlayerPaddle.imageY, 
				PlayerPaddle.X, PlayerPaddle.Y, PlayerPaddle.width, PlayerPaddle.height);
	  DrawSprite(Ball.Image, screen, Ball.imageX, Ball.imageY, Ball.X, Ball.Y, Ball.width, Ball.height);

	  DrawScores();
	  
	  SDL_Flip(screen);

	  timer = SDL_GetTicks();
	}

}

//Game Over State Function
void GameOver()
{
	if(SDL_GetTicks() - timer >= FRAME_RATE)
	{
		HandleGameOverInput();

		//===Draw Screen===//

		ClearScreen();
		
		if(PlayerScore == 5)
		{
			DrawText(screen, "Player 1 Won! Quit? Y/N", "Fixedsys500c.TTF",
					14, 300, 300, 0, 255, 0, 0, 0, 0, false, true);
		}
		if(Player2Score == 5)
		{
			DrawText(screen, "Player 2 Won! Quit? Y/N", "Fixedsys500c.TTF",
					14, 300, 300, 0, 255, 0, 0, 0, 0, false, true);
		}
		if(ComputerScore == 5)
		{
			DrawText(screen, "The Computer Won! Quit? Y/N", "Fixedsys500c.TTF", 
					14, 300, 300, 0, 255, 0, 0, 0, 0, false, true);
		}

		SDL_Flip(screen);

		timer = SDL_GetTicks();
	}
}

//Scoreboard State Function
void Scoreboard()
{
	if(SDL_GetTicks() - timer >= FRAME_RATE)
	{
		HandleSandCInput();

		SDL_Surface* temp = SDL_LoadBMP("scoreboard.bmp");
		SDL_SetColorKey(temp, SDL_SRCCOLORKEY, SDL_MapRGB(temp->format, 255, 0, 255));

		//==========Drawing Screen==========\\

		ClearScreen();

		DrawSprite(temp, screen, 0, 0, ((WINDOW_WIDTH / 2) - (550 / 2)), 
			((WINDOW_HEIGHT / 2) - (400 / 2)), 550, 400);

		SDL_Flip(screen);
		
		timer = SDL_GetTicks();
	}
}

//Controls State Function
void Controls()
{
	if(SDL_GetTicks() - timer >= FRAME_RATE)
	{
		HandleSandCInput();

		if(controls == false)
		{
			temp = SDL_LoadBMP("controls.bmp");
			controls = true;
		}

		SDL_SetColorKey(temp, SDL_SRCCOLORKEY, SDL_MapRGB(temp->format, 255, 0, 255));

		//==========Drawing Screen==========\\

		ClearScreen();

		DrawSprite(temp, screen, 0, 0, ((WINDOW_WIDTH / 2) - (550 / 2)), 
			((WINDOW_HEIGHT / 2) - (400 / 2)), 550, 400);

		SDL_Flip(screen);
		
		timer = SDL_GetTicks();
	}
}

//Difficulty State Function
void Difficulty()
{
	if(SDL_GetTicks() - timer >= FRAME_RATE)
	{
		HandleDifficultyInput();

		SDL_Surface* temp = SDL_LoadBMP("difficulty.bmp");
		SDL_SetColorKey(temp, SDL_SRCCOLORKEY, SDL_MapRGB(temp->format, 255, 0, 255));

		//==========Drawing Screen==========\\

		ClearScreen();

		DrawSprite(temp, screen, 0, 0, ((WINDOW_WIDTH / 2) - (175 / 2)), 
			((WINDOW_HEIGHT / 2) - (285 / 2)), 175, 285);

		SDL_Flip(screen);
		
		timer = SDL_GetTicks();
	}
}

//===================================\\
//==========Input Functions==========\\
//===================================\\

//Menu Input Function
void HandleMenuInput()
{
	if(SDL_PollEvent(&event))
    {
         if(event.type == SDL_QUIT)
         {
            gameRunning = false;
			return;
         }

		 if(event.key.keysym.sym == SDLK_ESCAPE)
		 {
			gameRunning = false;
			return;
		 }
		 //Controls
		 if(event.type == SDL_KEYUP)
		 {
			if(event.key.keysym.sym == SDLK_1)
			{
				 ScrChk = DIFFICULTY;
				return;
			}
		 }
		 if(event.key.keysym.sym == SDLK_2)
		 {
			 ScrChk = TWOPGAME;
			 return;
		 }
		 if(event.key.keysym.sym == SDLK_3)
		 {
			 ScrChk = SCOREBOARD;
			 return;
		 }
		 if(event.key.keysym.sym == SDLK_4)
		 {
			 ScrChk = CONTROLS;
			 return;
		 }
		 if(event.key.keysym.sym == SDLK_5)
		 {
			 gameRunning = false;
			 return;
		 }
	 }
}

//Two Player Game Input Function
void Handle2PGameInput()
{ 
      PlayerPaddle.pX = PlayerPaddle.X;
	  Player2Paddle.pX = Player2Paddle.X;
	  event.key.keysym.sym = SDLK_1;
	
	  //==========Event Type Checking==========\\
	  
	  if(SDL_PollEvent(&event))
      {
         if(event.type == SDL_QUIT)
         {
            gameRunning = false;
			return;
         }

		 if(event.type == SDL_KEYDOWN)
		 {
			KeysHeld[event.key.keysym.sym] = true;
		 }

		 if(event.type == SDL_KEYUP)
		 {
		    KeysHeld[event.key.keysym.sym] = false;
			Player2Paddle.speedX = 0;
			PlayerPaddle.speedX = 0;
		 }
	  }
	  
	  //==========Player 1 Controls==========\\
	  
	  if (event.key.keysym.sym == SDLK_ESCAPE)
      {
         gameRunning = false;
      }
	  if (event.key.keysym.sym == SDLK_q)
      {
         ScrChk = MENU;
      }
      if (KeysHeld[SDLK_LEFT])
      {
		  PlayerPaddle.speedX = -PADDLE_SPEED_X;
      }
      if (KeysHeld[SDLK_RIGHT])
      {
		  PlayerPaddle.speedX = PADDLE_SPEED_X;
      }
	  if (event.key.keysym.sym == SDLK_SPACE)
	  {
			if(started == false)
			{
				srand(SDL_GetTicks());
				Ball.speedX = (rand() % 100);
				int r = (rand() % 10);
				if(r < 6)
				{
					Ball.speedX = -Ball.speedX;
				}
				Ball.speedY = BALL_SPEED_Y;
				started = true;
			}
	  }
	  
	  //=====Player 2 Controls====\\
	
	  if (KeysHeld[SDLK_a])
      {
		  Player2Paddle.speedX = -PADDLE_SPEED_X;
      }
      if (KeysHeld[SDLK_d])
      {
		  Player2Paddle.speedX = PADDLE_SPEED_X;
      }

  
	  PlayerPaddle.X += PlayerPaddle.speedX * deltaTime;
	  Player2Paddle.X += Player2Paddle.speedX * deltaTime;
	  Ball.X += Ball.speedX * deltaTime;
	  Ball.Y += Ball.speedY * deltaTime;
}

//One Player Game Input Function
void Handle1PGameInput()
{ 
      PlayerPaddle.pX = PlayerPaddle.X;
	  ComputerPaddle.pX = ComputerPaddle.X;
	  event.key.keysym.sym = SDLK_1;
	
	  //==========Event Type Checking==========\\
	  
	  if(SDL_PollEvent(&event))
      {
         if(event.type == SDL_QUIT)
         {
            gameRunning = false;
			return;
         }

		 if(event.type == SDL_KEYDOWN)
		 {
			KeysHeld[event.key.keysym.sym] = true;
		 }

		 if(event.type == SDL_KEYUP)
		 {
		    KeysHeld[event.key.keysym.sym] = false;
			PlayerPaddle.speedX = 0;
		 }
	  }
	  
	  //==========Player 1 Controls==========\\
	  
	  if (event.key.keysym.sym == SDLK_ESCAPE)
      {
         gameRunning = false;
      }
	  if (event.key.keysym.sym == SDLK_q)
      {
         ScrChk = MENU;
      }
      if (KeysHeld[SDLK_LEFT])
      {
		  PlayerPaddle.speedX = -PADDLE_SPEED_X;
      }
      if (KeysHeld[SDLK_RIGHT])
      {
		  PlayerPaddle.speedX = PADDLE_SPEED_X;
      }
	  if (event.key.keysym.sym == SDLK_SPACE)
	  {
			if(started == false)
			{
				srand(SDL_GetTicks());
				Ball.speedX = (rand() % 100);
				int r = (rand() % 10);
				if(r < 6)
				{
					Ball.speedX = -Ball.speedX;
				}
				Ball.speedY = BALL_SPEED_Y;
				started = true;
			}
	  }

	  //Computer AI Function

   	  AICore();
  
	  PlayerPaddle.X += PlayerPaddle.speedX * deltaTime;
	  ComputerPaddle.X += ComputerPaddle.speedX * deltaTime;
	  Ball.X += Ball.speedX * deltaTime;
   	  Ball.Y += Ball.speedY * deltaTime;
}

//Game Over Input Function
void HandleGameOverInput()
{
	if(SDL_PollEvent(&event))
      {
         if(event.type == SDL_QUIT)
         {
            gameRunning = false;
			return;
         }

		 if(event.key.keysym.sym == SDLK_ESCAPE)
		 {
			 gameRunning = false;
			 return;
		 }
		 if(event.key.keysym.sym == SDLK_n)
		 {
			 Reset();
			 ScrChk = MENU;
			 return;
		 }
		 if(event.key.keysym.sym == SDLK_y)
		 {
			 gameRunning = false;
			 return;
		 }
	}
}

//Scoreboard and Controls Input Function
void HandleSandCInput()
{
	if(SDL_PollEvent(&event))
      {
         if(event.type == SDL_QUIT)
         {
            gameRunning = false;
			return;
         }	
		 if(event.key.keysym.sym == SDLK_ESCAPE)
		 {
			 gameRunning = false;
			 return;
		 }
		 if(event.type == SDL_KEYUP)
		 {
			if(event.key.keysym.sym == SDLK_1)
			{
				 ScrChk = MENU;
				 controls = false;
				 return;
			}
		 }
		 if(ScrChk == CONTROLS)
		 {
			 if(event.key.keysym.sym == SDLK_LEFT)
			 {
				 temp = SDL_LoadBMP("controls.bmp");
			 }
			 if(event.key.keysym.sym == SDLK_RIGHT)
			 {
				 temp = SDL_LoadBMP("controls2.bmp");
			 }
		 }
	}
}

//Difficulty Input Function
void HandleDifficultyInput()
{
	if(SDL_PollEvent(&event))
      {
         if(event.type == SDL_QUIT)
         {
            gameRunning = false;
			return;
         }	
		 if(event.key.keysym.sym == SDLK_ESCAPE)
		 {
			 gameRunning = false;
			 return;
		 }
		 if(event.key.keysym.sym == SDLK_1)
		 {
			 ScrChk = ONEPGAME;
			 difficulty = EASIER;
			 return;
		 }
		 if(event.key.keysym.sym == SDLK_2)
		 {
			 ScrChk = ONEPGAME;
			 difficulty = HARDER;
			 return;
		 }
		 if(event.type == SDL_KEYUP)
		 {
			if(event.key.keysym.sym == SDLK_3)
			{
				 ScrChk = MENU;
				 return;
			}
		 }
	}
}

//=================================\\
//==========All Things AI==========\\
//=================================\\

//AI's Core Function
void AICore()
{
	if (Ball.X > (ComputerPaddle.X + ComputerPaddle.width - 15))
	{
		ComputerPaddle.speedX = PADDLE_SPEED_X;
	}
	if((Ball.X + Ball.width) < (ComputerPaddle.X + 15))
	{
		ComputerPaddle.speedX = -PADDLE_SPEED_X;
	}
	if ((Ball.X > (ComputerPaddle.X + 45)) && ((Ball.X + Ball.width) < (ComputerPaddle.X + (ComputerPaddle.width - 45))))
	{
		ComputerPaddle.speedX = 0;
	}
	
	//Anticipation Algorithms
	if(difficulty == HARDER)
	{
		checked = false;
		if(((Ball.X + Ball.width) > (WINDOW_WIDTH - 200)) && (Ball.speedY > 0)
			&& (PlayerPaddle.X > (WINDOW_WIDTH - (PlayerPaddle.width * 2))))
		{
			ComputerPaddle.speedX = -PADDLE_SPEED_X;
			if(ComputerPaddle.X < (WINDOW_WIDTH - 300))
			{
				ComputerPaddle.speedX = 0;
			}
			checked = true;
		}
		if(checked == true)
		{
			if((Ball.speedY < 0) && (Ball.speedX < -60) 
				&& ((Ball.X + Ball.width) > (WINDOW_WIDTH - 200))
				&& (PlayerPaddle.X > (WINDOW_WIDTH - (PlayerPaddle.width * 2))))
			{
				ComputerPaddle.speedX = 0;
			}
		}
	
		if((Ball.X < 200) && (Ball.speedY > 0)
			&& (PlayerPaddle.X < PlayerPaddle.width))
		{
			ComputerPaddle.speedX = PADDLE_SPEED_X;
			if(ComputerPaddle.X < (WINDOW_WIDTH + 300))
			{
				ComputerPaddle.speedX = 0;
			}
			checked = true;
		}
		
		if(checked == true)
		{
			if((Ball.speedY < 0) && (Ball.speedX > 60) 
				&& (Ball.X < 200)
				&& (PlayerPaddle.X < PlayerPaddle.width))
			{
				ComputerPaddle.speedX = 0;
			}
		}
	}
}

//==============================================\\
//==========Init and Shutdown Functions=========\\
//==============================================\\

//Initiate SDL and Everything Else
void Init()
{
   TTF_Init();
   SDL_Init(SDL_INIT_VIDEO | SDL_INIT_TIMER);

   screen = SDL_SetVideoMode( WINDOW_WIDTH, WINDOW_HEIGHT, 0, SDL_HWSURFACE | SDL_DOUBLEBUF );
   SDL_WM_SetCaption( WINDOW_TITLE, 0 );

   timer = SDL_GetTicks();

   SDL_Surface* PlayerPaddleImage = SDL_LoadBMP("PaddlesBall.bmp");
   SDL_Surface* ComputerPaddleImage = SDL_LoadBMP("PaddlesBall.bmp");
   SDL_Surface* BallImage = SDL_LoadBMP("PaddlesBall.bmp");
   SDL_Surface* Player2PaddleImage = SDL_LoadBMP("PaddlesBall.bmp");
   
   PlayerPaddle.Image = PlayerPaddleImage;
   ComputerPaddle.Image = ComputerPaddleImage;
   Player2Paddle.Image = Player2PaddleImage;
   Ball.Image = BallImage;

   SDL_SetColorKey(PlayerPaddle.Image, SDL_SRCCOLORKEY, SDL_MapRGB(PlayerPaddle.Image->format, 255, 0, 255));
   SDL_SetColorKey(ComputerPaddle.Image, SDL_SRCCOLORKEY, SDL_MapRGB(ComputerPaddle.Image->format, 255, 0, 255));
   SDL_SetColorKey(Ball.Image, SDL_SRCCOLORKEY, SDL_MapRGB(Ball.Image->format, 255, 0, 255));
   SDL_SetColorKey(Player2Paddle.Image, SDL_SRCCOLORKEY, SDL_MapRGB(PlayerPaddle.Image->format, 255, 0, 255));
}

//Shut Down SDL and Everything Else
void Shutdown()
{
	TTF_Quit();

	SDL_FreeSurface(screen);
	SDL_FreeSurface(PlayerPaddle.Image);
	SDL_FreeSurface(Player2Paddle.Image);
	SDL_FreeSurface(ComputerPaddle.Image);
	SDL_FreeSurface(Ball.Image);

	SDL_Quit();
}

//===================================================================\\
//==========Collision Detection and Ball Speed Manipulation==========\\
//===================================================================\\

//Detects and Responds to Ball-Wall Collisions
void CheckWallCollision()
{
	if(Ball.X < 0)
	{
		Ball.speedX = -Ball.speedX;
	}
	if((Ball.X + Ball.width) > WINDOW_WIDTH)
	{
		Ball.speedX = -Ball.speedX;
	}
	if(Ball.Y < 0)
	{
		Scored();
	}
	if(ComputerScore == NOT_PLAYING)
	{
		if(Ball.Y > WINDOW_HEIGHT)
		{
			Scored();
		}
	}
	if(Player2Score == NOT_PLAYING)
	{
		if(Ball.Y > WINDOW_HEIGHT)
		{
			Scored();
		}
	}
}

//Keeps the Paddles on Screen
void CheckConstraints()
{
	if(PlayerPaddle.X > (WINDOW_WIDTH - PlayerPaddle.width))
	{
		PlayerPaddle.X = PlayerPaddle.pX;
	}
	if(PlayerPaddle.X < 0)
	{
		PlayerPaddle.X = PlayerPaddle.pX;
	}
	if(Player2Paddle.X > (WINDOW_WIDTH - Player2Paddle.width))
	{
		Player2Paddle.X = Player2Paddle.pX;
	}
	if(Player2Paddle.X < 0)
	{
		Player2Paddle.X = Player2Paddle.pX;
	}
	if(ComputerPaddle.X > (WINDOW_WIDTH - ComputerPaddle.width))
	{
		ComputerPaddle.X = ComputerPaddle.pX;
	}
	if(ComputerPaddle.X < 0)
	{
		ComputerPaddle.X = ComputerPaddle.pX;
	}
}

//Detects and Responds to Ball-Paddle Collisions
void CheckPaddleCollision()
{
	int BallCenterX = Ball.X + (Ball.width / 2);
	int PaddleCenter = PlayerPaddle.X + (PlayerPaddle.width / 2);
	int Paddle2Center = Player2Paddle.X + (Player2Paddle.width / 2);
	int ComputerCenter = ComputerPaddle.X + (ComputerPaddle.width / 2);
	
	//Side collisions
	if((Ball.Y > PlayerPaddle.Y) && ((Ball.Y + Ball.height) < (PlayerPaddle.Y + PlayerPaddle.height)))
	{
		if((Ball.X + Ball.width) > PlayerPaddle.X)
		{
			Ball.X = (PlayerPaddle.X - Ball.width - 1);
			Ball.speedX = -Ball.speedX;
		}
		if(Ball.X < (PlayerPaddle.X + PlayerPaddle.width))
		{
			Ball.X = (PlayerPaddle.X + PlayerPaddle.width + 1);
			Ball.speedX = -Ball.speedX;
		}
	}
	if((Ball.Y > Player2Paddle.Y) && ((Ball.Y + Ball.height) < (Player2Paddle.Y + Player2Paddle.height)))
	{
		if((Ball.X + Ball.width) > Player2Paddle.X)
		{
			Ball.X = (Player2Paddle.X - Ball.width - 1);
			Ball.speedX = -Ball.speedX;
		}
		if(Ball.X < (Player2Paddle.X + Player2Paddle.width))
		{
			Ball.X = (Player2Paddle.X + Player2Paddle.width + 1);
			Ball.speedX = -Ball.speedX;
		}
	}
	if((Ball.Y > ComputerPaddle.Y) && ((Ball.Y + Ball.height) < (ComputerPaddle.Y + ComputerPaddle.height)))
	{
		if((Ball.X + Ball.width) > ComputerPaddle.X)
		{
			Ball.X = (ComputerPaddle.X - Ball.width - 1);
			Ball.speedX = -Ball.speedX;
		}
		if(Ball.X < (ComputerPaddle.X + ComputerPaddle.width))
		{
			Ball.X = (ComputerPaddle.X + ComputerPaddle.width + 1);
			Ball.speedX = -Ball.speedX;
		}
	}

	//Head-on collisions
	if((BallCenterX > PlayerPaddle.X) && (BallCenterX < (PlayerPaddle.X + PlayerPaddle.width)))
	{
		if((Ball.Y + Ball.height) > PlayerPaddle.Y)
		{
			Ball.Y = (PlayerPaddle.Y - Ball.height);
			Ball.speedY = -Ball.speedY;
			BallspeedXManipulation(PaddleCenter, BallCenterX);
		}
	}
	if((BallCenterX > Player2Paddle.X) && (BallCenterX < (Player2Paddle.X + Player2Paddle.width)))
	{
		if((Ball.Y < (Player2Paddle.Y + Player2Paddle.height)))
		{
			Ball.Y = (Player2Paddle.Y + Player2Paddle.height);
			Ball.speedY = -Ball.speedY;
			BallspeedXManipulation(Paddle2Center, BallCenterX);
		}
	}
	if((BallCenterX > ComputerPaddle.X) && (BallCenterX < (ComputerPaddle.X + ComputerPaddle.width)))
	{
		if(Ball.Y < (ComputerPaddle.Y + ComputerPaddle.height))
		{
			Ball.Y = (ComputerPaddle.Y + ComputerPaddle.height);
			Ball.speedY = -Ball.speedY;
			BallspeedXManipulation(ComputerCenter, BallCenterX);
		}
	}

}

//Manipulates the Ball's speedX Accordingly After a Ball-Paddle Collision
void BallspeedXManipulation(int PadCenter, int BallCenter)
{
	if(Ball.speedX > 0)
	{
		Ball.speedX = Ball.speedX + (BallCenter - PadCenter);
	}
	if(Ball.speedX < 0)
	{
		Ball.speedX = Ball.speedX + (BallCenter - PadCenter);
	}
	if(Ball.speedX == 0)
	{
		Ball.speedX = BallCenter - PadCenter;
	}
	if(PlayerPaddle.speedX > 0)
	{
		Ball.speedX = Ball.speedX + 30;
	}
	if(PlayerPaddle.speedX < 0)
	{
		Ball.speedX = Ball.speedX - 20;
	}
	if(Ball.speedX > 200)
	{
		Ball.speedX = 200;
	}
}

//======================================\\
//==========Scores and Winning==========\\
//======================================\\

//Checks to see if Anyone Won
void CheckWin()
{
	if(PlayerScore == 5)
	{
		ScrChk = GAMEOVER;
		return;
	}
	if(Player2Score == 5)
	{
		ScrChk = GAMEOVER;
		return;
	}
	if(ComputerScore == 5)
	{
		ScrChk = GAMEOVER;
		return;
	}
}

//Resets the Ball and Gives a Point to the Appropriate Player
void Scored()
{
	if(Ball.Y < 0)
	{
		PlayerScore = PlayerScore + 1;
	}
	if((Ball.Y > WINDOW_HEIGHT) && (ComputerScore == NOT_PLAYING))
	{
		Player2Score = Player2Score + 1;
	}
	if((Ball.Y > WINDOW_HEIGHT) && (Player2Score == NOT_PLAYING))
	{
		ComputerScore = ComputerScore + 1;
	}		
	Ball.X = 390.0;
	Ball.Y = 290.0;
	Ball.speedX = 0.0;
	Ball.speedY = 0.0;
	started = false;
	CheckWin();
}

//Draws the Current Scores to the Screen
void DrawScores()
{
	if(PlayerScore == 0)
	{
		DrawText(screen, "Player 1 Score: 0", "Fixedsys500c.TTF", 14, 0, 0, 0, 255, 0, 0, 0, 0, false, true);
	}
	if(PlayerScore == 1)
	{
		DrawText(screen, "Player 1 Score: 1", "Fixedsys500c.TTF", 14, 0, 0, 0, 255, 0, 0, 0, 0, false, true);
	}
	if(PlayerScore == 2)
	{
		DrawText(screen, "Player 1 Score: 2", "Fixedsys500c.TTF", 14, 0, 0, 0, 255, 0, 0, 0, 0, false, true);
	}
	if(PlayerScore == 3)
	{
		DrawText(screen, "Player 1 Score: 3", "Fixedsys500c.TTF", 14, 0, 0, 0, 255, 0, 0, 0, 0, false, true);
	}
	if(PlayerScore == 4)
	{
		DrawText(screen, "Player 1 Score: 4", "Fixedsys500c.TTF", 14, 0, 0, 0, 255, 0, 0, 0, 0, false, true);
	}
	if(PlayerScore == 5)
	{
		DrawText(screen, "Player 1 Score: 5", "Fixedsys500c.TTF", 14, 0, 0, 0, 255, 0, 0, 0, 0, false, true);
	}

	if(Player2Score != NOT_PLAYING)
	{
		if(Player2Score == 0)
		{
			DrawText(screen, "Player 2 Score: 0", "Fixedsys500c.TTF", 14, 150, 0, 0, 255, 0, 0, 0, 0, false, true);
		}	
		if(Player2Score == 1)
		{
			DrawText(screen, "Player 2 Score: 1", "Fixedsys500c.TTF", 14, 150, 0, 0, 255, 0, 0, 0, 0, false, true);
		}
		if(Player2Score == 2)
		{
			DrawText(screen, "Player 2 Score: 2", "Fixedsys500c.TTF", 14, 150, 0, 0, 255, 0, 0, 0, 0, false, true);
		}
		if(Player2Score == 3)
		{
			DrawText(screen, "Player 2 Score: 3", "Fixedsys500c.TTF", 14, 150, 0, 0, 255, 0, 0, 0, 0, false, true);
		}
		if(Player2Score == 4)
		{
			DrawText(screen, "Player 2 Score: 4", "Fixedsys500c.TTF", 14, 150, 0, 0, 255, 0, 0, 0, 0, false, true);
		}
		if(Player2Score == 5)
		{
			DrawText(screen, "Player 2 Score: 5", "Fixedsys500c.TTF", 14, 150, 0, 0, 255, 0, 0, 0, 0, false, true);
		}
	}
	if(ComputerScore != NOT_PLAYING)
	{
		if(ComputerScore == 0)
		{
			DrawText(screen, "Computer Score: 0", "Fixedsys500c.TTF", 14, 150, 0, 0, 255, 0, 0, 0, 0, false, true);
		}	
		if(ComputerScore == 1)
		{
			DrawText(screen, "Computer Score: 1", "Fixedsys500c.TTF", 14, 150, 0, 0, 255, 0, 0, 0, 0, false, true);
		}
		if(ComputerScore == 2)
		{
			DrawText(screen, "Computer Score: 2", "Fixedsys500c.TTF", 14, 150, 0, 0, 255, 0, 0, 0, 0, false, true);
		}
		if(ComputerScore == 3)
		{
			DrawText(screen, "Computer Score: 3", "Fixedsys500c.TTF", 14, 150, 0, 0, 255, 0, 0, 0, 0, false, true);
		}
		if(ComputerScore == 4)
		{
			DrawText(screen, "Computer Score: 4", "Fixedsys500c.TTF", 14, 150, 0, 0, 255, 0, 0, 0, 0, false, true);
		}
		if(ComputerScore == 5)
		{
			DrawText(screen, "Computer Score: 5", "Fixedsys500c.TTF", 14, 150, 0, 0, 255, 0, 0, 0, 0, false, true);
		}
	}
}

//============================================\\
//==========File Reading and Writing==========\\
//============================================\\

void GetScores()
{
	finout.open("scoreboard.txt", ios::ate);
	finout.seekp(ios::beg, 0);
	finout << "1";
	finout.close();
}

//==================================================\\
//==========Miscellaneous Helper Functions==========\\
//==================================================\\

//Clears the Screen
void ClearScreen()
{
	SDL_FillRect(screen, NULL, SDL_MapRGB(screen->format, 0, 0, 0));
}

//Resets Global Values for the Next Game
void Reset()
{
	timer = 0;
	started = false;
	PlayerScore = 0;
	ComputerScore = 0;
	Player2Score = 0;

	SDL_Delay(500);

	PlayerPaddle.X = 337.5;
	PlayerPaddle.Y = 550.0;
	PlayerPaddle.pX = 400.0;
	PlayerPaddle.pY = 550.0;
	PlayerPaddle.speedX = 0.0;
	PlayerPaddle.speedY = 0.0;
	PlayerPaddle.imageX = 0;
	PlayerPaddle.imageY = 0;
	PlayerPaddle.width = 125;
	PlayerPaddle.height = 20;

	ComputerPaddle.X = 337.5;
	ComputerPaddle.Y = 30.0;
	ComputerPaddle.pX = 400.0;
	ComputerPaddle.pY = 30.0;
	ComputerPaddle.speedX = 0.0;
	ComputerPaddle.speedY = 0.0;
	ComputerPaddle.imageX = 0;
	ComputerPaddle.imageY = 20;
	ComputerPaddle.width = 125;
	ComputerPaddle.height = 20;

	Player2Paddle.X = 337.5;
	Player2Paddle.Y = 30.0;
	Player2Paddle.pX = 400.0;
	Player2Paddle.pY = 30.0;
	Player2Paddle.speedX = 0.0;
	Player2Paddle.speedY = 0.0;
	Player2Paddle.imageX = 0;
	Player2Paddle.imageY = 20;
	Player2Paddle.width = 125;
	Player2Paddle.height = 20;

	Ball.X = 390.0;
	Ball.Y = 290.0;
	Ball.pX = 390.0;
	Ball.pY = 290.0;
	Ball.speedX = 0.0;
	Ball.speedY = 0.0;
	Ball.imageX = 125;
	Ball.imageY = 0;
	Ball.width = 20;
	Ball.height = 20;
}