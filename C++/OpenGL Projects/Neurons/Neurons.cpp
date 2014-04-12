#include <windows.h>
#include <iostream>
#include <gl/gl.h>
#include <gl/glut.h>
#include <math.h>

using namespace std;

int   connectionArray[8][8];
float weightArray[8][8];
float inputValArray[8][8];
int   fireArray[8][8];

bool init = true;
bool next = true;

int  input1Strength = 0;
int  input2Strength = 0;
int  input3Strength = 0;
int i1fired = 0;
int i2fired = 0;
int i3fired = 0;
int i1x = -350;
int i1y = 400;
int i2x = 0;
int i2y = 400;
int i3x = 350;
int i3y = 400;

int o1x = -350;
int o1y = -400;
int o2x = 0;
int o2y = -400;
int o3x = 350;
int o3y = -400;

struct Neuron
{
       float thresholdNorm;
       float threshold;
       
       int fireStrength;
       
       float inputSum;
       
       int fired;
       
       int x;
       int y;
};

Neuron n1;
Neuron n2;
Neuron n3;
Neuron n4;
Neuron n5;


void gotoxy ( short x, short y )
{
  COORD coord = {x, y};
  SetConsoleCursorPosition ( GetStdHandle ( STD_OUTPUT_HANDLE ), coord );
}


void Init()
{
     int x = 0;
     int y = 0;
     
     bool set = false;
     
     srand(GetTickCount());
     
     //Initialization of connectionArray    
     for(x = 0; x < 5; x++)
     {
           for(y = 0; y < 5; y++)
           {
                 connectionArray[x][y] = (rand() % 2);
           }
     }
     
     for(x = 5; x < 8; x++)
     {
           set = false;
           for(y = (rand() % 4); y < 5; y++)
           {
                 connectionArray[x][y] = (rand() % 2);
                 if(connectionArray[x][y] == 1)
                 {
                      set = true;
                      weightArray[x][y] = 3.00;
                      break;
                 }
           }
           if(set == false)
           {
                  connectionArray[x][y - 1] = 1;
           }
     }
     
     for(y = 5; y < 8; y++)
     {
           set = false;
           for(x = (rand() % 4); x < 5; x++)
           {
                 connectionArray[x][y] = (rand() % 2);
                 if(connectionArray[x][y] == 1)
                 {
                      set = true;
                      break;
                 }
           }
           if(set == false)
           {
                  connectionArray[x - 1][y] = 1;
           }
     }
     

     x = 0;
     y = 0;
     
     while(x < 8)
     {
             connectionArray[x][y] = 0;
             x++;
             y++;
     }
     
     connectionArray[6][5] = 0;
     connectionArray[7][5] = 0;
     connectionArray[5][6] = 0;
     connectionArray[7][6] = 0;
     connectionArray[5][7] = 0;
     connectionArray[6][7] = 0;
     
     //Initialization of weightArray
     
     for(int x = 0; x < 8; x++)
     {
             for(int y = 0; y < 8; y++)
             {
                     weightArray[x][y] = (float)(((rand() % 301) / 100) * connectionArray[x][y]);
             }
     }
     
     //Initialization of neuron thresholds and firing strengths
     
     //Neuron 1
     n1.thresholdNorm = (rand() % 21);
     n1.fireStrength = (rand() % 21);
     n1.threshold = n1.thresholdNorm;
     
     //Neuron 2
     n2.thresholdNorm = (rand() % 21);
     n2.fireStrength = (rand() % 21);
     n2.threshold = n2.thresholdNorm;
     
     //Neuron 3
     n3.thresholdNorm = (rand() % 21);
     n3.fireStrength = (rand() % 21);
     n3.threshold = n3.thresholdNorm;
     
     //Neuron 4
     n4.thresholdNorm = (rand() % 21);
     n4.fireStrength = (rand() % 21);
     n4.threshold = n4.thresholdNorm;
     
     //Neuron 5
     n5.thresholdNorm = (rand() % 21);
     n5.fireStrength = (rand() % 21);
     n5.threshold = n5.thresholdNorm;
           
     //Initialize input firing strength values
     
     input1Strength = 50;
     input2Strength = 50;
     input3Strength = 50;
     
     //Initialize Neuron Positions
     
     n1.x = -150;
     n1.y = 175;
     
     n2.x = 150;
     n2.y = 175;
     
     n3.x = -250;
     n3.y = -175;
     
     n4.x = 0;
     n4.y = -175;
     
     n5.x = 250;
     n5.y = -175;
}
     
