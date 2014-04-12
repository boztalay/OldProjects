#include <windows.h>
#include <gltools.h>
#include <Vectors.h>

struct Object
{
	Vector position;
	Vector direction;
	Vector appliedForces;
	Vector displayColor;
	Vector velocity;
	Vector offsets;
	Vector acceleration;

	float mass;
	float radius;

	void Init(float x, float y, float R, float G, float B, float m, float r)
	{
		position = vecInit(x, y, 0.0f);
		direction = vecInit(0.0f, 1.0f, 0.0f);
		appliedForces = vecInit(0.0f, 0.0f, 0.0f);
		displayColor = vecInit(R, G, B);
		velocity = vecInit(0.0f, 0.0f, 0.0f);
		offsets = vecInit(0.0f, 0.0f, 0.0f);
		acceleration = vecInit(0.0f, 0.0f, 0.0f);

		mass = m;
		radius = r;
	}

	void Draw()
	{
		glColor3f(displayColor.x, displayColor.y, displayColor.z);
		glBegin(GL_TRIANGLES);
			glVertex3f(position.x, (position.y + radius), 0.0f);
			glVertex3f((position.x - radius), (position.y - radius), 0.0f);
			glVertex3f((position.x + radius), (position.y - radius), 0.0f);
		glEnd();
	}

	void Move(float time)
	{
		offsets = vecScaleConst(velocity, time);
		position = vecAdd(position, offsets);
	}

	void Rotate(float rotateAngle)
	{
		direction = vecRotate2D(direction, rotateAngle);
	}

	void ApplyForceVector(Vector forces)
	{
		appliedForces = vecAdd(appliedForces, forces);
	}

	void CalculateVelocity(float time)
	{
		acceleration = vecDivideConst(appliedForces, mass);
		velocity = vecAdd(vecScaleConst(acceleration, time), velocity);
		appliedForces = vecScaleConst(appliedForces, 0.0);
	}
};

Object ship;

float gridx = -100.0f;
float gridy = -100.0f;

float deltaTime = 0.0f;
float lastTime = 0.0f;
float currentTime = 0.0f;

bool init = false;

void SetupRC()
{
    glEnable(GL_DEPTH_TEST);
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f );
}

void RenderScene(void)
{
	if(init == false)
	{
		ship.Init(0.0, 0.0, 1.0, 0.0, 0.0, 5.0, 7.5);
		init = true;
	}
	
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	
	timeBeginPeriod(1);
	currentTime = (float)timeGetTime();
	timeEndPeriod(1);
	deltaTime = (currentTime - lastTime);
	deltaTime = (deltaTime / 1000);

	if(deltaTime > 0.5)
	{
		deltaTime = 0.16f;
	}
        
    glPushMatrix();//Main
	
		//Ship
		glPushMatrix();
			//Vector Drawings
			glBegin(GL_LINES);
				glColor3f(1.0, 1.0, 1.0);
				glVertex3f(ship.position.x, ship.position.y, 0.0f);
				glVertex3f((ship.position.x + ship.direction.x * 10), (ship.position.y + ship.direction.y * 10), 0.0f);
			glEnd();
			ship.CalculateVelocity(deltaTime);
			ship.Move(deltaTime);
			glTranslatef(ship.position.x, ship.position.y, 0.0f);
			//glRotatef((atan2(ship.direction.y, ship.direction.x) * (180 / PI) - 90.0), 0.0, 0.0, 1.0);
			ship.Draw();
		glPopMatrix();

		//Grid
		glColor3f(0.0, 1.0, 0.0);
		glBegin(GL_LINES);
			while(gridx <= 100)
			{
				glVertex3f(gridx, -100.0, 0.0);
				glVertex3f(gridx, 100.0, 0.0);
				gridx += 20;
			}
			
			while(gridy <= 100)
			{
				glVertex3f(-100.0, gridy, 0.0);
				glVertex3f(100.0, gridy, 0.0);
				gridy += 20;
			}
		glEnd();

    glPopMatrix();

	gridx = -100;
	gridy = -100; 

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

void SpecialKeys(int key, int x, int y)
{
	switch(key)
	{
		case GLUT_KEY_RIGHT:
			ship.Rotate(-(PI / 100.0));
			break;
		case GLUT_KEY_LEFT:
			ship.Rotate((PI / 100.0));
			break;
		case GLUT_KEY_UP:
			float force = 10.0f;
			Vector forces;
			forces = vecInit(0.0, 0.0, 0.0);
			forces = vecScaleConst(ship.direction, force);
			ship.appliedForces = vecAdd(ship.appliedForces, forces);
			break;
	}

	glutPostRedisplay();
}

int main(int argc, char* argv[])
{
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
    glutInitWindowSize(600,600);
    glutCreateWindow("2D Physics");
    glutReshapeFunc(ChangeSize);
    glutDisplayFunc(RenderScene);
	glutSpecialFunc(SpecialKeys);

    SetupRC();
    glutTimerFunc(33, TimerFunction, 1);

    glutMainLoop();

    return 0;
}
