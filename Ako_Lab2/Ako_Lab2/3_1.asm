.686
.model flat
.code
jc cos
ptl: mov [ebx+ecx],dl
and si,bx
loop ptl
cos:
END