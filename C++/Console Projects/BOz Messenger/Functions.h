#include <iostream>
#include <winsock2.h>
#include <windows.h>
#include <stdio.h>
#include "CMessage.h"

using namespace std;

#define MAX_MESSAGE_SIZE 4096

//////////These are all the functions needed for network messenging\\\\\\\\\\

//////////Client Functions\\\\\\\\\\

int SetupClient(unsigned short port, const char* serverName) 
{
	// An error code
	int error;
	WSAData wsaData;

	// Startup winsock
	if ((error = WSAStartup(MAKEWORD(2, 2), &wsaData)) == SOCKET_ERROR) 
	{
		printf("Could Not Start Up Winsock!\n");
		return -1;
	}

	// Create socket
	int mySocket = socket(AF_INET, SOCK_STREAM, 0);

	// Check Errors
	if (mySocket == SOCKET_ERROR) 
	{
		printf("Error Opening Socket!\n");
		return -1;
	}

	struct hostent *host_entry;

	// Setup the host entry
	if ((host_entry = gethostbyname(serverName)) == NULL) 
	{
		printf("Could not find host!\n");
	}

	struct sockaddr_in server;

	// Fill in the server socket info
	server.sin_family = AF_INET;
	server.sin_port = htons(port);
	server.sin_addr.s_addr = *(unsigned long*) host_entry->h_addr;

	// Connect to the server
	if (connect(mySocket, (sockaddr*)&server, sizeof(server)) == SOCKET_ERROR) 
	{
		printf("Error connecting to server!\n");
	}

	printf("Client Started\n");

	return mySocket;
}

void CloseClient(int clientSocket) 
{
	// Close the socket
	closesocket(clientSocket);

	// Shut down winsock
	WSACleanup();

	printf("Client Shutdown\n");
}

void SendMessageC(int mySocket, char cmessage[])
{
	CSendMessage smessage;
	smessage.SetMessage(cmessage);

	int nBytes;

	char buffer[MAX_MESSAGE_SIZE];

	sprintf_s(buffer, smessage.message);

	unsigned long messageSize = strlen(buffer);

	messageSize = htonl(messageSize);

	nBytes = send(mySocket, (char*)&messageSize, sizeof(messageSize), 0);

	if (nBytes == SOCKET_ERROR) 
	{
		printf("Send Failed!\n");
	}

	messageSize = ntohl(messageSize);

	nBytes = send(mySocket, buffer, messageSize, 0);

	if (nBytes == SOCKET_ERROR) 
	{
		printf("Send Failed!\n");
	}

	smessage.PrintMessage();
}

void RecieveMessageC(int mySocket)
{
	CRcvMessage rmessage;

	int nBytes;

	#define MAX_MESSAGE_SIZE 4096
	char buffer[MAX_MESSAGE_SIZE];

	unsigned long messageSize;

	nBytes = recv(mySocket, (char*)&messageSize, sizeof(messageSize), 0);

	if (nBytes == SOCKET_ERROR) 
	{
		printf("Recv Failed!\n");
	}

	messageSize = ntohl(messageSize);

	nBytes = recv(mySocket, buffer, messageSize, 0);

	if (nBytes == SOCKET_ERROR) 
	{
		printf("Recv Failed!\n");
	}

	buffer[messageSize] = '\0';

	rmessage.SetMessage(buffer);
	rmessage.PrintMessage();
}

//////////Server Functions\\\\\\\\\\

int SetupServer(unsigned short port) 
{
	// An error code we will use to get more information about our errors
	int error;

	// The winsock data structure
	WSAData wsaData;

	// startup winsock
	if ((error = WSAStartup(MAKEWORD(2, 2), &wsaData)) == SOCKET_ERROR) {
		printf("Could Not Start Up Winsock!\n");
		return -1;
	}

	// Create my socket
	int mySocket = socket(AF_INET, SOCK_STREAM, 0);

	// Make sure nothing bad happened
	if (mySocket == SOCKET_ERROR) 
	{
		printf("Error Opening Socket!\n");
		return -1;
	}

	// The address structure
	struct sockaddr_in server;

	// Fill the address structure with appropriate data
	server.sin_family = AF_INET;
	server.sin_port = htons(port);
	server.sin_addr.s_addr = INADDR_ANY;

	// And now bind my socket
	if (bind(mySocket, (sockaddr*)&server, sizeof(server)) == SOCKET_ERROR) 
	{
		printf("Bind Failed!\n");
		closesocket(mySocket);
		return -1;
	}

	// Mark my socket for listening
	if (listen(mySocket, 5) == SOCKET_ERROR) 
	{
		printf("Listen Failed!\n");
		closesocket(mySocket);
		return -1;
	}

	printf("Server Started\n");

	return mySocket;
}

void CloseServer(int socket) 
{
	// Close our socket
	closesocket(socket);

	// Shut down winsock
	WSACleanup();

	printf("Server Shutdown\n");
}

void RecieveMessageS(int &clientSocket)
{	
	CRcvMessage rmessage;

	int nBytes;

	char buffer[MAX_MESSAGE_SIZE];

	unsigned long messageSize;

	nBytes = recv(clientSocket, (char*)&messageSize, sizeof(messageSize), 0);

	if (nBytes == SOCKET_ERROR) 
	{
		printf("Recv Failed!\n");
	}

	messageSize = ntohl(messageSize);

	nBytes = recv(clientSocket, buffer, messageSize, 0);

	if (nBytes == SOCKET_ERROR) 
	{
		printf("Recv Failed!\n");
	}

	buffer[messageSize] = '\0';

	rmessage.SetMessage(buffer);
	rmessage.PrintMessage();
}

void SendMessageS(int mySocket, char cmessage[])
{
	CSendMessage smessage;
	smessage.SetMessage(cmessage);

	int nBytes;

	char buffer[MAX_MESSAGE_SIZE];

	sprintf_s(buffer, smessage.message);

	unsigned long messageSize = strlen(buffer);

	messageSize = htonl(messageSize);

	nBytes = send(mySocket, (char*)&messageSize, sizeof(messageSize), 0);

	if (nBytes == SOCKET_ERROR) 
	{
		printf("Send Failed!\n");
	}

	messageSize = ntohl(messageSize);

	nBytes = send(mySocket, buffer, messageSize, 0);

	if (nBytes == SOCKET_ERROR) 
	{
		printf("Send Failed!\n");
	}

	smessage.PrintMessage();
}
