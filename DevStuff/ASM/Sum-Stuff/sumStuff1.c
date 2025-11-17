#include <stdio.h>

int sumStuff2(int x, int y);

int sumStuff1(int x, int y, int z) {
    int sum;
    
    sum = x + sumStuff2(y, z);

    return sum;
}