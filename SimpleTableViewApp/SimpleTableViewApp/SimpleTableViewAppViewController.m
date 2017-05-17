//
//  SimpleTableViewAppViewController.m
//  SimpleTableViewApp
//
//  Created by msdcn on 12/29/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "SimpleTableViewAppViewController.h"

@interface SimpleTableViewAppViewController ()
@property(nonatomic, strong)NSArray  *provinces;
@end

@implementation SimpleTableViewAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.provinces = @[@"安徽省",@"北京市",@"重庆市",@"福建省",@"甘肃省",@"广东省",@"广西省"];
    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"ProvincesIdentifier"];
}

#pragma mark - 数据源协议
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.provinces count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /*UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProvincesIdentifier"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ProvincesIdentifier"];
    }*/
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProvincesIdentifier" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed: @"province.png"];;
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.provinces objectAtIndex:row];
    
    cell.detailTextLabel.text = @"详细信息";
    return cell;
}
#pragma mark - 代理协议
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 76.0f;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"您的选择是：" message:cell.textLabel.text delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
    [alert show];
}

@end
