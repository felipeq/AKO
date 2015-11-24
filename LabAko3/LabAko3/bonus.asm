.686
.model flat

extern _ExitProcess@4 : PROC
extern __write : PROC
extern __read : PROC
public _main

.data   
 
	znaki db 12 dup (?)
	obszar db 12 dup(?)
	magazyn			db	24	dup	(?)
	magazynU		db	24	dup	(?) ; unicode -2 bajty
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
wyswietl_EAX PROC
pusha

mov esi, 11 ; indeks w tablicy 'znaki'
mov ebx, 10 ; dzielnik równy 10
mov ecx,0
mov dh,0
od_nowa:

mov edx, 0 ; zerowanie starszej czci dzielnej
div ebx ; dzielenie przez 10, iloraz w EAX,; reszta w EDX (reszta < 10)
add dl, 30H ; zamiana reszty z dzielenia; na kod ASCII
mov znaki [esi], dl; przes³anie cyfry w kodzie ASCII do tablicy ’znaki’
add ecx,1
dec esi ; zmniejszenie indeksu
cmp eax, 0 ; sprawdzenie czy iloraz = 0
jne od_nowa ; skok, gdy iloraz niezerowy

; wype³nienie pozosta³ych bajtów spacjami

mov byte PTR znaki [esi], 0AH ; wpisanie znaku nowego wiersza
; wywietlenie cyfr na ekranie

mov eax,11
sub eax,ecx
mov ecx,11
mov ebx,0
przemagazynuj:
mov dl, znaki[eax+1]
inc eax
mov magazynU[ebx], dl
mov magazynU[ebx+1],dh
add ebx,2
cmp eax,ecx

jne przemagazynuj
popa
ret
wyswietl_EAX ENDP


_main:
call wczytaj_do_EAX
call wyswietl_EAX



push 0
push OFFSET magazynU
push OFFSET magazynU
push 0
call _MessageBoxW@16



koniec:
push 0
call _ExitProcess@4
END