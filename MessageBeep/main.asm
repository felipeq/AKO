.686
.model flat
extern _MessageBoxA@16 : PROC
extern _MessageBeep@4 : PROC
extern _ExitProcess@4 : PROC

public _main
.data
tytul	db	'Zapytanie', 0
tresc	db	'Czy wyslac sygnal '
		db	'dzwiekowy?', 0
.code
_main:
	push 24H
	push OFFSET tytul
	push OFFSET tresc
	push 0
	call _MessageBoxA@16
	; EAX = 6, gdy TAK, inaczej 7
	sub EAX, 6
	jnz koniec
	push 0
	call _MessageBeep@4
	koniec:
	push 0
	call _ExitProcess@4
END