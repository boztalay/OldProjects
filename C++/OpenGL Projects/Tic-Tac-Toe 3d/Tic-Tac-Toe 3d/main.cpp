/*  3D Tic-Tac-Toe
	
	Authors: Austin Mueller, Ben Oztalay
	
	Austin Mueller: Concept, bulk of program logic, original Java coding
	Ben Oztalay: Port from Java to C++, 3D display, user interface
	
	Copyright 2009
*/

#include <windows.h>
#include <gltools.h>
#include <math.h>
#include <iostream>

using namespace std;

//-------Begin--------//
//--Global Variables--//
//-------Begin--------//

static GLfloat yRot = 0.0f;
static GLfloat xRot = 0.0f;

//Board Array
int board[3][3][3] = { { {-1, -1, -1},
                         {-1, -1, -1},
                         {-1, -1, -1} },

					   { {-1, -1, -1},
                         {-1, -1, -1},
                         {-1, -1, -1} },

					   { {-1, -1, -1},
                         {-1, -1, -1},
                         {-1, -1, -1} } };
//Players
const int Player1 = 0;
const int Player2 = 1;
int PlayerTurn = 0;

//Booleans
bool playing = true;
bool init = true;
bool takenInput = false;

//Input variable
int input = 0;

//Global Mutex
bool mutex = false;

//--------End---------//
//--Global Variables--//
//--------End---------//



//-------Begin--------//
//---Game Functions---//
//-------Begin--------//

//Places a piece in the specified slot
void setMove(int i, int playerNum)
{
    if((i >= 11 && i <= 19) || (i >= 21 && i <= 29) || (i >= 31 && i <= 39))
    {
        switch(i)
        {
            case 11:
                board[0][0][0] = playerNum;
                break;
            case 12:
                board[0][0][1] = playerNum;
                break;
            case 13:
                board[0][0][2] = playerNum;
                break;
            case 14:
                board[0][1][0] = playerNum;
                break;
            case 15:
                board[0][1][1] = playerNum;
                break;
            case 16:
                board[0][1][2] = playerNum;
                break;
            case 17:
                board[0][2][0] = playerNum;
                break;
            case 18:
                board[0][2][1] = playerNum;
                break;
            case 19:
                board[0][2][2] = playerNum;
                break;


            case 21:
                board[1][0][0] = playerNum;
                break;
            case 22:
                board[1][0][1] = playerNum;
                break;
            case 23:
                board[1][0][2] = playerNum;
                break;
            case 24:
                board[1][1][0] = playerNum;
                break;
            case 25:
                board[1][1][1] = playerNum;
                break;
            case 26:
                board[1][1][2] = playerNum;
                break;
            case 27:
                board[1][2][0] = playerNum;
                break;
            case 28:
                board[1][2][1] = playerNum;
                break;
            case 29:
                board[1][2][2] = playerNum;
                break;


            case 31:
                board[2][0][0] = playerNum;
                break;
            case 32:
                board[2][0][1] = playerNum;
                break;
            case 33:
                board[2][0][2] = playerNum;
                break;
            case 34:
                board[2][1][0] = playerNum;
                break;
            case 35:
                board[2][1][1] = playerNum;
                break;
            case 36:
                board[2][1][2] = playerNum;
                break;
            case 37:
                board[2][2][0] = playerNum;
                break;
            case 38:
                board[2][2][1] = playerNum;
                break;
            case 39:
                board[2][2][2] = playerNum;
                break;
            default:
                cout << "\nFATAL ERROR.\n";
        }
    }
    else
        cout << "\nInvalid setMove.\n";
}

