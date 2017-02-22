//
//  ViewController.m
//  iOSBasic
//
//  Created by liulihua on 17/2/17.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType: UIButtonTypeContactAdd];
    [button setTitle:@"hello" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 100, 50);
    button.reversesTitleShadowWhenHighlighted = YES;
    [self.view addSubview:button];
    
    UIButton *button1= [UIButton buttonWithType: UIButtonTypeDetailDisclosure];
//    [button1 setTitle:@"hello" forState:UIControlStateNormal];
    button1.frame = CGRectMake(100, 300, 100, 50);
    button1.showsTouchWhenHighlighted = YES;
    
    [self.view addSubview:button1];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
