//
//  Person.h
//  PPerson
//
//  Created by msdcn on 11/6/12.
//  Copyright (c) 2012 msdcn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPerson : NSObject

@property(nonatomic, setter = ageSetter:) int age;
@property(nonatomic) char gender;

@property(nonatomic, strong) NSString *schoolName;

-(void)print;
@end
