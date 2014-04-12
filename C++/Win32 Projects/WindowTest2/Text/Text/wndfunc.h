#include <windows.h>
#include <stdio.h>

LRESULT CALLBACK Messages(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
{
	static RECT clientRect = {0}; // This will hold the client dimensions of window
	
	TEXTMETRIC textInfo; // This a struct that contains the basic physical properties of a font							
	PAINTSTRUCT paintStruct; // A PAINTSTRUCT structure is something we need to paint (draw) when handling the WM_PAINT message.
	HDC hdc=NULL; // An HDC is a handle to a device context.  We use this handle as a way to communicate to the graphics card so we can draw things to the window.  
	int x, y; // These will be used to position our text.
	char szHello[]="Hello World!";

    switch(iMsg)											
    {														
		case WM_CREATE:										

			GetClientRect(hwnd, &clientRect);
			break;											

		case WM_SIZE:
									
			GetClientRect(hwnd, &clientRect);
			break;															

		case WM_DESTROY:									
			PostQuitMessage(0);																	
			break;

		case WM_PAINT:							
			hdc = BeginPaint(hwnd, &paintStruct);			
			
			GetTextMetrics(hdc, &textInfo);				
														
			SetTextColor(hdc, RGB(255, 0, 0));				

			x = clientRect.right / 2;
			y = clientRect.bottom / 2;
										
			x = x - ((strlen(szHello) * textInfo.tmAveCharWidth) / 2);											

			y = y - (textInfo.tmHeight / 2);											
						 
			TextOut(hdc, x, y, szHello, strlen(szHello));			

			EndPaint(hwnd, &paintStruct);					
		    break;
	}

	return DefWindowProc (hwnd, iMsg, wParam, lParam);	
}

void WINAPI CreateAWindow(HINSTANCE hInstance, HINSTANCE hPrevInstance, PSTR szCmdLine, int iCmdShow, 
						  int width, int height, const char Title[], const char ClassName[], HWND hwnd, MSG msg)
{
	WNDCLASSEX wndclass = {0};

	wndclass.cbSize = sizeof(wndclass); // Size of WNDCLASSEX		
	wndclass.style = CS_HREDRAW | CS_VREDRAW; // Style of WNDCLASSEX		
	wndclass.lpfnWndProc = Messages; // Pointer to our window procedure
	wndclass.hInstance = hInstance; // Instance of our window						
	wndclass.hbrBackground = (HBRUSH)GetStockObject(WHITE_BRUSH); // Background color of the window
	wndclass.hCursor = (HCURSOR)LoadImage(NULL, MAKEINTRESOURCE(IDC_ARROW), IMAGE_CURSOR,
										  0, 0, LR_SHARED); // Set the cursor to be the default arrow cursor
	wndclass.lpszClassName = ClassName; // Name of our class

	RegisterClassEx(&wndclass);

	hwnd = CreateWindowEx(WS_EX_CLIENTEDGE, // Extended window style that gives the border a sunken edge
						  ClassName, // The window's class name
						  Title, // Title bar text
						  WS_OVERLAPPEDWINDOW, // Window style
						  CW_USEDEFAULT, // The top left corner X value of the window in screen coordinates.  Windows will pick a default X value.
						  CW_USEDEFAULT, // The top left corner Y value of the window in screen coordinates.  Windows will pick a default Y value.
						  width, // Desired width of the window
						  height, // Desired height of the window
						  NULL,	// This is the parent window handle.  Since we don't have a parent window, we set this to NULL
						  NULL,	// This is the window menu handle, but since we don't have a menu, we set this to NULL.
						  hInstance, // This is the programs instance handle.  We just pass it our hInstance from our WinMain().
						  NULL); // If we wanted to pass in a variable or structure to the "WndProc", we would do it here.
	
	ShowWindow(hwnd, iCmdShow); // Show the window
    UpdateWindow(hwnd); // Update (paint) the window

		while(1) // Loop forever
	{	
		// Get any messages the OS has for us
		if(PeekMessage(&msg, NULL, 0, 0, PM_REMOVE))
		{
			// If the message says to quit, quit!
			if(msg.message == WM_QUIT)
				break;

			TranslateMessage(&msg); // Translate from virtual keys to character messages						
			DispatchMessage(&msg); // Send the message to the WndProc
		}							
	}

	// Unregister (free up) our WNDCLASSEX
	UnregisterClass(ClassName,hInstance);			   									
}