#pragma once
#include "DS2LM.h"

namespace DS2LM {

	BOOL write_branch(DWORD64, LPVOID);
	VOID init_hooks();

	extern "C" DWORD64 pLightMan;

	///------- x86_64 -------///
	extern "C" VOID xContrast();
	extern "C" VOID xSaturation();
	extern "C" VOID xBrightness();
	extern "C" VOID xDarknessMul();
	extern "C" VOID xModel();
	extern "C" VOID xFogSwitch();
	extern "C" VOID xFogStr();
	extern "C" VOID xFogDist();
	extern "C" VOID xFogNear();
	extern "C" VOID xFogRed();
	extern "C" VOID xFogGreen();
	extern "C" VOID xFogBlue();
	extern "C" VOID xSunLightRGB();
	extern "C" VOID xSunLightStr();
	extern "C" VOID xSunSpriteRGB();
	extern "C" VOID xSunSpriteSize();
	extern "C" VOID xGodrayPowerMul();


	extern "C" VOID xGodrayOutline();
	extern "C" VOID xGodrayEdge();
	extern "C" VOID xGodrayFill();
	extern "C" VOID xGodrayShine();
	extern "C" VOID xSunSpriteX();
	extern "C" VOID xSunSpriteY();
	extern "C" VOID xVFXBloomMul();

	
	///------- RETURNS -------///
	//post processing
	extern "C" DWORD64 rContrast;
	extern "C" DWORD64 rSaturation;
	extern "C" DWORD64 rBrightness;
	extern "C" DWORD64 rVFXBloomMul;
	extern "C" DWORD64 rDarknessMul;
	extern "C" DWORD64 rModel;

	//fog
	extern "C" DWORD64 rFogSwitch;
	extern "C" DWORD64 rFogDist;
	extern "C" DWORD64 rFogNear;
	extern "C" DWORD64 rFogStr;
	extern "C" DWORD64 rFogR;
	extern "C" DWORD64 rFogG;
	extern "C" DWORD64 rFogB;

	// sunlight
	extern "C" DWORD64 rSunLightRGB;
	extern "C" DWORD64 rSunLightStr;
	extern "C" DWORD64 rSunSpriteRGB;
	extern "C" DWORD64 rSunSpriteSize;
	extern "C" DWORD64 rGodrayPowerMul;
	extern "C" DWORD64 rGodrayOutline;
	extern "C" DWORD64 rGodrayEdge;
	extern "C" DWORD64 rGodrayFill;
	extern "C" DWORD64 rGodrayShine;
	extern "C" DWORD64 rSunSpriteX;
	extern "C" DWORD64 rSunSpriteY;
	extern "C" DWORD64 rVFXBloomMul;
	

};