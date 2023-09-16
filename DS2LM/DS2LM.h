#pragma once
#include <Windows.h>
#include "MinHook/include/MinHook.h"
#include "tomlplusplus-3.3.0/include/toml++/toml.h"
#include <unordered_map>
#include <filesystem>
#define hstring DWORD64

namespace DS2LM {

	class LightManager {
	
	public:
		static LightManager* GetSingleton() {
			static LightManager singleton;
			return &singleton;
		};

		static VOID ReadLightTOML();

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
		float sunSpriteAlpha;  // 58
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

		static inline std::unordered_map<hstring, LightManager*> worldmap;
	
	};

	extern "C" DWORD64 pLightMan;

	/*
	enum HString : hstring {

		KINGDOM_OF_THE_DEAD = 0xAA07B1E10EEBF218,
		iKINGDOM_OF_THE_DEAD = 0x42BD5253C6827B03,
		FORGE_LANDS = 0xEDC98182781E74B7,
		iFORGE_LANDS = 0xAE730D1CAF1CE6D1,
		tFORGE_LANDS = 0xE5E3458C8B812831,
		LOST_LIGHT = 0x74A6ACF67449E5C6,
		iLOST_LIGHT = 0x9C1C4F44BC206CDD,
		SHADOWS_EDGE = 0x8E3BDD921FA796DF,
		tSHADOWS_EDGE = 0x66813E20D7CE1FC4,
		ICY_VEIL = 0x5EA9767D364658BE,
		iICY_VEIL = 0xB61395CFFE2FD1A5,
		CRUCIBLE = 0xA43407195DA82BA7,
		iCRUCIBLE = 0x4C8EE4AB95C1A2BC,
		MAIN_MENU = 0x0000000000000000,

		IVORY_CITADEL = 0x2DF0CD906C34EA5B,
		EARTH = 0x080A6C8F50240A13,
		PSYCHAMERON = 0x859077E0BA862F40,
		iPSYCHAMERON = 0xF0F49FE6BBADACBC

	};
	*/

	VOID thread();

}