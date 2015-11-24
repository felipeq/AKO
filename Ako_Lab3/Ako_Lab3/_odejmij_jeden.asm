.686
.model flat
public _odejmij_jeden
.code
_odejmij_jeden PROC
	push ebp ; zapisanie zawartoœci EBP na stosie
	mov ebp, esp ; kopiowanie zawartoœci ESP do EBP
	mov ebx, [ebp+8]
	mov edx, [ebx]
	mov eax, [edx]
	
	dec eax
	mov [edx],eax
	

	pop ebp
	ret
_odejmij_jeden ENDP
end