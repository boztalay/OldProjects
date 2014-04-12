#include <windows.h>
#include <gltools.h>
#include <math.h>
#include <time.h>

float cRadius = 15.0f;
float cMass = 5.0f;
float cElasticity = .38f;
float cX = -50.0f;
float cY = 54.0f;
float cZ = 0.0f;
float cXv = 10.0f;
float cYv = 0.0f;
float cZv = 0.0f;
float cXo = 0.0f;
float cYo = 0.0f;
float cZo = 0.0f;

static GLfloat yRot = 0.0f;
static GLfloat xRot = 0.0f;

float gridx = -100.0f;
float gridz = -100.0f;

float currentTime = 0.0f;
float lastTime = 0.0f;
float deltaTime = 0.0f;

void SetupRC();
float OffsetCalc(float V);
float Gravity(float yV);
float GroundCollision(float y, float yV, float elast, float radius);
void RenderScene(void);
void TimerFunction(int value);
void SpecialKeys(int key, int x, int y);
void ChangeSize(int w, int h);

int main(int argc, char* argv[])
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
    glutInitWindowSize(800,600);
    glutCreateWindow("Surface Gravity");
    glutReshapeFunc(ChangeSize);
    glutDisplayFunc(RenderScene);
	glutSpecialFunc(SpecialKeys);

    SetupRC();
    glutTimerFunc(33, TimerFunction, 1);

    glutMainLoop();

    return 0;
}

//Functions//

void SetupRC()
{
    glEnable(GL_DEPTH_TEST);
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f );
}

float OffsetCalc(float V)
{
	float offset = 0.0f;

	offset = (deltaTime * V);

	return offset;
}

float Gravity(float yV)
{
	static float g = -9.8f;
	float v2 = 0.0f;

	v2 = ((g * deltaTime) + yV);

	return v2;
}

float GroundCollision(float y, float yV, float elast, float radius)
{
	if((y - (radius / 2)) < 0)
	{
		yV = yV * elast;
		yV = -yV;
	}
	return yV;
}
	
void RenderScene(void)
{
	currentTime = (float)GetTickCount();
	deltaTime = (currentTime - lastTime);
	deltaTime = (deltaTime / 1000); //Convert to seconds

	if(deltaTime > 0.5)
	{
		deltaTime = 0.016f;
	}

	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
        
    glPushMatrix();
	glRotatef(xRot, 1.0f, 0.0f, 0.0f);
	glRotatef(yRot, 0.0f, 1.0f, 0.0f);
	
		glPushMatrix();//Cube
			cYv = GroundCollision(cY, cYv, cElasticity, cRadius);
			
			cXo = OffsetCalc(cXv);
			cYo = OffsetCalc(cYv);
			cZo = OffsetCalc(cZv);

			cX = cX + cXo;
			cY = cY + cYo;
			cZ = cZ + cZo;

			cYv = Gravity(cYv);

			glTranslatef(cX, cY, cZ);

			glColor3f(1.0, 0.0, 0.0);
			glutSolidCube(cRadius);
			glColor3f(0.0, 0.0, 1.0);
			glutWireCube(cRadius);
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
