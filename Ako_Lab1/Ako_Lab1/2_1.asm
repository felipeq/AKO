; program przyk�adowy (wersja 32-bitowa) 
.686 
.model flat 
extern _ExitProcess@4 : PROC 
extern __write : PROC ; (dwa znaki podkre�lenia) 
public _main 

.data 
tekst db 10, 'Nazywam sie Kamil' , 10 
	  db 'M',0A2h,'j pierwszy 32-bitowy program ' 
      db 'asemblerowy dzia',88H,'a ju',0BEH,' poprawnie!', 10 
.code 

_main: 
 mov ecx, 85 ; liczba znak�w wy�wietlanego tekstu 
 push ecx ; liczba znak�w wy�wietlanego tekstu 
 push dword PTR OFFSET tekst ; po�o�enie obszaru 

 push dword PTR 1 ; uchwyt urz�dzenia wyj�ciowego 
 call __write ; wy�wietlenie znak�w 

 add esp, 12 ; usuni�cie parametr�w ze stosu 
 push dword PTR 0 ; kod powrotu programu 
 call _ExitProcess@4 
END 