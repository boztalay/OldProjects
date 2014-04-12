#include <gltools.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
#include <iostream>

using namespace std;

GLfloat gridx = -100;
GLfloat gridz = -100;

float yRot = 0.0f;
float xRot = 0.0f;

float rMass = 0.0f;
float rSize = 15.0f;
float rDiam = (rSize / 2);
float rX = 0.0f;
float rY = 0.0f;
float rZ = 0.0f;
float rXv = 0.0f;
float rYv = 0.0f;
float rZv = 0.0f;
float rXo = 0.0f;
float rYo = 0.0f;
float rZo = 0.0f;

float bMass = 0.0f;
float bSize = 15.0f;
float bDiam = (bSize / 2);
float bX = 0.0f;
float bY = 0.0f;
float bZ = 0.0f;
float bXv = 0.0f;
float bYv = 0.0f;
float bZv = 0.0f;
float bXo = 0.0f;
float bYo = 0.0f;
float bZo = 0.0f;

float v2r = 0.0f;
float v2b = 0.0f;

float currentTime = 0.0f;
float lastTime = 0.0f;
float deltaTime = 0.0f;

bool collidedX = false;
bool collidedY = false;
bool collidedZ = false;
bool dimension = true;

void SetupRC()
{
    glEnable(GL_DEPTH_TEST);
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f );
}

void CalcOffsets()
{
	if(collidedX == true)
	{
		//X calculations
		v2r = (((rMass - bMass) / (rMass + bMass)) * rXv) + (((bMass * 2) / (rMass + bMass)) * bXv);
		v2b = (((rMass * 2) / (rMass + bMass)) * rXv) + (((bMass - rMass) / (rMass + bMass)) * bXv);

		rXv = v2r;
		bXv = v2b;

		collidedX = false;
	}
		
	if(collidedY == true)
	{
		//Y calculations
		v2r = (((rMass - bMass) / (rMass + bMass)) * rYv) + (((bMass * 2) / (rMass + bMass)) * bYv);
		v2b = (((rMass * 2) / (rMass + bMass)) * rYv) + (((bMass - rMass) / (rMass + bMass)) * bYv);

		rYv = v2r;
		bYv = v2b;

		collidedY = false;
	}

	if(collidedZ == true)
	{
		//Z calculations
		v2r = (((rMass - bMass) / (rMass + bMass)) * rZv) + (((bMass * 2) / (rMass + bMass)) * bZv);
		v2b = (((rMass * 2) / (rMass + bMass)) * rZv) + (((bMass - rMass) / (rMass + bMass)) * bZv);

		rZv = v2r;
		bZv = v2b;
		
		collidedZ = false;
	}

	//Calculate offsets according to velocities
	rXo = (rXv * deltaTime);
	bXo = (bXv * deltaTime);
	rYo = (rYv * deltaTime);
	bYo = (bYv * deltaTime);
	rZo = (rZv * deltaTime);
	bZo = (bZv * deltaTime);
}

void CollisionCheck()
{
	//Check X axis
	if(((((rY + rDiam) >= (bY - bDiam)) && ((rY + rDiam) <= (bY + bDiam))) ||  //Not even I fully understand
		(((rY - rDiam) >= (bY - bDiam)) && ((rY - rDiam) <= (bY + bDiam)))) && //what's happening here, but it works.
		((((rZ + rDiam) >= (bZ - bDiam)) && ((rZ + rDiam) <= (bZ + bDiam))) || 
		(((rZ - rDiam) >= (bZ - bDiam)) && ((rZ - rDiam) <= (bZ + bDiam)))))
	{
		if((rX - bX) < 0)
		{
			if(((rX + rDiam) > (bX - bDiam)) && ((rX + rDiam) < (bX - bDiam + 1)))
			{
				collidedX = true;
				rX = ((bX - bDiam) - rDiam);
			}
		}
		if((rX - bX) > 0)
		{
			if(((rX - rDiam) < (bX + bDiam)) && ((rX - rDiam) > (bX + bDiam - 1)))
			{
				collidedX = true;
				rX = ((bX + bDiam) + rDiam);
			}
		}
	}
	//Check Y axis
	if(((((rX + rDiam) >= (bX - bDiam)) && ((rX + rDiam) <= (bX + bDiam))) ||  //Not even I fully understand
		(((rX - rDiam) >= (bX - bDiam)) && ((rX - rDiam) <= (bX + bDiam)))) && //what's happening here, but it works.
		((((rZ + rDiam) >= (bZ - bDiam)) && ((rZ + rDiam) <= (bZ + bDiam))) || 
		(((rZ - rDiam) >= (bZ - bDiam)) && ((rZ - rDiam) <= (bZ + bDiam)))))
	{
		if((rY - bY) < 0)
		{
			if(((rY + rDiam) > (bY - bDiam)) && ((rY + rDiam) < (bY - bDiam + 1)))
			{
				collidedY = true;
				rY = ((bY - bDiam) - rDiam);
			}
		}
		if((rY - bY) > 0)
		{
			if(((rY - rDiam) < (bY + bDiam)) && ((rY - rDiam) > (bY + bDiam - 1)))
			{
				collidedY = true;
				rY = ((bY + bDiam) + rDiam);
			}
		}
	}
	//Check Z axis
	if(((((rY + rDiam) >= (bY - bDiam)) && ((rY + rDiam) <= (bY + bDiam))) ||  //Not even I fully understand
		(((rY - rDiam) >= (bY - bDiam)) && ((rY - rDiam) <= (bY + bDiam)))) && //what's happening here, but it works.
		((((rX + rDiam) >= (bX - bDiam)) && ((rX + rDiam) <= (bX + bDiam))) || 
		(((rX - rDiam) >= (bX - bDiam)) && ((rX - rDiam) <= (bX + bDiam)))))
	{
		if((rZ - bZ) < 0)
		{
			if(((rZ + rDiam) > (bZ - bDiam)) && ((rZ + rDiam) < (bZ - bDiam + 1)))
			{
				collidedZ = true;
				rZ = ((bZ - bDiam) - rDiam);
			}
		}
		if((rZ - bZ) > 0)
		{
			if(((rZ - rDiam) < (bZ + bDiam)) && ((rZ - rDiam) > (bZ + bDiam - 1)))
			{
				collidedZ = true;
				rZ = ((bZ + bDiam) + rDiam);
			}
		}
	}
}

