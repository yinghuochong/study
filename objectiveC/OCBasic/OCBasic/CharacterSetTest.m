//
//  CharacterSetTest.m
//  OCBasic
//
//  Created by liulihua on 17/2/10.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import "CharacterSetTest.h"

@implementation CharacterSetTest
- (void)test{
    NSString *str = @"   hello world!   ";
    NSCharacterSet *set = [NSCharacterSet whitespaceCharacterSet];
    str = [str stringByTrimmingCharactersInSet:set];
    NSLog(@"%@",str);
}
@end
