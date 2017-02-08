//
//  Person.m
//  OCBasic
//
//  Created by liulihua on 17/2/8.
//  Copyright © 2017年 liulihua. All rights reserved.
//

#import "Person.h"

@interface Person()
@property(nonatomic,copy) NSString*name;
@property(nonatomic,assign) int age;
@end

@implementation Person
//直接实现静态方法，获取带有name和age的Person对象
+(Person *)personWithAge:(int) age withName:(NSString *)name{
    Person *person = [[Person alloc] init];
    person.age = age;
    person.name = name;
    return person;
}

//自定义排序方法
-(NSComparisonResult)comparePerson:(Person *)person{
    //默认按年龄排序
    NSComparisonResult result = [[NSNumber numberWithInt:person.age] compare:[NSNumber numberWithInt:self.age]];//注意:基本数据类型要进行数据转换
    //如果年龄一样，就按照名字排序
    if (result == NSOrderedSame) {
        result = [self.name compare:person.name];
    }
    return result;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"%@ : %d",self.name,self.age];
}
@end
