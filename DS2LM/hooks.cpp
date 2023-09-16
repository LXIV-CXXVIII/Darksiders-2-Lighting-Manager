#include "hooks.h"

namespace DS2LM {

	BOOL write_branch(DWORD64 addr, LPVOID code) {

		if ((MH_CreateHook((LPVOID)addr, (LPVOID)code, NULL) != MH_OK) || (MH_EnableHook((LPVOID)addr) != MH_OK)) {
			return false;
		} else {
			return true;
		}

	};

	DWORD64 rModel          = NULL;
	DWORD64 rContrast       = NULL;
	DWORD64 rSaturation     = NULL;
	DWORD64 rBrightness     = NULL;
	DWORD64 rFogSwitch      = NULL;
	DWORD64 rFogDist        = NULL;
	DWORD64 rFogNear        = NULL;
	DWORD64 rFogStr         = NULL;
	DWORD64 rFogR           = NULL;
	DWORD64 rFogG           = NULL;
	DWORD64 rFogB           = NULL;
	DWORD64 rSunLightRGB    = NULL;
	DWORD64 rSunLightStr    = NULL;
	DWORD64 rSunSpriteRGB   = NULL;
	DWORD64 rSunSpriteSize  = NULL;
	DWORD64 rGodrayPowerMul = NULL;
	DWORD64 rGodrayOutline  = NULL;
	DWORD64 rGodrayEdge     = NULL;
	DWORD64 rGodrayFill     = NULL;
	DWORD64 rGodrayShine    = NULL;
	DWORD64 rSunSpriteX     = NULL;
	DWORD64 rSunSpriteY     = NULL;
	DWORD64 rVFXBloomMul    = NULL;
	DWORD64 rDarknessMul    = NULL;

