//
//  FlickrPhotoCell.h
//  FlickrSearch
//
//  Created by msdcn on 10/21/12.
//  Copyright (c) 2012 msdcn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@class FlickrPhoto;

@interface FlickrPhotoCell : UICollectionViewCell
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) FlickrPhoto *photo;
@end
