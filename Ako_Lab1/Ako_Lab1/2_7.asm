
.686 
.model flat 
extern _ExitProcess@4 : PROC 
extern __write : PROC ; (dwa znaki podkreœlenia) 
extern __read : PROC ; (dwa znaki podkreœlenia) 
extern _GetStdHandle@4 : PROC
extern _SetConsoleTextAttribute@8 : PROC
public _main 

.data 
STD_OUTPUT_HANDLE		DWORD-11
FOREGROUND_GREEN		EQU 0002H
FOREGROUND_INTENSITY	EQU 0008H
tekst_pocz db 10, 'Proszê napisaæ jakiœ tekst ' 
db 'i nacisnac Enter', 10 
koniec_t db ? 
magazyn db 80 dup (?) 
nowa_linia db 10 
liczba_znakow dd ?
.code 
_main: 

 mov ecx,(OFFSET koniec_t) - (OFFSET tekst_pocz) 
 push ecx 
 push OFFSET tekst_pocz
 push 1 
 call __write  
 add esp, 12 

 push 80  
 push OFFSET magazyn 
 push 0 ; 
 call __read 
 add esp, 12 

 mov liczba_znakow, eax 

 mov ecx, eax 
 mov ebx, 0 ; indeks pocz¹tkowy 
ptl: mov dl, magazyn[ebx]
 cmp dl, 'a' 
 jb dalej
 cmp dl, 'z' 
 ja dalej 
 sub dl, 20H 

 mov magazyn[ebx], dl 
dalej: inc ebx 
 loop ptl 

 push STD_OUTPUT_HANDLE
 call _GetStdHandle@4

 mov edx, FOREGROUND_GREEN
 or edx, FOREGROUND_INTENSITY

 push edx
 push eax
 call _SetConsoleTextAttribute@8

 push liczba_znakow 
 push OFFSET magazyn 
 push 1 
 call __write 

 add esp, 12 
 push 0 
 call _ExitProcess@4 
END