//
//  BlockTest.m
//  BlockDemo
//
//  Created by liulihua on 16/10/18.
//  Copyright © 2016年 liulihua. All rights reserved.
//

#import "BlockTest.h"

@implementation BlockTest


int function (int count){
    return count;
}

- (void)test{
    
//基本语法   ^ 返回值类型（可省略）  参数列表(可省略)  表达式
    int (*funcptr)(int) = &function;
//与函数指针变量进行对比 ，block变量  只是把 * 修改成了 ^
    int (^funcptr1)(int) =  ^int (int count){
        return count;
    };
    
    funcptr(100);
    funcptr1(101);
//block变量可以作为函数的返回值和参数
}
//block作为参数
int blockFunc ( int (^block1)(int) ){
    return block1(100);
}

//block作为返回值
int (^blockFunc2())(int){
    return ^int(int count){return count + 1;};
}

//block 如此书写非常繁琐，可以像使用函数指针一样 用typedef来解决
typedef int(^MyBlockType)(int);
//这样的话 就可以像正常类型一样使用了，函数也会变得更容易理解
//上面的两个函数就可以修改了
int blockFuncNew(MyBlockType block1){
    return block1(100);
}
MyBlockType blockFunc2New(){
    return ^int(int count){return count + 1;};
}






























@end
