//
//  ListTableViewCell.h
//  TableViewPageDemo
//
//  Created by liulihua on 2017/3/23.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewModel.h"

@interface ListTableViewCell : UITableViewCell
//@property(nonatomic,strong) ViewModel *model;
- (void)setModel:(ViewModel *)model;
@end
