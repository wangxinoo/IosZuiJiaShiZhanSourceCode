//
//  StoryDetailsViewController.m
//  MartialStoryApp
//
//  Created by msdcn on 11/11/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "StoryDetailsViewController.h"
#import "MartialStoryAppViewController.h"
#import "Story.h"

@interface StoryDetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblStoryName;
@property (weak, nonatomic) IBOutlet UILabel *lblPublishedYear;
//@property (weak, nonatomic) IBOutlet UILabel *lblStorySummary;
@end

@implementation StoryDetailsViewController

-(void)viewDidLoad
{
    self.lblStoryName.text = self.story.storyName;
    self.lblPublishedYear.text = self.story.publishedYear;
    //self.lblStorySummary.text = self.story.storySummary;
    //动态的方式创建lblStorySummary控件
    CGRect lblStorySummaryRect = CGRectMake(105 , 80, 200, 400);
    UILabel *lblStorySummary = [[UILabel alloc] initWithFrame:lblStorySummaryRect];
    
    
    CGSize labelSize = CGSizeMake(200, 400);
    CGSize theStringSize = [self.story.storySummary sizeWithFont:lblStorySummary.font
                                               constrainedToSize:labelSize];
    //NSLog(@"%f", theStringSize.width);
    lblStorySummary.frame = CGRectMake(105, 80, theStringSize.width, theStringSize.height);
    lblStorySummary.text = self.story.storySummary;
    lblStorySummary.numberOfLines = 0;
    lblStorySummary.backgroundColor = self.view.backgroundColor;
    [self.view addSubview:lblStorySummary];
    
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    MartialStoryAppViewController *controller = segue.destinationViewController;
    controller.strDataExchange = @"从详情视图返回";
    
}
@end
