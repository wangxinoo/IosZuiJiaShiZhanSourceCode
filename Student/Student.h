//
//  Student.h
//  Student
//
//  Created by msdcn on 11/4/12.
//  Copyright (c) 2012 msdcn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Student : Person
{
    NSString *grade;
    NSString *schoolName;
}

-(void) setGrade:(NSString *)theGrade;
-(void) setSchoolName:(NSString *)theSchoolName;
-(id) initWithAge: (int)theAge Gender:(char)theGender Grade:(NSString *)theGrade SchoolName:(NSString *)theSchoolName;

@end
