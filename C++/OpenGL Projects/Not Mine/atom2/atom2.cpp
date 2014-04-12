// Atom2.cpp
// OpenGL SuperBible
// Demonstrates OpenGL coordinate transformation
// and perspective
// Program by Richard S. Wright Jr.

#include "gltools.h"	// OpenGL toolkit
#include <math.h>



// Rotation amounts
static GLfloat xRot = 0.0f;
static GLfloat yRot = 0.0f;

void SeedRandNums()
{
	srand(GetTickCount());
}

//Planet Color Numbers...
	int PCN1R = rand()%200;
	int PCN1G = rand()%200;
	int PCN1B = rand()%200;
	int PCN2R = rand()%200;
	int PCN2G = rand()%200;
	int PCN2B = rand()%200;
	int PCN3R = rand()%200;
	int PCN3G = rand()%200;
	int PCN3B = rand()%200;
	int PCN4R = rand()%200;
	int PCN4G = rand()%200;
	int PCN4B = rand()%200;
	int PCN5R = rand()%200;
	int PCN5G = rand()%200;
	int PCN5B = rand()%200;
	int PCN6R = rand()%200;
	int PCN6G = rand()%200;
	int PCN6B = rand()%200;
	int PCN7R = rand()%200;
	int PCN7G = rand()%200;
	int PCN7B = rand()%200;
	int PCN8R = rand()%200;
	int PCN8G = rand()%200;
	int PCN8B = rand()%200;

//Planet Size Variation
	int PSV1 = rand()%200;
	float PSV11 = PSV1/100;
	int PSV2 = rand()%200;
	float PSV22 = PSV2/100;
	int PSV3 = rand()%200;
	float PSV33 = PSV3/100;
	int PSV4 = rand()%200;
	float PSV44 = PSV4/100;
	int PSV5 = rand()%200;
	float PSV55 = PSV5/100;
	int PSV6 = rand()%200;
	float PSV66 = PSV6/100;
	int PSV7 = rand()%200;
	float PSV77 = PSV7/100;
	int PSV8 = rand()%200;
	float PSV88 = PSV8/100;

//Speed of planets
	float Spd1 = 5.0f;
	float Spd2 = 4.8f;
	float Spd3 = 4.6f;
	float Spd4 = 4.4f;
	float Spd5 = 4.2f;
	float Spd6 = 4.0f;
	float Spd7 = 3.8f;
	float Spd8 = 3.6f;

