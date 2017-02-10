//
//  main.m
//  OCBasic
//
//  Created by liulihua on 17/1/16.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSStringTest.h"
#import "NSArrayTest.h"
#import "NSDictionaryTest.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *classNameArray = @[@"NSStringTest",
                                    //@"NSArrayTest",
                                    //@"NSDictionaryTest",
                                    //@"CharacterSetTest",
                                    ];
        for (NSString *className in classNameArray) {
            Class c = NSClassFromString(className);
            id<TestProtocal> obj = [[c alloc] init];
            if([obj respondsToSelector:@selector(test)]){
                [obj test];
            }
        }
        
        //测试NSString相关的方法
//        NSStringTest *strTest = [[NSStringTest alloc] init];
//        [strTest test];

//        //测试NSArray相关的方法
//        NSArrayTest *arrTest = [[NSArrayTest alloc] init];
//        [arrTest test];
        //测试NSArray相关的方法
        //NSDictionaryTest *dicTest = [[NSDictionaryTest alloc] init];
        //[dicTest test];
    }
    return 0;
}
