.686
.model flat
public _suma

.code
_suma PROC
push ebp
mov ebp, esp
mov edx,2
mov eax,0
mov ecx,[ebp+edx*4]

ptl:
inc edx
add eax,[ebp+edx*4]
loop ptl

pop ebp
ret
_suma ENDP
end