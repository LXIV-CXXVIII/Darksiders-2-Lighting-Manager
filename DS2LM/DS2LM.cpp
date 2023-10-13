#include "pch.h"
#include "DS2LM.h"

namespace DS2LM {

	VOID LightManager::ReadLightTOML() {
	
		constexpr auto path = L"/plugins/DS2LM";
		constexpr auto ext = L".toml";
		constexpr auto basecfg = L"/plugins/DS2LM/settings.toml";

		const auto readToml = [&](std::filesystem::path path) {
		
			try {
			
				const auto tbl = toml::parse_file(path.c_str());
				auto& arr = *tbl.get_as<toml::array>("world");

				for (auto&& elem : arr) {
				
					auto& worldTable = *elem.as_table();

					auto world = *worldTable["hWorld"].value<hstring>();

					auto lights = new Lights();

					//auto manager = new LightManager();
					lights->Contrast       = *worldTable["fContrast"].value<float>();
					lights->Saturation     = *worldTable["fSaturation"].value<float>();
					lights->Brightness     = *worldTable["fBrightness"].value<float>();
					lights->darknessMul    = *worldTable["fDarknessMul"].value<float>();
					lights->VFXBloomMul    = *worldTable["fVFXBloomMul"].value<float>();
					lights->modelRed       = *worldTable["fModelRed"].value<float>();
					lights->modelGreen     = *worldTable["fModelGreen"].value<float>();
					lights->modelBlue      = *worldTable["fModelBlue"].value<float>();
					lights->modelAlpha     = *worldTable["fModelAlpha"].value<float>();
					lights->fogSwitch      = *worldTable["bFogSwitch"].value<bool>();
					lights->fogStr         = *worldTable["fFogStr"].value<float>();
					lights->fogDist        = *worldTable["fFogDist"].value<float>();
					lights->fogNear        = *worldTable["fFogNear"].value<float>();
					lights->fogRed         = *worldTable["fFogRed"].value<float>();
					lights->fogGreen       = *worldTable["fFogGreen"].value<float>();
					lights->fogBlue        = *worldTable["fFogBlue"].value<float>();
					lights->sunLightRed    = *worldTable["fSunLightRed"].value<float>();
					lights->sunLightGreen  = *worldTable["fSunLightGreen"].value<float>();
					lights->sunLightBlue   = *worldTable["fSunLightBlue"].value<float>();
					lights->sunLightAlpha  = *worldTable["fSunLightAlpha"].value<float>();
					lights->sunLightStr    = *worldTable["fSunLightStr"].value<float>();
					lights->sunSpriteRed   = *worldTable["fSunSpriteRed"].value<float>();
					lights->sunSpriteGreen = *worldTable["fSunSpriteGreen"].value<float>();
					lights->sunSpriteBlue  = *worldTable["fSunSpriteBlue"].value<float>();
					lights->sunSpriteAlpha = *worldTable["fSunSpriteAlpha"].value<float>();
					lights->sunSpriteSize  = *worldTable["fSunSpriteSize"].value<float>();
					lights->godrayPowerMul = *worldTable["fGodrayPowerMul"].value<float>();
					lights->godrayOutlineR = *worldTable["fGodrayOutlineR"].value<float>();
					lights->godrayOutlineG = *worldTable["fGodrayOutlineG"].value<float>();
					lights->godrayOutlineB = *worldTable["fGodrayOutlineB"].value<float>();
					lights->godrayOutlineA = *worldTable["fGodrayOutlineA"].value<float>();
					lights->godrayEdgeR    = *worldTable["fGodrayEdgeR"].value<float>();
					lights->godrayEdgeG    = *worldTable["fGodrayEdgeG"].value<float>();
					lights->godrayEdgeB    = *worldTable["fGodrayEdgeB"].value<float>();
					lights->godrayEdgeA    = *worldTable["fGodrayEdgeA"].value<float>();
					lights->godrayFillR    = *worldTable["fGodrayFillR"].value<float>();
					lights->godrayFillG    = *worldTable["fGodrayFillG"].value<float>();
					lights->godrayFillB    = *worldTable["fGodrayFillB"].value<float>();
					lights->godrayFillA    = *worldTable["fGodrayFillA"].value<float>();
					lights->godrayShineR   = *worldTable["fGodrayShineR"].value<float>();
					lights->godrayShineG   = *worldTable["fGodrayShineG"].value<float>();
					lights->godrayShineB   = *worldTable["fGodrayShineB"].value<float>();
					lights->godrayShineS   = *worldTable["fGodrayShineS"].value<float>();
					lights->sunSpriteX     = *worldTable["fSunSpriteX"].value<float>();
					lights->sunSpriteY     = *worldTable["fSunSpriteY"].value<float>();

					lightMap.insert_or_assign(world, lights);
				
				};
			
			} catch (const toml::parse_error& e) {

				//std::ostringstream ss;
				//ss << "Error parsing file \'" << *e.source().path << "\:\n"
					//<< '\t' << e.description() << '\n'
					//<< "\t\t(" << e.source().begin << ')';
				//printf("%s", ss.str());
				printf("parse error\n");

			} catch (const std::exception& e) {
			
				printf(e.what());

			} catch (...) {
			
				printf("Unknown failure\n");
			
			};

		};

		auto baseToml = std::filesystem::path(basecfg);
		readToml(baseToml);
		if (std::filesystem::is_directory(path)) {
		
			for (const auto& file :std::filesystem::directory_iterator(path)) {
			
				if (std::filesystem::is_regular_file(file) && file.path().extension() == ext) {
			
					if (file.path() != basecfg) readToml(file.path());
			
				};
			
			};
		
		};

	};

	LightManager::LightManager() {
	
		ReadLightTOML();
	
	};
	
	LightManager::~LightManager() {
	};

	DWORD64 pLightMan = NULL;

	VOID thread() {
		
		while (auto t = true) {
		
			auto Darksiders2 = *(UINT_PTR*)0x141EEC2C0;

			if (Darksiders2) {

				Sleep(100);  // dont go the speed of light, you WILL die
			
				auto World = *(hstring*)(Darksiders2 + 0x1F0);
				auto StartPoint = *(hstring*)(Darksiders2 + 0x138);

				auto LightMan = DS2LM::LightManager::GetSingleton();

				//printf("hello\n");

				for (auto i : LightMan->lightMap) {
				
					if (World == i.first || StartPoint == i.first) {

						pLightMan = (DWORD64)&i.second;
					
					};
				
				};
			
			};
		
		};

	};

};