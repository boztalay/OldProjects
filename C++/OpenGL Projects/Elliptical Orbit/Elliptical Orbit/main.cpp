#include <gltools.h>
#include <math.h>
#include <stdlib.h>

static GLfloat yRot = 0.0f;
static GLfloat xRot = 0.0f;

#define GL_PI 3.14159

float i = 0;
float steps = 180;
float angle = 5;
float offsetX = 0;
float offsetZ = 0;
float beta = -angle / 180 * GL_PI;
float sinbeta = sin(beta);
float cosbeta = cos(beta);
float alpha = 0;
float sinalpha = 0;
float cosalpha = 0;

float a = 90; // horizontal axis length
float b = 50; // vertical axis length
float x = 0;
float z = 0;

int gridx = -100;
int gridz = -100;

int mRot = 0.0;

void SetupRC()
{
    glEnable(GL_DEPTH_TEST);

	glClearColor(0.0f, 0.0f, 0.0f, 1.0f );
}

void RenderScene(void)
{

	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        
    glPushMatrix();
	glRotatef(xRot, 1.0f, 0.0f, 0.0f);
	glRotatef(yRot, 0.0f, 1.0f, 0.0f);

		glColor3f(1.0, 1.0, 0.0);
        glutSolidSphere(15, 39, 78); //Sun

		glPushMatrix();
			alpha = i / 180 * GL_PI;
			sinalpha = sin(alpha);
			cosalpha = cos(alpha);

			offsetX = x + (a * cosalpha * cosbeta - b * sinalpha * sinbeta);
			offsetZ = z + (a * cosalpha * sinbeta + b * sinalpha * cosbeta);

			glTranslatef(offsetX, 0.0, offsetZ);
			glColor3f(0.0, 0.0, 1.0);
			glutSolidSphere(3.0, 13, 26);

			glPushMatrix();
				glRotatef(45, 1.0, 0.0, 0.0);
				glRotatef(mRot, 0.0, 1.0, 0.0);
				glTranslatef(7.0, 0.0, 0.0);
				glColor3f(0.5, 0.5, 0.5);
				glutSolidSphere(1.5, 13, 26);
			glPopMatrix();

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

	mRot += 5;
	if(mRot >= 360)
	{
		mRot = 0;
	}

	i += (360 / steps);
	if(i >= 360)
	{
		i = 0;
	}       
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
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
    glutInitWindowSize(800,600);
    glutCreateWindow("Solar System");
    glutReshapeFunc(ChangeSize);
    glutDisplayFunc(RenderScene);
	glutSpecialFunc(SpecialKeys);

    SetupRC();
    glutTimerFunc(33, TimerFunction, 1);

    glutMainLoop();

    return 0;
}
