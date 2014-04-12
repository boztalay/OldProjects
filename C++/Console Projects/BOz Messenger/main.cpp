/*
	This is the BOz Messenger

	This is the code for the client side.

	Ben Oztalay
*/

#include "Functions.h"
#include "Cmessage.h"
#include <iostream>
#include <winsock2.h>
#include <windows.h>
#include <stdio.h>

using namespace std;

void RecievingThreadProc();

void SendingThreadProc();

int main()
{
	int mySocket;
	int port;
	char serverName[4096];

	cout << "Welcome to the BOz messenger ClientSide!\n\n";
	cout << "Specify port: ";
	cin >> port;
	cout << "Specify server name: ";
	cin >> serverName;

	mySocket = SetupClient(port, serverName);

	if (mySocket == -1) 
	{
		CloseClient(mySocket);
		return 1;
	}

	return 0;
}

void SendingThreadProc(int mySocket)
{
	char cMessage;

	while(5)
	{
		cout << "Message to send: ";
		cin >> cMessage;
		SendMessageC(mySocket, &cMessage);
	}
}

void RecievingThreadProc(int mySocket)
{
	while(5)
	{
		RecieveMessageC(mySocket);
	}
}