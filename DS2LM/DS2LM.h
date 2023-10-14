#pragma once
#include <Windows.h>
#include "MinHook/include/MinHook.h"
#include "tomlplusplus-3.3.0/include/toml++/toml.h"
#include <unordered_map>
#include <filesystem>
#define hstring DWORD64

namespace DS2LM {

	class Lights { // this could prolly be a struct but eh
	
	public:
		float Contrast;   // 00
		float Saturation; // 4
		float Brightness; // 8
		float modelRed;		  // c
		float modelGreen;     // 10
		float modelBlue;      // 14
		float modelAlpha;     // 18

		int fogSwitch;    // 1c
		float fogStr;     // 20
		float fogDist;    // 24
		float fogNear;    // 28
		float fogRed;     // 2c
		float fogGreen;   // 30
		float fogBlue;    // 34

		float sunLightRed;    // 38
		float sunLightGreen;  // 3c
		float sunLightBlue;   // 40
		float sunLightAlpha;  // 44
		float sunLightStr;    // 48
		float sunSpriteRed;   // 4c
		float sunSpriteGreen; // 50
		float sunSpriteBlue;  // 54
		float sunSpriteAlpha; // 58
		float sunSpriteSize;  // 5c
		float godrayPowerMul; // 60
		float godrayOutlineR; // 64
		float godrayOutlineG; // 68
		float godrayOutlineB; // 6c
		float godrayOutlineA; // 70
		float godrayEdgeR;    // 74
		float godrayEdgeG;    // 78
		float godrayEdgeB;    // 7c
		float godrayEdgeA;    // 80
		float godrayFillR;    // 84
		float godrayFillG;    // 88
		float godrayFillB;    // 8c
		float godrayFillA;    // 90
		float godrayShineR;   // 94
		float godrayShineG;   // 98
		float godrayShineB;   // 9c
		float godrayShineS;   // a0
		float sunSpriteX;     // a4
		float sunSpriteY;     // a8
		float VFXBloomMul;    // ac
		float darknessMul;    // b0
	
	};

	class LightManager {

	public:
		static LightManager* GetSingleton() {
			static LightManager singleton;
			return &singleton;
		};

		LightManager();
		~LightManager();
		static VOID ReadLightTOML();

		static inline std::unordered_map<hstring, Lights*> lightMap;

	};

	extern "C" DWORD64 pLightMan;

	VOID thread();

}