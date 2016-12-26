//
//  BlockSourceTest.m
//  BlockDemo
//
//  Created by liulihua on 16/10/18.
//  Copyright © 2016年 liulihua. All rights reserved.
//

#import "BlockSourceTest.h"

@implementation BlockSourceTest
- (void)test{
    void(^blk)(void) = ^{
        printf("block\n");
    };
    blk();
}
@end
