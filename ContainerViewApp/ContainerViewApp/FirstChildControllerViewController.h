//
//  FirstChildControllerViewController.h
//  ContainerViewApp
//
//  Created by msdcn on 11/13/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SecondChildControllerViewController;

@interface FirstChildControllerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblInfo;
@property(nonatomic, weak)SecondChildControllerViewController *secondChildController;
@end
