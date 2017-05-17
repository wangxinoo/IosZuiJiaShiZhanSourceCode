//
//  Person.m
//  PPerson
//
//  Created by msdcn on 11/6/12.
//  Copyright (c) 2012 msdcn. All rights reserved.
//

#import "PPerson.h"

@interface PPerson()

@end
@implementation PPerson


/*-(void)setAge: (int)theAge
{
    NSLog(@"设置器测试");
    _age = theAge;
}*/
-(void)print
{
    [self test];
    NSLog(@"年龄：%d；性别：%@", _age, _gender=='M'?@"男性":@"女性");
}

-(void)test
{
    NSLog(@"Test");
}
@end
