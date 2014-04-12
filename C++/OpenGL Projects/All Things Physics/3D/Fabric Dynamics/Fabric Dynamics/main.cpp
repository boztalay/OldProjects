#include <gltools.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>

static GLfloat zRot = 0.0f;
static GLfloat xRot = 0.0f;

int x = 0;
int y = 0;
int z = 0;
int i = 0;

float tempV2f = 0.0f;
float tempV2s = 0.0f;
float tempHyp = 0.0f;
float tempDist = 0.0f;

float tempOff = 0.0f;

const float distance = 10.0f;
const float vertexMass = 10.0f;

float currentTime = 0.0f;
float lastTime = 0.0f;
float deltaTime = 0.0f;

float vArray[11][11][6];
			
void SetupRC()
{
	for(x = 0; x < 11; x++)
	{
		for(y = 0;y < 11;y++)
		{
			z = 0;
			vArray[x][y][z] = ((x - 5) * distance);
			z++;
			vArray[x][y][z] = ((y - 5) * distance);
			z++;
			vArray[x][y][z] = (0);
			z++;
			vArray[x][y][z] = (0);
			z++;
			vArray[x][y][z] = (0);
			z++;
			vArray[x][y][z] = (0);
			z++;
		}
	}

    glEnable(GL_DEPTH_TEST);
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f );
}

void RenderScene(void)
{
	currentTime = (float)GetTickCount();
	deltaTime = (currentTime - lastTime) / 1000;

	if(deltaTime > 1.0)
	{
		deltaTime = 0.016f;
	}

	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        
    glPushMatrix();
	glRotatef(xRot, 1.0f, 0.0f, 0.0f);
	glRotatef(zRot, 0.0f, 0.0f, 1.0f);

	for(x = 0; x < 11; x++)
	{
		for(y = 0; y < 11; y++)
		{
			tempOff = (vArray[x][y][3] * deltaTime);
			vArray[x][y][0] += tempOff;
			tempOff = (vArray[x][y][4] * deltaTime);
			vArray[x][y][1] += tempOff;
			tempOff = (vArray[x][y][5] * deltaTime);
			vArray[x][y][2] += tempOff;
		}
	}

	glColor3f(0.0f, 1.0f, 0.0f);
	for(y = 0; y < 11; y++)
	{
		glBegin(GL_LINE_STRIP);
		for(x = 0; x < 11; x++)
		{
			glVertex3f(vArray[x][y][0], vArray[x][y][1], vArray[x][y][2]);
		}
		glEnd();
	}
	for(x = 0; x < 11;x++)
	{
		glBegin(GL_LINE_STRIP);
		for(y = 0; y < 11; y++)
		{
			glVertex3f(vArray[x][y][0], vArray[x][y][1], vArray[x][y][2]);
		}
		glEnd();
	}

    glPopMatrix();

	        
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
		zRot -= 5.0f;

	if(key == GLUT_KEY_RIGHT)
		zRot += 5.0f;

	if(key > 356.0f)
		xRot = 0.0f;

	if(key < -1.0f)
		xRot = 355.0f;

	if(key > 356.0f)
		zRot = 0.0f;

	if(key < -1.0f)
		zRot = 355.0f;

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
