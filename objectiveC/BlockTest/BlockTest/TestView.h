//
//  TestView.h
//  BlockTest
//
//  Created by liulihua on 17/1/18.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^ButtonClickBlock)();

@interface TestView : UIView
+ (TestView *)addToView:(UIView *)view withClickBlock:(ButtonClickBlock)clickBlock;
@end
