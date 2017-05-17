//
//  AttributedStringAppViewController.m
//  AttributedStringApp
//
//  Created by msdcn on 11/18/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "AttributedStringAppViewController.h"

@interface AttributedStringAppViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lblInfo;
@property (weak, nonatomic) IBOutlet UILabel *lblInfo1;
@property (weak, nonatomic) IBOutlet UILabel *lblInfo2;
@property (weak, nonatomic) IBOutlet UILabel *lblInfo3;
@property (weak, nonatomic) IBOutlet UILabel *lblInfo4;

@end

@implementation AttributedStringAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSDictionary *attributes = @{
NSForegroundColorAttributeName: [UIColor redColor],
NSFontAttributeName: [UIFont fontWithName:@"Zapfino"  size:16.0]

    };
    NSString *strDisplayText = @"This is an attributed string.";
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:strDisplayText attributes:attributes];
    self.lblInfo.attributedText = attributedText;
    
    
    
    NSDictionary *attributes1 = @{
NSBackgroundColorAttributeName: [UIColor orangeColor],
    NSFontAttributeName: [UIFont fontWithName:@"Zapfino"  size:22.0],
NSKernAttributeName: @-1.0
    };
    NSString *strDisplayText1 = @"Orange Background";
    NSAttributedString *attributedText1 = [[NSAttributedString alloc] initWithString:strDisplayText1 attributes:attributes1];
    self.lblInfo1.attributedText = attributedText1;
    
    
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor greenColor];
    shadow.shadowBlurRadius = 5.0;
    shadow.shadowOffset = CGSizeMake(1.0, 1.0);
    NSDictionary *attributes2 = @{
NSUnderlineStyleAttributeName: @1,
NSShadowAttributeName: shadow
    };
    NSString *strDisplayText2 = @"Shadow Font";
    NSAttributedString *attributedText2 = [[NSAttributedString alloc] initWithString:strDisplayText2 attributes:attributes2];
    self.lblInfo2.attributedText = attributedText2;
    
    
    
    NSDictionary *subStrAttribute1 = @{
NSForegroundColorAttributeName: [UIColor redColor],
NSStrikethroughStyleAttributeName: @2
    };
    
    NSDictionary *subStrAttribute2 = @{
NSForegroundColorAttributeName: [UIColor greenColor]
    };
    
    NSString *strDisplayText3 = @"Red and Green";
    NSMutableAttributedString *attributedText3 = [[NSMutableAttributedString alloc] initWithString:strDisplayText3];
    [attributedText3 setAttributes:subStrAttribute1 range:NSMakeRange(0, 3)];
    [attributedText3 setAttributes:subStrAttribute2 range:NSMakeRange(8, 5)];
    self.lblInfo3.attributedText = attributedText3;
    
    

    
    NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
    paragraph.alignment = NSTextAlignmentJustified;
    paragraph.firstLineHeadIndent = 20.0;
    paragraph.paragraphSpacingBefore = 10.0;
    paragraph.lineSpacing = 5;
    paragraph.hyphenationFactor = 1.0;
    
    NSDictionary *attributes4 = @{
NSForegroundColorAttributeName: [UIColor redColor],
NSParagraphStyleAttributeName: paragraph
//NSLigatureAttributeName: @1
    };
    
    NSString *strDisplayText4 = @"iPad fi inspires creativity and hands-on learning with features you won’t find in any other educational tool — on a device that students really want to use.\nPowerful apps from the App Store like iTunes U and iBooks let students engage with content in interactive ways, find information in an instant, and access an entire library wherever they go.";
    NSAttributedString *attributedText4 = [[NSAttributedString alloc] initWithString: strDisplayText4 attributes:attributes4];
    self.lblInfo4.attributedText = attributedText4;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
