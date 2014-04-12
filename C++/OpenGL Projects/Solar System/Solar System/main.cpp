#include <gltools.h>
#include <math.h>
#include <stdlib.h>

static GLfloat yRot = 0.0f;
static GLfloat xRot = 0.0f;

int gridx = -100;
int gridz = -100;

GLfloat	 lightPos[] = { 0.0f, 0.0f, 0.0f, 1.0f };
GLfloat  specular[] = { 1.0f, 1.0f, 1.0f, 1.0f};
GLfloat  specref[] =  { 0.75f, 0.75f, 0.75f, 1.0f };
GLfloat  ambientLight[] = { 0.5f, 0.5f, 0.5f, 1.0f};
GLfloat  diffuselight[] = { 1.0f, 1.0f, 1.0f, 1.0f};
GLfloat  spotDir[] = { 0.0f, 0.0f, -1.0f };

void SetupRC()
{
    glEnable(GL_DEPTH_TEST);
	glEnable(GL_LIGHTING);
	
    glLightfv(GL_LIGHT0,GL_AMBIENT,ambientLight);
	glLightfv(GL_LIGHT0,GL_DIFFUSE,diffuselight);
    glLightfv(GL_LIGHT0,GL_SPECULAR,specular);
    glLightfv(GL_LIGHT0,GL_POSITION,lightPos);

    glEnable(GL_LIGHT0);

    glEnable(GL_COLOR_MATERIAL);

    glColorMaterial(GL_FRONT, GL_AMBIENT_AND_DIFFUSE);

    glMaterialfv(GL_FRONT, GL_SPECULAR,specref);
    glMateriali(GL_FRONT, GL_SHININESS,128);

	glClearColor(0.0f, 0.0f, 0.0f, 1.0f );
}

void RenderScene(void)
{
    static GLfloat eRot = 0.0f;
	static GLfloat mRot = 0.0f;

	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        
    glPushMatrix();
	glRotatef(xRot, 1.0f, 0.0f, 0.0f);
	glRotatef(yRot, 0.0f, 1.0f, 0.0f);

		glColor3f(1.0, 1.0, 0.0);
        glutSolidSphere(15, 39, 78); //Sun

		glPushMatrix();
			glRotatef(eRot, 0.0, 1.0, 0.0);//Earth
			glTranslatef(60.0, 0.0, 0.0);
			glColor3f(0.0, 0.0, 1.0);
			glutSolidSphere(3, 13, 26);

			glPushMatrix();
				glRotatef(mRot, 0.0, 1.0, 0.0);//Moon
				glTranslatef(6.0, 0.0, 0.0);
				glColor3f(0.5, 0.5, 0.5);
				glutSolidSphere(1.5, 13, 26);
				glPushMatrix();
					glRotatef(mRot, 0.0, 1.0, 0.0);//Moonmoon
					glTranslatef(1.0, 0.0, 0.0);
					glColor3f(2.0, 0.0, 1.0);
					glutSolidSphere(0.2, 13, 26);
				glPopMatrix();
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

	eRot += 1.5f;
	mRot += 3.0f;

	if(eRot >= 360.0)
	{
		eRot = 0.0;
	}
	if(mRot >= 360.0)
	{
		mRot = 0.0;
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