//Checks to see if the last move was made to a free space
boolean moveFree(int i)
{
    if((i >= 11 && i <= 19) || (i >= 21 && i <=29) || (i >= 31 && i <= 39))
    {
        switch(i)
        {
            case 11:
                if(board[0][0][0] != Player1 && board[0][0][0] != Player2)
                    return true;
                else
                    return false;
            case 12:
                if(board[0][0][1] != Player1 && board[0][0][1] != Player2)
                    return true;
                else
                    return false;
            case 13:
                if(board[0][0][2] != Player1 && board[0][0][2] != Player2)
                    return true;
                else
                    return false;
            case 14:
                if(board[0][1][0] != Player1 && board[0][1][0] != Player2)
                    return true;
                else
                    return false;
            case 15:
                if(board[0][1][1] != Player1 && board[0][1][1] != Player2)
                    return true;
                else
                    return false;
            case 16:
                if(board[0][1][2] != Player1 && board[0][1][2] != Player2)
                    return true;
                else
                    return false;
            case 17:
                if(board[0][2][0] != Player1 && board[0][2][0] != Player2)
                    return true;
                else
                    return false;
            case 18:
                if(board[0][2][1] != Player1 && board[0][2][1] != Player2)
                    return true;
                else
                    return false;
            case 19:
                if(board[0][2][2] != Player1 && board[0][2][2] != Player2)
                    return true;
                else
                    return false;
                //CHECK LEVEL 2
                //
            case 21:
                if(board[1][0][0] != Player1 && board[1][0][0] != Player2)
                    return true;
                else
                    return false;
            case 22:
                if(board[1][0][1] != Player1 && board[1][0][1] != Player2)
                    return true;
                else
                    return false;
            case 23:
                if(board[1][0][2] != Player1 && board[1][0][2] != Player2)
                    return true;
                else
                    return false;
            case 24:
                if(board[1][1][0] != Player1 && board[1][1][0] != Player2)
                    return true;
                else
                    return false;
            case 25:
                if(board[1][1][1] != Player1 && board[1][1][1] != Player2)
                    return true;
                else
                    return false;
            case 26:
                if(board[1][1][2] != Player1 && board[1][1][2] != Player2)
                    return true;
                else
                    return false;
            case 27:
                if(board[1][2][0] != Player1 && board[1][2][0] != Player2)
                    return true;
                else
                    return false;
            case 28:
                if(board[1][2][1] != Player1 && board[1][2][1] != Player2)
                    return true;
                else
                    return false;
            case 29:
                if(board[1][2][2] != Player1 && board[1][2][2] != Player2)
                    return true;
                else
                    return false;
                //CHECK LEVEL 3
                //
            case 31:
                if(board[2][0][0] != Player1 && board[2][0][0] != Player2)
                    return true;
                else
                    return false;
            case 32:
                if(board[2][0][1] != Player1 && board[2][0][1] != Player2)
                    return true;
                else
                    return false;
            case 33:
                if(board[2][0][2] != Player1 && board[2][0][2] != Player2)
                    return true;
                else
                    return false;
            case 34:
                if(board[2][1][0] != Player1 && board[2][1][0] != Player2)
                    return true;
                else
                    return false;
            case 35:
                if(board[2][1][1] != Player1 && board[2][1][1] != Player2)
                    return true;
                else
                    return false;
            case 36:
                if(board[2][1][2] != Player1 && board[2][1][2] != Player2)
                    return true;
                else
                    return false;
            case 37:
                if(board[2][2][0] != Player1 && board[2][2][0] != Player2)
                    return true;
                else
                    return false;
            case 38:
                if(board[2][2][1] != Player1 && board[2][2][1] != Player2)
                    return true;
                else
                    return false;
            case 39:
                if(board[2][2][2] != Player1 && board[2][2][2] != Player2)
                    return true;
                else
                    return false;
            default:
                cout << "\nFATAL ERROR.\n";
        }
    }
    //else
        //cout << "\nMove " << i << " is an invalid move.\n";
    return false;
}

