//
//  SearchAppViewController.m
//  SearchApp
//
//  Created by msdcn on 12/30/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "SearchAppViewController.h"

@interface SearchAppViewController ()
@property(nonatomic, strong) NSMutableArray *provinces;
@end

@implementation SearchAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self resetData];
    [self.tableView setContentOffset:CGPointMake(0, 44) animated:NO];
}

- (void)resetData
{
    self.provinces = [NSMutableArray arrayWithArray:
                      @[
                        @"安徽省",
                      @"北京市",
                      @"重庆市",
                      @"福建省",
                      @"甘肃省",
                      @"广东省",
                      @"广西壮族自治区",
                      @"贵州省",
                      @"海南省",
                      @"河北省",
                      @"河南省",
                      @"黑龙江省",
                      @"湖北省",
                      @"湖南省",
                      @"吉林省",
                      @"江苏省",
                      @"江西省",
                      @"辽宁省",
                      @"内蒙古自治区",
                      @"宁夏回族自治区",
                      @"青海省",
                      @"山东省",
                      @"山西省",
                      @"陕西省",
                      @"上海市",
                      @"四川省",
                      @"天津市",
                      @"西藏自治区",
                      @"新疆维吾尔族自治区",
                      @"云南省",
                      @"浙江省"]
    ];
    
}

#pragma mark - 表格视图数据源协议
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.provinces count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ProvincesIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.provinces objectAtIndex:[indexPath row]];
    return cell;
}

#pragma mark - 搜索栏数据源协议
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSString *searchText = [searchBar text];
    [self handleSearch:searchText];
    [searchBar resignFirstResponder];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if([searchText length] == 0)
    {
        [self resetData];
        [self.tableView reloadData];
        [searchBar resignFirstResponder];
        return;
    }
    [self handleSearch:searchText];
}


#pragma mark - 搜索处理方法
-(void)handleSearch: (NSString *)searchText
{
    NSMutableArray *provincesToRemove = [[NSMutableArray alloc] init];
    for(NSString *province in self.provinces)
    {
        if([province rangeOfString:searchText].location == NSNotFound)
        {
            [provincesToRemove addObject:province];
        }
    }
    [self.provinces removeObjectsInArray:provincesToRemove];
    [self.tableView reloadData];
}

@end
