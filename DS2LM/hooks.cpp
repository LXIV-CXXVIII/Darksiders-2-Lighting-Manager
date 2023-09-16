#include "hooks.h"

namespace DS2LM {

	BOOL write_branch(DWORD64 addr, DWORD64 ret, LPVOID code) {

		if ((MH_CreateHook((LPVOID)addr, (LPVOID)code, NULL) != MH_OK) || (MH_EnableHook((LPVOID)addr) != MH_OK)) {
			return false;
		} else {
			return true;
		}

	};

};