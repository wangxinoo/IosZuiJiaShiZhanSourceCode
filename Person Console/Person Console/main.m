//
//  main.m
//  Person Console
//
//  Created by msdcn on 11/4/12.
//  Copyright (c) 2012 msdcn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{

    Person *person = [Person new];
    [person setAge:25];
    [person setGender:'M'];
    [person print];
    
    Person *person1 = [[Person alloc] initWithAge:28 Gender:'F'];
    [person1 print];
    
    return 0;
}

