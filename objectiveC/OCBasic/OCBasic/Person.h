//
//  Person.h
//  OCBasic
//
//  Created by liulihua on 17/2/8.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
+(Person *)personWithAge:(int) age withName:(NSString *)name;
-(NSComparisonResult)comparePerson:(Person *)person;
@end
