#include <stdio.h>
int szukaj_max(int a, int b, int c);
int main()
{
	int x, y, z, wynik;
	printf("\nProsz� poda� trzy liczby ca�kowite ze znakiem: ");
	scanf_s("%d %d %d", &x, &y, &z, 32);
	wynik = szukaj_max(x, y, z);
	printf("\nSpo�r�d podanych liczb %d, %d, %d, \
		    liczba %d jest najwi�ksza\n", x, y, z, wynik);
	return 0;
}