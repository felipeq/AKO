.686
.model flat

extern _ExitProcess@4 : PROC
extern __write : PROC
extern __read : PROC

public _main

.data   
 
	znaki db 12 dup (?)
	obszar db 12 dup(?)
.code

wczytaj_do_EAX PROC
push ebx
push edi
push esi

push dword PTR 12
push dword PTR OFFSET obszar ; adres obszaru pamici
push dword PTR 0; numer urzdzenia (0 dla klawiatury)
call __read ; odczytywanie znaków z klawiatury

add esp, 12 ; usunicie parametrów ze stosu
; zamiana cyfr w kodzie ASCII na liczb binarn
mov esi, 0 ; bieca warto przekszta³canej
; liczby przechowywana jest w
; rejestrze ESI - przyjmujemy 0
; jako warto pocztkow
mov ebx, OFFSET obszar ; adres obszaru ze znakami
; pobranie kolejnej cyfry w kodzie ASCII z tablicy ’obszar’ 

mov ecx,0
nowy:
mov al, [ebx]
inc ebx ; zwikszenie indeksu
cmp al,10 ; sprawdzenie czy nacinito Enter
je byl_enter ; skok, gdy nacinito Enter
sub al, 30H ; zamiana kodu ASCII na warto cyfry
movzx edi, al ; przechowanie wartoci cyfry
; w rejestrze EDI
mov eax, 10 ; mnona
mul esi ; mnoenie wczeniej obliczonej
; wartoci razy 10
add eax, edi ; dodanie ostatnio odczytanej cyfry
mov esi, eax ; dotychczas obliczona warto
jmp nowy ; skok na pocztek ptli
byl_enter:
mov eax, esi ; przepisanie wyniku konwersji
; do rejestru EAX

pop esi
pop edi
pop ebx
ret
wczytaj_do_EAX ENDP



_main:
call wczytaj_do_EAX

push 0
call _ExitProcess@4
END