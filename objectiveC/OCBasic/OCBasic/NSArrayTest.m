//
//  NSArrayTest.m
//  OCBasic
//
//  Created by liulihua on 17/2/7.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import "NSArrayTest.h"
#import "Person.h"

@implementation NSArrayTest
- (void) test{
    NSString *s[4] = {@"2",@"3",@"4",@"1"};
    NSArray *arr = [[NSArray alloc] initWithObjects:s count:4];
    NSLog(@"%@",arr.description);
    [arr sortedArrayUsingSelector:@selector(compare:)];
    
    NSLog(@"%@",arr.description);
    
    
    NSString *str = @"00000Y";
    BOOL isTrue = [str boolValue];
    
    
    Person *p1 = [Person personWithAge:23 withName:@"zhangsan"];
    Person *p2 = [Person personWithAge:21 withName:@"lisi"];
    Person *p3 = [Person personWithAge:24 withName:@"wangwu"];
    Person *p4 = [Person personWithAge:24 withName:@"liwu"];
    Person *p5 = [Person personWithAge:20 withName:@"liwu"];
    NSArray *array = [NSArray arrayWithObjects:p1,p2,p3,p4,p5, nil];
    NSArray *sortedArray = [array sortedArrayUsingSelector:@selector(comparePerson:)];
    NSLog(@"排序前:%@",array);
    NSLog(@"排序后:%@",sortedArray);
    NSString *filePath = @"~/Desktop/iOSPakager.sh";
    filePath = [filePath stringByExpandingTildeInPath];
//    BOOL succ = [sortedArray writeToFile:filePath atomically:YES];
    
    NSURL *url = [NSURL fileURLWithPath:filePath];
    BOOL succ1 = [array writeToURL:url atomically:YES];

    NSLog(@"%@",@(succ1));
}

@end
