#include <windows.h>
#include <gltools.h>
#include <math.h>
#include <iostream>

using namespace std;

bool cont = true;
const float PI = 3.14159;

DWORD startTime = 0.0f;
DWORD endTime = 0.0f;
float deltaTime = 0.0f;

void gotoxy (short x, short y )
{
  COORD coord = {x, y};
  SetConsoleCursorPosition (GetStdHandle(STD_OUTPUT_HANDLE), coord );
}

struct Vector
{
  float x;
  float y;
};
typedef struct Vector Vector;

Vector p = {0.0f, 0.0f};
Vector v = {0.0f, 8.0f};
Vector vv = {-6.0f, -6.0f};
Vector vvv = {6.0f, -6.0f};

class Shape
{
	public:
		void Construct(Vector pos, Vector v1, Vector v2, Vector v3, float R, float G, float B, float M);

		void Rotate(float RotAng);
		void Move(float time);
		void Draw();
		void ApplyForces(float force);

	private:
		Vector position;
		Vector velocity;
		Vector direction;
		Vector AppForces;

		Vector vertex1act;
		Vector vertex2act;
		Vector vertex3act;

		Vector vertex1;
		Vector vertex2;
		Vector vertex3;

		float r;
		float g;
		float b;

		float angle;

		float mass;
};

void Shape::Construct(Vector pos, Vector v1, Vector v2, Vector v3, float R, float G, float B, float M)
{
	position = pos;

	vertex1act = v1;
	vertex2act = v2;
	vertex3act = v3;

	vertex1 = v1;
	vertex2 = v2;
	vertex3 = v3;

	direction.x = 0.0f;
	direction.y = 1.0f;

	r = R;
	g = G;
	b = B;

	mass = M;

	cout << "Object " << (int)this << " created\n";

	return;
}

void Shape::Rotate(float RotAngle)
{
	float tempAng = 0.0f;

	//Degrees to radians
	RotAngle *= (PI / 180);
	angle += RotAngle;

	//Rotate direction vector
	tempAng = atan2(direction.y, direction.x);  
    tempAng += RotAngle;
    direction.x = cos(tempAng);
    direction.y = sin(tempAng);

	//Rotate vertex 1
	vertex1.x = ((cos(angle) * vertex1act.x) - (sin(angle) * vertex1act.y));
	vertex1.y = ((sin(angle) * vertex1act.x) + (cos(angle) * vertex1act.y));

	//Rotate vertex 2
	vertex2.x = ((cos(angle) * vertex2act.x) - (sin(angle) * vertex2act.y));
	vertex2.y = ((sin(angle) * vertex2act.x) + (cos(angle) * vertex2act.y));

	//Rotate vertex 3
	vertex3.x = ((cos(angle) * vertex3act.x) - (sin(angle) * vertex3act.y));
	vertex3.y = ((sin(angle) * vertex3act.x) + (cos(angle) * vertex3act.y));
}

void Shape::Move(float time)
{
	velocity.x += (AppForces.x / mass);
	velocity.y += (AppForces.y / mass);

	position.x += (velocity.x * time);
	position.y += (velocity.y * time);

	AppForces.x = 0.0f;
	AppForces.y = 0.0f;

	if(position.x > 100.0f)
	{
		position.x = -100.0f;
	}

	if(position.x < -100.0f)
	{
		position.x = 100.0f;
	}


	if(position.y > 100.0f)
	{
		position.y = -100.0f;
	}

	if(position.y < -100.0f)
	{
		position.y = 100.0f;
	}

}


void Shape::Draw()
{
	glColor3f(r, g, b);
	glPushMatrix();
		glTranslatef(position.x, position.y, 0.0f);
		glBegin(GL_LINE_LOOP);
			glVertex2f(vertex1.x, vertex1.y);
			glVertex2f(vertex2.x, vertex2.y);
			glVertex2f(vertex3.x, vertex3.y);
		glEnd();
	glPopMatrix();

	gotoxy(0, 3);
	cout << "Position = {" << position.x << ", " << position.y << "}     \n";
	cout << "Direction = {" << direction.x << ", " << direction.y << "}     \n";
	cout << "Velocity = {" << velocity.x << ", " << velocity.y << "}     \n";
	cout << "Applied Forces = {" << AppForces.x << ", " << AppForces.y << "}     \n";
}

void Shape::ApplyForces(float force)
{
	AppForces.x = (force * direction.x);
	AppForces.y = (force * direction.y);
}

Shape triangle;

void SetupRC()
{
    glEnable(GL_DEPTH_TEST);
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f );
}

void RenderScene(void)
{
	deltaTime = (endTime - startTime);
	startTime = GetTickCount();

	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    if(cont == true)
    {
            triangle.Construct(p, v, vv, vvv, 1.0f, 0.0f, 0.0f, 5.0f);
            cont = false;
    }

	triangle.Move(deltaTime / 1000.0f);
    triangle.Draw();

    // Do the buffer Swap
    glutSwapBuffers();
	endTime = GetTickCount();
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
	 {
		 triangle.ApplyForces(10.0f);
	 }

     if(key == GLUT_KEY_RIGHT)
	 {
		triangle.Rotate(-5.0f);
	 }

     if(key == GLUT_KEY_LEFT)
	 {
		triangle.Rotate(5.0f);
	 }

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
    glutInitWindowSize(500,500);
    glutCreateWindow("Vector Test");
    glutReshapeFunc(ChangeSize);
    glutDisplayFunc(RenderScene);
	glutSpecialFunc(SpecialKeys);

    SetupRC();
    glutTimerFunc(33, TimerFunction, 1);

    glutMainLoop();

    return 0;
}
