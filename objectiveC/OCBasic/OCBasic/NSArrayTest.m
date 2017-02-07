//
//  NSArrayTest.m
//  OCBasic
//
//  Created by liulihua on 17/2/7.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import "NSArrayTest.h"

@implementation NSArrayTest
- (void) test{
    NSString *s[3] = {@"2",@"3",@"4"};
    NSArray *arr = [[NSArray alloc] initWithObjects:s count:3];
    NSLog(@"%@",arr.description);
}
@end
