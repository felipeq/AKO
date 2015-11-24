.686
.model flat

extern _ExitProcess@4 : PROC
extern __write : PROC
extern __read : PROC

public _main

.data   
 
	znaki db 12 dup (?)
	obszar db 12 dup(?)
	dekoder db '0123456789ABCDEF'
.code

wczytaj_do_EAX_hex PROC
push ebx
push ecx
push edx
push esi
push edi
push ebp

sub esp,12
mov esi,esp

push dword ptr 10
push esi
push dword ptr 0
call __read
add esp,12
mov eax, 0

pocz_konw:
mov dl,[esi]
inc esi
cmp dl,10
je gotowe

cmp dl,'0'
jb pocz_konw
cmp dl,'9'
ja sprawdzaj_dalej
sub dl,'0'

dopisz:
shl eax,4
or al,dl
jmp pocz_konw

sprawdzaj_dalej:
cmp dl, 'A'
jb pocz_konw 
cmp dl, 'F'
ja sprawdzaj_dalej2
sub dl, 'A' - 10 
jmp dopisz

sprawdzaj_dalej2:
cmp dl, 'a'
jb pocz_konw ; inny znak jest ignorowany
cmp dl, 'f'
ja pocz_konw ; inny znak jest ignorowany
sub dl, 'a' - 10
jmp dopisz

gotowe:
; zwolnienie zarezerwowanego obszaru pamici
add esp, 12
pop ebp
pop edi
pop esi
pop edx
pop ecx
pop ebx
ret
wczytaj_do_EAX_hex ENDP

wyswietl_EAX PROC
pusha

mov esi, 11 ; indeks w tablicy 'znaki'
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
call wczytaj_do_EAX_hex

call wyswietl_EAX

koniec:
push 0
call _ExitProcess@4
END