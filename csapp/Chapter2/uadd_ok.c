#include<stdio.h>
//determine whether arguments can be added without overflow
int uadd_ok(unsigned x,unsigned y){
	if( x+y < x ){
		return 0;
	}
	return 1;
}

int main(){
	int x,y;
	while(1){
		scanf("%d,%d",&x,&y);
		int result = uadd_ok(x,y);
		printf("%d\n",result );
	}
}