//
//  SimpleCollectionViewAppViewController.m
//  SimpleCollectionViewApp
//
//  Created by msdcn on 1/12/13.
//  Copyright (c) 2013 Demo. All rights reserved.
//

#import "SimpleCollectionViewAppViewController.h"
#import "ImageShowController.h"

@interface SimpleCollectionViewAppViewController ()

@end

@implementation SimpleCollectionViewAppViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - 数据源协议方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cat1.jpg"]];
    imageView.frame = cell.bounds;
    [cell.contentView addSubview:imageView];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header" forIndexPath:indexPath];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(330, 10, 100, 30)];
    label.font = [UIFont systemFontOfSize:30];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat: @"分段%d", [indexPath section] + 1 ];
    label.backgroundColor = [UIColor greenColor];
    [view addSubview:label];
    /*UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed: @"bg.jpeg"]];
     imageView.frame = CGRectMake(160, 10, imageView.frame.size.width, imageView.frame.size.width);
     [view addSubview:imageView];*/
    return view;
}
#pragma mark - 代理协议方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIImage *image = [UIImage imageNamed:@"cat1.jpg"];
    [self performSegueWithIdentifier:@"ShowImage" sender:image];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowImage"])
    {
        ImageShowController *controller = segue.destinationViewController;
        controller.image = (UIImage *)sender;
    }
}

#pragma mark - 流线布局协议方法
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGSize itemSize = CGSizeMake(320.0, 256.0);
    return itemSize;
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(50, 20, 50, 20);
}



@end
