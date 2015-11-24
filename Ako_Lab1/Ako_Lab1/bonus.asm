
.686 
.model flat 
extern _ExitProcess@4 : PROC 
extern __write : PROC ; (dwa znaki podkreœlenia) 
extern __read : PROC ; (dwa znaki podkreœlenia) 
extern _GetStdHandle@4 : PROC
extern _SetConsoleTextAttribute@8 : PROC
public _main 

.data 
tekst_pocz db 10, 'Proszê napisaæ jakiœ tekst ' 
db 'i nacisnac Enter', 10 
koniec_t db ? 
magazyn db 160 dup (?) 
magazyn2 db 160 dup (?)
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

 mov liczba_znakow, 160

 mov ecx, eax 
 mov ebx, 0 ; indeks pocz¹tkowy 
 mov esi,0
ptl: 
mov dl, magazyn[ebx]

cmp dl,'\'
je czyN
jmp zwykle

czyN:
inc ebx
mov dh,dl
mov dl, magazyn[ebx]
cmp dl,'n'
jne zwykle
mov dl, 10
jmp dalej

zwykle:
cmp dh,'\'
je bkslesz
jmp dalej

 bkslesz:
 mov magazyn2[esi], dh
 inc esi
 mov magazyn2[esi], 20H
 inc esi
 

dalej:
 mov magazyn2[esi], dl
 inc esi
 mov magazyn2[esi], 20H
 inc esi
 inc ebx 
 mov dh,0
 loop ptl 

 push liczba_znakow 
 push OFFSET magazyn2 
 push 1 
 call __write 

 add esp, 12 
 push 0 
 call _ExitProcess@4 
END