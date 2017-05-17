//
//  Demo5ViewController.m
//  ControlsApp
//
//  Created by msdcn on 11/26/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "Demo5ViewController.h"
#import <MessageUI/MessageUI.h>

@interface Demo5ViewController ()<UIAlertViewDelegate, UIActionSheetDelegate, MFMailComposeViewControllerDelegate>
- (IBAction)demoAlertView:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblInfo;
- (IBAction)demoActionSheet:(id)sender;
- (IBAction)demoActivityView:(id)sender;

@end

@implementation Demo5ViewController

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)demoAlertView:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"欢迎使用警告控件"
                          message: @"请点击警告的确认或取消按钮来查看效果"
                          delegate: self
                          cancelButtonTitle: @"取消"
                          otherButtonTitles:@"确认", nil];
    //alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake
                              (20, 20, 260, 50)];
    [textField becomeFirstResponder];
    [textField setBackgroundColor: [UIColor whiteColor]];
    [alert addSubview:textField];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 0)
    {
        self.lblInfo.text = @"您点击了取消按钮！";
    }
    else if(buttonIndex == 1)
    {
        self.lblInfo.text = @"您点击了确认按钮！";
        //NSString *message = [alertView textFieldAtIndex:0].text;
        //self.lblInfo.text = message;
        
        //UITextField *textField = (UITextField *)[[alertView subviews] objectAtIndex:5];
        //self.lblInfo.text = textField.text;
        
        for(UIView *subView in alertView.subviews)
        {
            if([subView isKindOfClass:[UITextField class]])
            {
                self.lblInfo.text = ((UITextField *)subView).text;
            }
        }
        
    }
}

- (IBAction)demoActionSheet:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:@"请选择任务："
                                  delegate: self
                                  cancelButtonTitle: @"取消"
                                  destructiveButtonTitle:@"打开微博"
                                  otherButtonTitles:@"打开邮件", nil
                                  ];
    [actionSheet showInView:self.view];
    //UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:@[@"测试"] applicationActivities:nil];
    //[self presentViewController: activityViewController animated: YES completion:nil];
}

- (IBAction)demoActivityView:(id)sender
{
    UIActivityViewController *controller = [[UIActivityViewController alloc] initWithActivityItems:@[@"测试数据"]  applicationActivities:nil];
    [self presentViewController:controller animated:YES completion:nil];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex == 1)
    {
        MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
        mailController.mailComposeDelegate = self;
        [mailController setSubject:@"测试邮件发送"];
        [mailController setMessageBody:@"测试内容" isHTML:NO];
        [self presentViewController:mailController animated:YES completion:nil];
    }
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch(result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"取消发送邮件成功！");
            [controller dismissViewControllerAnimated:YES completion:nil];
            break;
        case MFMailComposeResultSaved:
            NSLog(@"邮件保存成功！");
            [controller dismissViewControllerAnimated:YES completion:nil];
            break;
        case MFMailComposeResultSent:
            NSLog(@"发送邮件成功！");
            [controller dismissViewControllerAnimated:YES completion:nil];
            break;
        case MFMailComposeResultFailed:
            NSLog(@"发送邮件失败！");
            [controller dismissViewControllerAnimated:YES completion:nil];
            break;
        default:
            NSLog(@"没有发送邮件！");
            [controller dismissViewControllerAnimated:YES completion:nil];
            break;
    }
}
@end