#include "gltools.h"
#include "glu.h"

void RenderScene()
{
	glClear(GL_COLOR_BUFFER_BIT);
	glFlush();
}

void SetupRC()
{
	glClearColor(0.0f,0.0f,1.0f,1.0f);
}

int main()
{
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGBA);
	glutCreateWindow("Simple");
	glutDisplayFunc(RenderScene);
	SetupRC();

	glutMainLoop();
	return 0;
}