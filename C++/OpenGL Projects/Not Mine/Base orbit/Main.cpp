#include <gltools.h>	// OpenGL toolkit
#include <math.h>
#include <glframe.h>   // Frame Class
#include <stdlib.h>


// Rotation amounts
static GLfloat xRot = 0.0f;
static GLfloat yRot = 0.0f;
bool Orbitin = true;

// Called to draw scene
void RenderScene(void)
	{
	// Angle of revolution around the Sun
	static float fPElect1 = 0.0f;
	static float fPElect2 = 0.0f;

	// Clear the window with current clearing color
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	
	// Red Nucleus
	glPushMatrix();
		glRotatef(xRot, 1.0f, 0.0f, 0.0f);
		glRotatef(yRot, 0.0f, 0.0f, 1.0f);
		
		glPushMatrix();
		glColor3ub(150, 150, 150);
		//glRotatef(fPElect1, 0.0f, 1.0f, 0.0f);
		//glTranslatef(-10.0f, 0.0f, 0.0f);
		glutSolidSphere(5.0f, 150, 15);
		glPopMatrix();

		//Planets
		// First Planet Orbit
		// Save viewing transformation
		glPushMatrix();

		glColor3ub(0,100,0);
		
		// Rotate by angle of revolution
		glRotatef(fPElect1, 0.0f, 0.0f, 1.0f);

		// Translate out from origin to orbit distance
		glTranslatef(35.0f - fPElect2, 0.0f, 0.0f);

		// Draw the Planet
		glutSolidSphere(5.0f, 150, 15);

		glPopMatrix();
	glPopMatrix();

	// Increment the angle of revolution
	fPElect1 += 3.0f;
	if(fPElect1 > 360.0f)
		fPElect1 = 0.0f;

	if(Orbitin == false)
	{
		fPElect2 -= 0.4f;
		if(fPElect2 == 0.0f)
		{
			Orbitin = true;
		}
	}
	if(Orbitin == true)
	{
		fPElect2 += 0.4f;
		if(fPElect2 > 12.0f)
		{
			Orbitin = false;
		}
	}
	// Show the image
	glutSwapBuffers();
	}


// This function does any needed initialization on the rendering
// context. 
void SetupRC()
	{	
	GLfloat  whiteLight[] = { 0.7f, 0.7f, 0.7f, 1.0f };
	GLfloat  sourceLight[] = { 0.8f, 0.8f, 0.8f, 1.0f };
	GLfloat	 lightPos[] = { 0.0f, 0.0f, 0.0f, 1.0f };
	glEnable(GL_DEPTH_TEST);	// Hidden surface removal
	glFrontFace(GL_CCW);		// Counter clock-wise polygons face out
	glEnable(GL_CULL_FACE);		// Do not calculate inside of jet
	glEnable(GL_LIGHTING);
	glLightModelfv(GL_LIGHT_MODEL_AMBIENT,whiteLight);
	glLightfv(GL_LIGHT0,GL_DIFFUSE,sourceLight);
	glLightfv(GL_LIGHT0,GL_POSITION,lightPos);
	glEnable(GL_LIGHT0);
	glEnable(GL_COLOR_MATERIAL);
	glColorMaterial(GL_FRONT,GL_AMBIENT_AND_DIFFUSE);
	// Black background
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f );
	glEnable(GL_NORMALIZE);
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
    //GLfloat lightPos[] = { 1.0f, 1.0f, 1.0f, 1.0f };
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
