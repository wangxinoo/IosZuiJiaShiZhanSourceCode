//
//  Person.h
//  Person Console
//
//  Created by msdcn on 11/4/12.
//  Copyright (c) 2012 msdcn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

{
    int age;
    char gender;
}

-(void)setAge: (int)theAge;
-(void)setGender: (char)theGender;
-(id)initWithAge: (int)theAge Gender: (char)theGender;
-(void)print;
@end