	VOID init_hooks() {
	
		DWORD64 addr = NULL;

		// model
		addr = (0x1407E1BFA);
		rModel = (0x1407E1C02);
		if (!write_branch(addr, xModel)) {
			printf("bad hook: %llx with retn: %llx", addr, rModel);
		}

		// contrast
		addr = (0x1407CD43F);
		rContrast = (0x1407CD445);
		if (!write_branch(addr, xContrast)) {
			printf("bad hook: %llx with retn: %llx", addr, rContrast);
		}

		// saturation
		addr = (0x1407CD8B9);
		rSaturation = (0x1407CD8BF);
		if (!write_branch(addr, xSaturation)) {
			printf("bad hook: %llx with retn: %llx", addr, rSaturation);
		}

		// brightness
		addr = (0x1407CD445);
		rBrightness = (0x1407CD44B);
		if (!write_branch(addr, xBrightness)) {
			printf("bad hook: %llx with retn: %llx", addr, rBrightness);
		}

		// fog on/off
		addr = (0x1407C3EF7);
		rFogSwitch = (0x1407C3EFD);
		if (!write_branch(addr, xFogSwitch)) {
			printf("bad hook: %llx with retn: %llx", addr, rFogSwitch);
		}

		// fog strength
		addr = (0x1407C3EFD);
		rFogStr = (0x1407C3F03);
		if (!write_branch(addr, xFogStr)) {
			printf("bad hook: %llx with retn: %llx", addr, rFogStr);
		}

		// fog distance
		addr = (0x1407C3F09);
		rFogDist = (0x1407C3F0F);
		if (!write_branch(addr, xFogDist)) {
			printf("bad hook: %llx with retn: %llx", addr, rFogDist);
		}

		// fog near
		addr = NULL;
		rFogNear = (0x0);
		if (!write_branch(addr, xFogNear)) {
			printf("bad hook: %llx with retn: %llx", addr, rFogNear);
		}

		/// fog red
		addr = (0x1407C41C7);
		rFogR = (0x1407C41CF);
		if (!write_branch(addr, xFogRed)) {
			printf("bad hook: %llx with retn: %llx", addr, rFogR);
		}

		/// fog green
		addr = (0x1407C41D6);
		rFogG = (0x1407C41DE);
		if (!write_branch(addr, xFogGreen)) {
			printf("bad hook: %llx with retn: %llx", addr, rFogG);
		}

		/// fog blue
		addr = (0x1407C41E9);
		rFogB = (0x1407C41F1);
		if (!write_branch(addr, xFogBlue)) {
			printf("bad hook: %llx with retn: %llx", addr, rFogB);
		}

		/// Sunlight RGB
		addr = (0x1407E1DA3);
		rSunLightRGB = (0x1407E1DAA);
		if (!write_branch(addr, xSunLightRGB)) {
			printf("bad hook: %llx with retn: %llx", addr, rSunLightRGB);
		}

		/// sunlight strength
		addr = (0x1407E1DB2);
		rSunLightStr = (0x1407E1DB8);
		if (!write_branch(addr, xSunLightStr)) {
			printf("bad hook: %llx with retn: %llx", addr, rSunLightStr);
		}

		/// sun sprite RGB
		addr = (0x14075E054);
		rSunSpriteRGB = (0x14075E05C);
		if (!write_branch(addr, xSunSpriteRGB)) {
			printf("bad hook: %llx with retn: %llx", addr, rSunSpriteRGB);
		}

		/// sun sprite size
		addr = (0x14075DCBA);
		rSunSpriteSize = (0x14075DCC0);
		if (!write_branch(addr, xSunSpriteSize)) {
			printf("bad hook: %llx with retn: %llx", addr, rSunSpriteSize);
		}

		/// godray power mul
		addr = (0x14075DC5D);
		rGodrayPowerMul = (0x14075DC63);
		if (!write_branch(addr, xGodrayPowerMul)) {
			printf("bad hook: %llx with retn: %llx", addr, rGodrayPowerMul);
		}

		/// godray outline
		addr = (0x14075E018);
		rGodrayOutline = (0x14075E020);
		if (!write_branch(addr, xGodrayOutline)) {
			printf("bad hook: %llx with retn: %llx", addr, rGodrayOutline);
		}

		/// godray edge
		addr = (0x14075E027);
		rGodrayEdge = (0x14075E02F);
		if (!write_branch(addr, xGodrayEdge)) {
			printf("bad hook: %llx with retn: %llx", addr, rGodrayEdge);
		}

		/// godray fill
		addr = (0x14075E036);
		rGodrayFill = (0x14075E03E);
		if (!write_branch(addr, xGodrayFill)) {
			printf("bad hook: %llx with retn: %llx", addr, rGodrayFill);
		}

		/// godray shine
		addr = (0x14075E045);
		rGodrayShine = (0x14075E04D);
		if (!write_branch(addr, xGodrayShine)) {
			printf("bad hook: %llx with retn: %llx", addr, rGodrayShine);
		}

		/// sun sprite X
		addr = (0x1407E1BA3);
		rSunSpriteX = (0x1407E1BA9);
		if (!write_branch(addr, xSunSpriteX)) {
			printf("bad hook: %llx with retn: %llx", addr, rSunSpriteX);
		}

		/// sun sprite Y
		addr = (0x1407E1BAF);
		rSunSpriteY = (0x1407E1BB5);
		if (!write_branch(addr, xSunSpriteY)) {
			printf("bad hook: %llx with retn: %llx", addr, rSunSpriteY);
		}

		/// VFX bloom mul
		addr = (0x1407CD89B);
		rVFXBloomMul = (0x1407CD8A1);
		if (!write_branch(addr, xVFXBloomMul)) {
			printf("bad hook: %llx with retn: %llx", addr, rVFXBloomMul);
		}

		// Darkness
		addr = (0x1407CD8D7);
		rDarknessMul = (0xFFFFFFFFF);
		if (!write_branch(addr, xDarknessMul)) {
			printf("bad hook: %llx with retn: %llx", addr, rDarknessMul);
		}

	};

};