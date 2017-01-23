//
//  UIBlockButton.h
//  BlockTest
//
//  Created by liulihua on 17/1/18.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtonClickBlock)();

@interface UIBlockButton : UIButton
- (UIButton *)initWithBlock:(ButtonClickBlock)block;
@end