//Checks for a win. In every direction.
bool checkWin(int player)
{
    //  \\  //
    //   \\//             [Y][Z][X]
    //    ||
    //    ||
    //Check horizontal level 1
    if(board[0][0][0] == player && board[0][0][1] == player && board[0][0][2] == player)
        return true;
    else if(board[0][1][0] == player && board[0][1][1] == player && board[0][1][2] == player)
        return true;
    else if(board[0][2][0] == player && board[0][2][1] == player && board[0][2][2] == player)
        return true;
    //Check vertical level 1
    else if(board[0][0][0] == player && board[0][1][0] == player && board[0][2][0] == player)
        return true;
    else if(board[0][0][1] == player && board[0][1][1] == player && board[0][2][1] == player)
        return true;
    else if(board[0][0][2] == player && board[0][1][2] == player && board[0][2][2] == player)
        return true;
    //Check diagonal level 1
    else if(board[0][0][0] == player && board[0][1][1] == player && board[0][2][2] == player)
        return true;
    else if(board[0][2][0] == player && board[0][1][1] == player && board[0][0][2] == player)
        return true;
    //
    //LEVEL 2
    //

    //Check horizontal level 2
    if(board[0][0][0] == player && board[0][0][1] == player && board[0][0][2] == player)
        return true;
    else if(board[0][1][0] == player && board[0][1][1] == player && board[0][1][2] == player)
        return true;
    else if(board[0][2][0] == player && board[0][2][1] == player && board[0][2][2] == player)
        return true;
    //Check vertical level 2
    else if(board[0][0][0] == player && board[0][1][0] == player && board[0][2][0] == player)
        return true;
    else if(board[0][0][1] == player && board[0][1][1] == player && board[0][2][1] == player)
        return true;
    else if(board[0][0][2] == player && board[0][1][2] == player && board[0][2][2] == player)
        return true;
    //Check diagonal level 2
    else if(board[0][0][0] == player && board[0][1][1] == player && board[0][2][2] == player)
        return true;
    else if(board[0][2][0] == player && board[0][1][1] == player && board[0][0][2] == player)
        return true;
    //
    //LEVEL 3
    //

    //Check horizontal level 3
    if(board[0][0][0] == player && board[0][0][1] == player && board[0][0][2] == player)
        return true;
    else if(board[0][1][0] == player && board[0][1][1] == player && board[0][1][2] == player)
        return true;
    else if(board[0][2][0] == player && board[0][2][1] == player && board[0][2][2] == player)
        return true;
    //Check vertical level 3
    else if(board[0][0][0] == player && board[0][1][0] == player && board[0][2][0] == player)
        return true;
    else if(board[0][0][1] == player && board[0][1][1] == player && board[0][2][1] == player)
        return true;
    else if(board[0][0][2] == player && board[0][1][2] == player && board[0][2][2] == player)
        return true;
    //Check diagonal level 3
    else if(board[0][0][0] == player && board[0][1][1] == player && board[0][2][2] == player)
        return true;
    else if(board[0][2][0] == player && board[0][1][1] == player && board[0][0][2] == player)
        return true;


    //   =====
    //     //             [Y][Z][X]
    //    //
    //   =====
    //Check vertical level 1
    else if(board[0][0][0] == player && board[1][0][0] == player && board[2][0][0] == player)
        return true;
    else if(board[0][0][1] == player && board[1][0][1] == player && board[2][0][1] == player)
        return true;
    else if(board[0][0][2] == player && board[1][0][2] == player && board[2][0][2] == player)
        return true;
    //Check diagonal level 1
    else if(board[0][0][0] == player && board[1][0][1] == player && board[2][0][2] == player)
        return true;
    else if(board[0][0][2] == player && board[1][0][1] == player && board[2][0][0] == player)
        return true;
    //
    //LEVEL 2
    //

    //Check vertical level 2
    else if(board[0][1][0] == player && board[1][1][0] == player && board[2][1][0] == player)
        return true;
    else if(board[0][1][1] == player && board[1][1][1] == player && board[2][1][1] == player)
        return true;
    else if(board[0][1][2] == player && board[1][1][2] == player && board[2][1][2] == player)
        return true;
    //Check diagonal level 2
    else if(board[0][1][0] == player && board[1][1][1] == player && board[2][1][2] == player)
        return true;
    else if(board[0][1][2] == player && board[1][1][1] == player && board[2][1][0] == player)
        return true;
    //
    //LEVEL 3
    //

    //Check vertical level 3
    else if(board[0][2][0] == player && board[1][2][0] == player && board[2][2][0] == player)
        return true;
    else if(board[0][2][1] == player && board[1][2][1] == player && board[2][2][1] == player)
        return true;
    else if(board[0][2][2] == player && board[1][2][2] == player && board[2][2][2] == player)
        return true;
    //Check diagonal level 3
    else if(board[0][2][0] == player && board[1][2][1] == player && board[2][2][2] == player)
        return true;
    else if(board[0][2][2] == player && board[1][2][1] == player && board[2][2][0] == player)
        return true;


    //   \\  //
    //    \\//            [Y][Z][X]
    //    //\\
    //   //  \\
    //Check diagonal level 1
    else if(board[0][0][0] == player && board[1][1][0] == player && board[2][2][0] == player)
        return true;
    else if(board[0][2][0] == player && board[1][1][0] == player && board[2][0][0] == player)
        return true;
    //
    //LEVEL 2
    //

    //Check diagonal level 2
    else if(board[0][0][1] == player && board[1][1][1] == player && board[2][2][1] == player)
        return true;
    else if(board[0][2][1] == player && board[1][1][1] == player && board[2][0][1] == player)
        return true;
    //
    //LEVEL 3
    //

    //Check diagonal level 3
    else if(board[0][0][2] == player && board[1][1][2] == player && board[2][2][2] == player)
        return true;
    else if(board[0][2][2] == player && board[1][1][2] == player && board[2][0][2] == player)
        return true;

	//
	//MAIN DIAGONALS
	//

	else if(board[0][0][0] == player && board[1][1][1] == player && board[2][2][2] == player)
        return true;
    else if(board[0][0][2] == player && board[1][1][1] == player && board[2][2][0] == player)
        return true;
	else if(board[2][0][0] == player && board[1][1][1] == player && board[0][2][2] == player)
        return true;
    else if(board[0][2][0] == player && board[1][1][1] == player && board[2][0][2] == player)
        return true;
    
    else
        return false;
}

