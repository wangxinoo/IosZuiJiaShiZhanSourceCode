//
//  SampleAnnotation.m
//  MapKitDemo
//
//  Created by msdcn on 8/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SampleAnnotation.h"

@implementation SampleAnnotation
@synthesize coordinate;
@synthesize title;
@synthesize subtitle;

-(id)initWithCoordinate:(CLLocationCoordinate2D) aCoordinate
{
    self = [super init];
    if(self != nil)
    {
        self.coordinate = aCoordinate;
    }
    return self;
}


@end
