#include <stdio.h>
int main ()
{
	int number = 1;   //0x00000001
	if(*(char *)&number == 1){
        printf("Little-endian!\n");
    }else{
        printf("Big-endian!\n");
    }
    return 0;
}