#include "native.h"

extern "C" {
	 const char*  testVersion()
	{
		 const char* bb = "teststring";
		return bb;
	}
	int MyAddFunc(int _a, int _b)
	 {
		 return _a + _b;
	 }
}