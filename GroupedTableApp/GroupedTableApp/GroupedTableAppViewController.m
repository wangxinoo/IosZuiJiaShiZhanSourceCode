//
//  GroupedTableAppViewController.m
//  GroupedTableApp
//
//  Created by msdcn on 12/30/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "GroupedTableAppViewController.h"

@interface GroupedTableAppViewController ()
@property (nonatomic, strong) NSDictionary *allData;
@property (nonatomic, strong) NSArray *provinces;
@end

@implementation GroupedTableAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ProvincesCities" ofType:@"plist"];
    self.allData = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.provinces = [self.allData allKeys];
}

#pragma mark - 数据源协议
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.provinces count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *province = [self.provinces objectAtIndex:section];
    return province;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *province = [self.provinces objectAtIndex:section];
    NSArray *cities = [self.allData objectForKey:province];
    return [cities count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    
    NSString *province = [self.provinces objectAtIndex:section];
    NSArray *cities = [self.allData objectForKey:province];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CitiesIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = [[cities objectAtIndex:row] objectAtIndex:0];
    return cell;
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.provinces;
}


@end
