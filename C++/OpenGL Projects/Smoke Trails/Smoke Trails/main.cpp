#include <windows.h>
#include <gltools.h>
#include <math.h>

#include "PlayerClass.h"
#include "SmokeClass.h"

float EXPAND_RATE = 0.1f;
float DARKEN_RATE = 0.01f;

bool init = true;

bool movingLeft = false;
bool movingRight = false;
bool movingUp = false;
bool movingDown = false;

int index = 0;

Player player(0, 0, 1.0f, 0.0f, 0.0f, 10, 2);
Smoke  smokeArr[100];

void SetupRC()
{
    glEnable(GL_DEPTH_TEST);
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f );
}

void RenderScene(void)
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	srand(GetTickCount());

	glPushMatrix();
	if(init == true) //initialize the smoke array
	{
		for(int i = 0; i < 100; i++)
		{
			smokeArr[i].SmokeConst(0, 0, (float)((rand() % 7) + 1), 0.75, false);
		}
		init = false;
	}

	if(movingLeft == true)
	{
		player.moveX(-player.speed); //update player's position

		if(smokeArr[index].alive == false) //create new smoke bubble if one is available
		{
			smokeArr[index].alive = true;
			smokeArr[index].setXY((player.x + player.size), (player.y - (player.size / 2)));
		}

		movingLeft = false;

		index++; //increase the index of the smoke bubble array
		if(index > 99)
		{
			index = 0;
		}
	}

	if(movingRight == true)
	{
		player.moveX(player.speed); //update player's position

		if(smokeArr[index].alive == false) //create new smoke bubble if one is available
		{
			smokeArr[index].alive = true;
			smokeArr[index].setXY(player.x, (player.y - (player.size / 2)));
		}

		movingRight = false;

		index++; //increase the index of the smoke bubble array
		if(index > 99)
		{
			index = 0;
		}
	}

	if(movingUp == true)
	{
		player.moveY(player.speed); //update player's position

		if(smokeArr[index].alive == false) //create new smoke bubble if one is available
		{
			smokeArr[index].alive = true;
			smokeArr[index].setXY((player.x + (player.size / 2)), (player.y - player.size));
		}

		movingUp = false;

		index++; //increase the index of the smoke bubble array
		if(index > 99)
		{
			index = 0;
		}
	}

	if(movingDown == true)
	{
		player.moveY(-player.speed); //update player's position

		if(smokeArr[index].alive == false) //create new smoke bubble if one is available
		{
			smokeArr[index].alive = true;
			smokeArr[index].setXY((player.x + (player.size / 2)), player.y);
		}

		movingDown = false;

		index++; //increase the index of the smoke bubble array
		if(index > 99)
		{
			index = 0;
		}
	}
	
	for(int i = 0; i < 100; i++) //update live smoke bubbles
	{
		if(smokeArr[i].alive == true)
		{
			smokeArr[i].draw();
			smokeArr[i].update(EXPAND_RATE, DARKEN_RATE);
		}
	}

	player.draw(); //draw the player

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
		movingUp = true;

	if(key == GLUT_KEY_DOWN)
		movingDown = true;

	if(key == GLUT_KEY_LEFT)
		movingLeft = true;

	if(key == GLUT_KEY_RIGHT)
		movingRight = true;

	glutPostRedisplay();
}

void ChangeSize(int w, int h)
{
	GLfloat nRange = 100.0f;

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
	glutCreateWindow("Smoke Trails! :D");
    glutReshapeFunc(ChangeSize);
    glutDisplayFunc(RenderScene);
	glutSpecialFunc(SpecialKeys);

    SetupRC();
    glutTimerFunc(33, TimerFunction, 1);

    glutMainLoop();

    return 0;
}
