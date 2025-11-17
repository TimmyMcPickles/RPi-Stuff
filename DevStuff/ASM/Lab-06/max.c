#include <stdio.h>

int max(int a, int b);

int main(){
	printf("%d\n", max(3, 2));
	return 0;
}

int max(int a, int b){
	if (a > b){
		return a;
	}
	return b;
}
