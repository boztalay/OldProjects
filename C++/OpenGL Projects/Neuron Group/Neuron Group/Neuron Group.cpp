#include <windows.h>
#include <gltools.h>
#include <math.h>
#include <iostream>

using namespace std;

bool outputArray[4][3] = {{false, false, false},
						  {false, false, false},
					      {false, false, false},
						  {false, false, false}
						 };

bool connecArray[4][3] = {{false, false, false},
						  {false, false, false},
					      {false, false, false},
						  {true , false, false}
						 };

struct Neuron
{
	bool output1;
	bool output2;
	bool output3;

	float PI;

	float inputStr1;
	float inputStr2;
	float inputStr3;

	float inputVal1;
	float inputVal2;
	float inputVal3;

	int con1[2];
	int con2[2];
	int con3[2];

	float x;
	float y;
};

Neuron n1;
Neuron n2;
Neuron n3;
Neuron n4;

bool init = true;
bool mainInFire = false;
float timerX = 90.0;
int x = 0;
int y = 0;

void InitRandomize()
{
	srand(GetTickCount());
	
	//Probabiity Indexes
	n1.PI = 1.00;
	n2.PI = (float)((rand() % 101) / 100);
	n3.PI = (float)((rand() % 101) / 100);
	n4.PI = (float)((rand() % 101) / 100);
	
	//Connection Strengths
	n1.inputStr1 = 10.0;
	n1.inputStr2 = (float)((rand() % 1001) / 100);
	n1.inputStr3 = (float)((rand() % 1001) / 100);

	n2.inputStr1 = (float)((rand() % 1001) / 100);
	n2.inputStr2 = (float)((rand() % 1001) / 100);
	n2.inputStr3 = (float)((rand() % 1001) / 100);

	n3.inputStr1 = (float)((rand() % 1001) / 100);
	n3.inputStr2 = (float)((rand() % 1001) / 100);
	n3.inputStr3 = (float)((rand() % 1001) / 100);

	n4.inputStr1 = (float)((rand() % 1001) / 100);
	n4.inputStr2 = (float)((rand() % 1001) / 100);
	n4.inputStr3 = (float)((rand() % 1001) / 100);

	//Neuron 1 Connection Randomization
	cout << "n1.con1 = " << n1.con1[0] << "," << n1.con1[1] << endl;
	while(1)
	{
		n1.con2[0] = ((rand() % 3) + 1);
		n1.con2[1] = ((rand() % 3));
		if(connecArray[n1.con2[0]][n1.con2[1]] == false)
		{
			connecArray[n1.con2[0]][n1.con2[1]] = true;
			break;
		}
	}
	cout << "n1.con2 = " << n1.con2[0] << "," << n1.con2[1] << endl;
	while(1)
	{
		n1.con3[0] = ((rand() % 3) + 1);
		n1.con3[1] = ((rand() % 3));
		if(connecArray[n1.con3[0]][n1.con3[1]] == false)
		{
			connecArray[n1.con3[0]][n1.con3[1]] = true;
			break;
		}
	}
	cout << "n1.con3 = " << n1.con3[0] << "," << n1.con3[1] << "\n\n";

	//Neuron 2 Connection Randomization
	while(1)
	{
		n2.con1[0] = (rand() % 3);
		if(n2.con1[0] >= 1)
		{
			n2.con1[0]++;
		}

		n2.con1[1] = ((rand() % 3));
		if(connecArray[n2.con1[0]][n2.con1[1]] == false)
		{
			connecArray[n2.con1[0]][n2.con1[1]] = true;
			break;
		}
	}
	cout << "n2.con1 = " << n2.con1[0] << "," << n2.con1[1] << endl;
	while(1)
	{
		n2.con2[0] = (rand() % 3);
		if(n2.con2[0] >= 1)
		{
			n2.con2[0]++;
		}

		n2.con2[1] = ((rand() % 3));
		if(connecArray[n2.con2[0]][n2.con2[1]] == false)
		{
			connecArray[n2.con2[0]][n2.con2[1]] = true;
			break;
		}
	}
	cout << "n2.con2 = " << n2.con2[0] << "," << n2.con2[1] << endl;
	while(1)
	{
		n2.con3[0] = (rand() % 3);
		if(n2.con3[0] >= 1)
		{
			n2.con3[0]++;
		}

		n2.con3[1] = ((rand() % 3));
		if(connecArray[n2.con3[0]][n2.con3[1]] == false)
		{
			connecArray[n2.con3[0]][n2.con3[1]] = true;
			break;
		}
	}
	cout << "n2.con3 = " << n2.con3[0] << "," << n2.con3[1] << "\n\n";

	//Neuron 3 Connection Randomization
	while(1)
	{
		n3.con1[0] = (rand() % 3);
		if(n3.con1[0] >= 2)
		{
			n3.con1[0]++;
		}

		n3.con1[1] = ((rand() % 3));
		if(connecArray[n3.con1[0]][n3.con1[1]] == false)
		{
			connecArray[n3.con1[0]][n3.con1[1]] = true;
			break;
		}
	}
	cout << "n3.con1 = " << n3.con1[0] << "," << n3.con1[1] << endl;
	while(1)
	{
		n3.con2[0] = (rand() % 3);
		if(n3.con2[0] >= 2)
		{
			n3.con2[0]++;
		}

		n3.con2[1] = ((rand() % 3));
		if(connecArray[n3.con2[0]][n3.con2[1]] == false)
		{
			connecArray[n3.con2[0]][n3.con2[1]] = true;
			break;
		}
	}
	cout << "n3.con2 = " << n3.con2[0] << "," << n3.con2[1] << endl;
	while(1)
	{
		n3.con3[0] = (rand() % 3);
		if(n3.con3[0] >= 2)
		{
			n3.con3[0]++;
		}

		n3.con3[1] = ((rand() % 3));
		if(connecArray[n3.con3[0]][n3.con3[1]] == false)
		{
			connecArray[n3.con3[0]][n3.con3[1]] = true;
			break;
		}
	}
	cout << "n3.con3 = " << n3.con3[0] << "," << n3.con3[1] << "\n\n";

	//Neuron 4 Connection Randomization
	while(1)
	{
		n4.con1[0] = (rand() % 3);
		n4.con1[1] = ((rand() % 3));
		if(connecArray[n4.con1[0]][n4.con1[1]] == false)
		{
			connecArray[n4.con1[0]][n4.con1[1]] = true;
			break;
		}
	}
	cout << "n4.con1 = " << n4.con1[0] << "," << n4.con1[1] << endl;
	while(1)
	{
		n4.con2[0] = (rand() % 3);
		n4.con2[1] = ((rand() % 3));
		if(connecArray[n4.con2[0]][n4.con2[1]] == false)
		{
			connecArray[n4.con2[0]][n4.con2[1]] = true;
			break;
		}
	}
	cout << "n4.con2 = " << n4.con2[0] << "," << n4.con2[1] << endl;
	for(x = 0; x < 4; x++)
	{
		for(y = 0; y < 3; y++)
		{
			if(connecArray[x][y] == false)
			{
				n4.con3[0] = x;
				n4.con3[1] = y;
				connecArray[x][y] = true;
				break;
			}
		}
	}
	cout << "n4.con3 = " << n4.con3[0] << "," << n4.con3[1] << "\n\n";
	cout << "Randomization Complete!\n\n";

	n1.x = 0.0;
	n1.y = -75.0;

	n2.x = -75.0;
	n2.y = 0.0;

	n3.x = 75.0;
	n3.y = 0.0;
	
	n4.x = 0.0;
	n4.y = 75.0;
}

