//
//  BlockValueTest.m
//  BlockDemo
//
//  Created by liulihua on 16/10/18.
//  Copyright © 2016年 liulihua. All rights reserved.
//

#import "BlockValueTest.h"

@implementation BlockValueTest

//截获自动变量的demo
-(void) testValue{
    int dmy = 256;
    int val = 10;
    const char * fmt = "value = %d\n";
    void (^blk)() = ^{
        printf(fmt,val);
        //val = 100;  //不能在block中修改捕获的变量
    };
    
    val = 2;
    fmt = "value were changed value = %d\n";
    blk(); //输出结果  value = 10
}//该测试表明 block 捕获的是变量的瞬间值，捕获后在block中不能修改这个变量

//如果想在block中修改变量的值  需要加__block说明符，
-(void) testValue2{
    __block int val = 0;
    void (^blk)() = ^(){
        val = 100;
    };
    blk();
    printf("val = %d\n",val); //val = 100
}

//截获 Objective-C对象
- (void)testObject{
    __block NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:0];
    void(^blk)() = ^{
        id object = [[NSObject alloc] init];
        array = nil;  //不能对捕获的对象重新赋值，但是可以修改,除非加上__block修饰符
        [array addObject:object];
    };
}

//使用C语言数组
- (void)testCArray{
//    const char text[] = "hello";
//    void (^blk)() = ^(){
//        printf("%c \n",text[1]); //不能引用C数组 ,因为Blocks 截获自动变量的方法并没有实现对C语言数组的截获，应该使用指针
//    };
    
    const char *text = "hello";
    void (^blk)() = ^(){
        printf("%c \n",text[1]); //不能引用C数组
    };
}





@end
