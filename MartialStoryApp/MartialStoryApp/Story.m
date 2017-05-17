//
//  Story.m
//  MartialStoryApp
//
//  Created by msdcn on 11/11/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "Story.h"

@implementation Story
-(id)initWithStoryName: (NSString *)storyName PublishedYear: (NSString *)publishedYear StorySummary: (NSString *)storySummary
{
    self = [super init];
    if(self)
    {
        self.storyName = storyName;
        self.publishedYear = publishedYear;
        self.storySummary = storySummary;
    }
    return self;
}
@end
