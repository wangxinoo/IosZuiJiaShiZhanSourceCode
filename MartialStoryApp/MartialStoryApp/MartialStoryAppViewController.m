//
//  MartialStoryAppViewController.m
//  MartialStoryApp
//
//  Created by msdcn on 11/11/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "MartialStoryAppViewController.h"
#import "Story.h"
#import "StoryDetailsViewController.h"

@interface MartialStoryAppViewController ()
-(IBAction)handleSave: (UIStoryboardSegue *)segue;
@end

@implementation MartialStoryAppViewController

-(void)viewDidLoad
{
    Story *story1 = [[Story alloc] initWithStoryName:@"天龙八部" PublishedYear:@"1966" StorySummary:@"《天龙八部》有\"世间众生\"的意思，以宋哲宗时代为背景，通过宋、辽、大理、西夏、吐蕃王国之间的武林恩怨和民族毛度，从哲学的高度对人生和社会进行审视和描写。作品风格大气悲壮，同时也成就了金庸作品中的第一英雄人物萧峰。天龙八部又称为\"龙神八部\""];
    Story *story2 = [[Story alloc] initWithStoryName:@"射雕英雄传" PublishedYear:@"1959" StorySummary:@"《射雕英雄传》，它借用\"靖康之变\"，以其为题又名《大漠英雄转》，是\"射雕三部曲\"之一。下接《神雕侠侣》、《倚天屠龙记》。这部小说历史背景突出，场景纷繁，气势宏伟，具有鲜明的\"英雄史诗\"风格。在人物创造与情节安排上，它打破了传统无暇小说一味传奇，将人物作为情节附庸的模式。"];
    Story *story3 = [[Story alloc] initWithStoryName:@"神雕侠侣" PublishedYear:@"1959" StorySummary:@"南宋末年，江南少年杨过自小父母双亡，被父亲生前结义兄弟、江湖上有名的大侠郭靖夫妻收养。杨过个性倔强、脾气顽劣，为郭靖妻子黄蓉所不喜。无奈之下，郭靖唯有将杨过送到天下道教——全真教去学武"];
    self.storiesList = [NSArray arrayWithObjects:story1, story2, story3, nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"tlbbSegue"])
    {
       //[segue.destinationViewController setStory:self.storiesList[0]];
        StoryDetailsViewController *viewController = segue.destinationViewController;
        [viewController setStory:self.storiesList[0]];
    }
    else if([segue.identifier isEqualToString:@"sdyxzSegue"])
       [segue.destinationViewController setStory:self.storiesList[1]];
    else
       [segue.destinationViewController setStory:self.storiesList[2]];
        
}

-(IBAction)handleSave:(UIStoryboardSegue *)segue
{
    NSLog(@"%@", self.strDataExchange);
}

@end
