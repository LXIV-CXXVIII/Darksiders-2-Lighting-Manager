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

entrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je exit
 mov rcx, [rcx]
	test rcx, rcx
	je exit
 movss xmm0, DWORD PTR [rcx]
 movss DWORD PTR [rdi+028h], xmm0
 mov eax, [rbx+02Ch]
exit:
 pop rcx
 jmp [rContrast]

xContrast ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSaturation PROC

entrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je exit
 mov rbx, [rbx]
	test rbx, rbx
	je exit
 movss xmm0, DWORD PTR [rbx+04h]
 movss DWORD PTR [rcx+040h], xmm0
 mov eax, DWORD PTR [rdx+044h]
exit:
 pop rbx
 jmp [rSaturation]

xSaturation ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xBrightness PROC

entrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je exit
 mov rcx, [rcx]
	test rcx, rcx
	je exit
 mov eax, [rcx+08h]
 mov [rdi+02Ch], eax
 mov eax, [rbx+030h]
exit:
 pop rcx
 jmp [rBrightness]

xBrightness ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xDarknessMul PROC

entrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je exit
 mov rbx, [rbx]
	test rbx, rbx
	je exit
 mov eax, [rbx+0B0h]
 mov [rcx+054h], eax
 mov rax, rcx
exit:
 pop rbx
 ret

xDarknessMul ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xModel PROC

entrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je exit
 mov rcx, [rcx]
	test rcx, rcx
	je exit
 movaps xmm0, [rcx+0Ch]
 movups [rdi+0230h], xmm0
exit:
 pop rcx
 jmp [rModel]

xModel ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogSwitch PROC

entrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je exit
 mov rbx, [rbx]
	test rbx, rbx
	je exit
 mov eax, DWORD PTR [rbx+01Ch]
 mov [rcx+01Ch], eax
 mov eax, [rdx+020h]
exit:
 pop rbx
 jmp [rFogSwitch]

xFogSwitch ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogStr PROC

entrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je exit
 mov rbx, [rbx]
	test rbx, rbx
	je exit
 movss xmm0, DWORD PTR [rbx+020h]
 movss DWORD PTR [rcx+020h], xmm0 
 mov eax, [rdx+024h]
exit:
 pop rbx
 jmp [rFogStr]

xFogStr ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogDist PROC

entrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je exit
 mov rbx, [rbx]
	test rbx, rbx
	je exit
 movss xmm0, DWORD PTR [rbx+024h]
 movss DWORD PTR [rcx+028h], xmm0
 mov eax, [rdx+030h]
exit:
 pop rbx
 jmp [rFogDist]

xFogDist ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogNear PROC

; TBA :noooooooo:

xFogNear ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogRed PROC

entrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je exit
 mov rbx, [rbx]
	test rbx, rbx
	je exit
 movss xmm1, DWORD PTR [rbx+02Ch]
 movss DWORD PTR [rcx+090h], xmm1
exit:
 pop rbx
 jmp [rFogR]

xFogRed ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogGreen PROC

entrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je exit
 mov rbx, [rbx]
	test rbx, rbx
	je exit
 movss xmm0, DWORD PTR [rbx+030h]
 movss DWORD PTR [rcx+094h], xmm0
exit:
 pop rbx
 jmp [rFogG]

xFogGreen ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xFogBlue PROC

entrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je exit
 mov rbx, [rbx]
	test rbx, rbx
	je exit
 movss xmm1, DWORD PTR [rbx+034h]
 movss DWORD PTR [rcx+098h], xmm1
exit:
 pop rbx
 jmp [rFogB]

xFogBlue ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSunLightRGB PROC

entrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je exit
 mov rcx, [rcx]
	test rcx, rcx
	je exit
 movups xmm0, [rcx+038h] 
 movdqu [rbx+0CB0h], xmm0
 movups xmm0, [rbx+0CB0h]
exit:
 pop rcx
 jmp [rSunLightRGB]

xSunLightRGB ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSunLightStr PROC

entrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je exit
 mov rcx, [rcx]
	test rcx, rcx
	je exit
 mov eax, [rcx+048h]
 mov [rbx+0C94h], eax
 mov eax, [rbx+0C94h]
exit:
 pop rcx
 jmp [rSunLightStr]

xSunLightStr ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSunSpriteRGB PROC

 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je exit
 mov rcx, [rcx]
	test rcx, rcx
	je exit
 movups xmm0, [rcx+04Ch]
 movdqu [rbx+0130h], xmm0
exit:
 pop rcx
 jmp [rSunSpriteRGB]

xSunSpriteRGB ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSunSpriteSize PROC

entrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je exit
 mov rcx, [rcx]
	test rcx, rcx
	je exit
 mov eax, [rcx+05Ch]
 mov [rbx+080h], eax
exit:
 pop rcx
 jmp [rSunSpriteSize]

xSunSpriteSize ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xGodrayPowerMul PROC

entrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je exit
 mov rcx, [rcx]
	test rcx, rcx
	je exit
 mov eax, [rcx+060h]
 mov [rbx+03Ch], eax
 mov eax, [rdi+040h]
exit:
 pop rcx
 jmp [rGodrayPowerMul]

xGodrayPowerMul ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xGodrayOutline PROC

entrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je exit
 mov rcx, [rcx]
	test rcx, rcx
	je exit
 movups xmm0, [rcx+064h]
 movdqu [rbx+0F0h], xmm0
exit:
 pop rcx
 jmp [rGodrayOutline]

xGodrayOutline ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xGodrayEdge PROC

entrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je exit
 mov rcx, [rcx]
	test rcx, rcx
	je exit
 movups xmm1, [rcx+074h]
 movdqu [rbx+0100h], xmm1
exit:
 pop rcx
 jmp [rGodrayEdge]

xGodrayEdge ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xGodrayFill PROC

entrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je exit
 mov rcx, [rcx]
	test rcx, rcx
	je exit
 movups xmm0, [rcx+084h]
 movdqu [rbx+0110h], xmm0
exit:
 pop rcx
 jmp [rGodrayFill]

xGodrayFill ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xGodrayShine PROC

entrance:
 push rcx
 mov rcx, [pLightMan]
	test rcx, rcx
	je exit
 mov rcx, [rcx]
	test rcx, rcx
	je exit
 movups xmm1, [rcx+094h]
 movdqu [rbx+0120h], xmm1
exit:
 pop rcx
 jmp [rGodrayShine]

xGodrayShine ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSunSpriteX PROC

entrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je exit
 mov rbx, [rbx]
	test rbx, rbx
	je exit
 mov eax, [rbx+0A4h]
 mov [rcx+0C8Ch], eax
 mov eax, [rcx+0C8Ch]
exit:
 pop rbx
 jmp [rSunSpriteX]

xSunSpriteX ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xSunSpriteY PROC

entrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je exit
 mov rbx, [rbx]
	test rbx, rbx
	je exit
 mov eax, DWORD PTR [rbx+0A8h]
 mov [rcx+0C90h], eax
 mov eax, [rcx+0C90h]
exit:
 pop rbx
 jmp [rSunSpriteY]

xSunSpriteY ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

xVFXBloomMul PROC

entrance:
 push rbx
 mov rbx, [pLightMan]
	test rbx, rbx
	je exit
 mov rbx, [rbx]
	test rbx, rbx
	je exit
 mov eax, [rbx+0ACh]
 mov [rcx+030h], eax
 mov eax, [rdx+034h]
exit:
 pop rbx
 jmp [rVFXBloomMul]

xVFXBloomMul ENDP

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


END