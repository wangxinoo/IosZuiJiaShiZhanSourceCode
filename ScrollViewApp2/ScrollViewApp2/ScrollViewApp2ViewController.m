//
//  ScrollViewApp2ViewController.m
//  ScrollViewApp2
//
//  Created by msdcn on 12/25/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "ScrollViewApp2ViewController.h"

@interface ScrollViewApp2ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ScrollViewApp2ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.scrollView setBackgroundColor: [UIColor blackColor]];
    self.scrollView.scrollEnabled = YES;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    NSUInteger i;
    CGFloat curxLoc = 0.0f;
    for(i = 1; i <= 5; i++)
    {
        NSString *imageName = [NSString stringWithFormat:@"image%d.jpeg", i];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        CGRect rect = imageView.frame;
        rect.size.height = 548.0f;
        rect.size.width = 320.0f;
        rect.origin = CGPointMake(curxLoc, 0.0);
        curxLoc += 320.0f;
        imageView.frame = rect;
        [self.scrollView addSubview: imageView];
    }
    self.scrollView.contentSize = CGSizeMake(1600.0f, 548.0f);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
