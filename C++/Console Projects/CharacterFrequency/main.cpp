#include <cstdlib>
#include <iostream>
#include <fstream>
#include <string>
#include <windows.h>

using namespace std;

int main(int argc, char *argv[])
{
	WIN32_FIND_DATA FindData;
	HANDLE hFind;

	string fileType = argv[1];
	fileType = "*" + fileType;

	if(argc != 2) {
		cout << "No argument dice\n";
        system("PAUSE");
    	return EXIT_SUCCESS;
	} else {
		hFind = FindFirstFile(fileType.c_str(), &FindData);
	}

	if(hFind == INVALID_HANDLE_VALUE)
    {
        cout << "No dice searching directory\n";
        system("PAUSE");
    	return EXIT_SUCCESS;
    }

	ifstream fin;
	ofstream fout;
	ofstream fout1;
	int totalChars = 0;
	int charNums[127];
	int chars[127];
	string line;
	int temp = 0;

	for(int i = 0; i < 128; i++) {
		charNums[i] = 0;
	}

	for(int i = 0; i < 128; i++) {
		chars[i] = i;
	}

	fout.open("1outLetters.txt");
	if(!fout) {
		cout << "No out file dice.\n";
		system("PAUSE");
    	return EXIT_SUCCESS;
	}

	fout1.open("1outSymbols.txt");
	if(!fout1) {
		cout << "No out file dice.\n";
		system("PAUSE");
    	return EXIT_SUCCESS;
	}
	
	do {
		cout << "\nAnalyzing file " << FindData.cFileName << "...";

		fin.open(FindData.cFileName);
		if(!fin) {
			cout << "\nNo in file dice.\n\n";
			system("PAUSE");
	    	return EXIT_SUCCESS;
		}

		fin >> line;
		while(fin) {
			for(int i = 0; i < line.size(); i++) {
				charNums[line.at(i)]++;
			}
	
			fin >> line;
		}
		
		fin.close();
		fin.clear();
	} while (FindNextFile(hFind, &FindData) > 0);

	cout << "\n\nAdding up the characters";

	for(int i = 32; i < 128; i++) {
		totalChars += charNums[i];
	}

	cout << "\nSorting...";

	for(int j = 32; j < 128; j++)
	{
        for(int k = j + 1; k < 128; k++)
        {
            if (charNums[j] < charNums[k])
            {
                temp = charNums[j];
                charNums[j] = charNums[k];
                charNums[k] = temp;
				temp = chars[j];
                chars[j] = chars[k];
                chars[k] = temp;
            }
        }
    }

	cout << "\nWriting to files...";

	for(int i = 32; i < 128; i++) {
		if(chars[i] == '`' || 
		   chars[i] == '~' || 
		   chars[i] == '!' || 
		   chars[i] == '@' || 
		   chars[i] == '#' || 
		   chars[i] == '$' || 
		   chars[i] == '%' || 
		   chars[i] == '^' || 
		   chars[i] == '&' || 
		   chars[i] == '*' || 
		   chars[i] == '(' || 
		   chars[i] == ')' || 
		   chars[i] == '-' || 
		   chars[i] == '_' || 
		   chars[i] == '=' || 
		   chars[i] == '+' || 
		   chars[i] == '\\' || 
		   chars[i] == '|' || 
		   chars[i] == '[' || 
		   chars[i] == ']' || 
		   chars[i] == '{' || 
		   chars[i] == '}' || 
		   chars[i] == ';' || 
		   chars[i] == ':' || 
		   chars[i] == '\'' || 
		   chars[i] == '\"' || 
		   chars[i] == ',' || 
		   chars[i] == '.' || 
		   chars[i] == '<' || 
		   chars[i] == '>' || 
		   chars[i] == '/' ||  
		   chars[i] == ' ' ||
		   chars[i] == '?') {
			fout1 <<(char)chars[i] << ": " << (100.0f * ((float)charNums[i] / (float)totalChars)) << "\n";
		} else {
			fout << (char)chars[i] << ": " << (100.0f * ((float)charNums[i] / (float)totalChars)) << "\n";
		}
	}

	cout << endl << endl;

	fin.close();
	fout.close();
	fout1.close();

    system("PAUSE");
    return EXIT_SUCCESS;
}
