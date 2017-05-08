//
//  ViewModel.h
//  TableViewPageDemo
//
//  Created by liulihua on 2017/3/24.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewModel : NSObject

@property (nonatomic, assign,readonly) NSInteger sourceIndex;  //索引
@property (nonatomic, assign,readonly) float cellHeight;  //行高

@property (nonatomic, copy) NSString *showText;  //展示文本


- (id)initWithText:(NSString *)content index:(NSInteger)index;


@end
