//
//  DrawCircleView.m
//  RotationApp
//
//  Created by msdcn on 12/9/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "DrawCircleView.h"

@implementation DrawCircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor purpleColor].CGColor);
    if(self.isVertical)
    {
        CGContextFillEllipseInRect(context, CGRectMake(50.0, 50.0, 100.0, 100.0));
        CGContextFillEllipseInRect(context, CGRectMake(175.0, 50.0, 100.0, 100.0));
        CGContextFillEllipseInRect(context, CGRectMake(50.0, 175.0, 100.0, 100.0));
        CGContextFillEllipseInRect(context, CGRectMake(175.0, 175.0, 100.0, 100.0));
        CGContextFillEllipseInRect(context, CGRectMake(50.0, 300.0, 100.0, 100.0));
        CGContextFillEllipseInRect(context, CGRectMake(175.0, 300.0, 100.0, 100.0));
        CGContextDrawPath(context, kCGPathFill);
    }
    else
    {
        CGContextFillEllipseInRect(context, CGRectMake(50.0, 25.0, 100.0, 100.0));
        CGContextFillEllipseInRect(context, CGRectMake(200.0, 25.0, 100.0, 100.0));
        CGContextFillEllipseInRect(context, CGRectMake(350.0, 25.0, 100.0, 100.0));
        CGContextFillEllipseInRect(context, CGRectMake(50.0, 175.0, 100.0, 100.0));
        CGContextFillEllipseInRect(context, CGRectMake(200.0, 175.0, 100.0, 100.0));
        CGContextFillEllipseInRect(context, CGRectMake(350.0, 175.0, 100.0, 100.0));
        CGContextDrawPath(context, kCGPathFill);

    }
}


@end
