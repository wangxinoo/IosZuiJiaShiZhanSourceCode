//
//  SwipeAppViewController.m
//  SwipeApp
//
//  Created by msdcn on 12/22/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "SwipeAppViewController.h"

@interface SwipeAppViewController ()
@property (strong, nonatomic) IBOutlet UISwipeGestureRecognizer *rightSwipeRecognizer;
@property (strong, nonatomic) UISwipeGestureRecognizer *leftSwipeRecognizer;
- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)sender;
@end

@implementation SwipeAppViewController
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.leftSwipeRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    self.leftSwipeRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    self.leftSwipeRecognizer.numberOfTouchesRequired = 2;
    [self.view addGestureRecognizer:self.leftSwipeRecognizer];
}

- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)sender
{
    CGPoint location = [sender locationInView:self.view];
    if(sender.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        [self showImageWithText:@"左扫" atPoint:location];
    }
    else if(sender.direction == UISwipeGestureRecognizerDirectionRight)
    {
        [self showImageWithText:@"右扫" atPoint:location];
    }
}

-(void)showImageWithText: (NSString *)string atPoint: (CGPoint)centerPoint
{
    NSString *imageFileName = [string stringByAppendingString:@".png"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageFileName]];
    [self.view addSubview:imageView];
    imageView.center = centerPoint;
    imageView.alpha = 1.0;
    [UIView animateWithDuration:2 animations:^{
        imageView.alpha = 0.0f;
    }];
}
@end
