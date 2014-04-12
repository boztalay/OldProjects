#include <iostream>
#include <fstream>
#include <windows.h>
#include <Winuser.h>
#include <string.h>
#include <psapi.h>

using namespace std;

void runInBackground();

void initializeCounts();
string getSecondHalfOfLine(string);

void listenAndRecord();
void recordKey(int);
void reprintDataFile();
string convertKeyCode(int);

string startDate;
int totalPresses;
int keyPresses[256];

int main(int argc, char *argv[]) {
	runInBackground();

	initializeCounts();
	listenAndRecord();

    return EXIT_SUCCESS;
}

void runInBackground() {
	HWND windowHandle;
	AllocConsole();
	windowHandle = FindWindowA("ConsoleWindowClass", NULL);
	ShowWindow(windowHandle, 0);
}

void initializeCounts() {
	ifstream file;
	file.open("useageTrackerData.txt");

	for(int i = 0; i < 256; i++) {
		keyPresses[i] = 0;
	}
	totalPresses = 0;

	string line;
	getline(file, line);
	startDate = getSecondHalfOfLine(line);

	for(int i = 1; i < 256; i++) {
		string invalid = "NORECORD";

		if(convertKeyCode(i) != invalid) {
			
			getline(file, line);
			keyPresses[i] = atoi(getSecondHalfOfLine(line).c_str());
			totalPresses += keyPresses[i];
		}
	}	

	file.close();
}

string getSecondHalfOfLine(string line) {
	int startIdx = 0;

	for(int i = 0; i < line.length(); i++) {
		char curChar = line[i];
		if(curChar == ':') {
			startIdx = i + 1;
			break;
		}
	}

	return line.substr(startIdx, (line.length() - 1));
}

void listenAndRecord() {
	int keyPressed;
	bool keyStates[256];

	for(int i = 0; i < 256; i++) {
		keyStates[i] = false;
	}
	
	while(1) {
		for(int i = 0; i < 256; i++) {
			bool currentKeyState = (GetAsyncKeyState(i) == -32767);

			if(keyStates[i]) {
				if(!currentKeyState) {
					recordKey(i);
				}
			}

			keyStates[i] = currentKeyState;
		}
	}
}

void recordKey(int keyCode) {
	string toRecord = convertKeyCode(keyCode);
	string noRecord = "NORECORD";

	if(toRecord == noRecord) {
		return;
	}

	keyPresses[keyCode]++;
	totalPresses++;

	reprintDataFile();
}

void reprintDataFile() {
	ofstream file;
	file.open("useageTrackerData.txt", ios::trunc);

	file << "[START-DATE]:" << startDate << endl;

	for(int i = 0; i < 256; i++) {
		string toRecord = convertKeyCode(i);
		string noRecord = "NORECORD";

		if(toRecord != noRecord) {
			file << toRecord << " :" << keyPresses[i] << endl;
		}
	}

	file << "[TOTAL]:" << totalPresses << endl;

	file.close();
}

