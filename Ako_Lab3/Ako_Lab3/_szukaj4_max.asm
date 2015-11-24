.686
.model flat
public _szukaj4_max
.code
_szukaj4_max PROC
	push ebp ; zapisanie zawartoœci EBP na stosie
	mov ebp, esp ; kopiowanie zawartoœci ESP do EBP
	mov eax, [ebp+8] ; liczba w
	cmp eax, [ebp+12] ; porownanie liczb w i x
	jge w_wieksze
	jmp x_wieksze

	wpisz_z:
	mov eax,[ebp+20]
	zakoncz:
	pop ebp
	ret

	x_wieksze:
	mov eax,[ebp+12]
	cmp eax,[ebp+16]
	jge znowu_wieksze
	mov eax,[ebp+16]
	jmp znowu_wieksze

	w_wieksze:
	cmp eax, [ebp+16] ; porow z y
	jge znowu_wieksze
	mov eax,[ebp+16]

	znowu_wieksze:
	cmp eax,[ebp+20]; porow z z
	jge zakoncz
	jmp wpisz_z

_szukaj4_max ENDP
END