//
//  ScrollViewAppViewController.m
//  ScrollViewApp
//
//  Created by msdcn on 12/23/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "ScrollViewAppViewController.h"

@interface ScrollViewAppViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ScrollViewAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.scrollView.contentSize = self.imageView.image.size;
    //self.scrollView.delegate = self;
    //self.imageView.frame = CGRectMake(0, 0, self.imageView.image.size.width, self.imageView.image.size.height);
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}

@end