//Checks for a tie
bool checkTie()
{
    for(int i = 1; i <= 39; i++)
    {
        if(moveFree(i))
        {
            return false;
        }
        if((i % 9) == 0)
            i++;
    }
    return true;
}

//Displays the board
void DisplayBoard()
{
	int x = 0;
	int y = 0;
	int z = 0;
	
	int xoff = 0;
	int yoff = 0;
	int zoff = 0;

	//Draw the frame
	glColor3f(0.0f, 1.0f, 0.0f);
	glBegin(GL_LINES);
		glVertex3f(-150.0f, 50.0f, -50.0f);
		glVertex3f(150.0f, 50.0f, -50.0f);

		glVertex3f(-150.0f, -50.0f, -50.0f);
		glVertex3f(150.0f, -50.0f, -50.0f);

		glVertex3f(-150.0f, 50.0f, 50.0f);
		glVertex3f(150.0f, 50.0f, 50.0f);

		glVertex3f(-150.0f, -50.0f, 50.0f);
		glVertex3f(150.0f, -50.0f, 50.0f);


		glVertex3f(-50.0f, 50.0f, -150.0f);
		glVertex3f(-50.0f, 50.0f, 150.0f);

		glVertex3f(-50.0f, -50.0f, -150.0f);
		glVertex3f(-50.0f, -50.0f, 150.0f);

		glVertex3f(50.0f, 50.0f, -150.0f);
		glVertex3f(50.0f, 50.0f, 150.0f);

		glVertex3f(50.0f, -50.0f, -150.0f);
		glVertex3f(50.0f, -50.0f, 150.0f);


		glVertex3f(-50.0f, 150.0f, 50.0f);
		glVertex3f(-50.0f, -150.0f, 50.0f);

		glVertex3f(-50.0f, 150.0f, -50.0f);
		glVertex3f(-50.0f, -150.0f, -50.0f);

		glVertex3f(50.0f, 150.0f, 50.0f);
		glVertex3f(50.0f, -150.0f, 50.0f);

		glVertex3f(50.0f, 150.0f, -50.0f);
		glVertex3f(50.0f, -150.0f, -50.0f);
	glEnd();

	//Draw the reference spheres
	glColor3f(1.0, 0.0, 1.0);
	glPushMatrix();
		glTranslatef(200, 150, -150);
		glutSolidSphere(10, 7, 7);
	glPopMatrix();

	glColor3f(1.0, 1.0, 0.0);
	glPushMatrix();
		glTranslatef(200, 150, 0);
		glutSolidSphere(10, 7, 7);
	glPopMatrix();

	glColor3f(0.0, 1.0, 1.0);
	glPushMatrix();
		glTranslatef(200, 150, 150);
		glutSolidSphere(10, 7, 7);
	glPopMatrix();

	//Draw any player spheres
	for(x = 0; x <= 2; x++)
	{
		for(y = 0; y <= 2; y++)
		{
			for(z = 0; z <= 2; z++)
			{
				if((board[y][z][x] == Player1) | (board[y][z][x] == Player2))
				{
					if(x == 0)
						xoff = -100;
					if(x == 1)
						xoff = 0;
					if(x == 2)
						xoff = 100;

					if(y == 0)
						yoff = 100;
					if(y == 1)
						yoff = 0;
					if(y == 2)
						yoff = -100;

					if(z == 0)
						zoff = -100;
					if(z == 1)
						zoff = 0;
					if(z == 2)
						zoff = 100;

					if(board[y][z][x] == Player1)
					{
						glColor3f(1.0f, 0.0f, 0.0f);
					}
					if(board[y][z][x] == Player2)
					{
						glColor3f(0.0f, 0.0f, 1.0f);
					}

					glPushMatrix();
						glTranslatef(xoff, yoff, zoff);
						glutSolidSphere(25, 10, 10);
					glPopMatrix();
				}
			}
		}
	}
}