void CalcInputVals()
{
     //Set to 0
     for(int x = 0; x < 8; x++)
     {
             for(int y = 0; y < 8; y++)
             {
                     inputValArray[x][y] = 0;
             }
     }
     
     for(int x = 0; x < 8; x++)
     {
             for(int y = 0; y < 8; y++)
             {
                     if(fireArray[x][y] == 1)
                     {
                            switch(x)
                            {
                                     case 0:
                                          inputValArray[x][y] = (n1.fireStrength * weightArray[x][y]);
                                          break;
                                     case 1:
                                          inputValArray[x][y] = (n2.fireStrength * weightArray[x][y]);
                                          break; 
                                     case 2:
                                          inputValArray[x][y] = (n3.fireStrength * weightArray[x][y]);
                                          break; 
                                     case 3:
                                          inputValArray[x][y] = (n4.fireStrength * weightArray[x][y]);
                                          break; 
                                     case 4:
                                          inputValArray[x][y] = (n5.fireStrength * weightArray[x][y]);
                                          break;
                                     case 5:
                                          inputValArray[x][y] = (input1Strength * weightArray[x][y]);
                                          break;
                                     case 6:
                                          inputValArray[x][y] = (input2Strength * weightArray[x][y]);
                                          break; 
                                     case 7:
                                          inputValArray[x][y] = (input3Strength * weightArray[x][y]);
                                          break; 
                                     default:
                                          break;
                            }
                     }
                     
                     if(fireArray[x][y] == 0)
                     {
                            inputValArray[x][y] = 0;
                     }
             }
     }
}
                                   
void CalcInputSums()
{
     for(int x = 0; x < 8; x++)
     {
             n1.inputSum += inputValArray[x][0];
     }
     
     for(int x = 0; x < 8; x++)
     {
             n2.inputSum += inputValArray[x][1];
     }
     
     for(int x = 0; x < 8; x++)
     {
             n3.inputSum += inputValArray[x][2];
     }
     
     for(int x = 0; x < 8; x++)
     {
             n4.inputSum += inputValArray[x][3];
     }
     
     for(int x = 0; x < 8; x++)
     {
             n5.inputSum += inputValArray[x][4];
     }
}

void CheckFire()
{
     //Neuron 1
     if(n1.inputSum > n1.threshold)
     {
            n1.fired = 1;
     }
     else
     {
            n1.fired = 0;
     }
     
     //Neuron 2
     if(n2.inputSum > n2.threshold)
     {
            n2.fired = 1;
     }
     else
     {
            n2.fired = 0;
     }
     
     //Neuron 3
     if(n3.inputSum > n3.threshold)
     {
            n3.fired = 1;
     }
     else
     {
            n3.fired = 0;
     }
     
     //Neuron 4
     if(n4.inputSum > n4.threshold)
     {
            n4.fired = 1;
     }
     else
     {
            n4.fired = 0;
     }
     
     //Neuron 5
     if(n5.inputSum > n5.threshold)
     {
            n5.fired = 1;
     }
     else
     {
            n5.fired = 0;
     }
}