void CalcProbOutputs()
{
	float probability = 0.0f;
	
	//Neuron 1 Output Calculations
	probability = (n1.inputVal1 * n1.PI);
	if(((rand() % 100) + 1) <= probability)
	{
		outputArray[0][0] = true;
	}
	else
	{
		outputArray[0][0] = false;
	}
	probability = (n1.inputVal2 * n1.PI);
	if(((rand() % 100) + 1) <= probability)
	{
		outputArray[0][1] = true;
	}
	else
	{
		outputArray[0][1] = false;
	}
	probability = (n1.inputVal3 * n1.PI);
	if(((rand() % 100) + 1) <= probability)
	{
		outputArray[0][2] = true;
	}
	else
	{
		outputArray[0][2] = false;
	}

	//Neuron 2 Output Calculations
	probability = (n2.inputVal1 * n2.PI);
	if(((rand() % 100) + 1) <= probability)
	{
		outputArray[1][0] = true;
	}
	else
	{
		outputArray[1][0] = false;
	}
	probability = (n2.inputVal2 * n2.PI);
	if(((rand() % 100) + 1) <= probability)
	{
		outputArray[1][1] = true;
	}
	else
	{
		outputArray[1][1] = false;
	}
	probability = (n2.inputVal3 * n2.PI);
	if(((rand() % 100) + 1) <= probability)
	{
		outputArray[1][2] = true;
	}
	else
	{
		outputArray[1][2] = false;
	}

	//Neuron 3 Output Calculations
	probability = (n3.inputVal1 * n3.PI);
	if(((rand() % 100) + 1) <= probability)
	{
		outputArray[2][0] = true;
	}
	else
	{
		outputArray[2][0] = false;
	}
	probability = (n3.inputVal2 * n3.PI);
	if(((rand() % 100) + 1) <= probability)
	{
		outputArray[2][1] = true;
	}
	else
	{
		outputArray[2][1] = false;
	}
	probability = (n3.inputVal3 * n3.PI);
	if(((rand() % 100) + 1) <= probability)
	{
		outputArray[2][2] = true;
	}
	else
	{
		outputArray[2][2] = false;
	}

	//Neuron 4 Output Calculations
	probability = (n4.inputVal1 * n4.PI);
	if(((rand() % 100) + 1) <= probability)
	{
		outputArray[3][0] = true;
	}
	else
	{
		outputArray[3][0] = false;
	}
	probability = (n4.inputVal2 * n4.PI);
	if(((rand() % 100) + 1) <= probability)
	{
		outputArray[3][1] = true;
	}
	else
	{
		outputArray[3][1] = false;
	}
	probability = (n4.inputVal3 * n4.PI);
	if(((rand() % 100) + 1) <= probability)
	{
		outputArray[3][2] = true;
	}
	else
	{
		outputArray[3][2] = false;
	}
}

