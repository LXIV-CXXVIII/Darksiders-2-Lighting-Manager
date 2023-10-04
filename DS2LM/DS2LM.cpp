#include "pch.h"
#include "DS2LM.h"

namespace DS2LM {

	VOID LightManager::ReadLightTOML() {
	
		constexpr auto path = L"plugins/DS2LM";
		constexpr auto ext = L".toml";
		constexpr auto basecfg = L"plugins/DS2LM/DS2LM.toml";

		const auto readToml = [&](std::filesystem::path path) {
		
			try {
			
				const auto tbl = toml::parse_file(path.c_str());
				auto& arr = *tbl.get_as<toml::array>("world");

				for (auto&& elem : arr) {
				
					auto& worldTable = *elem.as_table();

					auto world = *worldTable["world"].value<hstring>();

					auto manager = new LightManager();
					manager->Contrast       = *worldTable["fContrast"].value<float>();
					manager->Saturation     = *worldTable["fSaturation"].value<float>();
					manager->Brightness     = *worldTable["fBrightness"].value<float>();
					manager->darknessMul    = *worldTable["fDarknessMul"].value<float>();
					manager->VFXBloomMul    = *worldTable["fVFXBloomMul"].value<float>();
					manager->modelRed       = *worldTable["fModelRed"].value<float>();
					manager->modelGreen     = *worldTable["fModelGreen"].value<float>();
					manager->modelBlue      = *worldTable["fModelBlue"].value<float>();
					manager->modelAlpha     = *worldTable["fModelAlpha"].value<float>();
					manager->fogSwitch      = *worldTable["bFogSwitch"].value<bool>();
					manager->fogStr         = *worldTable["fFogStr"].value<float>();
					manager->fogDist        = *worldTable["fFogDist"].value<float>();
					manager->fogNear        = *worldTable["fFogNear"].value<float>();
					manager->fogRed         = *worldTable["fFogRed"].value<float>();
					manager->fogGreen       = *worldTable["fFogGreen"].value<float>();
					manager->fogBlue        = *worldTable["fFogBlue"].value<float>();
					manager->sunLightRed    = *worldTable["fSunLightRed"].value<float>();
					manager->sunLightGreen  = *worldTable["fSunLightGreen"].value<float>();
					manager->sunLightBlue   = *worldTable["fSunLightBlue"].value<float>();
					manager->sunLightAlpha  = *worldTable["fSunLightAlpha"].value<float>();
					manager->sunLightStr    = *worldTable["fSunLightStr"].value<float>();
					manager->sunSpriteRed   = *worldTable["fSunSpriteRed"].value<float>();
					manager->sunSpriteGreen = *worldTable["fSunSpriteGreen"].value<float>();
					manager->sunSpriteBlue  = *worldTable["fSunSpriteBlue"].value<float>();
					manager->sunSpriteAlpha = *worldTable["fSunSpriteAlpha"].value<float>();
					manager->sunSpriteSize  = *worldTable["fSunSpriteSize"].value<float>();
					manager->godrayPowerMul = *worldTable["fGodrayPowerMul"].value<float>();
					manager->godrayOutlineR = *worldTable["fGodrayOutlineR"].value<float>();
					manager->godrayOutlineG = *worldTable["fGodrayOutlineG"].value<float>();
					manager->godrayOutlineB = *worldTable["fGodrayOutlineB"].value<float>();
					manager->godrayOutlineA = *worldTable["fGodrayOutlineA"].value<float>();
					manager->godrayEdgeR    = *worldTable["fGodrayEdgeR"].value<float>();
					manager->godrayEdgeG    = *worldTable["fGodrayEdgeG"].value<float>();
					manager->godrayEdgeB    = *worldTable["fGodrayEdgeB"].value<float>();
					manager->godrayEdgeA    = *worldTable["fGodrayEdgeA"].value<float>();
					manager->godrayFillR    = *worldTable["fGodrayFillR"].value<float>();
					manager->godrayFillG    = *worldTable["fGodrayFillG"].value<float>();
					manager->godrayFillB    = *worldTable["fGodrayFillB"].value<float>();
					manager->godrayFillA    = *worldTable["fGodrayFillA"].value<float>();
					manager->godrayShineR   = *worldTable["fGodrayShineR"].value<float>();
					manager->godrayShineG   = *worldTable["fGodrayShineG"].value<float>();
					manager->godrayShineB   = *worldTable["fGodrayShineB"].value<float>();
					manager->godrayShineS   = *worldTable["fGodrayShineS"].value<float>();
					manager->sunSpriteX     = *worldTable["fSunSpriteX"].value<float>();
					manager->sunSpriteY     = *worldTable["fSunSpriteY"].value<float>();

					worldmap.insert_or_assign(world, manager);
				
				};
			
			} catch (const toml::parse_error& e) {

				std::ostringstream ss;
				//ss << "Error parsing file \'" << *e.source().path << "\:\n"
					//<< '\t' << e.description() << '\n'
					//<< "\t\t(" << e.source().begin << ')';
				//printf("%s", ss.str());

			} catch (const std::exception& e) {
			
				//printf(e.what());

			} catch (...) {
			
				//printf("Unknown failure");
			
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

				for (auto i : LightMan->worldmap) {
				
					if (World == i.first || StartPoint == i.first) {
					
						pLightMan = (DWORD64)&i.second;
					
					};
				
				};
			
			};
		
		};

	};

};