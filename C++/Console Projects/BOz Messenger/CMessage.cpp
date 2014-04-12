#include "CMessage.h"

//////////Implimenting the base Message Class\\\\\\\\\\

void CMessage::SetMessage(char cmessage[])
{
	strcpy(cmessage, message);
};

//////////Implimenting the recieved Message Class\\\\\\\\\\

void CRcvMessage::PrintMessage()
{
	cout << "Recieved: " << message;
};

//////////Implimenting the sent Message Class\\\\\\\\\\

void CSendMessage::PrintMessage()
{
	cout << "Sent: " << message;
};