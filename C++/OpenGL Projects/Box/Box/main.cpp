#include <gltools.h>
#include <math.h>
#include <glframe.h>

int iOutline;
GLfloat gridx = -100;
GLfloat gridz = -100;

GLfloat boxX = 0;
GLfloat boxY = 0;
GLfloat boxZ = 0;
GLfloat size = 25;

static GLfloat xRot = 0.0f;
static GLfloat yRot = 0.0f;

void ProcessMenu(int value)
{
	switch(value)
	{
		case 1:
			iOutline = !iOutline;
		default:
			break;
	}

	glutPostRedisplay();
}


void RenderScene()
{
	glColor3f(1.0f, 0.0f, 0.0f);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	glDisable(GL_CULL_FACE);
	glEnable(GL_DEPTH_TEST);
	
	if(iOutline)
	{
		glPolygonMode(GL_FRONT,GL_LINE);
		glPolygonMode(GL_BACK,GL_LINE);
	}
	else
	{
		glPolygonMode(GL_FRONT,GL_FILL);
		glPolygonMode(GL_BACK,GL_FILL);
	}

	glPushMatrix();
	glRotatef(xRot, 1.0f, 0.0f, 0.0f);
	glRotatef(yRot, 0.0f, 1.0f, 0.0f);

	glBegin(GL_QUAD_STRIP); // Sides
 
		glVertex3f(boxX, boxY, boxZ);                      // V0
		glVertex3f(boxX, boxY + size, boxZ);               // V1
		glVertex3f(boxX + size, boxY, boxZ);               // V2
		glVertex3f(boxX + size, boxY + size, boxZ);        // V3
		glVertex3f(boxX + size, boxY, boxZ + size);        // V4
		glVertex3f(boxX + size, boxY + size, boxZ + size); // V5
		glVertex3f(boxX, boxY, boxZ + size);               // V6
		glVertex3f(boxX, boxY + size, boxZ + size);        // V7
		glVertex3f(boxX, boxY, boxZ);                      // V8
		glVertex3f(boxX, boxY + size, boxZ);               // V9
	
	glEnd();

	glBegin(GL_QUADS); // Top side

		glVertex3f(boxX, boxY + size, boxZ);               // V1
		glVertex3f(boxX + size, boxY + size, boxZ);        // V3
		glVertex3f(boxX + size, boxY + size, boxZ + size); // V5
		glVertex3f(boxX, boxY + size, boxZ + size);        // V7

	glEnd();

	glBegin(GL_QUADS); //Bottom side

		glVertex3f(boxX, boxY, boxZ);                      // V0
		glVertex3f(boxX + size, boxY, boxZ);               // V2
		glVertex3f(boxX + size, boxY, boxZ + size);        // V4
		glVertex3f(boxX, boxY, boxZ + size);               // V6
		
	glEnd();

	glColor3f(0.0, 0.0, 1.0);

	glBegin(GL_LINE_STRIP); //Outlines
		
		glVertex3f(boxX + size, boxY, boxZ);               // V2
		glVertex3f(boxX, boxY, boxZ);                      // V0
		glVertex3f(boxX, boxY + size, boxZ);               // V1
		glVertex3f(boxX + size, boxY + size, boxZ);        // V3
		glVertex3f(boxX + size, boxY, boxZ);               // V2
		glVertex3f(boxX + size, boxY + size, boxZ);        // V3
		glVertex3f(boxX + size, boxY + size, boxZ + size); // V5
		glVertex3f(boxX + size, boxY, boxZ + size);        // V4
		glVertex3f(boxX + size, boxY, boxZ);               // V2
		glVertex3f(boxX + size, boxY, boxZ + size);        // V4
		glVertex3f(boxX, boxY, boxZ + size);               // V6
		glVertex3f(boxX, boxY + size, boxZ + size);        // V7
		glVertex3f(boxX + size, boxY + size, boxZ + size); // V5
		glVertex3f(boxX, boxY + size, boxZ + size);        // V7
		glVertex3f(boxX, boxY + size, boxZ);               // V1
		glVertex3f(boxX, boxY, boxZ);                      // V0
		glVertex3f(boxX, boxY, boxZ + size);               // V6
	
	glEnd();

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

	gridx = -100;
	gridz = -100;
	
	glPopMatrix();

    glutSwapBuffers();
}

void SetupRC()
{
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f );

	glColor3f(0.0f, 1.0f, 0.0f);

	glShadeModel(GL_FLAT);
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

void NormalKeys(unsigned char key, int x, int y)
{	
	if(key == 119)
		boxY += 5;

	if(key == 115)
		boxY -= 5;

	if(key == 97)
		boxX -= 5;

	if(key == 100)
		boxX += 5;

	if(key == 101)
		boxZ += 5;

	if(key == 113)
		boxZ -= 5;

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
	glutCreateWindow("Box");
	
	// Create the Menu
	glutCreateMenu(ProcessMenu);
	glutAddMenuEntry("Toggle outlines",1);
	glutAttachMenu(GLUT_RIGHT_BUTTON);
	
	glutReshapeFunc(ChangeSize);
	glutSpecialFunc(SpecialKeys);
	glutKeyboardFunc(NormalKeys);
	glutDisplayFunc(RenderScene);
	SetupRC();
	glutMainLoop();

	return 0;
}



