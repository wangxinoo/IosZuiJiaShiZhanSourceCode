//
//  CustomCellAppViewController.h
//  CustomCellApp
//
//  Created by msdcn on 12/30/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellAppViewController : UITableViewController
@property(strong, nonatomic) NSString *provinceName;
-(void)reloadData;
@end
