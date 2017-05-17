//
//  Student.m
//  Student
//
//  Created by msdcn on 11/4/12.
//  Copyright (c) 2012 msdcn. All rights reserved.
//

#import "Student.h"

@implementation Student

-(void) setGrade:(NSString *)theGrade
{
    grade = theGrade;
}

-(void) setSchoolName:(NSString *)theSchoolName
{
    schoolName = theSchoolName;
}

-(id) initWithAge: (int)theAge Gender:(char)theGender Grade:(NSString *)theGrade SchoolName:(NSString *)theSchoolName
{
    self = [self initWithAge:theAge Gender:theGender];
    if(self)
    {
        [self setGrade:theGrade];
        [self setSchoolName:theSchoolName];
    }
    return self;
}

-(void)print
{
    NSLog(@"年龄：%d；性别：%@；学校：%@；年级：%@；", age, gender == 'M' ? @"男性": @"女性", schoolName, grade);
}
@end
