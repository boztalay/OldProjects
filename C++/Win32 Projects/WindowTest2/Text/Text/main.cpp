#include <windows.h>
#include <stdio.h>
#include "wndfunc.h"

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance, PSTR szCmdLine, int iCmdShow)
{
	HWND hwnd;
	MSG msg;

	CreateAWindow(hInstance, hPrevInstance, szCmdLine, iCmdShow,
					400, 200, "THE TITLE!!!", "WndClass1", hwnd, msg);
	return msg.wParam;									
}



void WndProc(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
{
	Messages(hwnd, iMsg, wParam, lParam);
}
