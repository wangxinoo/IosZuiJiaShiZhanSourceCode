//
//  SingleViewAppViewController.m
//  SingleViewApp
//
//  Created by msdcn on 11/9/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "SingleViewAppViewController.h"

@interface SingleViewAppViewController ()
@property(nonatomic, weak) IBOutlet UIButton *button1;
@property(nonatomic, weak) IBOutlet UIButton *button2;
@property(nonatomic, weak) IBOutlet UILabel *infoLabel;
-(IBAction)btnPressed: (UIButton *)sender;
@end

@implementation SingleViewAppViewController

-(IBAction)btnPressed: (UIButton *)sender
{
    NSString *strTitle = [sender titleForState:UIControlStateNormal];
    NSString *strMessage = [NSString stringWithFormat:@"%@被按下了！", strTitle];
    self.infoLabel.text = strMessage;
    self.infoLabel.text = [NSString stringWithFormat:@"%@被按下了！", [sender titleForState:UIControlStateNormal]];
}

@end
