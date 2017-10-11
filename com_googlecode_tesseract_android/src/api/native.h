#ifndef API_NATIVE_H_
#define API_NATIVE_H_

#if 0
#define EXPORT_DLL __declspec(dllexport)
#else
#define EXPORT_DLL 
#endif

extern "C" {
	EXPORT_DLL const char* testVersion();
	EXPORT_DLL int MyAddFunc(int _a, int _b);
}
#endif