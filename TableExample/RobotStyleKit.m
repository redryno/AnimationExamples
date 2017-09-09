//
//  RobotStyleKit.m
//  TableExample
//
//  Created by Ryan Bigger on 9/8/17.
//  Copyright © 2017 Ryan Bigger. All rights reserved.
//
//  Generated by PaintCode
//  http://www.paintcodeapp.com
//

#import "RobotStyleKit.h"


@implementation RobotStyleKit

#pragma mark Initialization

+ (void)initialize
{
}

#pragma mark Drawing Methods

+ (void)drawRobot
{
    [RobotStyleKit drawRobotWithFrame: CGRectMake(0, 0, 100, 100) resizing: RobotStyleKitResizingBehaviorStretch];
}

+ (void)drawRobotWithFrame: (CGRect)targetFrame resizing: (RobotStyleKitResizingBehavior)resizing
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Resize to Target Frame
    CGContextSaveGState(context);
    CGRect resizedFrame = RobotStyleKitResizingBehaviorApply(resizing, CGRectMake(0, 0, 100, 100), targetFrame);
    CGContextTranslateCTM(context, resizedFrame.origin.x, resizedFrame.origin.y);
    CGContextScaleCTM(context, resizedFrame.size.width / 100, resizedFrame.size.height / 100);


    //// Color Declarations
    UIColor* fillColor = [UIColor colorWithRed: 0.4 green: 0 blue: 0.8 alpha: 1];
    UIColor* strokeColor = [UIColor colorWithRed: 0.4 green: 0 blue: 0.8 alpha: 1];

    //// Page-1
    {
        //// Logo-90pt
        {
            //// Logo
            {
                //// Head Drawing
                UIBezierPath* headPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(21, 13, 58, 28) cornerRadius: 2];
                [strokeColor setStroke];
                headPath.lineWidth = 2;
                [headPath stroke];


                //// Body Drawing
                UIBezierPath* bodyPath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(21, 49, 58, 28) cornerRadius: 2];
                [strokeColor setStroke];
                bodyPath.lineWidth = 2;
                [bodyPath stroke];


                //// Left-Arm Drawing
                UIBezierPath* leftArmPath = [UIBezierPath bezierPathWithRect: CGRectMake(10, 56, 10, 13)];
                [fillColor setFill];
                [leftArmPath fill];


                //// Right-Arm Drawing
                UIBezierPath* rightArmPath = [UIBezierPath bezierPathWithRect: CGRectMake(80, 56, 10, 13)];
                [fillColor setFill];
                [rightArmPath fill];


                //// Left-Leg Drawing
                UIBezierPath* leftLegPath = [UIBezierPath bezierPathWithRect: CGRectMake(29, 78, 13, 10)];
                [fillColor setFill];
                [leftLegPath fill];


                //// Right-Leg Drawing
                UIBezierPath* rightLegPath = [UIBezierPath bezierPathWithRect: CGRectMake(59, 78, 13, 10)];
                [fillColor setFill];
                [rightLegPath fill];


                //// Neck Drawing
                UIBezierPath* neckPath = [UIBezierPath bezierPathWithRect: CGRectMake(43, 40, 14, 10)];
                [fillColor setFill];
                [neckPath fill];


                //// Left-Bar Drawing
                UIBezierPath* leftBarPath = [UIBezierPath bezierPath];
                [leftBarPath moveToPoint: CGPointMake(23, 27)];
                [leftBarPath addLineToPoint: CGPointMake(28.5, 27)];
                [strokeColor setStroke];
                leftBarPath.lineWidth = 2;
                leftBarPath.miterLimit = 4;
                leftBarPath.lineCapStyle = kCGLineCapSquare;
                [leftBarPath stroke];


                //// Right-Bar Drawing
                UIBezierPath* rightBarPath = [UIBezierPath bezierPath];
                [rightBarPath moveToPoint: CGPointMake(71.5, 27)];
                [rightBarPath addLineToPoint: CGPointMake(77, 27)];
                [strokeColor setStroke];
                rightBarPath.lineWidth = 2;
                rightBarPath.miterLimit = 4;
                rightBarPath.lineCapStyle = kCGLineCapSquare;
                [rightBarPath stroke];


                //// Center-Bar Drawing
                UIBezierPath* centerBarPath = [UIBezierPath bezierPath];
                [centerBarPath moveToPoint: CGPointMake(43.5, 27)];
                [centerBarPath addLineToPoint: CGPointMake(56.5, 27)];
                [strokeColor setStroke];
                centerBarPath.lineWidth = 2;
                centerBarPath.miterLimit = 4;
                centerBarPath.lineCapStyle = kCGLineCapSquare;
                [centerBarPath stroke];


                //// Right-Rim Drawing
                UIBezierPath* rightRimPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(57, 20, 14, 14)];
                [strokeColor setStroke];
                rightRimPath.lineWidth = 2;
                [rightRimPath stroke];


                //// Left-Rim Drawing
                UIBezierPath* leftRimPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(29, 20, 14, 14)];
                [strokeColor setStroke];
                leftRimPath.lineWidth = 2;
                [leftRimPath stroke];
            }
        }
    }
    
    CGContextRestoreGState(context);

}

@end



CGRect RobotStyleKitResizingBehaviorApply(RobotStyleKitResizingBehavior behavior, CGRect rect, CGRect target)
{
    if (CGRectEqualToRect(rect, target) || CGRectEqualToRect(target, CGRectZero))
        return rect;

    CGSize scales = CGSizeZero;
    scales.width = ABS(target.size.width / rect.size.width);
    scales.height = ABS(target.size.height / rect.size.height);

    switch (behavior)
    {
        case RobotStyleKitResizingBehaviorAspectFit:
        {
            scales.width = MIN(scales.width, scales.height);
            scales.height = scales.width;
            break;
        }
        case RobotStyleKitResizingBehaviorAspectFill:
        {
            scales.width = MAX(scales.width, scales.height);
            scales.height = scales.width;
            break;
        }
        case RobotStyleKitResizingBehaviorStretch:
            break;
        case RobotStyleKitResizingBehaviorCenter:
        {
            scales.width = 1;
            scales.height = 1;
            break;
        }
    }

    CGRect result = CGRectStandardize(rect);
    result.size.width *= scales.width;
    result.size.height *= scales.height;
    result.origin.x = target.origin.x + (target.size.width - result.size.width) / 2;
    result.origin.y = target.origin.y + (target.size.height - result.size.height) / 2;
    return result;
}