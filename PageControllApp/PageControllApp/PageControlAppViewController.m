//
//  PageControlAppViewController.m
//  PageControllApp
//
//  Created by msdcn on 12/26/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "PageControlAppViewController.h"

@interface PageControlAppViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic)UIPageControl *pageControl;
@property (strong, nonatomic) UIScrollView *scrollView;
@end

@implementation PageControlAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    float pageControlHeight = 18.0f;
    int pageCount = 3;
    CGRect scrollViewRect = [self.view bounds];
    scrollViewRect.size.height -= pageControlHeight;
    self.scrollView = [[UIScrollView alloc] initWithFrame: scrollViewRect];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(scrollViewRect.size.width * pageCount, scrollViewRect.size.height);
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    
    CGRect pageControlRect = [self.view bounds];
    pageControlRect.size.height = pageControlHeight;
    pageControlRect.origin.y = scrollViewRect.size.height;
    self.pageControl = [[UIPageControl alloc] initWithFrame:pageControlRect];
    self.pageControl.backgroundColor = [UIColor blackColor];
    self.pageControl.numberOfPages = pageCount;
    self.pageControl.currentPage = 0;
    //self.pageControl.defersCurrentPageDisplay = NO;
    [self.pageControl addTarget: self action: @selector(changeView:) forControlEvents:UIControlEventValueChanged];
    [self configureViews];
    [self.view addSubview:self.scrollView];
    [self.view addSubview:self.pageControl];
}

-(void)changeView:(id)sender
{
    int page = self.pageControl.currentPage;
    CGRect rect = CGRectMake(320.0 * page, 0.0, 320.0, 550.0);
    [self.scrollView scrollRectToVisible:rect animated:YES];
    [self.pageControl updateCurrentPageDisplay];
}

-(void)configureViews
{
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 550.0)];
    view1.backgroundColor = [UIColor blueColor];
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(320.0, 0.0, 320.0, 550.0)];
    view2.backgroundColor = [UIColor redColor];
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(640.0, 0.0, 320.0, 550.0)];
    view3.backgroundColor = [UIColor greenColor];

    [self.scrollView addSubview:view1];
     [self.scrollView addSubview:view2];
     [self.scrollView addSubview:view3];
}

-(void)scrollViewDidScroll:(UIScrollView *)sender
{
    int page = floor((sender.contentOffset.x - 320.0/2)/320.0) + 1;
    self.pageControl.currentPage = page;
}


@end
