#include <iostream>
#include <fstream>
#include <string>

using namespace std;

char bin2hex(string bin);

int main()
{
	ofstream fout("output.txt");
	ifstream fin("input.txt");

	string instruction;
	string temp = "0000";
	int i = 0;

	fout << "v2.0 raw\n";

	getline(fin, instruction);
	while(instruction[0] != '%')
	{
		cout << "instruction: " << instruction << endl;

		for(i = 0; i < 32; i += 4)
		{
			temp[0] = instruction[i];
			temp[1] = instruction[i + 1];
			temp[2] = instruction[i + 2];
			temp[3] = instruction[i + 3];

			fout << bin2hex(temp);
		}

		fout << endl;
		getline(fin, instruction);
	}

	fin.close();
	fout.close();

	system("pause");
	return 0;
}

char bin2hex(string bin)
{
	if(bin == "0000")
		return '0';
	if(bin == "0001")
		return '1';
	if(bin == "0010")
		return '2';
	if(bin == "0011")
		return '3';
	if(bin == "0100")
		return '4';
	if(bin == "0101")
		return '5';
	if(bin == "0110")
		return '6';
	if(bin == "0111")
		return '7';
	if(bin == "1000")
		return '8';
	if(bin == "1001")
		return '9';
	if(bin == "1010")
		return 'a';
	if(bin == "1011")
		return 'b';
	if(bin == "1100")
		return 'c';
	if(bin == "1101")
		return 'd';
	if(bin == "1110")
		return 'e';
	if(bin == "1111")
		return 'f';
}
	


		








