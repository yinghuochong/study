//
//  ListTableViewCell.m
//  TableViewPageDemo
//
//  Created by liulihua on 2017/3/23.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import "ListTableViewCell.h"

@interface ListTableViewCell()
@property (nonatomic,strong) UILabel *contentLabel;
@end

@implementation ListTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.contentLabel = [[UILabel alloc] initWithFrame:self.bounds];
        self.contentLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.contentLabel];
    }
    return self;
}


- (void)setModel:(ViewModel *)model{
    self.frame = CGRectMake(0, 0, 320, model.cellHeight);
    self.contentLabel.frame = self.bounds;
    self.contentLabel.text = model.showText;
    CGFloat r = (arc4random()%255)/255.f;
    CGFloat g = (arc4random()%255)/255.f;
    CGFloat b = (arc4random()%255)/255.f;
    
    self.contentLabel.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1.f];
}



@end
