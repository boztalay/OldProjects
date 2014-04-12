#include <gl/glut.h>
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

float eMass = (1.98892f * (10^40));
float eDiam = 50000.0f;
float eX = 0.0f;
float eY = 0.0f;
float eZ = -250000.0f;
float eXa = 0.0f;
float eYa = 0.0f;
float eZa = 0.0f;
float eTa = 0.0f;
float eXoffset = 0.0f;
float eYoffset = 0.0f;
float eZoffset = 0.0f;
float eXvel = (1.5846 * (10 ^ -28f));
float eYvel = 0.0f;
float eZvel = 0.0f;
float eXcomp = 0.0f;
float eYcomp = 0.0f;
float eZcomp = 0.0f;

float XYh = 0.0f;
float XZh = 0.0f;
float ZYh = 0.0f;
float Xdist = 0.0f;
float Ydist = 0.0f;
float Zdist = 0.0f;
									
float sMass = (1.98892f * (10^40));
float sDiam = 50000.0f;
float sX = 0.0f;
float sY = 0.0f;
float sZ = 250000.0f;
float sXa = 0.0f;
float sYa = 0.0f;
float sZa = 0.0f;
float sTa = 0.0f;
float sXoffset = 0.0f;
float sYoffset = 0.0f;
float sZoffset = 0.0f;
float sXvel = -(1.5846 * (10 ^ -28f));
float sYvel = 0.0f;
float sZvel = 0.0f;
float sXcomp = 0.0f;
float sYcomp = 0.0f;
float sZcomp = 0.0f;

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

	XYh = sqrt((Xdist * Xdist) + (Ydist * Ydist));
	XZh = sqrt((Xdist * Xdist) + (Zdist * Zdist));
	ZYh = sqrt((Zdist * Zdist) + (Ydist * Ydist));

	d3Dkm = sqrt((XZh * XZh) + (Ydist * Ydist));
	d3Dm = (d3Dkm * 1000);
}

void CalcOffsets()
{
	//Main Calculations
	CalcDist();
	F = (GL_GC * ((eMass * sMass) / (d3Dm * d3Dm)));
	eTa = (F / eMass);
	sTa = (F / sMass);

	//X E Calculations
	feta = acos(ZYh / d3Dkm);
	eXcomp = sin(feta);
	eXa = (eTa * eXcomp);

	//Z E Calculations
	feta = acos(XYh / d3Dkm);
	eZcomp = sin(feta);
	eZa = (eTa * eZcomp);

	//Y E Calculations
	feta = acos(XZh / d3Dkm);
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
	
	//SUN
	
	//X S Calculations
	feta = acos(ZYh / d3Dkm);
	sXcomp = sin(feta);
	sXa = (sTa * eXcomp);

	//Z S Calculations
	feta = acos(XYh / d3Dkm);
	sZcomp = sin(feta);
	sZa = (sTa * eZcomp);

	//Y S Calculations
	feta = acos(XZh / d3Dkm);
	sYcomp = sin(feta);
	sYa = (sTa * eYcomp);

	if(((sX - eX) < 0) && (sXa < 0))
	{
		sXa = -sXa;
	}
	if(((sX - eX) > 0) && (sXa > 0))
	{
		sXa = -sXa;
	}
	if(((sZ - eZ) < 0) && (sZa < 0))
	{
		sZa = -sZa;
	}
	if(((sZ - eZ) > 0) && (sZa > 0))
	{
		sZa = -sZa;
	} 
	if(((sY - eY) < 0) && (sYa < 0))
	{
		sYa = -sYa;
	}
	if(((sY - eY) > 0) && (sYa > 0))
	{
		sYa = -sYa;
	}

	v2 = ((sXa * deltaTime) + sXvel); //find v2
	sXoffset = (sXvel * deltaTime);//find the offset using the original eXvel
	sXvel = v2; // replace eXvel with v2 after finding offset

	v2 = ((sZa * deltaTime) + sZvel); //same procedure for the Z offset and eZvel
	sZoffset = (sZvel * deltaTime);
	sZvel = v2;

	v2 = ((sYa * deltaTime) + sYvel); //same procedure for the Z offset and eZvel
	sYoffset = (sYvel * deltaTime);
	sYvel = v2;
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
		
            glPushMatrix(); // Sun
				CalcOffsets();

				sX = sX + sXoffset; //Apply offsets
				sY = sY + sYoffset;
				sZ = sZ + sZoffset;

				glTranslatef(sX, sY, sZ);

				glColor3f(1.0, 0.0, 0.0);
				glutSolidSphere((sDiam / 2), 39, 78); //Draw Sun
			glPopMatrix();

			glPushMatrix(); // Earth

				eX = eX + eXoffset; //Apply offsets
				eY = eY + eYoffset;
				eZ = eZ + eZoffset;

				glTranslatef(eX, eY, eZ);

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