//The thread function that takes user input
DWORD WINAPI ThreadTakeInput(LPVOID lpParam)
{	
	if(mutex == false && takenInput == false && playing == true)
	{
		mutex = true;

		if(PlayerTurn == Player1)
		{
			cout << "Player 1, enter the slot you would like to go: ";
			cin >> input;
			takenInput = true;
			mutex = false;
			return 0;
		}
		if(PlayerTurn == Player2)
		{
			cout << "Player 2, enter the slot you would like to go: ";
			cin >> input;
			takenInput = true;
			mutex = false;
			return 0;
		}
	}
}

void Reset()
{
	int x = 0;
	int y = 0;
	int z = 0;

	//Reset board
	for(x = 0; x <= 2; x++)
	{
		for(y = 0; y <= 2; y++)
		{
			for(z = 0; z <= 2; z++)
			{
				board[y][z][x] = -1;
			}
		}
	}

	//Clear the screen
	system("cls");

	//Reset the control booleans
	init = true;
	mutex = false;
	takenInput = false;
	playing = true;
}


//--------End---------//
//---Game Functions---//
//--------End---------//



//-------Begin--------//
//---Main Game Code---//
//-------Begin--------//

void SetupRC()
{
    glEnable(GL_DEPTH_TEST);
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f );
}

