// dllmain.cpp : Defines the entry point for the DLL application.
#include "pch.h"
#include "DS2LM.h"
#include "hooks.h"

//void DS2LM() {
//};

DWORD WINAPI MainThread() {

    CreateThread(0, 0, (LPTHREAD_START_ROUTINE)DS2LM::thread, 0, 0, 0);
    Sleep(100);
    DS2LM::init_hooks();

    return 0;

};

BOOL InitInstance() {

    if (MH_Initialize() != MH_OK) {
    
        ExitProcess(0xDEADBEEF);
    
    };

    if (MH_EnableHook(MH_ALL_HOOKS) != MH_OK) {
    
        ExitProcess(0xBEEEEEEF);
    
    };

    MainThread();

    return true;
};

BOOL ExitInstance() {
    return true;
};

BOOL APIENTRY DllMain( HMODULE hModule,
                       DWORD  ul_reason_for_call,
                       LPVOID lpReserved
                     )
{
    switch (ul_reason_for_call)
    {
    case DLL_PROCESS_ATTACH:
        FILE* fp;
        AllocConsole();
        SetConsoleTitleA("DS2LM - Debug Console");
        freopen_s(&fp, "CONOUT$", "w", stdout);
        InitInstance();
        break;
    case DLL_PROCESS_DETACH:
        ExitInstance();
        break;
    }
    return TRUE;
}