void UpdateThresholds()
{
     //Neuron 1
     if((fireArray[0][0] == 1) || (fireArray[0][1] == 1) || (fireArray[0][2] == 1) ||
        (fireArray[0][3] == 1) || (fireArray[0][4] == 1))
     {
           n1.threshold -= 2;
           if(n1.threshold < 0)
           {
                  n1.threshold = 0;
           }
     }
     else
     {
           n1.threshold += 0.5;
           
           if(n1.threshold > n1.thresholdNorm)
           {
                  n1.threshold = n1.thresholdNorm;
           }
     }
     
     //Neuron 2
     if((fireArray[1][0] == 1) || (fireArray[1][1] == 1) || (fireArray[1][2] == 1) ||
        (fireArray[1][3] == 1) || (fireArray[1][4] == 1))
     {
           n2.threshold -= 2;
           if(n2.threshold < 0)
           {
                  n2.threshold = 0;
           }
     }
     else
     {
           n2.threshold += 0.5;
           
           if(n2.threshold > n2.thresholdNorm)
           {
                  n2.threshold = n2.thresholdNorm;
           }
     }
     
     //Neuron 3
     if((fireArray[2][0] == 1) || (fireArray[2][1] == 1) || (fireArray[2][2] == 1) ||
        (fireArray[2][3] == 1) || (fireArray[2][4] == 1))
     {
           n3.threshold -= 2;
           if(n3.threshold < 0)
           {
                  n3.threshold = 0;
           }
     }
     else
     {
           n3.threshold += 0.5;
           
           if(n3.threshold > n3.thresholdNorm)
           {
                  n3.threshold = n3.thresholdNorm;
           }
     }
     
     //Neuron 4
     if((fireArray[3][0] == 1) || (fireArray[3][1] == 1) || (fireArray[3][2] == 1) ||
        (fireArray[3][3] == 1) || (fireArray[3][4] == 1))
     {
           n4.threshold -= 2;
           if(n4.threshold < 0)
           {
                  n4.threshold = 0;
           }
     }
     else
     {
           n4.threshold += 0.5;
           
           if(n4.threshold > n4.thresholdNorm)
           {
                  n4.threshold = n4.thresholdNorm;
           }
     }
     
     //Neuron 5
     if((fireArray[4][0] == 1) || (fireArray[4][1] == 1) || (fireArray[4][2] == 1) ||
        (fireArray[4][3] == 1) || (fireArray[4][4] == 1))
     {
           n5.threshold -= 2;
           if(n5.threshold < 0)
           {
                  n5.threshold = 0;
           }
     }
     else
     {
           n5.threshold += 0.5;
           
           if(n5.threshold > n5.thresholdNorm)
           {
                  n5.threshold = n5.thresholdNorm;
           }
     }
}

void UpdateWeights()
{
     //Neuron 1
     if((fireArray[0][0] == 1) || (fireArray[0][1] == 1) || (fireArray[0][2] == 1) ||
        (fireArray[0][3] == 1) || (fireArray[0][4] == 1))
     {
           for(int y = 0; y < 8; y++)
           {
                   weightArray[0][y] += (0.2 * connectionArray[0][y]);
                   if(weightArray[0][y] > 3.00)
                   {
                        weightArray[0][y] = 3.00;
                   }
           }
     }
     else
     {
           for(int y = 0; y < 8; y++)
           {
                   weightArray[0][y] -= (0.05 * connectionArray[0][y]);
                   if(weightArray[0][y] < 0.00)
                   {
                        weightArray[0][y] = 0.00;
                   }
           }
     }
     
     //Neuron 2
     if((fireArray[1][0] == 1) || (fireArray[1][1] == 1) || (fireArray[1][2] == 1) ||
        (fireArray[1][3] == 1) || (fireArray[1][4] == 1))
     {
           for(int y = 0; y < 8; y++)
           {
                   weightArray[1][y] += (0.2 * connectionArray[1][y]);
                   if(weightArray[1][y] > 3.00)
                   {
                        weightArray[1][y] = 3.00;
                   }
           }
     }
     else
     {
           for(int y = 0; y < 8; y++)
           {
                   weightArray[1][y] -= (0.05 * connectionArray[1][y]);
                   if(weightArray[1][y] < 0.00)
                   {
                        weightArray[1][y] = 0.00;
                   }
           }
     }
     
     //Neuron 3
     if((fireArray[2][0] == 1) || (fireArray[2][1] == 1) || (fireArray[2][2] == 1) ||
        (fireArray[2][3] == 1) || (fireArray[2][4] == 1))
     {
           for(int y = 0; y < 8; y++)
           {
                   weightArray[2][y] += (0.2 * connectionArray[2][y]);
                   if(weightArray[2][y] > 3.00)
                   {
                        weightArray[2][y] = 3.00;
                   }
           }
     }
     else
     {
           for(int y = 0; y < 8; y++)
           {
                   weightArray[2][y] -= (0.05 * connectionArray[2][y]);
                   if(weightArray[2][y] < 0.00)
                   {
                        weightArray[2][y] = 0.00;
                   }
           }
     }
     
     //Neuron 4
     if((fireArray[3][0] == 1) || (fireArray[3][1] == 1) || (fireArray[3][2] == 1) ||
        (fireArray[3][3] == 1) || (fireArray[3][4] == 1))
     {
           for(int y = 0; y < 8; y++)
           {
                   weightArray[3][y] += (0.2 * connectionArray[3][y]);
                   if(weightArray[3][y] > 3.00)
                   {
                        weightArray[3][y] = 3.00;
                   }
           }
     }
     else
     {
           for(int y = 0; y < 8; y++)
           {
                   weightArray[3][y] -= (0.05 * connectionArray[3][y]);
                   if(weightArray[3][y] < 0.00)
                   {
                        weightArray[3][y] = 0.00;
                   }
           }
     }
     
     //Neuron 5
     if((fireArray[4][0] == 1) || (fireArray[4][1] == 1) || (fireArray[4][2] == 1) ||
        (fireArray[4][3] == 1) || (fireArray[4][4] == 1))
     {
           for(int y = 0; y < 8; y++)
           {
                   weightArray[4][y] += (0.2 * connectionArray[4][y]);
                   if(weightArray[4][y] > 3.00)
                   {
                        weightArray[4][y] = 3.00;
                   }
           }
     }
     else
     {
           for(int y = 0; y < 8; y++)
           {
                   weightArray[4][y] -= (0.05 * connectionArray[4][y]);
                   if(weightArray[4][y] < 0.00)
                   {
                        weightArray[4][y] = 0.00;
                   }
           }
     }
     
     //NOTE!!! Include same things for inputs sometime later
}