void RenderScene(void)
{
	currentTime = (float)GetTickCount();
	deltaTime = (currentTime - lastTime) / 1000;

	if(dimension == false)
	{
		rY = rDiam;
		bY = bDiam;
	}

	if(deltaTime > 1.0)
	{
		deltaTime = 0.016f;
	}
	
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        
    glPushMatrix();
		glRotatef(xRot, 1.0f, 0.0f, 0.0f);
		glRotatef(yRot, 0.0f, 1.0f, 0.0f);
		
		glPushMatrix();
			CollisionCheck();
			CalcOffsets();

			rX += rXo;
			rY += rYo;
			rZ += rZo;

			glTranslatef(rX, rY, rZ);
			
			glColor3f(1.0, 0.0, 0.0);
			glutSolidCube(rSize);
			glColor3f(0.0, 0.0, 1.0);
			glutWireCube(rSize);
		glPopMatrix();

		glPushMatrix();
			CollisionCheck();
			CalcOffsets();

			bX += bXo;
			bY += bYo;
			bZ += bZo;

			glTranslatef(bX, bY, bZ);
			
			glColor3f(0.0, 0.0, 1.0);
			glutSolidCube(bSize);
			glColor3f(1.0, 0.0, 0.0);
			glutWireCube(bSize);
		glPopMatrix();


		glColor3f(0.0, 1.0, 0.0);
		glBegin(GL_LINES); //Grid	
			while(gridx <= 100)
			{
				glVertex3f(gridx, 0, -100);
				glVertex3f(gridx, 0, 100);
				gridx += 20;
			}
			
			while(gridz <= 100)
			{
				glVertex3f(-100, 0, gridz);
				glVertex3f(100, 0, gridz);
				gridz += 20;
			}
		glEnd();

    glPopMatrix();

	gridx = -100;
	gridz = -100;

	lastTime = currentTime;
       
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
	//Setting up the masses
	cout << "3D (1 or 0): ";
	cin >> dimension;

	cout << "\n\nrMass: ";
	cin >> rMass;
	cout << "rX: ";
	cin >> rX;
	if(dimension == true)
	{
		cout << "rY: ";
		cin >> rY;
	}
	cout << "rZ: ";
	cin >> rZ;
	cout << "rXv: ";
	cin >> rXv;
	if(dimension == true)
	{
		cout << "rYv: ";
		cin >> rYv;
	}
	cout << "rZv: ";
	cin >> rZv;
	cout << "bMass: ";
	cin >> bMass;
	cout << "bX: ";
	cin >> bX;
	if(dimension == true)
	{
		cout << "bY: ";
		cin >> bY;
	}
	cout << "bZ: ";
	cin >> bZ;
	cout << "bXv: ";
	cin >> bXv;
	if(dimension == true)
	{
		cout << "bYv: ";
		cin >> bYv;
	}
	cout << "bZv: ";
	cin >> bZv;

    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
    glutInitWindowSize(800,600);
    glutCreateWindow("Conservation of Momentum");
    glutReshapeFunc(ChangeSize);
    glutDisplayFunc(RenderScene);
	glutSpecialFunc(SpecialKeys);

    SetupRC();
    glutTimerFunc(33, TimerFunction, 1);

    glutMainLoop();

    return 0;
}
