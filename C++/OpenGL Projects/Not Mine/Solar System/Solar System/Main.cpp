// Atom2.cpp
// OpenGL SuperBible
// Demonstrates OpenGL coordinate transformation
// and perspective
// Program by Richard S. Wright Jr.

#include <gltools.h>	// OpenGL toolkit
#include <math.h>



// Rotation amounts
static GLfloat xRot = 0.0f;
static GLfloat yRot = 0.0f;

//Planet Color Numbers...
	int PCN1R;
	int PCN1G;
	int PCN1B;
	int PCN2R;
	int PCN2G;
	int PCN2B;
	int PCN3R;
	int PCN3G;
	int PCN3B;
	int PCN4R;
	int PCN4G;
	int PCN4B;
	int PCN5R;
	int PCN5G;
	int PCN5B;
	int PCN6R;
	int PCN6G;
	int PCN6B;
	int PCN7R;
	int PCN7G;
	int PCN7B;
	int PCN8R;
	int PCN8G;
	int PCN8B;

//Planet Size Variation
	int PSV1;
	float PSV11;
	int PSV2;
	float PSV22;
	int PSV3;
	float PSV33;
	int PSV4;
	float PSV44;
	int PSV5;
	float PSV55;
	int PSV6;
	float PSV66;
	int PSV7;
	float PSV77;
	int PSV8;
	float PSV88;
	
//Moon color numbers...
	int MCN1R;
	int MCN1G;
	int MCN1B;
	int MCN2R;
	int MCN2G;
	int MCN2B;
	int MCN3R;
	int MCN3G;
	int MCN3B;
	int MCN4R;
	int MCN4G;
	int MCN4B;
	int MCN5R;
	int MCN5G;
	int MCN5B;
	int MCN6R;
	int MCN6G;
	int MCN6B;
	int MCN7R;
	int MCN7G;
	int MCN7B;
	int MCN8R;
	int MCN8G;
	int MCN8B;

//Moon size variation
	int MSV1;
	float MSV11;
	int MSV2;
	float MSV22;
	int MSV3;
	float MSV33;
	int MSV4;
	float MSV44;
	int MSV5;
	float MSV55;
	int MSV6;
	float MSV66;
	int MSV7;
	float MSV77;
	int MSV8;
	float MSV88;


//Speed of planets
	float PSpd1 = 4.0f;
	float PSpd2 = 3.8f;
	float PSpd3 = 3.6f;
	float PSpd4 = 3.4f;
	float PSpd5 = 3.2f;
	float PSpd6 = 3.0f;
	float PSpd7 = 2.8f;
	float PSpd8 = 2.6f;
	//Moons
	float MSpd1;
	float MSpd11;
	float MSpd2;
	float MSpd22;
	float MSpd3;
	float MSpd33;
	float MSpd4;
	float MSpd44;
	float MSpd5;
	float MSpd55;
	float MSpd6;
	float MSpd66;
	float MSpd7;
	float MSpd77;
	float MSpd8;
	float MSpd88;
