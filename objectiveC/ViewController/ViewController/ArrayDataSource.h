//
//  ArrayDataSource.h
//  ViewController
//
//  Created by liulihua on 17/1/6.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ArrayDataSource : NSObject

-(id)itemAtIndexPath:(NSIndexPath*)indexPath;
-(NSInteger)numberOfRowsInSection:(NSInteger)section;

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end