void CalcRandomFires()
{
	int n = 0;
	int o = 0;

	srand(GetTickCount());

	for(n = 0; n < 4; n++)
	{
		for(o = 0; o < 3; o++)
		{
			if(((rand() % 25) + 1) == 1)
			{
				outputArray[n][o] = true;
			}
		}
	}
}

void UpdatePIs()
{
	if((outputArray[0][0] == true) || (outputArray[0][1] == true) || (outputArray[0][2] == true))
	{
		n1.PI += 0.15;
		if(n1.PI > 1.00)
			n1.PI = 1.00;
	}
	else
	{
		n1.PI -= 0.02;
		if(n1.PI < 0.00)
			n1.PI = 0.00;
	}

	if((outputArray[1][0] == true) || (outputArray[1][1] == true) || (outputArray[1][2] == true))
	{
		n2.PI += 0.15;
		if(n2.PI > 1.00)
			n2.PI = 1.00;
	}
	else
	{
		n2.PI -= 0.02;
		if(n2.PI < 0.00)
			n2.PI = 0.00;
	}

	if((outputArray[2][0] == true) || (outputArray[2][1] == true) || (outputArray[2][2] == true))
	{
		n3.PI += 0.15;
		if(n3.PI > 1.00)
			n3.PI = 1.00;
	}
	else
	{
		n3.PI -= 0.02;
		if(n3.PI < 0.00)
			n3.PI = 0.00;
	}

	if((outputArray[3][0] == true) || (outputArray[3][1] == true) || (outputArray[3][2] == true))
	{
		n4.PI += 0.15;
		if(n4.PI > 1.00)
			n4.PI = 1.00;
	}
	else
	{
		n4.PI -= 0.02;
		if(n4.PI < 0.00)
			n4.PI = 0.00;
	}
}

