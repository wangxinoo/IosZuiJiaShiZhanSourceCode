//
//  main.m
//  ClassCategory
//
//  Created by msdcn on 11/7/12.
//  Copyright (c) 2012 msdcn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+NSStringUtility.h"

int main(int argc, const char * argv[])
{
    //@autoreleasepool {
        
        NSString *strEmail = @"test@host.com";
        if([strEmail validateEmail])
            NSLog(@"%@是一个合法的邮箱地址", strEmail);
        else
            NSLog(@"%@不是一个合法的邮箱地址", strEmail);
    //}
    return 0;
}

