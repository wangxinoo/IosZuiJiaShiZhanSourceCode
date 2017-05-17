//
//  AsyncAppViewController.m
//  AsyncApp
//
//  Created by msdcn on 1/6/13.
//  Copyright (c) 2013 Demo. All rights reserved.
//

#import "AsyncAppViewController.h"

@interface AsyncAppViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *txtInput;
- (IBAction)handleSubmit:(id)sender;
@end

@implementation AsyncAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.txtInput.returnKeyType = UIReturnKeyDone;
    self.txtInput.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    //无多线程的代码
    /*NSURL *networkURL = [[NSURL alloc] initWithString:@"http://www.jiuzhaigoutour.com/UploadFiles/Image/201206/16_2012061455294478.jpg"];
    NSData *imageData = [NSData dataWithContentsOfURL: networkURL];
    [NSThread sleepForTimeInterval:10.0];
    UIImage *image = [UIImage imageWithData:imageData];
    self.imageView.image = image;*/
    dispatch_queue_t queue = dispatch_queue_create("download", NULL);
    dispatch_async(queue, ^{
        NSURL *networkURL = [[NSURL alloc] initWithString:@"http://www.jiuzhaigoutour.com/UploadFiles/Image/201206/16_2012061455294478.jpg"];
        NSData *imageData = [NSData dataWithContentsOfURL: networkURL];
        [NSThread sleepForTimeInterval:10.0];
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [UIImage imageWithData:imageData];
            self.imageView.image = image;
        });
    });
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)handleSubmit:(id)sender
{
    NSString *strMessage = [NSString stringWithFormat:@"您输入了：%@", self.txtInput.text];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"用户输入" message: strMessage delegate:nil cancelButtonTitle:@"确认" otherButtonTitles: nil];
    [alert show];
}
@end