//seeding random numbers...
void SeedRandNums()
{
	srand(GetTickCount());
	//Planet Color Numbers...
	PCN1R = rand()%200;
	PCN1G = rand()%200;
	PCN1B = rand()%200;
	PCN2R = rand()%200;
	PCN2G = rand()%200;
	PCN2B = rand()%200;
	PCN3R = rand()%200;
	PCN3G = rand()%200;
	PCN3B = rand()%200;
	PCN4R = rand()%200;
	PCN4G = rand()%200;
	PCN4B = rand()%200;
	PCN5R = rand()%200;
	PCN5G = rand()%200;
	PCN5B = rand()%200;
	PCN6R = rand()%200;
	PCN6G = rand()%200;
	PCN6B = rand()%200;
	PCN7R = rand()%200;
	PCN7G = rand()%200;
	PCN7B = rand()%200;
	PCN8R = rand()%200;
	PCN8G = rand()%200;
	PCN8B = rand()%200;
	srand(GetTickCount());

//Planet Size Variation
	PSV1 = rand()%1500;
	PSV11 = (float)PSV1/1000;
	PSV2 = rand()%1500;
	PSV22 = (float)PSV2/1000;
	PSV3 = rand()%1500;
	PSV33 = (float)PSV3/1000;
	PSV4 = rand()%1500;
	PSV44 = (float)PSV4/1000;
	PSV5 = rand()%1500;
	PSV55 = (float)PSV5/1000;
	PSV6 = rand()%1500;
	PSV66 = (float)PSV6/1000;
	PSV7 = rand()%1500;
	PSV77 = (float)PSV7/1000;
	PSV8 = rand()%1500;
	PSV88 = (float)PSV8/1000;

//Moon Color Numbers...
	MCN1R = rand()%50 + 100;
	MCN1G = rand()%50 + 100;
	MCN1B = rand()%50 + 100;
	MCN2R = rand()%50 + 100;
	MCN2G = rand()%50 + 100;
	MCN2B = rand()%50 + 100;
	MCN3R = rand()%50 + 100;
	MCN3G = rand()%50 + 100;
	MCN3B = rand()%50 + 100;
	MCN4R = rand()%50 + 100;
	MCN4G = rand()%50 + 100;
	MCN4B = rand()%50 + 100;
	MCN5R = rand()%50 + 100;
	MCN5G = rand()%50 + 100;
	MCN5B = rand()%50 + 100;
	MCN6R = rand()%50 + 100;
	MCN6G = rand()%50 + 100;
	MCN6B = rand()%50 + 100;
	MCN7R = rand()%50 + 100;
	MCN7G = rand()%50 + 100;
	MCN7B = rand()%50 + 100;
	MCN8R = rand()%50 + 100;
	MCN8G = rand()%50 + 100;
	MCN8B = rand()%50 + 100;

//Moon Size Variation
	MSV1 = rand()%1000;
	MSV11 = (float)MSV1/1000;
	MSV2 = rand()%1000;
	MSV22 = (float)MSV2/1000;
	MSV3 = rand()%1000;
	MSV33 = (float)MSV3/1000;
	MSV4 = rand()%1000;
	MSV44 = (float)MSV4/1000;
	MSV5 = rand()%1000;
	MSV55 = (float)MSV5/1000;
	MSV6 = rand()%1000;
	MSV66 = (float)MSV6/1000;
	MSV7 = rand()%1000;
	MSV77 = (float)MSV7/1000;
	MSV8 = rand()%1000;
	MSV88 = (float)MSV8/1000;

//Moons speed variation
	float MSpd1 = 5.0f + rand()%5000;
	MSpd11 = (float)MSpd1/1000;
	float MSpd2 = 4.8f + rand()%5000;
	MSpd22 = (float)MSpd2/1000;
	float MSpd3 = 4.6f + rand()%5000;
	MSpd33 = (float)MSpd3/1000;
	float MSpd4 = 4.4f + rand()%5000;
	MSpd44 = (float)MSpd4/1000;
	float MSpd5 = 4.2f + rand()%5000;
	MSpd55 = (float)MSpd5/1000;
	float MSpd6 = 4.0f + rand()%5000;
	MSpd66 = (float)MSpd6/1000;
	float MSpd7 = 3.8f + rand()%5000;
	MSpd77 = (float)MSpd7/1000;
	float MSpd8 = 3.6f + rand()%5000;
	MSpd88 = (float)MSpd8/1000;
}


