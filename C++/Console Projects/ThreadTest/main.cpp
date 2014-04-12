#include<iostream>
#include<windows.h>

using namespace std;

#include<iostream>
#include<windows.h>

using namespace std;

void threadProc()
{
	int i = 10;

	cout << "I'm a thread";

	while(i)
	{
		cout << ".";
		Sleep(500);
		i--;
	}
}


int main()
{
	int i = 10;

	cout << "This is a thread test, both lines should be adding '.' every \nhalf second together.";

	HANDLE threadHandle;
	threadHandle = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE) threadProc, NULL, 0, NULL);

	cout << "\n\nI'm in the main thread\n\n";

	while(i)
	{
		cout << ".";
		Sleep(500);
		i--;
	}

	cout << "\n\n";

	system("pause");
	return 0;
}
