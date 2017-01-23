//
//  TestView.m
//  BlockTest
//
//  Created by liulihua on 17/1/18.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import "TestView.h"

@interface TestView()
@property (nonatomic, copy) ButtonClickBlock clickBlock;
@end

@implementation TestView
+ (TestView* )addToView:(UIView *)view withClickBlock:(ButtonClickBlock)clickBlock;
{
    TestView *tView = [[TestView alloc] init];
    tView.clickBlock = clickBlock;
    [view addSubview:tView];
    return tView;
}

- (id)init{
    self = [super initWithFrame:CGRectMake(0, 0, 320, 50)];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        UIButton *btn = [[UIButton alloc] initWithFrame:self.bounds];
        [btn setTitle:@"Click Me" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    return self;
}

- (void)buttonClicked:(id)sender{
    if(self.clickBlock) {
        self.clickBlock();
    }
}
@end
