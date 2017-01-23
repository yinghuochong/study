//
//  ViewController.m
//  ViewController
//
//  Created by liulihua on 16/12/30.
//  Copyright © 2016年 liulihua. All rights reserved.
//

#import "ViewController.h"
#import "PhotoCell.h"
#import "Photo.h"

 NSString *kPhotoCellIdentifier = @"photoCellIdentifier";
const NSInteger kPhotoCellHeight = 40;

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

//原子性  可读性  内存管理
@property(nonatomic, strong) NSArray *photos;
@property(nonatomic, strong) UITableView *photoTableView;

@end

@implementation ViewController{
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //init data
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:1];
    for (NSInteger i = 0; i < 100; i ++) {
        Photo *photo = [[Photo alloc] init];
        photo.name = [NSString stringWithFormat:@"Photo %ld",i];
        [arr addObject:photo];
    }
    self.photos = arr;
    
    //init view
    self.photoTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.photoTableView.delegate = self;
    self.photoTableView.dataSource = self;
    [self.view addSubview:self.photoTableView];
}

#pragma mark- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.photos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:kPhotoCellIdentifier];
    if(!cell){
        cell = [[PhotoCell alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, kPhotoCellHeight)];
    }
    Photo *photo = [self.photos objectAtIndex:indexPath.row];
    cell.textLabel.text = photo.name;
    return cell;
}

#pragma mark- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kPhotoCellHeight;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didSelectRowAtIndexPath : %ld",indexPath.row);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