void UpdateFireArray()
{
     //Set to 0
     for(int x = 0; x < 8; x++)
     {
             for(int y = 0; y < 8; y++)
             {
                     fireArray[x][y] = 0;
             }
     }
     
     for(int y = 0; y < 8; y++)
     {
             fireArray[0][y] = (n1.fired * connectionArray[0][y]);
     }
     
     for(int y = 0; y < 8; y++)
     {
             fireArray[1][y] = (n2.fired * connectionArray[1][y]);
     }
     
     for(int y = 0; y < 8; y++)
     {
             fireArray[2][y] = (n3.fired * connectionArray[2][y]);
     }
     
     for(int y = 0; y < 8; y++)
     {
             fireArray[3][y] = (n4.fired * connectionArray[3][y]);
     }
     
     for(int y = 0; y < 8; y++)
     {
             fireArray[4][y] = (n5.fired * connectionArray[4][y]);
     }
     
     for(int y = 0; y < 8; y++)
     {
             fireArray[5][y] = (i1fired * connectionArray[5][y]);
     }
     
     for(int y = 0; y < 8; y++)
     {
             fireArray[6][y] = (i2fired * connectionArray[6][y]);
     }

     for(int y = 0; y < 8; y++)
     {
             fireArray[7][y] = (i3fired * connectionArray[7][y]);
     }
}

