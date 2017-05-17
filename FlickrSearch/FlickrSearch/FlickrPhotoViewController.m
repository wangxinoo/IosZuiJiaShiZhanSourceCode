//
//  FlickrPhotoViewController.m
//  FlickrSearch
//
//  Created by msdcn on 10/22/12.
//  Copyright (c) 2012 msdcn. All rights reserved.
//

#import "FlickrPhotoViewController.h"
#import "FlickrPhoto.h"
#import "Flickr.h"

@interface FlickrPhotoViewController ()
@property (weak) IBOutlet UIImageView *imageView;
-(IBAction)done: (id)sender;
@end

@implementation FlickrPhotoViewController

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
}

-(void)viewWillAppear:(BOOL)animated
{
    if(self.flickPhoto.largeImage)
    {
        self.imageView.image = self.flickPhoto.largeImage;
    }
    else
    {
        self.imageView.image = self.flickPhoto.thumbnail;
        [Flickr loadImageForPhoto: self.flickPhoto thumbnail:NO completionBlock:^(UIImage *photoImage, NSError *error){
           if(!error)
           {
               dispatch_async(dispatch_get_main_queue(), ^{
                   self.imageView.image = self.flickPhoto.largeImage;
               });
           }
        }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)done:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:^{}];
}

@end
