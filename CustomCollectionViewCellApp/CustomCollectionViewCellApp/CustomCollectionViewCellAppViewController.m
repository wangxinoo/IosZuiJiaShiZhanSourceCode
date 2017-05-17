//
//  CustomCollectionViewCellAppViewController.m
//  CustomCollectionViewCellApp
//
//  Created by msdcn on 1/27/13.
//  Copyright (c) 2013 Demo. All rights reserved.
//

#import "CustomCollectionViewCellAppViewController.h"
#import "PhotoCell.h"

@implementation CustomCollectionViewCellAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - 数据源协议方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomCell" forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:@"cat1.jpg"];
    return cell;
}

@end
