//
//  main.m
//  PPerson
//
//  Created by msdcn on 11/6/12.
//  Copyright (c) 2012 msdcn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPerson.h"

int main(int argc, const char * argv[])
{
    PPerson *pperson = [[PPerson alloc] init];
    pperson.age = 18;
    //[pperson ageSetter:26];
    pperson.gender = 'M';
    [pperson print];
    return 0;
}

