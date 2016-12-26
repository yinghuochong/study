//
//  ViewController.m
//  BlockDemo
//
//  Created by liulihua on 16/10/18.
//  Copyright © 2016年 liulihua. All rights reserved.
//

#import "ViewController.h"
#import "WhyUseBlock.h"
#import "BlockTest.h"
#import "BlockValueTest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Why Use Block?
    WhyUseBlock *why = [[WhyUseBlock alloc] init];
    
    BlockValueTest *test = [[BlockValueTest alloc] init];
    [test testCArray];
    
    
}


@end