// Called to draw scene
void RenderScene(void)
	{
	srand(GetTickCount());

	// Angle of revolution around the nucleus
	static float fElect1 = 0.0f;
	static float fElect2 = 0.0f;
	static float fElect3 = 0.0f;
	static float fElect4 = 0.0f;
	static float fElect5 = 0.0f;
	static float fElect6 = 0.0f;
	static float fElect7 = 0.0f;
	static float fElect8 = 0.0f;
	// Clear the window with current clearing color
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	// Red Nucleus
	glColor3ub(200, 255, 200);
	glutSolidSphere(15.0f, 15, 15);

	// Yellow Electrons
	glColor3ub(PCN1R,PCN1G,PCN1B);

	// First Electron Orbit
	// Save viewing transformation
	glPushMatrix();

	// Rotate by angle of revolution
	glRotatef(fElect1, 0.0f, 0.0f, 1.0f);

	// Translate out from origin to orbit distance
	glTranslatef(25.0f+(PSV11*2), 0.0f, 0.0f);

	// Draw the electron
	glutSolidSphere(1.0f+PSV11, 15, 15);

	// Restore the viewing transformation
	glPopMatrix();

	glColor3ub(PCN2R,PCN2G,PCN2B);
	// Second Planet Orbit
	glPushMatrix();
	//glRotatef(45.0f, 0.0f, 0.0f, 1.0f);
	glRotatef(fElect2, 0.0f, 0.0f, 1.0f);
	glTranslatef(35.0f+(PSV22*2), 0.0f, 0.0f);
	glutSolidSphere(1.0f+PSV22, 15, 15);
	glPopMatrix();

	glColor3ub(PCN3R,PCN3G,PCN3B);
	// Third Electron Orbit
	glPushMatrix();
	//glRotatef(360.0f-45.0f,0.0f, 0.0f, 1.0f);
	glRotatef(fElect3, 0.0f, 0.0f, 1.0f);
	glTranslatef(45.0f+(PSV33*2), 0.0f, 0.0f);
	glutSolidSphere(1.0f+PSV33, 15, 15);
	glPopMatrix();

	glColor3ub(PCN4R,PCN4G,PCN4B);
	// Fourth Electron Orbit
	glPushMatrix();
	//glRotatef(360.0f-45.0f,0.0f, 0.0f, 1.0f);
	glRotatef(fElect4, 0.0f, 0.0f, 1.0f);
	glTranslatef(55.0f+(PSV44*2), 0.0f, 0.0f);
	glutSolidSphere(1.0f+PSV44, 15, 15);
	glPopMatrix();

	glColor3ub(PCN5R,PCN5G,PCN5B);
	// Fith Electron Orbit
	glPushMatrix();
	//glRotatef(360.0f-45.0f,0.0f, 0.0f, 1.0f);
	glRotatef(fElect5, 0.0f, 0.0f, 1.0f);
	glTranslatef(65.0f+(PSV55*2), 0.0f, 0.0f);
	glutSolidSphere(1.0f+PSV55, 15, 15);
	glPopMatrix();

	glColor3ub(PCN6R,PCN6G,PCN6B);
	// Sixth Electron Orbit
	glPushMatrix();
	//glRotatef(360.0f-45.0f,0.0f, 0.0f, 1.0f);
	glRotatef(fElect6, 0.0f, 0.0f, 1.0f);
	glTranslatef(75.0f+(PSV66*2), 0.0f, 0.0f);
	glutSolidSphere(1.0f+PSV66, 15, 15);
	glPopMatrix();

	glColor3ub(PCN7R,PCN7G,PCN7B);
	// Seventh Electron Orbit
	glPushMatrix();
	//glRotatef(360.0f-45.0f,0.0f, 0.0f, 1.0f);
	glRotatef(fElect7, 0.0f, 0.0f, 1.0f);
	glTranslatef(85.0f+(PSV77*2), 0.0f, 0.0f);
	glutSolidSphere(1.0f+PSV77, 15, 15);
	glPopMatrix();

	glColor3ub(PCN8R,PCN8G,PCN8B);
	// Eighth Electron Orbit
	glPushMatrix();
	//glRotatef(360.0f-45.0f,0.0f, 0.0f, 1.0f);
	glRotatef(fElect8, 0.0f, 0.0f, 1.0f);
	glTranslatef(95.0f+(PSV88*2), 0.0f, 0.0f);
	glutSolidSphere(1.0f+PSV88, 15, 15);
	glPopMatrix();

	// Increment the angle of revolution
	fElect1 += Spd1;
	if(fElect1 > 360.0f)
		fElect1 = 0.0f;
	
	fElect2 += Spd2;
	if(fElect2 > 360.0f)
		fElect2 = 0.0f;

	fElect3 += Spd3;
	if(fElect3 > 360.0f)
		fElect3 = 0.0f;

	fElect4 += Spd4;
	if(fElect4 > 360.0f)
		fElect4 = 0.0f;

	fElect5 += Spd5;
	if(fElect5 > 360.0f)
		fElect5 = 0.0f;

	fElect6 += Spd6;
	if(fElect6 > 360.0f)
		fElect6 = 0.0f;

	fElect7 += Spd7;
	if(fElect7 > 360.0f)
		fElect7 = 0.0f;

	fElect8 += Spd8;
	if(fElect8 > 360.0f)
		fElect8 = 0.0f;

	if(fElect1 == fElect2 && fElect2 == fElect3 && fElect3 == fElect4 && fElect4 == fElect5 && fElect5 == fElect6 && fElect6 == fElect7 && fElect7 == fElect8)
	{
		Spd1 = 0.0f;
		Spd2 = 0.0f;
		Spd3 = 0.0f;
		Spd4 = 0.0f;
		Spd5 = 0.0f;
		Spd6 = 0.0f;
		Spd7 = 0.0f;
		Spd8 = 0.0f;
	}
	// Show the image
	glutSwapBuffers();
	}


// This function does any needed initialization on the rendering
// context. 
void SetupRC()
	{
	glEnable(GL_DEPTH_TEST);	// Hidden surface removal
	glFrontFace(GL_CCW);		// Counter clock-wise polygons face out
	glEnable(GL_CULL_FACE);		// Do not calculate inside of jet

	// Black background
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f );	
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

	// Refresh the Window
	glutPostRedisplay();
	}

void TimerFunc(int value)
    {
    glutPostRedisplay();
    glutTimerFunc(100, TimerFunc, 1);
    }

void ChangeSize(int w, int h)
    {
    GLfloat fAspect;

    // Prevent a divide by zero
    if(h == 0)
        h = 1;

    // Set Viewport to window dimensions
    glViewport(0, 0, w, h);

    // Reset coordinate system
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();

    fAspect = (float)w/(float)h;
    gluPerspective(45.0, fAspect, 1.0, 500.0);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glTranslatef(0.0f, 0.0f, -250.0f);
    }

int main(int argc, char* argv[])
	{
	SeedRandNums();
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
        glutInitWindowSize(800, 600);
	glutCreateWindow("OpenGL Atom - Part Duex");
	glutReshapeFunc(ChangeSize);
	glutSpecialFunc(SpecialKeys);
	glutDisplayFunc(RenderScene);
        glutTimerFunc(500, TimerFunc, 1);
	SetupRC();
	glutMainLoop();

	return 0;
	}