void Display()
{
     float c1 = 0.0;
     float c2 = 0.0;
     float c3 = 0.0;
     
     glColor3f(1.0, 0.0, 0.0);
     glPushMatrix();
           glTranslatef(i1x, i1y, 0.0);
           glutSolidSphere(10, 15, 15);
     glPopMatrix();
     glPushMatrix();
           glTranslatef(i2x, i2y, 0.0);
           glutSolidSphere(10, 15, 15);
     glPopMatrix();
     glPushMatrix();
           glTranslatef(i3x, i3y, 0.0);
           glutSolidSphere(10, 15, 15);
     glPopMatrix();
     
     glColor3f(0.0, 0.0, 1.0);
     glPushMatrix();
           glTranslatef(o1x, o1y, 0.0);
           glutSolidSphere(10, 15, 15);
     glPopMatrix();
     glPushMatrix();
           glTranslatef(o2x, o2y, 0.0);
           glutSolidSphere(10, 15, 15);
     glPopMatrix();
     glPushMatrix();
           glTranslatef(o3x, o3y, 0.0);
           glutSolidSphere(10, 15, 15);
     glPopMatrix();
     
     glColor3f(1.0, 0.0, 1.0);
     glPushMatrix();
           glTranslatef(n1.x, n1.y, 0.0);
           glutSolidSphere(20, 15, 15);
     glPopMatrix();
     glPushMatrix();
           glTranslatef(n2.x, n2.y, 0.0);
           glutSolidSphere(20, 15, 15);
     glPopMatrix();
     glPushMatrix();
           glTranslatef(n3.x, n3.y, 0.0);
           glutSolidSphere(20, 15, 15);
     glPopMatrix();
     glPushMatrix();
           glTranslatef(n4.x, n4.y, 0.0);
           glutSolidSphere(20, 15, 15);
     glPopMatrix();
     glPushMatrix();
           glTranslatef(n5.x, n5.y, 0.0);
           glutSolidSphere(20, 15, 15);
     glPopMatrix();
     
     glBegin(GL_LINES);
     for(int x = 0; x < 8; x++)
     {
             for(int y = 0; y < 8; y++)
             {
                     if(connectionArray[x][y] == 1)
                     {
                          if(fireArray[x][y] == 1)
                          {
                                 c1 = 1.0;
                                 c2 = 1.0;
                                 c3 = 0.0;
                          }
                          else
                          {
                                 c1 = 0.5;
                                 c2 = 0.5;
                                 c3 = 0.5;
                          }
                          
                          glColor3f(c1, c2, c3);
                          
                          switch(x)
                          {
                                   case 0:
                                        glVertex2f(n1.x, (n1.y - 20));
                                        break;
                                   case 1:
                                        glVertex2f(n2.x, (n2.y - 20));
                                        break;
                                   case 2:
                                        glVertex2f(n3.x, (n3.y - 20));
                                        break;
                                   case 3:
                                        glVertex2f(n4.x, (n4.y - 20));
                                        break;
                                   case 4:
                                        glVertex2f(n5.x, (n5.y - 20));
                                        break;
                                   case 5:
                                        glVertex2f(i1x, i1y);
                                        break;
                                   case 6:
                                        glVertex2f(i2x, i2y);
                                        break;
                                   case 7:
                                        glVertex2f(i3x, i3y);
                                        break;
                                   default:
                                        break;
                          }
                          
                          switch(y)
                          {
                                   case 0:
                                        glVertex2f(n1.x, (n1.y + 20));
                                        break;
                                   case 1:
                                        glVertex2f(n2.x, (n2.y + 20));
                                        break;
                                   case 2:
                                        glVertex2f(n3.x, (n3.y + 20));
                                        break;
                                   case 3:
                                        glVertex2f(n4.x, (n4.y + 20));
                                        break;
                                   case 4:
                                        glVertex2f(n5.x, (n5.y + 20));
                                        break;
                                   case 5:
                                        glVertex2f(o1x, o1y);
                                        break;
                                   case 6:
                                        glVertex2f(o2x, o2y);
                                        break;
                                   case 7:
                                        glVertex2f(o3x, o3y);
                                        break;
                                   default:
                                        break;
                          }
                     }
             }
     }
     glEnd();
}
     
void SetupRC()
{
    glEnable(GL_DEPTH_TEST);
	glClearColor(0.0f, 0.0f, 0.0f, 1.0f );
}

