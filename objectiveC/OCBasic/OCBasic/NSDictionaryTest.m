//
//  NSDictionaryTest.m
//  OCBasic
//
//  Created by liulihua on 17/2/9.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import "NSDictionaryTest.h"

@implementation NSDictionaryTest
- (void) test{
    NSDictionary *dic = @{@"1":@"hello",@"2":@"world"};
    id keyset = [NSDictionary sharedKeySetForKeys:dic.allKeys];
    
    NSMutableDictionary *dic3 = [NSMutableDictionary dictionaryWithSharedKeySet:keyset];
    
    NSLog(@"%@",[dic descriptionInStringsFileFormat]);
    NSLog(@"%@",[dic description]);
    NSLog(@"%@",[dic descriptionWithLocale:[NSLocale currentLocale]]);
    NSLog(@"%@",[dic descriptionWithLocale:[NSLocale currentLocale] indent:5]);
    NSArray *arr = [dic objectsForKeys:@[@"1",@"2",@"3"] notFoundMarker:nil];
    NSLog(@"%@",arr);
}
@end
