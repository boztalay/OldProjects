#include <cstdlib>
#include <iostream>
#include <fstream>
#include <string>

using namespace std;

int main()
{
    ifstream fin("input.txt");
    
    string line;
    char key_char = 0;
    char new_char;
    int key_int;
    
    getline(fin, line);
    
    cout << line[line.length() - 1] << endl;         
    
    new_char = key_char ^ line[line.length() - 1];
    while(new_char != '.')
    {
         new_char = key_char ^ line[line.length() - 1];
         key_char++;
    }
    
    key_char--;
    key_int = key_char;
    
    cout << "Key: " << key_char << ", or " << key_int << "\n\n";
    
    for(int i = 0; i < line.length(); i++)
    {
         new_char = key_char ^ line[i];
         cout << new_char;
    }
    
    cout << endl;

    system("PAUSE");
    return EXIT_SUCCESS;
}
