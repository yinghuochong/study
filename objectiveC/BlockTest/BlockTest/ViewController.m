//
//  ViewController.m
//  BlockTest
//
//  Created by liulihua on 17/1/18.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(80, 200, 200, 40)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"GO TO VC2" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    

}

- (void)buttonClicked:(id)sender{
    UIViewController *vc2 = [[ViewController2 alloc] init];
    [self.navigationController pushViewController:vc2 animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
