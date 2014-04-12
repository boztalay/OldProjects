#include <iostream>
#include <stdlib.h>
#include <windows.h>

using namespace std;

int sortFunction( const void *a, const void *b)
{
      int intOne = *((int*)a);
      int intTwo = *((int*)b);
      if (intOne < intTwo)
         return -1;
      if (intOne == intTwo)
         return 0;
      return 1;
}

int main()
{
   int parent = 100;
   int child1 = 0;
   int child2 = 0;
   int child3 = 0;
   int child4 = 0;
   int child5 = 0;
   int difference = 0;
   int childArray[5] = {0, 0, 0, 0, 0};
   int generations = 1;
    
   bool done = false;
   
   srand(GetTickCount());
   
   while(done == false)
   {
              generations++;
              
              difference = (rand() % 10 - 5);  
              child1 = (parent + difference);
              difference = (rand() % 10 - 5);  
              child2 = (parent + difference);
              difference = (rand() % 10 - 5);  
              child3 = (parent + difference);
              difference = (rand() % 10 - 5);  
              child4 = (parent + difference);
              difference = (rand() % 10 - 5);  
              child5 = (parent + difference);

			  cout << "\nGeneration " << generations << "\n";              
			  cout << "Parent: " << parent << "\n";
              cout << "Child1: " << child1 << "\n";
              cout << "Child2: " << child2 << "\n";
              cout << "Child3: " << child3 << "\n";
              cout << "Child4: " << child4 << "\n";
              cout << "Child5: " << child5 << "\n";
              
              childArray[0] = abs(child1);
              childArray[1] = abs(child2);
              childArray[2] = abs(child3);
              childArray[3] = abs(child4);
              childArray[4] = abs(child5);
              
              qsort((void *)childArray, 5, sizeof(childArray[0]), sortFunction);
              
              if(child1 == childArray[0])
              {
                        parent =  child1;
              }
              if(child2 == childArray[0])
              {
                        parent =  child2;
              }
              if(child3 == childArray[0])
              {
                        parent =  child3;
              }
              if(child4 == childArray[0])
              {
                        parent =  child4;
              }
              if(child5 == childArray[0])
              {
                        parent =  child5;
              }

              if(parent == 0)
              {
                        done = true;
              }
   }
   
   cout << "\n\nDone!\nGenerations: " << generations << "\n\n";
   
   system("pause");
   return 0;
} 
              
           
    
