.686 
.model flat 
extern _ExitProcess@4 : PROC 
extern _MessageBoxA@16 : PROC
extern __write : PROC ; (dwa znaki podkreœlenia) 
extern __read : PROC ; (dwa znaki podkreœlenia) 


public _main 
.data 
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
 push 0 
 call __read 
 add esp, 12 

 mov liczba_znakow, eax 

 mov ecx, eax 
 mov ebx, 0 ; indeks pocz¹tkowy 

ptl:
 mov dl, magazyn[ebx] ; pobranie kolejnego znaku 

 cmp dl,0A5h
 jne polskie_c
 mov dl,0A5H
 jmp pdalej

 polskie_c:
 cmp dl, 86H
 jne polskie_e
 mov dl, 0C6H
 jmp pdalej

 polskie_e:
 cmp dl,0A9h
 jne polskie_l
 mov dl,0CAh
 jmp pdalej

 polskie_l:
 cmp dl, 88H
 jne polskie_n
 mov dl, 0A3H
 jmp pdalej

 polskie_n:
 cmp dl,0E4H
 jne polskie_o
 mov dl, 0D1H
 jmp pdalej

 polskie_o:
 cmp dl,0A2H
 jne polskie_s
 mov dl,0D3H
 jmp pdalej

 polskie_s:
 cmp dl,98H
 jne polskie_zi
 mov dl,8Ch
 jmp pdalej

 polskie_zi:
 cmp dl,0ABh
 jne polskie_z
 mov dl,8FH
 jmp pdalej

 polskie_z:
 cmp dl,0BEH
 jne standardowe
 mov dl,0AFH
 jmp pdalej

 standardowe:
 cmp dl, 'a' 
 jb dalej 
 cmp dl, 'z' 
 ja dalej 
 sub dl, 20H ; zamiana na wielkie litery 

 pdalej:
 mov magazyn[ebx], dl 

dalej:
 inc ebx 
 loop ptl 
 push 0
 push OFFSET magazyn 
 push OFFSET magazyn 
 push 0 
 call _MessageBoxA@16 
 add esp, 12 
 
 push 0 
 call _ExitProcess@4 
END 