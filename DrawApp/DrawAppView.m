//
//  DrawAppView.m
//  DrawApp
//
//  Created by msdcn on 12/8/12.
//  Copyright (c) 2012 Demo. All rights reserved.
//

#import "DrawAppView.h"

@implementation DrawAppView


- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetFillColorWithColor(context,[UIColor purpleColor].CGColor);
    CGContextSetLineWidth(context, 2.0);
    
    switch(self.shapeType)
    {
        case lineShape:
            CGContextMoveToPoint(context, self.firstTouch.x, self.firstTouch.y);
            CGContextAddLineToPoint(context, self.lastTouch.x, self.lastTouch.y);
            CGContextStrokePath(context);
            break;
        case rectShape:
        {
            CGRect shapeRect = CGRectMake(self.firstTouch.x, self.firstTouch.y,  self.lastTouch.x - self.firstTouch.x, self.lastTouch.y - self.firstTouch.y);
            CGContextAddRect(context, shapeRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        }
        case ellipseShape:
        {
            CGRect shapeRect = CGRectMake(self.firstTouch.x, self.firstTouch.y,  self.lastTouch.x - self.firstTouch.x, self.lastTouch.y - self.firstTouch.y);
            CGContextFillEllipseInRect(context, shapeRect);
            CGContextDrawPath(context, kCGPathFillStroke);
            break;
        }
        default:
            break;
            
            
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.firstTouch = [touch locationInView:self];
    self.lastTouch = [touch locationInView:self];
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.lastTouch = [touch locationInView:self];
    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    self.lastTouch = [touch locationInView:self];
    [self setNeedsDisplay];
}
@end