void CalcInputValues()
{
	//Reset Input Values
	n1.inputVal1 = 0.0;
	n1.inputVal2 = 0.0;
	n1.inputVal3 = 0.0;

	n2.inputVal1 = 0.0;
	n2.inputVal2 = 0.0;
	n2.inputVal3 = 0.0;

	n3.inputVal1 = 0.0;
	n3.inputVal2 = 0.0;
	n3.inputVal3 = 0.0;

	n4.inputVal1 = 0.0;
	n4.inputVal2 = 0.0;
	n4.inputVal3 = 0.0;

	//Neuron 1
	if(mainInFire == true)
	{
		n1.inputVal1 = (10 * n1.inputStr1);
	}
	if(outputArray[n1.con2[0]][n1.con2[1]] == true)
	{
		n1.inputVal2 = (10 * n1.inputStr2);
	}
	if(outputArray[n1.con3[0]][n1.con3[1]] == true)
	{
		n1.inputVal3 = (10 * n1.inputStr3);
	}

	//Neuron 2
	if(outputArray[n2.con1[0]][n2.con1[1]] == true)
	{
		n2.inputVal1 = (10 * n1.inputStr1);
	}
	if(outputArray[n2.con2[0]][n2.con2[1]] == true)
	{
		n2.inputVal2 = (10 * n1.inputStr2);
	}
	if(outputArray[n2.con3[0]][n2.con3[1]] == true)
	{
		n2.inputVal3 = (10 * n1.inputStr3);
	}

	//Neuron 3
	if(outputArray[n3.con1[0]][n3.con1[1]] == true)
	{
		n3.inputVal1 = (10 * n1.inputStr1);
	}
	if(outputArray[n3.con2[0]][n3.con2[1]] == true)
	{
		n3.inputVal2 = (10 * n1.inputStr2);
	}
	if(outputArray[n3.con3[0]][n3.con3[1]] == true)
	{
		n3.inputVal3 = (10 * n1.inputStr3);
	}

	//Neuron 4
	if(outputArray[n4.con1[0]][n4.con1[1]] == true)
	{
		n4.inputVal1 = (10 * n1.inputStr1);
	}
	if(outputArray[n4.con2[0]][n4.con2[1]] == true)
	{
		n4.inputVal2 = (10 * n1.inputStr2);
	}
	if(outputArray[n4.con3[0]][n4.con3[1]] == true)
	{
		n4.inputVal3 = (10 * n1.inputStr3);
	}
}

