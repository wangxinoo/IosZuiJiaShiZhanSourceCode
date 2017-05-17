//
//  ImageShowController.m
//  SimpleCollectionViewApp
//
//  Created by msdcn on 1/14/13.
//  Copyright (c) 2013 Demo. All rights reserved.
//

#import "ImageShowController.h"

@interface ImageShowController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)handleDone:(id)sender;

@end

@implementation ImageShowController

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
    self.imageView.image = self.image;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)handleDone:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