// Called to draw scene
void RenderScene(void)
	{
	// Angle of revolution around the Sun
	static float fPElect1 = 0.0f;
	static float fPElect2 = 0.0f;
	static float fPElect3 = 0.0f;
	static float fPElect4 = 0.0f;
	static float fPElect5 = 0.0f;
	static float fPElect6 = 0.0f;
	static float fPElect7 = 0.0f;
	static float fPElect8 = 0.0f;
	// Angle of revolution around the Planets
	static float fMElect1 = 0.0f;
	static float fMElect2 = 0.0f;
	static float fMElect3 = 0.0f;
	static float fMElect4 = 0.0f;
	static float fMElect5 = 0.0f;
	static float fMElect6 = 0.0f;
	static float fMElect7 = 0.0f;
	static float fMElect8 = 0.0f;
	// Clear the window with current clearing color
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	// Red Nucleus
	glPushMatrix();
		glRotatef(xRot, 1.0f, 0.0f, 0.0f);
		glRotatef(yRot, 0.0f, 0.0f, 1.0f);
		glColor3ub(0, 200, 0);
		glBegin(GL_LINES);
			for(GLfloat iLine = -200.0f; iLine <= 200.0f; iLine += 10.0f)
			{
				glVertex3f(200.0f, iLine, 0.0f);    // Draw Z lines
				glVertex3f(-200.0f, iLine, 0.0f);
    
				glVertex3f(iLine, 200.0f, 0.0f);
				glVertex3f(iLine, -200.0f, 0.0f);
			}
		glEnd();
		glDisable(GL_LIGHTING);
		glColor3ub(200, 255, 200);
		glutSolidSphere(12.0f, 15, 15);
		glEnable(GL_LIGHTING);
		//Planets Orbit lines...
		glColor3ub(0,0,150);
			//Planet Orbit one
			glPushMatrix();
			glTranslatef(0.0f, 0.0f, 0.0f);
			glRotatef(fPElect1, 0.0f, 0.0f + (PSV11/3), 1.0f);
			gltDrawTorus(20.0f+(PSV11*4)-((1.0f+PSV11)/2),0.2f, 150, 15);
			glPopMatrix();
			//Planet Orbit two
			glPushMatrix();
			glTranslatef(0.0f, 0.0f, 0.0f);
			glRotatef(fPElect2, 0.0f, 0.0f + (PSV22/3), 1.0f);
			gltDrawTorus(35.0f+(PSV22*4)-((1.0f+PSV22)/2),0.2f, 150, 15);
			glPopMatrix();
			//Planet Orbit three
			glPushMatrix();
			glTranslatef(0.0f, 0.0f, 0.0f);
			glRotatef(fPElect3, 0.0f, 0.0f + (PSV33/3), 1.0f);
			gltDrawTorus(50.0f+(PSV33*4)-((1.0f+PSV33)/2),0.2f, 150, 15);
			glPopMatrix();
			//Planet Orbit four
			glPushMatrix();
			glTranslatef(0.0f, 0.0f, 0.0f);
			glRotatef(fPElect4, 0.0f, 0.0f + (PSV44/3), 1.0f);
			gltDrawTorus(65.0f+(PSV44*4)-((1.0f+PSV44)/2),0.2f, 150, 15);
			glPopMatrix();
			//Planet Orbit five
			glPushMatrix();
			glTranslatef(0.0f, 0.0f, 0.0f);
			glRotatef(fPElect5, 0.0f, 0.0f + (PSV55/3), 1.0f);
			gltDrawTorus(80.0f+(PSV55*4)-((1.0f+PSV55)/2),0.2f, 150, 15);
			glPopMatrix();
			//Planet Orbit six
			glPushMatrix();
			glTranslatef(0.0f, 0.0f, 0.0f);
			glRotatef(fPElect6, 0.0f, 0.0f + (PSV66/3), 1.0f);
			gltDrawTorus(95.0f+(PSV66*4)-((1.0f+PSV66)/2),0.2f, 150, 15);
			glPopMatrix();
			//Planet Orbit seven
			glPushMatrix();
			glTranslatef(0.0f, 0.0f, 0.0f);
			glRotatef(fPElect7, 0.0f, 0.0f + (PSV77/3), 1.0f);
			gltDrawTorus(110.0f+(PSV77*4)-((1.0f+PSV77)/2),0.2f, 150, 15);
			glPopMatrix();
			//Planet Orbit eight
			glPushMatrix();
			glTranslatef(0.0f, 0.0f, 0.0f);
			glRotatef(fPElect8, 0.0f, 0.0f + (PSV88/3), 1.0f);
			gltDrawTorus(125.0f+(PSV88*4)-((1.0f+PSV88)/2),0.2f, 150, 15);
			glPopMatrix();
		// Yellow Electrons
		glColor3ub(PCN1R,PCN1G,PCN1B);

		// First Electron Orbit
		// Save viewing transformation
		glPushMatrix();

		// Rotate by angle of revolution
		glRotatef(fPElect1, 0.0f, 0.0f + (PSV11/3), 1.0f);

		// Translate out from origin to orbit distance
		glTranslatef(20.0f+(PSV11*2), 0.0f, 0.0f);

		// Draw the electron
		glutSolidSphere(1.0f+PSV11, 15, 15);
			
		//Moons on planet
			glColor3ub(MCN1R,MCN1G,MCN1B);
			glPushMatrix();
			glRotatef(fMElect1, 0.0f, 0.0f + (MSV11*5), 1.0f);
			glTranslatef(3.0f+(MSV11*2), 0.0f, 0.0f);
			glutSolidSphere(0.1f+MSV11, 15, 15);
			glPopMatrix();

		// Restore the viewing transformation
		glPopMatrix();

		glColor3ub(PCN2R,PCN2G,PCN2B);
		// Second Planet Orbit
		glPushMatrix();
		//glRotatef(45.0f, 0.0f, 0.0f, 1.0f);
		glRotatef(fPElect2, 0.0f,  0.0f + (PSV22/3), 1.0f);
		glTranslatef(35.0f+(PSV22*2), 0.0f, 0.0f);
		glutSolidSphere(1.0f+PSV22, 15, 15);
			glColor3ub(MCN1R,MCN1G,MCN1B);
			glPushMatrix();
			glRotatef(fMElect2, 0.0f, 0.0f + (MSV22*5), 1.0f);
			glTranslatef(3.0f+(MSV22*2), 0.0f, 0.0f);
			glutSolidSphere(0.1f+MSV22, 15, 15);
			glPopMatrix();
		glPopMatrix();

		glColor3ub(PCN3R,PCN3G,PCN3B);
		// Third Electron Orbit
		glPushMatrix();
		//glRotatef(360.0f-45.0f,0.0f, 0.0f, 1.0f);
		glRotatef(fPElect3, 0.0f, 0.0f + (PSV33/3), 1.0f);
		glTranslatef(50.0f+(PSV33*2), 0.0f, 0.0f);
		glutSolidSphere(1.0f+PSV33, 15, 15);
			glColor3ub(MCN3R,MCN3G,MCN3B);
			glPushMatrix();
			glRotatef(fMElect3, 0.0f, 0.0f + (MSV33*5), 1.0f);
			glTranslatef(3.0f+(MSV33*2), 0.0f, 0.0f);
			glutSolidSphere(0.1f+MSV33, 15, 15);
			glPopMatrix();
		glPopMatrix();

		glColor3ub(PCN4R,PCN4G,PCN4B);
		// Fourth Electron Orbit
		glPushMatrix();
		//glRotatef(360.0f-45.0f,0.0f, 0.0f, 1.0f);
		glRotatef(fPElect4, 0.0f, 0.0f + (PSV44/3), 1.0f);
		glTranslatef(65.0f+(PSV44*2), 0.0f, 0.0f);
		glutSolidSphere(1.0f+PSV44, 15, 15);
			glColor3ub(MCN4R,MCN4G,MCN4B);
			glPushMatrix();
			glRotatef(fMElect4, 0.0f, 0.0f + (MSV44*5), 1.0f);
			glTranslatef(3.0f+(MSV44*2), 0.0f, 0.0f);
			glutSolidSphere(0.1f+MSV44, 15, 15);
			glPopMatrix();
		glPopMatrix();

		glColor3ub(PCN5R,PCN5G,PCN5B);
		// Fith Electron Orbit
		glPushMatrix();
		//glRotatef(360.0f-45.0f,0.0f, 0.0f, 1.0f);
		glRotatef(fPElect5, 0.0f, 0.0f + (PSV55/3), 1.0f);
		glTranslatef(80.0f+(PSV55*2), 0.0f, 0.0f);
		glutSolidSphere(1.0f+PSV55, 15, 15);
			glColor3ub(MCN5R,MCN5G,MCN5B);
			glPushMatrix();
			glRotatef(fMElect5, 0.0f, 0.0f + (MSV55*5), 1.0f);
			glTranslatef(3.0f+(MSV55*2), 0.0f, 0.0f);
			glutSolidSphere(0.1f+MSV55, 15, 15);
			glPopMatrix();
		glPopMatrix();

		glColor3ub(PCN6R,PCN6G,PCN6B);
		// Sixth Electron Orbit
		glPushMatrix();
		//glRotatef(360.0f-45.0f,0.0f, 0.0f, 1.0f);
		glRotatef(fPElect6, 0.0f, 0.0f + (PSV66/3), 1.0f);
		glTranslatef(95.0f+(PSV66*2), 0.0f, 0.0f);
		glutSolidSphere(1.0f+PSV66, 15, 15);
			glColor3ub(MCN6R,MCN6G,MCN6B);
			glPushMatrix();
			glRotatef(fMElect6, 0.0f, 0.0f + (MSV66*5), 1.0f);
			glTranslatef(3.0f+(MSV66*2), 0.0f, 0.0f);
			glutSolidSphere(0.1f+MSV66, 15, 15);
			glPopMatrix();
		glPopMatrix();

		glColor3ub(PCN7R,PCN7G,PCN7B);
		// Seventh Electron Orbit
		glPushMatrix();
		//glRotatef(360.0f-45.0f,0.0f, 0.0f, 1.0f);
		glRotatef(fPElect7, 0.0f, 0.0f + (PSV77/3), 1.0f);
		glTranslatef(110.0f+(PSV77*2), 0.0f, 0.0f);
		glutSolidSphere(1.0f+PSV77, 15, 15);
			glColor3ub(MCN7R,MCN7G,MCN7B);
			glPushMatrix();
			glRotatef(fMElect7, 0.0f, 0.0f + (MSV77*5), 1.0f);
			glTranslatef(3.0f+(MSV77*2), 0.0f, 0.0f);
			glutSolidSphere(0.1f+MSV77, 15, 15);
			glPopMatrix();
		glPopMatrix();

		glColor3ub(PCN8R,PCN8G,PCN8B);
		// Eighth Electron Orbit
		glPushMatrix();
		//glRotatef(360.0f-45.0f,0.0f, 0.0f, 1.0f);
		glRotatef(fPElect8, 0.0f, 0.0f + (PSV88/3), 1.0f);
		glTranslatef(125.0f+(PSV88*2), 0.0f, 0.0f);
		glutSolidSphere(1.0f+PSV88, 15, 15);
			glColor3ub(MCN8R,MCN8G,MCN8B);
			glPushMatrix();
			glRotatef(fMElect8, 0.0f, 0.0f + (MSV88*5), 1.0f);
			glTranslatef(3.0f+(MSV88*2), 0.0f, 0.0f);
			glutSolidSphere(0.1f+MSV88, 15, 15);
			glPopMatrix();
		glPopMatrix();
	glPopMatrix();

	// Increment the angle of revolution
	fPElect1 += PSpd1;
	if(fPElect1 > 1440.0f)
		fPElect1 = 0.0f;
	
	fPElect2 += PSpd2;
	if(fPElect2 > 1440.0f)
		fPElect2 = 0.0f;

	fPElect3 += PSpd3;
	if(fPElect3 > 1440.0f)
		fPElect3 = 0.0f;

	fPElect4 += PSpd4;
	if(fPElect4 > 1440.0f)
		fPElect4 = 0.0f;

	fPElect5 += PSpd5;
	if(fPElect5 > 1440.0f)
		fPElect5 = 0.0f;

	fPElect6 += PSpd6;
	if(fPElect6 > 1440.0f)
		fPElect6 = 0.0f;

	fPElect7 += PSpd7;
	if(fPElect7 > 1440.0f)
		fPElect7 = 0.0f;

	fPElect8 += PSpd8;
	if(fPElect8 > 1440.0f)
		fPElect8 = 0.0f;
//Moons
	fMElect1 += MSpd11;
	if(fMElect1 > 1440.0f)
		fMElect1 = 0.0f;
	
	fMElect2 += MSpd22;
	if(fMElect2 > 1440.0f)
		fMElect2 = 0.0f;

	fMElect3 += MSpd33;
	if(fMElect3 > 1440.0f)
		fMElect3 = 0.0f;

	fMElect4 += MSpd44;
	if(fMElect4 > 1440.0f)
		fMElect4 = 0.0f;

	fMElect5 += MSpd55;
	if(fMElect5 > 1440.0f)
		fMElect5 = 0.0f;

	fMElect6 += MSpd66;
	if(fMElect6 > 1440.0f)
		fMElect6 = 0.0f;

	fMElect7 += MSpd77;
	if(fMElect7 > 1440.0f)
		fMElect7 = 0.0f;

	fMElect8 += MSpd88;
	if(fMElect8 > 1440.0f)
		fMElect8 = 0.0f;

	if(fPElect1 == fPElect2 && fPElect2 == fPElect3 && fPElect3 == fPElect4 && fPElect4 == fPElect5 && fPElect5 == fPElect6 && fPElect6 == fPElect7 && fPElect7 == fPElect8)
	{
		PSpd1 = 0.0f;
		PSpd2 = 0.0f;
		PSpd3 = 0.0f;
		PSpd4 = 0.0f;
		PSpd5 = 0.0f;
		PSpd6 = 0.0f;
		PSpd7 = 0.0f;
		PSpd8 = 0.0f;
	}
	// Show the image
	glutSwapBuffers();
	}


