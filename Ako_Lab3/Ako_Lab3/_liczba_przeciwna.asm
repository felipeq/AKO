.686
.model flat
public _liczba_przeciwna
.code
_liczba_przeciwna PROC
	push ebp ; zapisanie zawartoœci EBP na stosie
	mov ebp, esp ; kopiowanie zawartoœci ESP do EBP
	mov ebx, [ebp+8]
	mov eax, [ebx]
	mov ecx,0
	dec ecx
	imul eax,ecx
	mov [ebx],eax

	pop ebp
	ret
_liczba_przeciwna ENDP
end