//Not proud of this...
string convertKeyCode(int keyCode) {
	string returnVal = "";

	switch(keyCode) {
		case 1:
			returnVal = "[MOUSE-L]";
			break;
		case 2:
			returnVal = "[MOUSE-R]";
			break;
		case 4:
			returnVal = "[MOUSE-M]";
			break;

		case 8:
			returnVal = "[   BKSP]";
			break;
		case 9:
			returnVal = "[    TAB]";
			break;
		case 13:
			returnVal = "[  ENTER]";
			break;
		case 160:
			returnVal = "[LSHIFT]";
			break;
		case 161:
			returnVal = "[RSHIFT]";
			break;
		case 162:
			returnVal = "[LCTRL]";
			break;
		case 163:
			returnVal = "[RCTRL]";
			break;
		case 18:
			returnVal = "[    ALT]";
			break;
		case 19:
			returnVal = "[  PAUSE]";
			break;
		case 20:
			returnVal = "[CAPS-LK]";
			break;
		case 27:
			returnVal = "[    ESC]";
			break;
		case 32:
			returnVal = "[  SPACE]";
			break;

		case 33:
			returnVal = "[PAGE-UP]";
			break;
		case 34:
			returnVal = "[PAGE-DN]";
			break;
		case 35:
			returnVal = "[    END]";
			break;
		case 36:
			returnVal = "[   HOME]";
			break;

		case 37:
			returnVal = "[ LEFT-A]";
			break;
		case 38:
			returnVal = "[   UP-A]";
			break;
		case 39:
			returnVal = "[RIGHT-A]";
			break;
		case 40:
			returnVal = "[ DOWN-A]";
			break;

		case 44:
			returnVal = "[PRNTSCR]";
			break;
		case 45:
			returnVal = "[    INS]";
			break;
		case 46:
			returnVal = "[    DEL]";
			break;

		case 91:
			returnVal = "[LWIN]";
			break;
		case 92:
			returnVal = "[RWIN]";
			break;

		case 96:
			returnVal = "[NUM0]";
			break;
		case 97:
			returnVal = "[NUM1]";
			break;
		case 98:
			returnVal = "[NUM2]";
			break;
		case 99:
			returnVal = "[NUM3]";
			break;
		case 100:
			returnVal = "[NUM4]";
			break;
		case 101:
			returnVal = "[NUM5]";
			break;
		case 102:
			returnVal = "[NUM6]";
			break;
		case 103:
			returnVal = "[NUM7]";
			break;
		case 104:
			returnVal = "[NUM8]";
			break;
		case 105:
			returnVal = "[NUM9]";
			break;

		case 106:
			returnVal = "[MUL]";
			break;
		case 107:
			returnVal = "[ADD]";
			break;
		case 109:
			returnVal = "[SUB]";
			break;
		case 110:
			returnVal = "[DEC]";
			break;
		case 111:
			returnVal = "[DIV]";
			break;

		case 112:
			returnVal = "[F1]";
			break;
		case 113:
			returnVal = "[F2]";
			break;
		case 114:
			returnVal = "[F3]";
			break;
		case 115:
			returnVal = "[F4]";
			break;
		case 116:
			returnVal = "[F5]";
			break;
		case 117:
			returnVal = "[F6]";
			break;
		case 118:
			returnVal = "[F7]";
			break;
		case 119:
			returnVal = "[F8]";
			break;
		case 120:
			returnVal = "[F9]";
			break;
		case 121:
			returnVal = "[F10]";
			break;
		case 122:
			returnVal = "[F11]";
			break;
		case 123:
			returnVal = "[F12]";
			break;

		case 144:
			returnVal = "[NUM-LK]";
			break;
		case 145:
			returnVal = "[SCR-LK]";
			break;

		case 164:
		case 165:
			returnVal = "[MENU]";
			break;

		case 188:
			returnVal = ",";
			break;		
		case 190:
			returnVal = ".";
			break;	
		case 191:
			returnVal = "/";
			break;	
		case 186:
			returnVal = ";";
			break;	
		case 222:
			returnVal = "\"";
			break;	
		case 219:
			returnVal = "{";
			break;	
		case 221:
			returnVal = "}";
			break;	
		case 189:
			returnVal = "-";
			break;	
		case 187:
			returnVal = "=";
			break;	
		case 220:
			returnVal = "|";
			break;		
		case 192:
			returnVal = "~";
			break;	

		case 48:
		case 49:
		case 50:
		case 51:
		case 52:
		case 53:
		case 54:
		case 55:
		case 56:
		case 57:
		case 65:
		case 66:
		case 67:
		case 68:
		case 69:
		case 70:
		case 71:
		case 72:
		case 73:
		case 74:
		case 75:
		case 76:
		case 77:
		case 78:
		case 79:
		case 80:
		case 81:
		case 82:
		case 83:
		case 84:
		case 85:
		case 86:
		case 87:
		case 88:
		case 89:
		case 90:
			returnVal = (char)keyCode;
			break;

		default:
			returnVal = "NORECORD";
			break;
	}

	return returnVal;
}
