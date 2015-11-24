.686
.model flat

extern _ExitProcess@4 : PROC
extern __write : PROC
extern __read : PROC

public _main

.data
.code
_main:

mov eax,[ebx]


push 0
call _ExitProcess@4
END