// This function does any needed initialization on the rendering
// context. 
void SetupRC()
	{	
	GLfloat  whiteLight[] = { 0.2f, 0.2f, 0.2f, 1.0f };
	GLfloat  sourceLight[] = { 0.8f, 0.8f, 0.8f, 1.0f };
	GLfloat	 lightPos[] = { 0.0f, 0.0f, 0.0f, 1.0f };
	glEnable(GL_DEPTH_TEST);	// Hidden surface removal
	glFrontFace(GL_CCW);		// Counter clock-wise polygons face out
	glEnable(GL_CULL_FACE);		// Do not calculate inside of jet
	glEnable(GL_LIGHTING);
	//glLightModelfv(GL_LIGHT_MODEL_AMBIENT,whiteLight);
	glLightfv(GL_LIGHT0,GL_DIFFUSE,sourceLight);
	glLightfv(GL_LIGHT0,GL_POSITION,lightPos);
	glEnable(GL_LIGHT0);
	glEnable(GL_COLOR_MATERIAL);
	glColorMaterial(GL_FRONT,GL_AMBIENT_AND_DIFFUSE);
	// Black background
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f );
	glEnable(GL_NORMALIZE);
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

    // Refresh the Window
    glutPostRedisplay();
    }

void TimerFunc(int value)
    {
    glutPostRedisplay();
    glutTimerFunc(100, TimerFunc, 1);
    }

void ChangeSize(int w, int h)
    {
    GLfloat fAspect;
    //GLfloat lightPos[] = { 1.0f, 1.0f, 1.0f, 1.0f };
    // Prevent a divide by zero
    if(h == 0)
        h = 1;

    // Set Viewport to window dimensions
    glViewport(0, 0, w, h);

    // Reset coordinate system
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();

    fAspect = (float)w/(float)h;
    gluPerspective(45.0, fAspect, 1.0, 500.0);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    glTranslatef(0.0f, 0.0f, -250.0f);
    }

int main(int argc, char* argv[])
	{
	SeedRandNums();
	glutInit(&argc, argv);
	glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB | GLUT_DEPTH);
        glutInitWindowSize(800, 600);
	glutCreateWindow("OpenGL Atom - Part Duex");
	glutReshapeFunc(ChangeSize);
	glutSpecialFunc(SpecialKeys);
	glutDisplayFunc(RenderScene);
        glutTimerFunc(500, TimerFunc, 1);
	SetupRC();
	glutMainLoop();

	return 0;
	}
