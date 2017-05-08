//
//  ViewModel.m
//  TableViewPageDemo
//
//  Created by liulihua on 2017/3/24.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import "ViewModel.h"

@implementation ViewModel
- (id)initWithText:(NSString *)content index:(NSInteger)index{
    self = [super init];
    if(self){
        
        _cellHeight = arc4random()%50 + 70;   //  70 <  height < 120
        _sourceIndex = index;
        _showText = [NSString stringWithFormat:@"row : %ld  , height : %f",_sourceIndex+1,_cellHeight];
        
    }
    return self;
}
@end
