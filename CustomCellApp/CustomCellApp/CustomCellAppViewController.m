//
//  CustomCellAppViewController.m
//  CustomCellApp
//
//  Created by msdcn on 12/30/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "CustomCellAppViewController.h"
#import "AddProvinceViewController.h"

@interface CustomCellAppViewController ()
@property(strong, nonatomic)NSMutableArray *provinces;
@end

@implementation CustomCellAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.provinces = [NSMutableArray arrayWithArray:
                      @[@"安徽省",@"北京市",@"重庆市",@"福建省",@"甘肃省",@"广东省",@"广西省"]];
    self.title = @"省份列表";
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pushAddView)];
    self.navigationItem.rightBarButtonItem = addButton;
}

#pragma mark - 数据源协议
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.provinces count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProvincesIdentifier" forIndexPath:indexPath];
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.provinces objectAtIndex:row];
    
    return cell;
}

#pragma mark - 处理方法
-(void)pushAddView
{
    AddProvinceViewController *controller = [[AddProvinceViewController alloc] initWithNibName:@"AddProvinceViewController" bundle:nil];
    controller.relatedController = self;
    UINavigationController *naviController = [[UINavigationController alloc] initWithRootViewController:controller];
    [self presentViewController:naviController animated:YES completion:nil];
}

-(void)reloadData
{
    [self.provinces addObject:self.provinceName];
    [self.tableView reloadData];
}

@end
