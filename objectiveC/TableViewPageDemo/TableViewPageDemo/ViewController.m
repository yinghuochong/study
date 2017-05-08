//
//  ViewController.m
//  TableViewPageDemo
//
//  Created by liulihua on 2017/3/23.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import "ViewController.h"
#import "ViewModel.h"
#import "ListTableViewCell.h"


const NSInteger kItemNumberOfPerPage = 10;
const NSInteger kDataSourceNumber = 192;

typedef enum : NSUInteger {
    ScrollOrientationUp,
    ScrollOrientationDown,
} ScrollOrientation;


@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UILabel *pageNumberLabel;

@property (nonatomic,copy) NSMutableArray *dataArray;

@property (nonatomic,assign) NSInteger curPage;


@property (nonatomic,assign) CGFloat tableViewOffsetY;
@property (nonatomic,assign) ScrollOrientation scrollOrientation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    _dataArray = [[NSMutableArray alloc] initWithCapacity:1];
    //data
    for (int i = 0 ; i < kDataSourceNumber; i ++) {
        ViewModel *model = [[ViewModel alloc] initWithText:@"" index:i];
        [_dataArray addObject:model];
    }
    
    // Do any additional setup after loading the view, typically from a nib.
    _pageNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.frame) -120, CGRectGetHeight(self.view.frame)/2.f, 120, 40)];
    [self.view addSubview:_pageNumberLabel];
    _pageNumberLabel.backgroundColor = [UIColor redColor];
    [_tableView reloadData];
    _curPage = 1;
    _tableViewOffsetY = 0;
}

- (void)updatePageNumberLabel{
    NSInteger totalPage = ceil((float)kDataSourceNumber/kItemNumberOfPerPage);
    _pageNumberLabel.text = [NSString stringWithFormat:@"%ld/%ld",_curPage,totalPage];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self updatePageNumberLabel];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

static NSString *CellIdentifier = @"ListTableViewCell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (nil == cell) {
        cell = [[ListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }else{
        //重置cell状态
    }
    
    //给cell配置数据模版
    NSInteger index = indexPath.row;
    ViewModel *model = [_dataArray objectAtIndex:index];
    [cell setModel:model];
    return cell;

}


#pragma mark -UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ViewModel *model = [_dataArray objectAtIndex:indexPath.row];
    return model.cellHeight;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"will show : %ld",indexPath.row);
    
    if(indexPath.row % kItemNumberOfPerPage == 0 && _scrollOrientation == ScrollOrientationUp){// 当前页的第一行
        NSInteger page = (indexPath.row / kItemNumberOfPerPage) + 1;
        NSLog(@"xxxxxxxxxxxxxxxxxxx scroll up enter page : %ld",page);
        _curPage = page; //开始进入page
    }
    if(indexPath.row % kItemNumberOfPerPage == 9 && _scrollOrientation == ScrollOrientationDown){// 当前页的最后一个
        NSInteger page = (indexPath.row / kItemNumberOfPerPage) + 1;
        NSLog(@"xxxxxxxxxxxxxxxxxxx scroll down enter page : %ld",page);
    }
    
    [self updatePageNumberLabel];
}
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath{
    NSLog(@"leave row: %ld",indexPath.row);
    if(indexPath.row % kItemNumberOfPerPage == 9 && _scrollOrientation == ScrollOrientationUp){// 当前页的最后一个了
        NSInteger page = (indexPath.row / kItemNumberOfPerPage) + 1;
        NSLog(@"xxxxxxxxxxxxxxxxxxx scroll up leave page : %ld",page);
    }
    if(indexPath.row % kItemNumberOfPerPage == 0 && _scrollOrientation == ScrollOrientationDown){// 当前页的第一个
        NSInteger page = (indexPath.row / kItemNumberOfPerPage)+1;
        NSLog(@"xxxxxxxxxxxxxxxxxxx scroll down leave page : %ld",page);
        _curPage = page - 1;  //完全离开page ，等于完全进入 page-1
    }
    [self updatePageNumberLabel];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{ // any offset changes
    
    CGFloat newOffsetY = scrollView.contentOffset.y;
    if(newOffsetY > _tableViewOffsetY){
        //move up
        _scrollOrientation = ScrollOrientationUp;
    }else{
        //move down
        _scrollOrientation = ScrollOrientationDown;
    }
    //NSLog(@"%f   :  %f",_tableViewOffsetY,newOffsetY);
    _tableViewOffsetY = newOffsetY;
}








@end
