//
//  Demo3ViewController.m
//  ControlsApp
//
//  Created by msdcn on 11/25/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "Demo3ViewController.h"

@interface Demo3ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation Demo3ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.imageView.image = [UIImage imageNamed:@"自动加载的图片.png"];
    
    UIImage *image = [UIImage imageNamed:@"代码创建的图片.png"];
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame: CGRectMake(19, 280, image.size.width,image.size.height)];
    imageView1.image = image;
    [self.view addSubview:imageView1];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