void RenderScene(void)
{
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    
    int x = 0;
    int y = 0;
    
    if(init == true)
    {
            Init();
            init = false;
    }
    
    gotoxy(0, 0);   
    cout << "connectionArray:\n";   
    for(y = 0; y < 8; y++)
    {
            for(x = 0; x < 8; x++)
            {
                   cout << connectionArray[x][y] << " ";
            }
            cout << "\n";
    }
    
    gotoxy(18, 1);      
    cout << "Input 1 Strength: " << input1Strength;
    gotoxy(18,2);
    cout << "Input 1 Fired: " << i1fired;
        
    gotoxy(18,4);
    cout << "Input 2 Strength: " << input2Strength;
    gotoxy(18,5);
    cout << "Input 2 Fired: " << i1fired;
        
    gotoxy(18,7);
    cout << "Input 3 Strength: " << input3Strength;
    gotoxy(18,8);
    cout << "Input 3 Fired: " << i1fired;
    
    gotoxy(0, 10);
    cout << "Neuron 1:";
    gotoxy(0, 11);
    cout << "thresholdNorm: " << n1.thresholdNorm;
    gotoxy(0, 12);
    cout << "threshold: " << n1.threshold;
    gotoxy(0, 13);
    cout << "fireStrength: " << n1.fireStrength;
    gotoxy(0, 14);
    cout << "inputSum: " << n1.inputSum << "   ";
    gotoxy(0, 15);
    cout << "fired: " << n1.fired;
    
    gotoxy(18, 10);
    cout << "Neuron 2:";
    gotoxy(18, 11);
    cout << "thresholdNorm: " << n2.thresholdNorm;
    gotoxy(18, 12);
    cout << "threshold: " << n2.threshold;
    gotoxy(18, 13);
    cout << "fireStrength: " << n2.fireStrength;
    gotoxy(18, 14);
    cout << "inputSum: " << n2.inputSum << "   ";
    gotoxy(18, 15);
    cout << "fired: " << n2.fired;
    
    gotoxy(36, 10);
    cout << "Neuron 3:";
    gotoxy(36, 11);
    cout << "thresholdNorm: " << n3.thresholdNorm;
    gotoxy(36, 12);
    cout << "threshold: " << n3.threshold;
    gotoxy(36, 13);
    cout << "fireStrength: " << n3.fireStrength;
    gotoxy(36, 14);
    cout << "inputSum: " << n3.inputSum << "   ";
    gotoxy(36, 15);
    cout << "fired: " << n3.fired;
    
    gotoxy(54, 10);
    cout << "Neuron 4:";
    gotoxy(54, 11);
    cout << "thresholdNorm: " << n4.thresholdNorm;
    gotoxy(54, 12);
    cout << "threshold: " << n4.threshold;
    gotoxy(54, 13);
    cout << "fireStrength: " << n4.fireStrength;
    gotoxy(54, 14);
    cout << "inputSum: " << n4.inputSum << "   ";
    gotoxy(54, 15);
    cout << "fired: " << n4.fired;
    
    gotoxy(72, 10);
    cout << "Neuron 5:";
    gotoxy(72, 11);
    cout << "thresholdNorm: " << n5.thresholdNorm;
    gotoxy(72, 12);
    cout << "threshold: " << n5.threshold;
    gotoxy(72, 13);
    cout << "fireStrength: " << n5.fireStrength;
    gotoxy(72, 14);
    cout << "inputSum: " << n5.inputSum << "   ";
    gotoxy(72, 15);
    cout << "fired: " << n5.fired;
    
    gotoxy(0, 17);   
    cout << "weightArray:\n";   
    for(y = 0; y < 8; y++)
    {
            for(x = 0; x < 8; x++)
            {
                   cout << connectionArray[x][y] << " ";
            }
            cout << "\n";
    }
    
    gotoxy(20, 17);   
    cout << "inputValArray:\n";   
    for(y = 0; y < 8; y++)
    {
            gotoxy(20, (y + 18));
            for(x = 0; x < 8; x++)
            {
                   cout << inputValArray[x][y] << " ";
            }
    }
    
    gotoxy(40, 17);   
    cout << "fireArray:\n";   
    for(y = 0; y < 8; y++)
    {
            gotoxy(40, (y + 18));
            for(x = 0; x < 8; x++)
            {
                   cout << fireArray[x][y] << " ";
            }
    }
    
    if(next == true)
    {
        n1.fired = 0;
        n2.fired = 0;
        n3.fired = 0;
        n4.fired = 0;
        n5.fired = 0;
        
        n1.inputSum = 0;
        n2.inputSum = 0;
        n3.inputSum = 0;
        n4.inputSum = 0;
        n5.inputSum = 0;
        
        CalcInputVals();
        CalcInputSums();
        CheckFire();
        UpdateThresholds();
        UpdateWeights();
        UpdateFireArray();
        
        i1fired = 0;
        i2fired = 0;
        i3fired = 0;
        
        Sleep(500);
        next = false;
    }

    Display();
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
        next = true;

	if(key == GLUT_KEY_LEFT)
		i1fired = 1;
		
	if(key == GLUT_KEY_DOWN)
		i2fired = 1;	

	if(key == GLUT_KEY_RIGHT)
		i3fired = 1;

	glutPostRedisplay();
}

void ChangeSize(int w, int h)
{
	GLfloat nRange = 500.0f;

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
    glutCreateWindow("Neurons!!");
    glutReshapeFunc(ChangeSize);
    glutDisplayFunc(RenderScene);
	glutSpecialFunc(SpecialKeys);

    SetupRC();
    glutTimerFunc(33, TimerFunction, 1);

    glutMainLoop();

    return 0;
}
