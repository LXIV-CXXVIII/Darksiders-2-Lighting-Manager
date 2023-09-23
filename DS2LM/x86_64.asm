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

 push rcx
 mov rcx, [pLightMan]
 mov rcx, [rcx]
 movss xmm0, DWORD PTR [rcx]
 movss DWORD PTR [rdi+028h], xmm0
 mov eax, [rbx+02Ch]
 pop rcx
 jmp [rContrast]

xContrast ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSaturation PROC

 push rbx
 mov rbx, [pLightMan]
 mov rbx, [rbx]
 movss xmm0, DWORD PTR [rbx+04h]
 movss DWORD PTR [rcx+040h], xmm0
 mov eax, DWORD PTR [rdx+044h]
 pop rbx
 jmp [rSaturation]

xSaturation ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xBrightness PROC

 push rcx
 mov rcx, [pLightMan]
 mov rcx, [rcx]
 mov eax, [rcx+08h]
 mov [rdi+02Ch], eax
 mov eax, [rbx+030h]
 pop rcx
 jmp [rBrightness]

xBrightness ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xDarknessMul PROC

 push rbx
 mov rbx, [pLightMan]
 mov rbx, [rbx]
 mov eax, [rbx+0ACh]
 mov [rcx+054h], eax
 mov rax, rcx
 pop rbx
 ret

xDarknessMul ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xModel PROC

 push rcx
 mov rcx, [pLightMan]
 mov rcx, [rcx]
 movss xmm0, DWORD PTR [rcx+0Ch]  ; red
 movss DWORD PTR [rdi+0230h], xmm0
 movss xmm0, DWORD PTR [rcx+010h] ; green
 movss DWORD PTR [rdi+0234h], xmm0
 movss xmm0, DWORD PTR [rcx+014h] ; blue
 movss DWORD PTR [rdi+0238h], xmm0
 movss xmm0, DWORD PTR [rcx+018h] ; alpha
 movss DWORD PTR [rdi+023Ch], xmm0
 pop rcx
 jmp [rModel]

xModel ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogSwitch PROC

 push rbx
 mov rbx, [pLightMan]
 mov rbx, [rbx]
 mov eax, DWORD PTR [rbx+01Ch]
 mov [rcx+01Ch], eax
 mov eax, [rdx+020h]
 pop rbx
 jmp [rFogSwitch]

xFogSwitch ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogStr PROC

 push rbx
 mov rbx, [pLightMan]
 mov rbx, [rbx]
 movss xmm0, DWORD PTR [rbx+020h]
 movss DWORD PTR [rcx+020h], xmm0 
 mov eax, [rdx+024h]
 pop rbx
 jmp [rFogStr]

xFogStr ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogDist PROC

 push rbx
 mov rbx, [pLightMan]
 mov rbx, [rbx]
 movss xmm0, DWORD PTR [rbx+024h]
 movss DWORD PTR [rcx+028h], xmm0
 mov eax, [rdx+030h]
 pop rbx
 jmp [rFogDist]

xFogDist ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogNear PROC

; TBA

xFogNear ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogRed PROC

 push rbx
 mov rbx, [pLightMan]
 mov rbx, [rbx]
 movss xmm1, DWORD PTR [rbx+028h]
 movss DWORD PTR [rcx+090h], xmm1
 pop rbx
 jmp [rFogR]

xFogRed ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogGreen PROC

 push rbx
 mov rbx, [pLightMan]
 mov rbx, [rbx]
 movss xmm0, DWORD PTR [rbx+02Ch]
 movss DWORD PTR [rcx+094h], xmm0
 pop rbx
 jmp [rFogG]

xFogGreen ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogBlue PROC

 push rbx
 mov rbx, [pLightMan]
 mov rbx, [rbx]
 movss xmm1, DWORD PTR [rbx+030h]
 movss DWORD PTR [rcx+098h], xmm1
 pop rbx
 jmp [rFogB]

xFogBlue ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSunLightRGB PROC

 push rcx
 mov rcx, [pLightMan]
 mov rcx, [rcx]
 movups xmm0, [rcx+034h] 
 movdqu [rbx+0CB0h], xmm0
 movups xmm0, [rbx+0CB0h]
 pop rcx
 jmp [rSunLightRGB]

xSunLightRGB ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSunLightStr PROC

 push rcx
 mov rcx, [pLightMan]
 mov rcx, [rcx]
 mov eax, [rcx+044h]
 mov [rbx+0C94h], eax
 mov eax, [rbx+0C94h]
 pop rcx
 jmp [rSunLightStr]

xSunLightStr ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSunSpriteRGB PROC

 push rcx
 mov rcx, [pLightMan]
 mov rcx, [rcx]
 movups xmm0, [rcx+048h]
 movdqu [rbx+0130h], xmm0
 pop rcx
 jmp [rSunSpriteRGB]

xSunSpriteRGB ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSunSpriteSize PROC

 push rcx
 mov rcx, [pLightMan]
 mov rcx, [rcx]
 mov eax, [rcx+058h]
 mov [rbx+080h], eax
 pop rcx
 jmp [rSunSpriteSize]

xSunSpriteSize ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xGodrayPowerMul PROC

 push rcx
 mov rcx, [pLightMan]
 mov rcx, [rcx]
 mov eax, [rcx+05Ch]
 mov [rbx+03Ch], eax
 mov eax, [rdi+040h]
 pop rcx
 jmp [rGodrayPowerMul]

xGodrayPowerMul ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xGodrayOutline PROC

 push rcx
 mov rcx, [pLightMan]
 mov rcx, [rcx]
 movups xmm0, [rcx+060h]
 movdqu [rbx+0F0h], xmm0
 pop rcx
 jmp [rGodrayOutline]

xGodrayOutline ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xGodrayEdge PROC

 push rcx
 mov rcx, [pLightMan]
 mov rcx, [rcx]
 movups xmm1, [rcx+070h]
 movdqu [rbx+0100h], xmm1
 pop rcx
 jmp [rGodrayEdge]

xGodrayEdge ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xGodrayFill PROC

 push rcx
 mov rcx, [pLightMan]
 mov rcx, [rcx]
 movups xmm0, [rcx+080h]
 movdqu [rbx+0110h], xmm0
 pop rcx
 jmp [rGodrayFill]

xGodrayFill ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xGodrayShine PROC

 push rcx
 mov rcx, [pLightMan]
 mov rcx, [rcx]
 movups xmm1, [rcx+090h]
 movdqu [rbx+0120h], xmm1
 pop rcx
 jmp [rGodrayShine]

xGodrayShine ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSunSpriteX PROC

 push rbx
 mov rbx, [pLightMan]
 mov rbx, [rbx]
 mov eax, [rbx+0A0h]
 mov [rcx+0C8Ch], eax
 mov eax, [rcx+0C8Ch]
 pop rbx
 jmp [rSunSpriteX]

xSunSpriteX ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSunSpriteY PROC

 push rbx
 mov rbx, [pLightMan]
 mov rbx, [rbx]
 mov eax, DWORD PTR [rbx+0A4h]
 mov [rcx+0C90h], eax
 mov eax, [rcx+0C90h]
 pop rbx
 jmp [rSunSpriteY]

xSunSpriteY ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xVFXBloomMul PROC

 push rbx
 mov rbx, [pLightMan]
 mov rbx, [rbx]
 mov eax, [rbx+0A8h]
 mov [rcx+030h], eax
 mov eax, [rdx+034h]
 pop rbx
 jmp [rVFXBloomMul]

xVFXBloomMul ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


END