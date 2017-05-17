//
//  NSString+StringConvenience.m
//  ClassCategory
//
//  Created by msdcn on 11/7/12.
//  Copyright (c) 2012 msdcn. All rights reserved.
//

#import "NSString+NSStringUtility.h"

@implementation NSString (NSStringUtility)

-(BOOL)validateEmail
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSString *laxString = @".+@.+\\.[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

@end
