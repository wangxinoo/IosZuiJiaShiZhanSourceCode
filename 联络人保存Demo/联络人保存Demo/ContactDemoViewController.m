//
//  ContactDemoViewController.m
//  联络人保存Demo
//
//  Created by msdcn on 8/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContactDemoViewController.h"

@interface ContactDemoViewController ()

@end

@implementation ContactDemoViewController
@synthesize txtFirstName;
@synthesize txtLastName;
@synthesize txtAge;
@synthesize personnelImage;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    txtFirstName.delegate = self;
    txtLastName.delegate = self;
    txtAge.delegate = self;
    txtFirstName.returnKeyType = UIReturnKeyDone;
    txtLastName.returnKeyType = UIReturnKeyDone;
    txtAge.returnKeyType = UIReturnKeyDone;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    txtFirstName.text = [defaults stringForKey:@"firstName"];
    txtLastName.text = [defaults stringForKey:@"lastName"];
    txtAge.text = [NSString stringWithFormat:@"%i", [defaults integerForKey:@"age"]];
    
    NSData *imageData = [defaults dataForKey:@"image"];
    personnelImage.image = [UIImage imageWithData:imageData];
    
}

- (void)viewDidUnload
{
    [self setTxtFirstName:nil];
    [self setTxtLastName:nil];
    [self setTxtAge:nil];
    [self setPersonnelImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    personnelImage.image = image;
    [picker dismissModalViewControllerAnimated:YES];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissModalViewControllerAnimated:YES];
}

- (IBAction)chooseImage:(id)sender 
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentModalViewController:picker animated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)save:(id)sender {
    NSString *firstName = txtFirstName.text;
    NSString *lastName = txtLastName.text;
    int age = txtAge.text.intValue;
    
    UIImage *image = personnelImage.image;
    NSData *imageData = UIImageJPEGRepresentation(image, 1);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:firstName forKey:@"firstName"];
    [defaults setObject:lastName forKey:@"lastName"];
    [defaults setInteger:age forKey:@"age"];
    [defaults setObject:imageData forKey:@"image"];
    
    [defaults synchronize];
    
}
@end