void UpdateConnStr()
{
	//Neuron 1
	if(mainInFire == true)
	{
		n1.inputStr1 += 0.75;
		if(n1.inputStr1 > 10.00)
			n1.inputStr1 = 10.00;
	}
	else
	{
		n1.inputStr1 -= 0.10;
		if(n1.inputStr1 < 0.00)
			n1.inputStr1 = 0.00;
	}
	if(outputArray[0][1] == true)
	{
		n1.inputStr1 += 0.75;
		if(n1.inputStr1 > 10.00)
			n1.inputStr1 = 10.00;
	}
	else
	{
		n1.inputStr1 -= 0.10;
		if(n1.inputStr1 < 0.00)
			n1.inputStr1 = 0.00;
	}
	if(outputArray[0][2] == true)
	{
		n1.inputStr1 += 0.75;
		if(n1.inputStr1 > 10.00)
			n1.inputStr1 = 10.00;
	}
	else
	{
		n1.inputStr1 -= 0.10;
		if(n1.inputStr1 < 0.00)
			n1.inputStr1 = 0.00;
	}

	//Neuron 2
	if(outputArray[0][0] == true)
	{
		n2.inputStr1 += 0.75;
		if(n2.inputStr1 > 10.00)
			n2.inputStr1 = 10.00;
	}
	else
	{
		n2.inputStr1 -= 0.10;
		if(n2.inputStr1 < 0.00)
			n2.inputStr1 = 0.00;
	}
	if(outputArray[0][1] == true)
	{
		n2.inputStr1 += 0.75;
		if(n2.inputStr1 > 10.00)
			n2.inputStr1 = 10.00;
	}
	else
	{
		n2.inputStr1 -= 0.10;
		if(n2.inputStr1 < 0.00)
			n2.inputStr1 = 0.00;
	}
	if(outputArray[0][2] == true)
	{
		n2.inputStr1 += 0.75;
		if(n2.inputStr1 > 10.00)
			n2.inputStr1 = 10.00;
	}
	else
	{
		n2.inputStr1 -= 0.10;
		if(n2.inputStr1 < 0.00)
			n2.inputStr1 = 0.00;
	}

	//Neuron 3
	if(outputArray[0][0] == true)
	{
		n3.inputStr1 += 0.75;
		if(n3.inputStr1 > 10.00)
			n3.inputStr1 = 10.00;
	}
	else
	{
		n3.inputStr1 -= 0.10;
		if(n3.inputStr1 < 0.00)
			n3.inputStr1 = 0.00;
	}
	if(outputArray[0][1] == true)
	{
		n3.inputStr1 += 0.75;
		if(n3.inputStr1 > 10.00)
			n3.inputStr1 = 10.00;
	}
	else
	{
		n3.inputStr1 -= 0.10;
		if(n3.inputStr1 < 0.00)
			n3.inputStr1 = 0.00;
	}
	if(outputArray[0][2] == true)
	{
		n3.inputStr1 += 0.75;
		if(n3.inputStr1 > 10.00)
			n3.inputStr1 = 10.00;
	}
	else
	{
		n3.inputStr1 -= 0.10;
		if(n3.inputStr1 < 0.00)
			n3.inputStr1 = 0.00;
	}

	//Neuron 4
	if(outputArray[0][0] == true)
	{
		n4.inputStr1 += 0.75;
		if(n4.inputStr1 > 10.00)
			n4.inputStr1 = 10.00;
	}
	else
	{
		n4.inputStr1 -= 0.10;
		if(n4.inputStr1 < 0.00)
			n4.inputStr1 = 0.00;
	}
	if(outputArray[0][1] == true)
	{
		n4.inputStr1 += 0.75;
		if(n4.inputStr1 > 10.00)
			n4.inputStr1 = 10.00;
	}
	else
	{
		n4.inputStr1 -= 0.10;
		if(n4.inputStr1 < 0.00)
			n4.inputStr1 = 0.00;
	}
	if(outputArray[0][2] == true)
	{
		n4.inputStr1 += 0.75;
		if(n4.inputStr1 > 10.00)
			n4.inputStr1 = 10.00;
	}
	else
	{
		n4.inputStr1 -= 0.10;
		if(n4.inputStr1 < 0.00)
			n4.inputStr1 = 0.00;
	}
}

void SetupRC()
{
    glEnable(GL_DEPTH_TEST);
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f );
}

