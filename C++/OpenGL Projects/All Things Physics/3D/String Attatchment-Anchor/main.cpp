#include <gl/glut.h>
#include <math.h>
#include <iostream>

using namespace std;

static GLfloat yRot = 0.0f;
static GLfloat xRot = 0.0f;

//Physics Variables
float d3D = 0.0;
float feta = 0.0;
float F = 0.0;
float r = 50.0;
float v2 = 0.0;
float offset = 0.0;
float V = 0.0f;

//Ball Variables
float bMass = 150.0f;
float bDiam = 7.5f;
float bX = r;
float bY = 0.0f;
float bZ = 0.0f;
float bXa = 0.0f;
float bYa = 0.0f;
float bZa = 0.0f;
float bTa = 0.0f;
float bXoffset = 0.0f;
float bYoffset = 0.0f;
float bZoffset = 0.0f;
float bXvel = 0.0f;
float bYvel = 0.0f;
float bZvel = 25.0f;
float bXcomp = 0.0f;
float bYcomp = 0.0f;
float bZcomp = 0.0f;
float bXYh = 0.0f;
float bXZh = 0.0f;
float bZYh = 0.0f;
float bXYv = 0.0f;
float bXZv = 0.0f;
float bZYv = 0.0f;

//Time Variables
float currentTime = 0.0f;
float lastTime = 0.0f;
float deltaTime = 0.0f;

//Other Variables
int gridx = -100;
int gridz = -100;
bool cut = false;

void SetupRC()
{
    glEnable(GL_DEPTH_TEST);

	glClearColor(0.0f, 0.0f, 0.0f, 1.0f );
}

void CalcDist() //Distance Calculations
{
	bXYh = sqrt((bX * bX) + (bY * bY));
	bXZh = sqrt((bX * bX) + (bZ * bZ));
	bZYh = sqrt((bZ * bZ) + (bY * bY));

	d3D = sqrt((bXZh * bXZh) + (bY * bY));
}

void CalcV() //True Velocity Calculations
{
    bXYv = sqrt((bXvel * bXvel) + (bYvel * bYvel));
	bXZv = sqrt((bXvel * bXvel) + (bZvel * bZvel));
	bZYv = sqrt((bZvel * bZvel) + (bYvel * bYvel));

	V = sqrt((bXZv * bXZv) + (bYvel * bYvel));
}

void CalcOffsets()
{
	//Main Calculations
	CalcDist();
	CalcV();
	F = (bMass * ((V * V) / r));
	bTa = (F / bMass);

	//X Calculations
	feta = acos(bZYh / d3D);
	bXcomp = sin(feta);
	bXa = (bTa * bXcomp);

	//Z Calculations
	feta = acos(bXYh / d3D);
	bZcomp = sin(feta);
	bZa = (bTa * bZcomp);

	//Y Calculations
	feta = acos(bXZh / d3D);
	bYcomp = sin(feta);
	bYa = (bTa * bYcomp);

	if((bX < 0) && (bXa < 0))
	{
		bXa = -bXa;
	}
	if((bX > 0) && (bXa > 0))
	{
		bXa = -bXa;
	}
	if((bZ < 0) && (bZa < 0))
	{
		bZa = -bZa;
	}
	if((bZ > 0) && (bZa > 0))
	{
		bZa = -bZa;
	} 
	if((bY < 0) && (bYa < 0))
	{
		bYa = -bYa;
	}
	if((bY > 0) && (bYa > 0))
	{
		bYa = -bYa;
	}

	v2 = ((bXa * deltaTime) + bXvel); //find v2
	bXoffset = (bXvel * deltaTime);//find the offset using the original eXvel
	bXvel = v2; // replace eXvel with v2 after finding offset

	v2 = ((bZa * deltaTime) + bZvel); //same procedure for the Z offset and eZvel
	bZoffset = (bZvel * deltaTime);
	bZvel = v2;

	v2 = ((bYa * deltaTime) + bYvel); //same procedure for the Z offset and eZvel
	bYoffset = (bYvel * deltaTime);
	bYvel = v2;
}

void CutOffsets()
{    
	bXoffset = (bXvel * deltaTime);
	bZoffset = (bZvel * deltaTime);
	bYoffset = (bYvel * deltaTime);
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

			glColor3f(0.5, 0.5, 0.5);
			glutSolidSphere(2, 39, 78); //Pivot

			glPushMatrix(); // Ball
				if(cut == false)
				{
                      CalcOffsets();
                }
                if(cut == true)
                {
                      CutOffsets();
                }

				bX += bXoffset; //Apply offsets
				bY += bYoffset;
				bZ += bZoffset;

				glTranslatef(bX, bY, bZ);
				
				if(cut == false)
				{
                    glColor3f(1.0, 0.0, 0.0);
    				glBegin(GL_LINES);//String
    					glVertex3f(0.0, 0.0, 0.0);
    					glVertex3f(-bX, -bY, -bZ);
    				glEnd();
                }

				glColor3f(0.0, 0.0, 1.0);
				glutSolidSphere((bDiam / 2), 39, 78); //Draw Ball
			glPopMatrix();
		
		glColor3f(0.0, 1.0, 0.0);

		glBegin(GL_LINES); //Grid	
			while(gridx <= 100)
			{
				glVertex3f((float)gridx, 0.0f, -100.0f);
				glVertex3f((float)gridx, 0.0f, 100.0f);
				gridx += 10;
			}
			
			while(gridz <= 100)
			{
				glVertex3f(-100.0f, 0.0f, (float)gridz);
				glVertex3f(100.0f, 0.0f, (float)gridz);
				gridz += 10;
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

void NormalKeys(unsigned char key, int x, int y)
{	
	if(key == 119)
		cut = true;

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
	cout << "bX: ";
	cin >> bX;
	cout << "bXvel: ";
	cin >> bXvel;
	cout << "bY: ";
	cin >> bY;
	cout << "bYvel: ";
	cin >> bYvel;
	cout << "bZ: ";
	cin >> bZ ;
	cout << "bZvel: ";
	cin >> bZvel;
	cout << "\n";
	
	glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
    glutInitWindowSize(800,600);
    glutCreateWindow("String Attatchment");
    glutReshapeFunc(ChangeSize);
    glutDisplayFunc(RenderScene);
	glutSpecialFunc(SpecialKeys);
	glutKeyboardFunc(NormalKeys);

    SetupRC();
    glutTimerFunc(33, TimerFunction, 1);

    glutMainLoop();

    return 0;
}