//Runs the game code and renders the game
void RenderScene(void)
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	int choice = 0;

	//If it's the first iteration of the loop, display the instructions
	if(init == true)
	{
		 cout << "The board is set up 1 through 9 - 1 staring in the\n";
		 cout << "top left corner and 9 being in the bottom right.\n";
		 cout << "To make a move - When prompted enter the number slot you\n";
		 cout << "would like to go in and press enter.\n\n";
		 cout << "To choose which level you would like to go in, simply\n";
		 cout << "put the level number before the space number (i.e., 25, 12, 39)\n\n";
		 cout << "3D Controls: Arrow keys to rotate display.\n\n\n";

		 init = false;
	}
	
	//If the game is still in play
	if(playing == true)
	{
		//Player 1's turn
		if(PlayerTurn == Player1)
		{
			if(mutex == false && takenInput == true) //Grab the mutex
			{
				mutex = true;
				if(moveFree(input)) //Check and set the input
				{
					setMove(input, Player1);
					PlayerTurn = Player2;
				}
				else
				{
					cout << "\nYou can't go there!\n\n";
				}
				mutex = false;
				takenInput = false;

				if(checkWin(Player1)) //Check for a win or tie
				{
					cout << "\nPlayer 1 wins!\n";
					playing = false;
				}
				if(checkTie())
				{
					cout << "\nIt's a tie!\n";
					playing = false;
				}
			}
		}
		else if(PlayerTurn == Player2)
		{
			//Player 2's turn
			if(mutex == false && takenInput == true) //Grab the mutex
			{
				mutex = true;
				if(moveFree(input)) //Check and set the input
				{
					setMove(input, Player2);
					PlayerTurn = Player1;
				}
				else
				{
					cout << "\nYou can't go there!\n\n";
				}
				mutex = false;
				takenInput = false;

				if(checkWin(Player2)) //Check for a win or tie
				{
					cout << "\nPlayer 2 wins!\n";
					playing = false;
				}
				if(checkTie())
				{
					cout << "\nIt's a tie!\n";
					playing = false;
				}
			}
		}
		CreateThread(NULL, 0, ThreadTakeInput, NULL, 0, NULL);
	}
	//If the game is over, check to reset
	else if(playing == false)
	{
		cout << "Would you like to play again? (0/1) ";
		cin >> choice;

		if(choice == 0)
		{
			cout << "\nYou may now close the program.";
		}	
		else if(choice == 1)
		{
			Reset();
		}
		else
		{
			cout << "WRONG!!";
		}
	}
	
	//Display everything
	glPushMatrix();
		glRotatef(xRot, 1.0f, 0.0f, 0.0f);
		glRotatef(yRot, 0.0f, 1.0f, 0.0f);			
		DisplayBoard();
	glPopMatrix();

	// Do the buffer Swap
    glutSwapBuffers();
}

void TimerFunction(int value)
{
    // Redraw the scene with new coordinates
    glutPostRedisplay();
    glutTimerFunc(3,TimerFunction, 1);
}

void SpecialKeys(int key, int x, int y)
{
	if(key == GLUT_KEY_UP)
		xRot-= 5.0f;

	if(key == GLUT_KEY_DOWN)
		xRot += 5.0f;

	if(key == GLUT_KEY_LEFT)
		yRot -= 5.0f;

	if(key == GLUT_KEY_RIGHT)
		yRot += 5.0f;

	if(key > 356.0f)
		xRot = 0.0f;

	if(key < -1.0f)
		xRot = 355.0f;

	if(key > 356.0f)
		yRot = 0.0f;

	if(key < -1.0f)
		yRot = 355.0f;

	glutPostRedisplay();
}

void ChangeSize(int w, int h)
{
	GLfloat nRange = 400.0f;

	// Prevent a divide by zero
	if(h == 0)
		h = 1;

	// Set Viewport to window dimensions
    glViewport(0, 0, w, h);

	// Reset projection matrix stack
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();

	// Establish clipping volume (left, right, bottom, top, near, far)
    if (w <= h) 
		glOrtho (-nRange, nRange, -nRange*h/w, nRange*h/w, -nRange, nRange);
    else 
		glOrtho (-nRange*w/h, nRange*w/h, -nRange, nRange, -nRange, nRange);

	// Reset Model view matrix stack
	glMatrixMode(GL_MODELVIEW);
	glLoadIdentity();
}

int main(int argc, char* argv[])
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
    glutInitWindowSize(800,600);
    glutCreateWindow("TTT3D!!");
    glutReshapeFunc(ChangeSize);
    glutDisplayFunc(RenderScene);
	glutSpecialFunc(SpecialKeys);

    SetupRC();
    glutTimerFunc(33, TimerFunction, 1);

    glutMainLoop();

    return 0;
}
