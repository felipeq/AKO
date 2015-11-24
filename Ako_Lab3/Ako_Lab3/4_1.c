#include <stdio.h>
int szukaj4_max(int a, int b, int c, int d);
int liczba_przeciwna(int * a);
void odejmij_jeden(int ** a);
__int64 suma_siedmiu_liczb(__int64 v1, __int64 v2, __int64
	v3, __int64 v4, __int64 v5, __int64 v6, __int64 v7);
int suma(int n, ...);

int main()
{
	//int x, y, z, wynik;
	//printf("\nProszê podaæ trzy liczby ca³kowite ze znakiem: ");
	//scanf_s("%d %d %d", &x, &y, &z, 32);
	//wynik = szukaj_max(x, y, z);
	//printf("\nSpoœród podanych liczb %d, %d, %d, \
	//	    liczba %d jest najwiêksza\n", x, y, z, wynik);


	/*Zadanie 4.1*/
	/*int w=-5, x=3, y=44, z=1, wynik;
	wynik = szukaj4_max(w, x, y, z);
	printf("Najwieksze liczba to: %d", wynik);*/

	/*Zadanie 4.2*/
	/*int m;
	m = 5;
	liczba_przeciwna(&m);
	printf("\n m = %d\n", m);*/

	/*Zadanie 4.3*/
	int k;
	int * wsk;
	wsk = &k;
	printf("\nProsze napisac liczbe: ");
	scanf_s("%d", &k, 12);
	odejmij_jeden(&wsk);
	printf("\nWynik = %d\n", k);

	/*Zadanie 4.4*/
	/*int n = 5;
	int tablica[5] = { 4, 2, 5, 1, 8 };

	for (int i=0; i < n; i++)
	{
		przestaw(tablica, n);
	}
	
	for (int i = 0; i < n; i++)
	{
		printf("%d ", tablica[i]);
	}*/

	/*Zadanie 4.5*/
	/*__int64  a=1, b=2, c=3, d=4, e=5, f=6, g=7, wynik;
	wynik = suma_siedmiu_liczb(a, b, c, d, e, f, g);

	printf("Suma 7 podanych liczb to:  %I64d", wynik);*/


	/*Zadanie dodatkowe*/
	/*int wynik;
	int n = 5;

	wynik = suma(8, 1, 1, 1, 1, 1,2,1,2);
	printf("Suma: %d", wynik);*/

	return 0;
}
