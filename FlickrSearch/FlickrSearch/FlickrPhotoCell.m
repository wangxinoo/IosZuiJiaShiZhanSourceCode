//
//  FlickrPhotoCell.m
//  FlickrSearch
//
//  Created by msdcn on 10/21/12.
//  Copyright (c) 2012 msdcn. All rights reserved.
//

#import "FlickrPhotoCell.h"
#import "FlickrPhoto.h"

@implementation FlickrPhotoCell
@synthesize photo;
@synthesize imageView;

-(void)setPhoto:(FlickrPhoto *)aPhoto
{
    //NSLog(@"Test Here!!!");
    if(photo != aPhoto)
    {
        photo = aPhoto;
    }
    imageView.image = photo.thumbnail;
}

/*- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}*/
-(id)initWithCoder: (NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        UIView *bgView = [[UIView alloc] initWithFrame:self.backgroundView.frame];
        bgView.backgroundColor = [UIColor blueColor];
        bgView.layer.borderColor = [[UIColor whiteColor] CGColor];
        bgView.layer.borderWidth = 4;
        self.selectedBackgroundView = bgView;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
