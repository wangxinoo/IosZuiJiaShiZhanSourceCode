//
//  DrawAppView.h
//  DrawApp
//
//  Created by msdcn on 12/8/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum
{
    lineShape = 0,
    rectShape,
    ellipseShape,
}ShapeType;

@interface DrawAppView : UIView
@property(nonatomic) ShapeType shapeType;
@property(nonatomic) CGPoint firstTouch;
@property(nonatomic) CGPoint lastTouch;
@end
