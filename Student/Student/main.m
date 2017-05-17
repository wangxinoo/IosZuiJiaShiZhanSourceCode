//
//  main.m
//  Student
//
//  Created by msdcn on 11/4/12.
//  Copyright (c) 2012 msdcn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"

int main(int argc, const char * argv[])
{

    /*Student *student = [[Student alloc] initWithAge:15 Gender:'M' Grade:@"二年级" SchoolName:@"红星中学"];
    [student print];
    return 0;*/
    Student *student = [[Student alloc] initWithAge:18 Gender:'F'];
    SEL setGradeAlias = @selector(setGrade:);
    SEL setSchoolNameAlias = NSSelectorFromString(@"setSchoolName:");
    if([student respondsToSelector:setGradeAlias])
    {
        [student performSelector:setGradeAlias withObject: @"三年级"];
    }
    [student performSelector:setSchoolNameAlias withObject: @"胜利高中"];
    [student performSelector:@selector(print)];
    
    
}

