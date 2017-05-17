//
//  PassViewAppViewController.m
//  PassViewApp
//
//  Created by msdcn on 1/2/13.
//  Copyright (c) 2013 Demo. All rights reserved.
//

#import "PassViewAppViewController.h"
#import <PassKit/PassKit.h>

@interface PassViewAppViewController ()<PKAddPassesViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblInfo;
@property (weak, nonatomic) IBOutlet UIButton *btnOpenPass;

- (IBAction)openPass:(id)sender;

@end

@implementation PassViewAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    if(![PKPassLibrary isPassLibraryAvailable])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"错误" message:@"当前设备不支持PassKit" delegate:nil cancelButtonTitle:@"确认" otherButtonTitles:nil];
        [alert show];
        self.btnOpenPass.enabled = NO;
    }
}

- (IBAction)openPass:(id)sender {
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *passFilePath = [bundle pathForResource:@"lufthBoardingPass" ofType:@"pkpass"];
    NSData *passData = [NSData dataWithContentsOfFile:passFilePath];
    PKPass *pass = [[PKPass alloc] initWithData:passData error:nil];
       PKAddPassesViewController *addController = [[PKAddPassesViewController alloc] initWithPass:pass];
    addController.delegate = self;
    [self presentViewController:addController animated:YES completion:nil];

}

-(void)addPassesViewControllerDidFinish:(PKAddPassesViewController *)controller
{
    self.lblInfo.text = @"登机牌凭证添加成功！";
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
