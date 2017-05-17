//
//  main.m
//  CommonClass
//
//  Created by msdcn on 11/6/12.
//  Copyright (c) 2012 msdcn. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    //NSArray Test
    /*NSArray *array = @[
    @1234,
    @5678
        ];
    NSLog(@"%@", array[0]);
    NSLog(@"%@", [array objectAtIndex:0]);*/
    //NSDictionary
    //NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"漩涡鸣人",@"姓名",@"10月10日",@"出生日期",@"火之国",@"国籍", nil];
    //NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"漩涡鸣人",@"姓名",@"10月10日",@"出生日期",@"火之国",@"国籍", nil];
    NSDictionary *dictionary = @{
        @"姓名" : @"漩涡鸣人",
        @"出生日期" : @"10月10日",
        @"国籍" : @"火之国"
    };
    //NSLog(@"%@", [dictionary objectForKey:@"国籍"]);
    NSLog(@"%@", dictionary[@"国籍"]);
    return 0;
}
