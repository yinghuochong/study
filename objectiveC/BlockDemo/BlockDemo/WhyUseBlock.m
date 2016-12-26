//
//  WhyUseBlock.m
//  BlockDemo
//
//  Created by liulihua on 16/10/18.
//  Copyright © 2016年 liulihua. All rights reserved.
//

#import "WhyUseBlock.h"

@implementation WhyUseBlock


int func(int count){
    return count;
}

- (void)test{
    /************************* 函数指针 *******************************/
    int result1 = func(10); //正常方式调用一个c函数
    
    int (*funcptr) (int) = &func;  //函数指针指向一个c函数
    int result2 = (*funcptr)(10);  //使用函数指针来调用函数

}



/************************* 为什么用block *******************************/
//当回调中需要用到调用者的一些变量时，有几种方式
//1、将变量存储为全局变量，
int buttonId = 0;
int maxButton = 10;
void buttonCallback(int event){
    printf("buttonId : %d event = %d\n",buttonId,event);
}
//只有一个按钮时无问题，当有多个按钮时会有问题,buttonCallback无法拿到正确的buttonId
void setButtonCallbacks(){
    for (int i = 0; i<maxButton; i++) {
        buttonId = i;
        //setButtonCallback(i,&buttonCallback);
    }
}
//2、给回调buttonCallback 增加buttonId参数,但这时回调方需要保持buttonId
void buttonCallback1(int buttonId, int event){
    printf("buttonId : %d event = %d\n",buttonId,event);
}
//可以通过构造一个Button类来实现,button类存储buttonId,这样的话回调方只用保持对象就可以了
//但是这样做把代码搞的很复杂
//如果使用block,非常容易就实现了我们所需要的功能
void setButtonCallbacks1(){
    for (int i = 0; i<maxButton; i++) {
        buttonId = i;
        //setButtonCallbackUsingBlock(i,^(int event){
        //  printf("buttonId : %d event = %d\n",buttonId,event);
        //});
    }
}




@end
