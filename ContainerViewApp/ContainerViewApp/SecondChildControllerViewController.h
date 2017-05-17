//
//  SecondChildControllerViewController.h
//  ContainerViewApp
//
//  Created by msdcn on 11/14/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FirstChildControllerViewController;

@interface SecondChildControllerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblInfo;
@property(nonatomic, weak)FirstChildControllerViewController *firstChildController;
@end
