//
//  Person.m
//  Person Console
//
//  Created by msdcn on 11/4/12.
//  Copyright (c) 2012 msdcn. All rights reserved.
//

#import "Person.h"

@implementation Person

-(void)setAge:(int)theAge
{
    age = theAge;
    
}

-(void)setGender:(char)theGender
{
    gender = theGender;
}
-(id)initWithAge: (int)theAge Gender: (char)theGender
{
    self = [super init];
    if(self)
    {
        [self setAge:theAge];
        [self setGender:theGender];
    }
    return self;
}

-(void)print
{
    NSLog(@"年龄：%d；性别：%@", age, gender == 'M' ? @"男性": @"女性");
}
@end
