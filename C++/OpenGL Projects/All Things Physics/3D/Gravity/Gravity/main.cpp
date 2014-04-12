#include <gltools.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
#include <iostream>

using namespace std;

static GLfloat yRot = 0.0f;
static GLfloat xRot = 0.0f;

const float GL_GC = (6.6917625079f * (10^-11));

float d3Dkm = 0.0;
float d3Dm = 0.0;
float feta = 0.0;

float F = 0.0;
float r = 0.0;
float v2 = 0.0;
float offset = 0.0;

float eMass = (5.97420f * (10^24));
float eDiam = 12756.32f;
float eX = 0.0f;
float eY = 0.0f;
float eZ = 0.0f;
float eXa = 0.0f;
float eYa = 0.0f;
float eZa = 0.0f;
float eTa = 0.0f;
float eXoffset = 0.0f;
float eYoffset = 0.0f;
float eZoffset = 0.0f;
float eXvel = 0.0f;
float eYvel = 0.0f;
float eZvel = 0.0f;
float eXcomp = 0.0f;
float eYcomp = 0.0f;
float eZcomp = 0.0f;
float eXYh = 0.0f;
float eXZh = 0.0f;
float eZYh = 0.0f;

float Xdist = 0.0f;
float Ydist = 0.0f;
float Zdist = 0.0f;
									
float sMass = (5.9742f * (10^24) * 9999999999999999999.0f);   // this cannot be right...(it's not)
float sDiam = 100000.0f;
float sX = 0.0f;
float sY = 0.0f;
float sZ = 0.0f;

float lineX = 0.0f;
float lineY = 0.0f;
float lineZ = 0.0f;

float currentTime = 0.0f;
float lastTime = 0.0f;
float deltaTime = 0.0f;

int gridx = -1000000;
int gridz = -1000000;

void SetupRC()
{
    glEnable(GL_DEPTH_TEST);

	glClearColor(0.0f, 0.0f, 0.0f, 1.0f );
}

void CalcDist() //Distance Calculations
{
	Xdist = (eX - sX);
	Ydist = (eY - sY);
	Zdist = (eZ - sZ);

	eXYh = sqrt((Xdist * Xdist) + (Ydist * Ydist));
	eXZh = sqrt((Xdist * Xdist) + (Zdist * Zdist));
	eZYh = sqrt((Zdist * Zdist) + (Ydist * Ydist));

	d3Dkm = sqrt((eXZh * eXZh) + (Ydist * Ydist));
	d3Dm = (d3Dkm * 1000);
}

void CalcOffsets()
{
	//Main Calculations
	CalcDist();
	F = (GL_GC * ((eMass * sMass) / (d3Dm * d3Dm)));
	eTa = (F / eMass);

	//X Calculations
	feta = acos(eZYh / d3Dkm);
	eXcomp = sin(feta);
	eXa = (eTa * eXcomp);

	//Z Calculations
	feta = acos(eXYh / d3Dkm);
	eZcomp = sin(feta);
	eZa = (eTa * eZcomp);

	//Y Calculations
	feta = acos(eXZh / d3Dkm);
	eYcomp = sin(feta);
	eYa = (eTa * eYcomp);

	if(((eX - sX) < 0) && (eXa < 0))
	{
		eXa = -eXa;
	}
	if(((eX - sX) > 0) && (eXa > 0))
	{
		eXa = -eXa;
	}
	if(((eZ - sZ) < 0) && (eZa < 0))
	{
		eZa = -eZa;
	}
	if(((eZ - sZ) > 0) && (eZa > 0))
	{
		eZa = -eZa;
	} 
	if(((eY - sY) < 0) && (eYa < 0))
	{
		eYa = -eYa;
	}
	if(((eY - sY) > 0) && (eYa > 0))
	{
		eYa = -eYa;
	}

	v2 = ((eXa * deltaTime) + eXvel); //find v2
	eXoffset = (eXvel * deltaTime);//find the offset using the original eXvel
	eXvel = v2; // replace eXvel with v2 after finding offset

	v2 = ((eZa * deltaTime) + eZvel); //same procedure for the Z offset and eZvel
	eZoffset = (eZvel * deltaTime);
	eZvel = v2;

	v2 = ((eYa * deltaTime) + eYvel); //same procedure for the Z offset and eZvel
	eYoffset = (eYvel * deltaTime);
	eYvel = v2;
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

			glColor3f(1.0, 1.0, 0.0);
			glutSolidSphere((sDiam / 2), 39, 78); //Sun

			glPushMatrix(); // Earth
				CalcOffsets();

				eX = eX + eXoffset; //Apply offsets
				eY = eY + eYoffset;
				eZ = eZ + eZoffset;

				printf("eX: ");          //Variable monitoring
				printf("%4.4f ", eX);
				printf("eXvel: ");
				printf("%4.4f ", eXvel);
				printf("eZ: ");
				printf("%4.4f ", eZ);
				printf("eZvel: ");
				printf("%4.4f \r", eZvel);

				lineX = (-eX + (eX / 2));
				lineY = (-eY + (eY / 2));
				lineZ = (-eZ + (eZ / 2));

				glTranslatef(eX, eY, eZ);
				
				glColor3f(1.0, 1.0, 1.0);
				glBegin(GL_LINES);
					glVertex3f(0.0, 0.0, 0.0);
					glVertex3f(lineX, lineY, lineZ);
				glEnd();

				glColor3f(0.0, 0.0, 1.0);
				glutSolidSphere((eDiam / 2), 39, 78); //Draw Earth
			glPopMatrix();
		
		glColor3f(0.0, 1.0, 0.0);

		glBegin(GL_LINES); //Grid	
			while(gridx <= 1000000)
			{
				glVertex3f((float)gridx, 0.0f, -1000000.0f);
				glVertex3f((float)gridx, 0.0f, 1000000.0f);
				gridx += 100000;
			}
			
			while(gridz <= 1000000)
			{
				glVertex3f(-1000000.0f, 0.0f, (float)gridz);
				glVertex3f(1000000.0f, 0.0f, (float)gridz);
				gridz += 100000;
			}
		glEnd();
    glPopMatrix();

	gridx = -1000000;
	gridz = -1000000;

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
	GLfloat nRange = 1000000.0f;

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
	cout << "eX: ";
	cin >> eX;
	cout << "eXvel: ";
	cin >> eXvel;
	cout << "eY: ";
	cin >> eY;
	cout << "eYvel: ";
	cin >> eYvel;
	cout << "eZ: ";
	cin >> eZ ;
	cout << "eZvel: ";
	cin >> eZvel;
	cout << "\n";
	
	glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
    glutInitWindowSize(800,600);
    glutCreateWindow("Gravity");
    glutReshapeFunc(ChangeSize);
    glutDisplayFunc(RenderScene);
	glutSpecialFunc(SpecialKeys);

    SetupRC();
    glutTimerFunc(33, TimerFunction, 1);

    glutMainLoop();

    return 0;
}
