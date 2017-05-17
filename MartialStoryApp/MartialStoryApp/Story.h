//
//  Story.h
//  MartialStoryApp
//
//  Created by msdcn on 11/11/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Story : NSObject

@property(nonatomic, strong) NSString *storyName;
@property(nonatomic, strong) NSString *publishedYear;
@property(nonatomic, strong) NSString *storySummary;
-(id)initWithStoryName: (NSString *)storyName PublishedYear: (NSString *)publishedYear StorySummary: (NSString *)storySummary;
@end
