#include <windows.h>
#include <gltools.h>
#include <math.h>
#include <stdlib.h>

int i = 0;
float parent[3] = {0,0,0};
float newparent[3] = {0,0,0};
float child1[3] = {0,0,0};
float child2[3] = {0,0,0};
float child3[3] = {0,0,0};
float child4[3] = {0,0,0};
float child5[3] = {0,0,0};
float difference = 0;
float childDistArray[5] = {0, 0, 0, 0, 0};
bool init = true;
bool next = false;

static GLfloat xRot = 0.0f;
static GLfloat yRot = 0.0f;

float sqroot(float m)
{
   float i=0;
   float x1,x2;
   while( (i*i) <= m )
          i+=0.1;
   x1=i;
   for(int j=0;j<10;j++)
   {
      x2=m;
      x2/=x1;
      x2+=x1;
      x2/=2;
      x1=x2;
   }
   return x2;
}

float distance(float x, float y, float z)
{
      float d1 = sqroot((x * x) + (y * y));
      float d2 = sqroot((d1 * d1) + (z * z));
      return d2;
}

int sortFunction(const void *a, const void *b)
{
    float intOne = *((int*)a);
    float intTwo = *((int*)b);
    if(intOne < intTwo)
              return -1;
    if(intOne == intTwo)
              return 0;
    return 1;
}

void SetupRC()
{
    glEnable(GL_DEPTH_TEST);

	glClearColor(0.0f, 0.0f, 0.0f, 1.0f );
}

void RenderScene()
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	glDisable(GL_CULL_FACE);
	glEnable(GL_DEPTH_TEST);
	
	glPushMatrix();
	glRotatef(xRot, 1.0f, 0.0f, 0.0f);
	glRotatef(yRot, 0.0f, 1.0f, 0.0f);
	
	srand(GetTickCount());

	glutBitmapCharacter("times", 'v');

	if(init == true)
	{
		newparent[0] = ((rand() % 200) - 100);
		newparent[1] = ((rand() % 200) - 100);
		newparent[2] = ((rand() % 200) - 100);
		init = false;
	}

	glColor3f(0.0, 1.0, 0.0);
	glBegin(GL_LINES);
		glVertex3f(0.0f, 100.0f, 0.0f);
		glVertex3f(0.0f, -100.0f, 0.0f);

		glVertex3f(100.0f, 0.0f, 0.0f);
		glVertex3f(-100.0f, 0.0f, 0.0f);
		
		glVertex3f(0.0f, 0.0f, 100.0f);
		glVertex3f(0.0f, 0.0f, -100.0f);
	glEnd();

	if(next == true)
	{
		parent[0] = newparent[0];
		parent[1] = newparent[1];
		parent[2] = newparent[2];

		while(i < 3)
   		{
				difference = ((rand() % 4) - 2);
				child1[i] = (parent[i] + difference);
				i++;
		}
		i = 0;
		while(i < 3)
   		{
				difference = ((rand() % 4) - 2);
				child2[i] = (parent[i] + difference);
				i++;
		}
		i = 0;
		while(i < 3)
   		{
				difference = ((rand() % 4) - 2);
				child3[i] = (parent[i] + difference);
				i++;
		}
		i = 0;
		while(i < 3)
   		{
				difference = ((rand() % 4) - 2);
				child4[i] = (parent[i] + difference);
				i++;
		}
		i = 0;
		while(i < 3)
   		{
				difference = ((rand() % 4) - 2);
				child5[i] = (parent[i] + difference);
				i++;
		}
		i = 0;
	    	               
		childDistArray[0] = distance(child1[0], child1[1], child1[2]);
		childDistArray[1] = distance(child2[0], child2[1], child2[2]);
		childDistArray[2] = distance(child3[0], child3[1], child3[2]);
		childDistArray[3] = distance(child4[0], child4[1], child4[2]);
		childDistArray[4] = distance(child5[0], child5[1], child5[2]);
	  
		qsort((void *)childDistArray, 5, sizeof(childDistArray[0]), sortFunction);
	               
		if(distance(child1[0], child1[1], child1[2]) == childDistArray[0])
		{
			   newparent[0] = child1[0];
   			   newparent[1] = child1[1];
   			   newparent[2] = child1[2];
		}
		if(distance(child2[0], child2[1], child2[2]) == childDistArray[0])
		{
   			   newparent[0] = child2[0];
   			   newparent[1] = child2[1];
   			   newparent[2] = child2[2];
		}
		if(distance(child3[0], child3[1], child3[2]) == childDistArray[0])
		{
   			   newparent[0] = child3[0];
   			   newparent[1] = child3[1];
   			   newparent[2] = child3[2];
		}
		if(distance(child4[0], child4[1], child4[2]) == childDistArray[0])
		{
   			   newparent[0] = child4[0];
   			   newparent[1] = child4[1];
   			   newparent[2] = child4[2];
		}
		if(distance(child5[0], child5[1], child5[2]) == childDistArray[0])
		{
  			   newparent[0] = child5[0];
   			   newparent[1] = child5[1];
   			   newparent[2] = child5[2];
		}
	    
		if((parent[0] == 0) && (parent[1] == 0) && (parent[2] == 0))
		{
			   newparent[0] = ((rand() % 200) - 100);
			   newparent[1] = ((rand() % 200) - 100);
			   newparent[2] = ((rand() % 200) - 100);
		}
		next = false;
	}

	glPushMatrix();
        glTranslatef(parent[0], parent[1], parent[2]);
        glutSolidSphere(0.5, 13, 26);
    glPopMatrix();
	glColor3f(1.0f, 0.0f, 0.0f);
    glPushMatrix();
         glTranslatef(child1[0], child1[1], child1[2]);
         glutSolidSphere(0.5, 13, 26);
    glPopMatrix();
    glPushMatrix();
         glTranslatef(child2[0], child2[1], child2[2]);
         glutSolidSphere(0.5, 13, 26);
    glPopMatrix();
    glPushMatrix();
         glTranslatef(child3[0], child3[1], child3[2]);
         glutSolidSphere(0.5, 13, 26);
    glPopMatrix();
    glPushMatrix();
         glTranslatef(child4[0], child4[1], child4[2]);
         glutSolidSphere(0.5, 13, 26);
    glPopMatrix();
    glPushMatrix();
         glTranslatef(child5[0], child5[1], child5[2]);
         glutSolidSphere(0.5, 13, 26);
    glPopMatrix();

    glPopMatrix();
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

void NormalKeys(unsigned char key, int x, int y)
{	
	if(key == 119)
		next = true;

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
    glutCreateWindow("Evolution");
    glutReshapeFunc(ChangeSize);
    glutSpecialFunc(SpecialKeys);
    glutKeyboardFunc(NormalKeys);
    glutDisplayFunc(RenderScene);
    SetupRC();
    glutTimerFunc(33, TimerFunction, 1);

    glutMainLoop();

    return 0;
}
