#include <stdio.h>

typedef unsigned char *byte_pointer;

void showbytes(byte_pointer start, int len){
	int i = 0;
	for (int i = 0; i < len; ++i){
		printf("%.2x", start[i]);
	}
	printf("\n");
}

void show_int(int x){
	showbytes((byte_pointer)&x,sizeof(int));
}

void show_float(float x){
	showbytes((byte_pointer)&x,sizeof(float));
}

void show_pointer(void *x){
	showbytes((byte_pointer)&x,sizeof(void *));
}

int main(){
	int i = 1;
	float j = (float)1.0;
	int *p = &i;
	show_int(i);
	show_float(j);
	show_pointer(p);
}

/*

01000000
0000803f
acd6ce5bff7f0000

*/