void RenderScene(void)
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	if(init == true)
	{
		InitRandomize();
	}

	//Draw the Neurons
	if(init == true)
		cout << "Drawing Neurons...\n";
	Sleep(500);
	glColor3f(0.0, 1.0, 0.0);
	glPushMatrix();
		glTranslatef(n1.x, n1.y, 0.0);
		glutSolidSphere(5.0, 15.0, 15.0);
	glPopMatrix();
	glPushMatrix();
		glTranslatef(n2.x, n2.y, 0.0);
		glutSolidSphere(5.0, 15.0, 15.0);
	glPopMatrix();
	glPushMatrix();
		glTranslatef(n3.x, n3.y, 0.0);
		glutSolidSphere(5.0, 15.0, 15.0);
	glPopMatrix();
	glPushMatrix();
		glTranslatef(n4.x, n4.y, 0.0);
		glutSolidSphere(5.0, 15.0, 15.0);
	glPopMatrix();
	glBegin(GL_LINES);
		glVertex2f((n1.x - 10.0), n1.y);
		glVertex2f((n1.x + 10.0), n1.y);

		glVertex2f(n1.x, (n1.y - 10.0));
		glVertex2f(n1.x, (n1.y + 10.0));

		glVertex2f((n2.x - 10.0), n2.y);
		glVertex2f((n2.x + 10.0), n2.y);

		glVertex2f(n2.x, (n2.y - 10.0));
		glVertex2f(n2.x, (n2.y + 10.0));

		glVertex2f((n3.x - 10.0), n3.y);
		glVertex2f((n3.x + 10.0), n3.y);

		glVertex2f(n3.x, (n3.y - 10.0));
		glVertex2f(n3.x, (n3.y + 10.0));

		glVertex2f((n4.x - 10.0), n4.y);
		glVertex2f((n4.x + 10.0), n4.y);

		glVertex2f(n4.x, (n4.y - 10.0));
		glVertex2f(n4.x, (n4.y + 10.0));
	glEnd();
	if(init == true)
		cout << "Done!\n\n";

	//Draw the Connections
	if(init == true)
		cout << "Drawing Connections...\n";
	glColor3f(0.5, 0.5, 0.5);
	glBegin(GL_LINES);
		//Connections between Neuron 1 and others
		if(mainInFire == true)
			glColor3f(1.0, 1.0, 0.0);
		glVertex2f(n1.x, n1.y);
		glVertex2f((n1.x - 20.0), (n1.y - 20.0));
		glColor3f(0.5, 0.5, 0.5);

		if(outputArray[n1.con2[0]][n1.con2[1]] == true)
			glColor3f(1.0, 1.0, 0.0);
		glVertex2f(n1.x, n1.y);
		switch(n1.con2[0])
		{
			case 1:
				glVertex2f((n2.x - 10.0), n2.y);
				break;
			case 2:
				glVertex2f((n3.x - 10.0), n3.y);
				break;
			case 3:
				glVertex2f((n4.x - 10.0), n4.y);
				break;
			default:
				break;
		}
		glColor3f(0.5, 0.5, 0.5);

		if(outputArray[n1.con3[0]][n1.con3[1]] == true)
			glColor3f(1.0, 1.0, 0.0);
		glVertex2f(n1.x, n1.y);
		switch(n1.con3[0])
		{
			case 1:
				glVertex2f((n2.x + 10.0), n2.y);
				break;
			case 2:
				glVertex2f((n3.x + 10.0), n3.y);
				break;
			case 3:
				glVertex2f((n4.x + 10.0), n4.y);
				break;
			default:
				break;
		}
		glColor3f(0.5, 0.5, 0.5);

		//Connections between Neuron 2 and others
		if(outputArray[n2.con1[0]][n2.con1[1]] == true)
			glColor3f(1.0, 1.0, 0.0);
		glVertex2f(n2.x, n2.y);
		switch(n2.con1[0])
		{
			case 0:
				glVertex2f(n1.x, (n1.y - 10.0));
				break;
			case 2:
				glVertex2f(n3.x, (n3.y - 10.0));
				break;
			case 3:
				glVertex2f(n4.x, (n4.y - 10.0));
				break;
			default:
				break;
		}
		glColor3f(0.5, 0.5, 0.5);

		if(outputArray[n2.con2[0]][n2.con2[1]] == true)
			glColor3f(1.0, 1.0, 0.0);
		glVertex2f(n2.x, n2.y);
		switch(n2.con2[0])
		{
			case 0:
				glVertex2f((n1.x - 10.0), n1.y);
				break;
			case 2:
				glVertex2f(n3.x, (n3.y + 5.0));
				break;
			case 3:
				glVertex2f((n4.x - 10.0), n4.y);
				break;
			default:
				break;
		}
		glColor3f(0.5, 0.5, 0.5);

		if(outputArray[n2.con3[0]][n2.con3[1]] == true)
			glColor3f(1.0, 1.0, 0.0);
		glVertex2f(n2.x, n2.y);
		switch(n2.con3[0])
		{
			case 0:
				glVertex2f(n1.x, (n1.y + 10.0));
				break;
			case 2:
				glVertex2f(n3.x, (n3.y + 10.0));
				break;
			case 3:
				glVertex2f(n4.x, (n4.y + 10.0));
				break;
			default:
				break;
		}
		glColor3f(0.5, 0.5, 0.5);

	//Connections between Neuron 3 and others
		if(outputArray[n3.con1[0]][n3.con1[1]] == true)
			glColor3f(1.0, 1.0, 0.0);
		glVertex2f(n3.x, n3.y);
		switch(n3.con1[0])
		{
			case 0:
				glVertex2f(n1.x, (n1.y - 10.0));
				break;
			case 1:
				glVertex2f(n2.x, (n2.y - 10.0));
				break;
			case 3:
				glVertex2f(n4.x, (n4.y - 10.0));
				break;
			default:
				break;
		}
		glColor3f(0.5, 0.5, 0.5);

		if(outputArray[n3.con2[0]][n3.con2[1]] == true)
			glColor3f(1.0, 1.0, 0.0);
		glVertex2f(n3.x, n3.y);
		switch(n3.con2[0])
		{
			case 0:
				glVertex2f((n1.x - 10.0), n1.y);
				break;
			case 1:
				glVertex2f(n2.x, (n2.y + 5.0));
				break;
			case 3:
				glVertex2f((n4.x - 10.0), n4.y);
				break;
			default:
				break;
		}
		glColor3f(0.5, 0.5, 0.5);

		if(outputArray[n3.con3[0]][n3.con3[1]] == true)
			glColor3f(1.0, 1.0, 0.0);
		glVertex2f(n3.x, n3.y);
		switch(n3.con3[0])
		{
			case 0:
				glVertex2f(n1.x, (n1.y + 10.0));
				break;
			case 1:
				glVertex2f(n2.x, (n2.y + 10.0));
				break;
			case 3:
				glVertex2f(n4.x, (n4.y + 10.0));
				break;
			default:
				break;
		}
		glColor3f(0.5, 0.5, 0.5);

		//Connections between Neuron 4 and others
		if(outputArray[n4.con1[0]][n4.con1[1]] == true)
			glColor3f(1.0, 1.0, 0.0);
		glVertex2f(n4.x, n4.y);
		switch(n4.con1[0])
		{
			case 0:
				glVertex2f((n1.x + 5.0), n1.y);
				break;
			case 1:
				glVertex2f(n2.x, (n2.y - 10.0));
				break;
			case 2:
				glVertex2f(n3.x, (n3.y - 10.0));
				break;
			default:
				break;
		}
		glColor3f(0.5, 0.5, 0.5);

		if(outputArray[n4.con2[0]][n4.con2[1]] == true)
			glColor3f(1.0, 1.0, 0.0);
		glVertex2f(n4.x, n4.y);
		switch(n4.con2[0])
		{
			case 0:
				glVertex2f((n1.x - 10.0), n1.y);
				break;
			case 1:
				glVertex2f((n2.x - 10.0), n2.y);
				break;
			case 2:
				glVertex2f((n3.x - 10.0), n3.y);
				break;
			default:
				break;
		}
		glColor3f(0.5, 0.5, 0.5);

		if(outputArray[n4.con3[0]][n4.con3[1]] == true)
			glColor3f(1.0, 1.0, 0.0);
		glVertex2f(n4.x, n4.y);
		switch(n4.con3[0])
		{
			case 0:
				glVertex2f((n1.x + 10.0), n1.y);
				break;
			case 1:
				glVertex2f((n2.x + 10.0), n2.y);
				break;
			case 2:
				glVertex2f((n3.x + 10.0), n3.y);
				break;
			default:
				break;
		}
		glColor3f(0.5, 0.5, 0.5);
	glEnd();
	glBegin(GL_LINES);
		if(outputArray[3][0] == true)
			glColor3f(1.0, 1.0, 0.0);
		glVertex2f(n4.x, n4.y);
		glVertex2f((n4.x + 20.0), (n4.y + 20.0));
	glEnd();
	if(init == true)
	{
		cout << "Done!\n\n";
		init = false;
	}

	//Various Calulations

	CalcProbOutputs();
	CalcRandomFires();
	UpdatePIs();
	CalcInputValues();
	UpdateConnStr();

	glColor3f(1.0, 0.0, 0.0);
	glPushMatrix();
		glTranslatef(timerX, -90.0, 0.0);
		glutSolidSphere(2.5, 15, 15);
	glPopMatrix();

	timerX += 10.0;
	if(timerX >= 110.0)
		timerX = 90.0;

	mainInFire = false;
   
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
		mainInFire = true;
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
    glutCreateWindow("OpenGl Project");
    glutReshapeFunc(ChangeSize);
    glutDisplayFunc(RenderScene);
	glutSpecialFunc(SpecialKeys);

    SetupRC();
    glutTimerFunc(33, TimerFunction, 1);

    glutMainLoop();

    return 0;
}
