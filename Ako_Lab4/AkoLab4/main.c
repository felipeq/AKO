#include <stdio.h>
//#include <random>
#include <stdlib.h>

#define NUM_COUNT 20

void przestaw(int* a, int c);
int szukaj4_max(int a, int b, int c, int d);

void plus_jeden(int * a);

void odejmij_jeden(int ** a);

//__int64 suma_siedmiu_liczb(__int64 v1, __int64 v2, __int64
//	v3, __int64 v4, __int64 v5, __int64 v6, __int64 v7);
void zad2();
void zad3();
void zad4();
void zad5();

int main()
{
	int a, b, c, d, wynik;
	printf("\nProsze podac cztery liczby ca³kowite: ");
	scanf_s("%d %d %d %d", &a, &b, &c, &d, 32);

	wynik = szukaj4_max(a, b, c, d);
	printf("\nSposród podanych liczb %d, %d, %d %d, liczba %d jest najwieksza\n", a, b, c, d, wynik);
	zad2();
	zad3();
	zad4();
	zad5();


	return 0;
}
void zad2()
{
	int m;
	printf("Prosze podac liczbe: ");
	scanf_s("%d", &m);
	plus_jeden(&m);
	printf("\n liczba odwrotna do podanej to: %d\n", m);
}
void zad3()
{
	int k;
	int * wsk;

	wsk = &k;
	printf("\nProsze napisac liczbe: ");

	scanf_s("%d", &k, 12);
	odejmij_jeden(&wsk);

	printf("\nWynik = %d\n", k);

}
void zad5()
{
	__int64 l[7];
	int i;
	printf("Prosze podac 7 liczb: ");
	for (i = 0; i < 7; ++i)
		scanf_s("%lld", l + i);

	//printf("Suma podanych liczb to: %lld\n", suma_siedmiu_liczb(l[0], l[1], l[2], l[3], l[4], l[5], l[6]));
}
void printArray(int* a, int c)
{
	int i;
	for (i = 0; i < c; ++i)
		printf("%d ", a[i]);
}
void zad4()
{
	int a[NUM_COUNT];

	int i;
	for (i = 0; i < NUM_COUNT; ++i)
		a[i] = (rand() - RAND_MAX / 2) % 100;

	printf("Tablica poczatkowa: ");
	printArray(a, NUM_COUNT);

	for (i = 0; i < NUM_COUNT - 1; ++i)
		przestaw(a, NUM_COUNT - i);

	printf("\nTablica wynikowa: ");
	printArray(a, NUM_COUNT);
}