//
//  ViewController2.m
//  BlockTest
//
//  Created by liulihua on 17/1/18.
//  Copyright © 2017年 liulihua. All rights reserved.
//


#ifndef weakify
#if TARGET_IPHONE_DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if TARGET_IPHONE_DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif



#import "ViewController2.h"
#import "TestView.h"

@interface ViewController2 ()
@property (nonatomic,copy) NSString *text;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
//    @weakify(self);
    TestView *testView = [TestView addToView:self.view withClickBlock:^{
//        @strongify(self);
        self.text = @"hello";
        NSLog(@"self.text : %@",self.text);
    }];
    
    CGRect rect = self.view.bounds;
    testView.center = CGPointMake(CGRectGetWidth(rect)/2,CGRectGetHeight(rect)/2 );
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    NSLog(@"ViewController2 dealloced");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
