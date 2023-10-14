.data 
EXTERN rContrast:QWORD
EXTERN rSaturation:QWORD
EXTERN rBrightness:QWORD
EXTERN rModel:QWORD
EXTERN rFogSwitch:QWORD
EXTERN rFogDist:QWORD
EXTERN rFogNear:QWORD
EXTERN rFogStr:QWORD
EXTERN rFogR:QWORD
EXTERN rFogG:QWORD
EXTERN rFogB:QWORD
EXTERN rSunLightRGB:QWORD
EXTERN rSunLightStr:QWORD
EXTERN rSunSpriteRGB:QWORD
EXTERN rSunSpriteSize:QWORD
EXTERN rGodrayPowerMul:QWORD
EXTERN rGodrayOutline:QWORD
EXTERN rGodrayEdge:QWORD
EXTERN rGodrayFill:QWORD
EXTERN rGodrayShine:QWORD
EXTERN rSunSpriteX:QWORD
EXTERN rSunSpriteY:QWORD
EXTERN rVFXBloomMul:QWORD
EXTERN pLightMan:QWORD ; OUR CLASS

.code 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xContrast PROC

contrastEntrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je contrastExit
 mov rcx, [rcx]
	test rcx, rcx
	je contrastExit
 movss xmm0, DWORD PTR [rcx]
 movss DWORD PTR [rdi+028h], xmm0
contrastExit:
 mov eax, [rbx+02Ch]
 pop rcx
 jmp [rContrast]

xContrast ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSaturation PROC

saturationEntrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je saturationExit
 mov rbx, [rbx]
	test rbx, rbx
	je saturationExit
 movss xmm0, DWORD PTR [rbx+04h]
 movss DWORD PTR [rcx+040h], xmm0
saturationExit:
 mov eax, DWORD PTR [rdx+044h]
 pop rbx
 jmp [rSaturation]

xSaturation ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xBrightness PROC

brightnessEntrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je brightnessExit
 mov rcx, [rcx]
	test rcx, rcx
	je brightnessExit
 mov eax, [rcx+08h]
 mov [rdi+02Ch], eax
brightnessExit:
 mov eax, [rbx+030h]
 pop rcx
 jmp [rBrightness]

xBrightness ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xDarknessMul PROC

darknessEntrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je darknessExit
 mov rbx, [rbx]
	test rbx, rbx
	je darknessExit
 mov eax, [rbx+0B0h]
 mov [rcx+054h], eax
darknessExit:
 mov rax, rcx
 pop rbx
 ret

xDarknessMul ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xModel PROC

modelEntrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je modelExit
 mov rcx, [rcx]
	test rcx, rcx
	je modelExit
 movaps xmm0, [rcx+0Ch]
 movups [rdi+0230h], xmm0
modelExit:
 pop rcx
 jmp [rModel]

xModel ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogSwitch PROC

fogswitchEntrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je fogswitchExit
 mov rbx, [rbx]
	test rbx, rbx
	je fogswitchExit
 mov eax, DWORD PTR [rbx+01Ch]
 mov [rcx+01Ch], eax
fogswitchExit:
 mov eax, [rdx+020h]
 pop rbx
 jmp [rFogSwitch]

xFogSwitch ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogStr PROC

fogstrEntrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je fogstrExit
 mov rbx, [rbx]
	test rbx, rbx
	je fogstrExit
 movss xmm0, DWORD PTR [rbx+020h]
 movss DWORD PTR [rcx+020h], xmm0 
fogstrExit:
 mov eax, [rdx+024h]
 pop rbx
 jmp [rFogStr]

xFogStr ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogDist PROC

fogdistEntrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je fogdistExit
 mov rbx, [rbx]
	test rbx, rbx
	je fogdistExit
 movss xmm0, DWORD PTR [rbx+024h]
 movss DWORD PTR [rcx+028h], xmm0
fogdistExit:
 mov eax, [rdx+030h]
 pop rbx
 jmp [rFogDist]

xFogDist ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogNear PROC

; TBA :noooooooo:

xFogNear ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogRed PROC

fogredEntrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je fogredExit
 mov rbx, [rbx]
	test rbx, rbx
	je fogredExit
 movss xmm1, DWORD PTR [rbx+02Ch]
 movss DWORD PTR [rcx+090h], xmm1
fogredExit:
 pop rbx
 jmp [rFogR]

xFogRed ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogGreen PROC

foggreenEntrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je foggreenExit
 mov rbx, [rbx]
	test rbx, rbx
	je foggreenExit
 movss xmm0, DWORD PTR [rbx+030h]
 movss DWORD PTR [rcx+094h], xmm0
foggreenExit:
 pop rbx
 jmp [rFogG]

xFogGreen ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogBlue PROC

fogblueEntrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je fogblueExit
 mov rbx, [rbx]
	test rbx, rbx
	je fogblueExit
 movss xmm1, DWORD PTR [rbx+034h]
 movss DWORD PTR [rcx+098h], xmm1
fogblueExit:
 pop rbx
 jmp [rFogB]

xFogBlue ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSunLightRGB PROC

sunlightrgbEntrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je sunlightrgbExit
 mov rcx, [rcx]
	test rcx, rcx
	je sunlightrgbExit
 movups xmm0, [rcx+038h] 
 movaps [rbx+0CB0h], xmm0
sunlightrgbExit:
 movups xmm0, [rbx+0CB0h]
 pop rcx
 jmp [rSunLightRGB]

xSunLightRGB ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSunLightStr PROC

sunlightstrEntrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je sunlightstrExit
 mov rcx, [rcx]
	test rcx, rcx
	je sunlightstrExit
 mov eax, [rcx+048h]
 mov [rbx+0C94h], eax
sunlightstrExit:
 mov eax, [rbx+0C94h]
 pop rcx
 jmp [rSunLightStr]

xSunLightStr ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSunSpriteRGB PROC

sunspritergbEntrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je sunspritergbExit
 mov rcx, [rcx]
	test rcx, rcx
	je sunspritergbExit
 movups xmm0, [rcx+04Ch]
 movaps [rbx+0130h], xmm0
sunspritergbExit:
 pop rcx
 jmp [rSunSpriteRGB]

xSunSpriteRGB ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSunSpriteSize PROC

sunspritesizeEntrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je sunspritesizeExit
 mov rcx, [rcx]
	test rcx, rcx
	je sunspritesizeExit
 mov eax, [rcx+05Ch]
 mov [rbx+080h], eax
sunspritesizeExit:
 pop rcx
 jmp [rSunSpriteSize]

xSunSpriteSize ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xGodrayPowerMul PROC

godraypowerEntrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je godraypowerExit
 mov rcx, [rcx]
	test rcx, rcx
	je godraypowerExit
 mov eax, [rcx+060h]
 mov [rbx+03Ch], eax
godraypowerExit:
 mov eax, [rdi+040h]
 pop rcx
 jmp [rGodrayPowerMul]

xGodrayPowerMul ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xGodrayOutline PROC

godrayoutlineEntrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je godrayoutlineExit
 mov rcx, [rcx]
	test rcx, rcx
	je godrayoutlineExit
 movups xmm0, [rcx+064h]
 movaps [rbx+0F0h], xmm0
godrayoutlineExit:
 pop rcx
 jmp [rGodrayOutline]

xGodrayOutline ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xGodrayEdge PROC

godrayedgeEntrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je godrayedgeExit
 mov rcx, [rcx]
	test rcx, rcx
	je godrayedgeExit
 movups xmm1, [rcx+074h]
 movaps [rbx+0100h], xmm1
godrayedgeExit:
 pop rcx
 jmp [rGodrayEdge]

xGodrayEdge ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xGodrayFill PROC

godrayfillEntrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je godrayfillExit
 mov rcx, [rcx]
	test rcx, rcx
	je godrayfillExit
 movups xmm0, [rcx+084h]
 movdqu [rbx+0110h], xmm0
godrayfillExit:
 pop rcx
 jmp [rGodrayFill]

xGodrayFill ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xGodrayShine PROC

godrayshineEntrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je godrayshineExit
 mov rcx, [rcx]
	test rcx, rcx
	je godrayshineExit
 movups xmm1, [rcx+094h]
 movdqu [rbx+0120h], xmm1
godrayshineExit:
 pop rcx
 jmp [rGodrayShine]

xGodrayShine ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSunSpriteX PROC

sunspritexEntrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je sunspritexExit
 mov rbx, [rbx]
	test rbx, rbx
	je sunspritexExit
 mov eax, [rbx+0A4h]
 mov [rcx+0C8Ch], eax
sunspritexExit:
 mov eax, [rcx+0C8Ch]
 pop rbx
 jmp [rSunSpriteX]

xSunSpriteX ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSunSpriteY PROC

sunspriteyEntrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je sunspriteyExit
 mov rbx, [rbx]
	test rbx, rbx
	je sunspriteyExit
 mov eax, DWORD PTR [rbx+0A8h]
 mov [rcx+0C90h], eax
sunspriteyExit:
 mov eax, [rcx+0C90h]
 pop rbx
 jmp [rSunSpriteY]

xSunSpriteY ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xVFXBloomMul PROC

vfxbloomEntrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je vfxbloomExit
 mov rbx, [rbx]
	test rbx, rbx
	je vfxbloomExit
 mov eax, [rbx+0ACh]
 mov [rcx+030h], eax
vfxbloomExit:
 mov eax, [rdx+034h]
 pop rbx
 jmp [rVFXBloomMul]

xVFXBloomMul ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


END