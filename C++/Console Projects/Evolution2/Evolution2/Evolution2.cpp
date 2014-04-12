#include <iostream>
#include <stdlib.h>
#include <windows.h>
#include <math.h>

using namespace std;

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

int main()
{
    float parent[2] = {0,0};
    float child1[2] = {0,0};
    float child2[2] = {0,0};
    float child3[2] = {0,0};
    float child4[2] = {0,0};
    float child5[2] = {0,0};
    float difference = 0;
    float generations = 0;
    float childDistArray[5] = {0, 0, 0, 0, 0};
    bool done = false;
    int choice = 1;
	int startVal = 0;

	while(choice == 1)
	{
		system("cls");

		cout << "Enter a starting value: ";
		cin >> startVal;

		parent[0] = startVal;
		parent[1] = startVal;
		generations = 0;
		done = false;

		srand(GetTickCount());
	    
		while(done == false)
		{
				   generations++;
	               
				   difference = ((rand() % 10) - 5);
				   child1[0] = (parent[0] + difference);
				   difference = ((rand() % 10) - 5);
				   child2[0] = (parent[0] + difference);
				   difference = ((rand() % 10) - 5);
				   child3[0] = (parent[0] + difference);
				   difference = ((rand() % 10) - 5);
				   child4[0] = (parent[0] + difference);
				   difference = ((rand() % 10) - 5);
				   child5[0] = (parent[0] + difference);
				   difference = ((rand() % 10) - 5);
	               
				   child1[1] = (parent[1] + difference);
				   difference = ((rand() % 10) - 5);
				   child2[1] = (parent[1] + difference);
				   difference = ((rand() % 10) - 5);
				   child3[1] = (parent[1] + difference);
				   difference = ((rand() % 10) - 5);
				   child4[1] = (parent[1] + difference);
				   difference = ((rand() % 10) - 5);
				   child5[1] = (parent[1] + difference);
	               
				   childDistArray[0] = sqrt((child1[0] * child1[0]) + (child1[1] * child1[1]));
				   childDistArray[1] = sqrt((child2[0] * child2[0]) + (child2[1] * child2[1]));
				   childDistArray[2] = sqrt((child3[0] * child3[0]) + (child3[1] * child3[1]));
				   childDistArray[3] = sqrt((child4[0] * child4[0]) + (child4[1] * child4[1]));
				   childDistArray[4] = sqrt((child5[0] * child5[0]) + (child5[1] * child5[1]));
	    
	               
				   cout << "\nGeneration " << generations << "\n";
				   cout << "Parent: " << parent[0] << ", " << parent[1] << "\n";
				   cout << "Child 1: " << child1[0] << ", " << child1[1] << ", " << childDistArray[0] << "\n";
				   cout << "Child 2: " << child2[0] << ", " << child2[1] << ", " << childDistArray[1] << "\n";
				   cout << "Child 3: " << child3[0] << ", " << child3[1] << ", " << childDistArray[2] << "\n";
				   cout << "Child 4: " << child4[0] << ", " << child4[1] << ", " << childDistArray[3] << "\n";
				   cout << "Child 5: " << child5[0] << ", " << child5[1] << ", " << childDistArray[4] << "\n";
	               
				   qsort((void *)childDistArray, 5, sizeof(childDistArray[0]), sortFunction);
	               
				   if((sqrt((child1[0] * child1[0]) + (child1[1] * child1[1]))) == childDistArray[0])
				   {
						  parent[0] = child1[0];
						  parent[1] = child1[1];
				   }
				   if((sqrt((child2[0] * child2[0]) + (child2[1] * child2[1]))) == childDistArray[0])
				   {
						  parent[0] = child2[0];
						  parent[1] = child2[1];
				   }
				   if((sqrt((child3[0] * child3[0]) + (child3[1] * child3[1]))) == childDistArray[0])
				   {
						  parent[0] = child3[0];
						  parent[1] = child3[1];
				   }
				   if((sqrt((child4[0] * child4[0]) + (child4[1] * child4[1]))) == childDistArray[0])
				   {
						  parent[0] = child4[0];
						  parent[1] = child4[1];
				   }
				   if((sqrt((child5[0] * child5[0]) + (child5[1] * child5[1]))) == childDistArray[0])
				   {
						  parent[0] = child5[0];
						  parent[1] = child5[1];
				   }
	               
				   if((parent[0] == 0) && (parent[1] == 0))
				   {
							 done = true;
				   }
				   //Sleep(500);
		}
	    
		cout << "\n\nDone!\nGenerations: " << generations << "\n\n";
		cout << "Run again? (1)\nOr quit? (0)\nChoice: ";
		cin >> choice;
	}
    
	cout << "\n\n";
    system("pause");
    return 0;
}
               
    
