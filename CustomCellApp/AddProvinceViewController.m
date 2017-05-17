//
//  AddProvinceViewController.m
//  CustomCellApp
//
//  Created by msdcn on 12/30/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "AddProvinceViewController.h"
#import "CustomCellAppViewController.h"

@interface AddProvinceViewController ()

@end

@implementation AddProvinceViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *completeButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(addProvince)];
    self.navigationItem.rightBarButtonItem = completeButton;
    self.title = @"添加省份";
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProvinceIdentifier"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ProvinceIdentifier"];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 16, 100, 15)];
        titleLabel.textAlignment = NSTextAlignmentRight;
        titleLabel.tag = 1000;
        titleLabel.backgroundColor = [UIColor colorWithWhite: 1.0 alpha:0];
        [cell.contentView addSubview:titleLabel];
        
        UITextField *provinceField = [[UITextField alloc]initWithFrame:CGRectMake(105, 12, 260, 50)];
        
        provinceField.tag = 1001;
        [cell.contentView addSubview:provinceField];
    }
    //cell.textLabel.text = @"test";
    UILabel *label = (UILabel *)[cell.contentView viewWithTag:1000];
    //NSLog(@"%@", [self.elements objectAtIndex:[indexPath row]]);
    label.text = @"省份名：";
    
    UITextField *textField = (UITextField *)[cell.contentView viewWithTag:1001];
    textField.placeholder = @"请输入省份名称";
    return cell;
}


#pragma mark - 处理方法
-(void)addProvince
{
    UITableViewCell * cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    UITextField *provinceField = (UITextField *)[cell.contentView viewWithTag:1001];
    self.relatedController.provinceName = provinceField.text;
    [self.relatedController reloadData];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
