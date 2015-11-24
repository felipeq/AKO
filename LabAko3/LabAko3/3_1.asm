.686
.model flat

extern _ExitProcess@4 : PROC
extern __write : PROC

public _main

.data   
 
	znaki db 10 dup (?)

.code

wyswietl_EAX PROC
pusha

mov esi, 9 ; indeks w tablicy 'znaki'
mov ebx, 10 ; dzielnik równy 10

od_nowa:

mov edx, 0 ; zerowanie starszej czci dzielnej
div ebx ; dzielenie przez 10, iloraz w EAX,; reszta w EDX (reszta < 10)
add dl, 30H ; zamiana reszty z dzielenia; na kod ASCII
mov znaki [esi], dl; przes³anie cyfry w kodzie ASCII do tablicy ’znaki’
dec esi ; zmniejszenie indeksu
cmp eax, 0 ; sprawdzenie czy iloraz = 0
jne od_nowa ; skok, gdy iloraz niezerowy

; wype³nienie pozosta³ych bajtów spacjami
wypeln:
mov byte PTR znaki [esi], 20H ; kod spacji
dec esi ; zmniejszenie indeksu
jnz wypeln
mov byte PTR znaki [esi], 0AH ; wpisanie znaku nowego wiersza
; wywietlenie cyfr na ekranie
push dword PTR 12 ; liczba wywietlanych znaków
push dword PTR OFFSET znaki ; adres wyw. obszaru
push dword PTR 1; numer urzdzenia (ekran ma numer 1)
call __write ; wywietlenie liczby na ekranie
add esp, 12 ; usunicie parametrów ze stosu
popa
ret
wyswietl_EAX ENDP

_main:
mov ecx, 0
mov eax, 1

ptl:
cmp ecx,50
je koniec
add eax,ecx
call wyswietl_EAX
inc ecx
jmp ptl

koniec:
push 0
call _ExitProcess@4
END