#include <windows.h>
#include <stdio.h>
#include <time.h>
#include <sys/types.h>
#include <sys/timeb.h>
#include <string>
#include <iostream>
#include <fstream>

using namespace std;

int main()
{
    time_t rawtime;
    struct tm * timeinfo;
    string time_str;
    int hour = 0;
    int minutes = 0;
    string weekday;
    int begin_hour = 0;
    int begin_minutes = 0;
    string begin_weekday;
    int elapsed_minutes = 0;
    string minutes_prev;
    int minutes_previous = 0;
    
    fstream file("storage.txt", fstream::in);
    if (!file)
    {
        cout << "file don't exist, bitch\n";
        file.close();
        file.open("storage.txt", fstream::out);
        file.close();
        file.open("storage.txt");
        file << "10\n";
        file.close();
        
        system("pause");
    }
    file.close();
    
    time ( &rawtime );
    timeinfo = localtime ( &rawtime );
   
    time_str = asctime(timeinfo);
    begin_weekday = time_str.substr(0, 3);
    begin_hour = atoi(time_str.substr(11, 2).c_str());                
    begin_minutes = atoi(time_str.substr(14, 2).c_str());
    
    //file >> minutes_prev;
    //minutes_previous = atoi(minutes_prev.c_str());
    
    for(;;)
    {
            time ( &rawtime );
            timeinfo = localtime ( &rawtime );
            
            time_str = asctime(timeinfo);
            weekday = time_str.substr(0, 3);
            hour = atoi(time_str.substr(11, 2).c_str());                
            minutes = atoi(time_str.substr(14, 2).c_str());
            
            elapsed_minutes = (minutes - begin_minutes) + minutes_previous;
            
            cout << elapsed_minutes << endl;
    }
    
    return 0;
}
    
    

/*LRESULT CALLBACK WndProc(HWND, UINT, WPARAM, LPARAM);

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE hPrevInstance,
                   PSTR szCmdLine, int iCmdShow)
{
    //Windows gunk
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
						  
     //Time gunk
    time_t rawtime;
    struct tm * timeinfo;
    string time_str;
    int hour = 0;
    int minutes = 0;
    string weekday;
    int begin_hour = 0;
    int begin_minutes = 0;
    string begin_weekday;
    int elapsed_minutes = 0;
    
    //File I/O gunk
    fstream storage_file
    
    
    bool started_playing = false;    
    
    for(;;)
    {
        if ( FindWindow(NULL, "Minecraft")) //If Minecraft is being played
        {
            if (started_playing == false) //Check to see if Minecraft was just started
            {
               started_playing = true;
               //Get the time info
                   time ( &rawtime );
                   timeinfo = localtime ( &rawtime );
                   
                   time_str = asctime(timeinfo);
                   begin_weekday = time_str.substr(0, 3);
                   begin_hour = atoi(time_str.substr(11, 2).c_str());                
                   begin_minutes = atoi(time_str.substr(14, 2).c_str());
                   elapsed_minutes = 0;
            }
            
            
            //Grab the window, end it, display message
            /*  DWORD pid;
                HANDLE hand1 = NULL;
                HWND hwndWindow1;
                hwndWindow1 = FindWindow(NULL, "Minecraft");
                GetWindowThreadProcessId(hwndWindow1, &pid);
                hand1 = OpenProcess(PROCESS_ALL_ACCESS,0,pid);
                TerminateProcess(hand1, 0);
                MessageBox(hwnd, "LOL OWNED!!", "OWNED!", MB_OK | MB_ICONEXCLAMATION);
            *//*
            
            //Get the time info
                time ( &rawtime );
                timeinfo = localtime ( &rawtime );
                
                time_str = asctime(timeinfo);
                weekday = time_str.substr(0, 3);
                hour = atoi(time_str.substr(11, 2).c_str());                
                minutes = atoi(time_str.substr(14, 2).c_str());
            
            //Figure out the elapsed time
                elapsed_minutes = (((hour - begin_hour) * 60) + (minutes - begin_minutes));   
                                      
        }
        else if (started_playing == true) //If Minecraft was exited
        {
             started_playing = false;
        }
    }
    UnregisterClass("GameTutorials",hInstance);
    
    return 0;
}

LRESULT CALLBACK WndProc(HWND hwnd, UINT iMsg, WPARAM wParam, LPARAM lParam)
{
	return 0;  				
}*/
