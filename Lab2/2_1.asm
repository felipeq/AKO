.686
.model flat
extern __write			: PROC
extern _ExitProcess@4	: PROC

public _main1
.data
tekst	db	10,'Nazywam si',0A9H,' Filip Biedrzycki',10
		db	'M',0A2H, 'j pierwszy 32-bitowy program '
		db	'asemblerowy dzia',088H,'a ju',0BEH,' poprawnie!',10
.code
_main1:
	mov		ecx, 94
	push	ecx
	push	dword PTR OFFSET tekst
	push	dword PTR 1
	call	__write
	add		esp, 12
	push	dword PTR 0
	call _ExitProcess@4
END