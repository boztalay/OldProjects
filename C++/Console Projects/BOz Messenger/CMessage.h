#include <iostream>
#include <winsock2.h>
#include <windows.h>
#include <stdio.h>

using namespace std;

#define MAX_MSG_LENGTH 4096; 


///////////A Base Message Class\\\\\\\\\\

class CMessage
{

	public:

		void SetMessage(char cmessage[]);
		
		char message[4096];
};

///////////A Recieved Message Class\\\\\\\\\\

class CRcvMessage : public CMessage
{
	public:

		void PrintMessage();
};

///////////A Sent Message Class\\\\\\\\\\

class CSendMessage : public CMessage
{
	public:

		void PrintMessage();
};
