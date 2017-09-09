//
//  FaceView.m
//  TableExample
//
//  Created by Ryan Bigger on 9/3/15.
//  Copyright © 2017 Ryan Bigger. All rights reserved.
//

#import "FaceView.h"
#import "RobotStyleKit.h"

@interface FaceView ()

@property (strong, nonatomic) CAShapeLayer *eyes;

@end


@implementation FaceView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    self.layer.borderColor = [UIColor colorWithRed: 0.4 green: 0 blue: 0.8 alpha: 1].CGColor;
    self.layer.borderWidth = 0.5;
    
    _eyes = [CAShapeLayer layer];
    _eyes.fillColor = [UIColor colorWithRed: 0.4 green: 0 blue: 0.8 alpha: 1].CGColor;
    _eyes.path = [self openEyesPath].CGPath;
    [self.layer addSublayer: _eyes];
}

- (UIBezierPath *)closedEyesPath {
    // Used PaintCode to generate the paths
    //// Bezier Closed
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(39.5, 27)];
    [bezierPath addCurveToPoint: CGPointMake(36, 27.5) controlPoint1: CGPointMake(39.5, 27.28) controlPoint2: CGPointMake(37.93, 27.5)];
    [bezierPath addCurveToPoint: CGPointMake(32.5, 27) controlPoint1: CGPointMake(34.07, 27.5) controlPoint2: CGPointMake(32.5, 27.28)];
    [bezierPath addCurveToPoint: CGPointMake(36, 26.5) controlPoint1: CGPointMake(32.5, 26.72) controlPoint2: CGPointMake(34.07, 26.5)];
    [bezierPath addCurveToPoint: CGPointMake(39.5, 27) controlPoint1: CGPointMake(37.93, 26.5) controlPoint2: CGPointMake(39.5, 26.72)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(67.5, 27)];
    [bezierPath addCurveToPoint: CGPointMake(64, 27.5) controlPoint1: CGPointMake(67.5, 27.28) controlPoint2: CGPointMake(65.93, 27.5)];
    [bezierPath addCurveToPoint: CGPointMake(60.5, 27) controlPoint1: CGPointMake(62.07, 27.5) controlPoint2: CGPointMake(60.5, 27.28)];
    [bezierPath addCurveToPoint: CGPointMake(64, 26.5) controlPoint1: CGPointMake(60.5, 26.72) controlPoint2: CGPointMake(62.07, 26.5)];
    [bezierPath addCurveToPoint: CGPointMake(67.5, 27) controlPoint1: CGPointMake(65.93, 26.5) controlPoint2: CGPointMake(67.5, 26.72)];
    [bezierPath closePath];
    return bezierPath;
}

- (UIBezierPath *)openEyesPath {
    //// Bezier Open
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(39.5, 27)];
    [bezierPath addCurveToPoint: CGPointMake(36, 30.5) controlPoint1: CGPointMake(39.5, 28.93) controlPoint2: CGPointMake(37.93, 30.5)];
    [bezierPath addCurveToPoint: CGPointMake(32.5, 27) controlPoint1: CGPointMake(34.07, 30.5) controlPoint2: CGPointMake(32.5, 28.93)];
    [bezierPath addCurveToPoint: CGPointMake(36, 23.5) controlPoint1: CGPointMake(32.5, 25.07) controlPoint2: CGPointMake(34.07, 23.5)];
    [bezierPath addCurveToPoint: CGPointMake(39.5, 27) controlPoint1: CGPointMake(37.93, 23.5) controlPoint2: CGPointMake(39.5, 25.07)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(67.5, 27)];
    [bezierPath addCurveToPoint: CGPointMake(64, 30.5) controlPoint1: CGPointMake(67.5, 28.93) controlPoint2: CGPointMake(65.93, 30.5)];
    [bezierPath addCurveToPoint: CGPointMake(60.5, 27) controlPoint1: CGPointMake(62.07, 30.5) controlPoint2: CGPointMake(60.5, 28.93)];
    [bezierPath addCurveToPoint: CGPointMake(64, 23.5) controlPoint1: CGPointMake(60.5, 25.07) controlPoint2: CGPointMake(62.07, 23.5)];
    [bezierPath addCurveToPoint: CGPointMake(67.5, 27) controlPoint1: CGPointMake(65.93, 23.5) controlPoint2: CGPointMake(67.5, 25.07)];
    [bezierPath closePath];
    return bezierPath;
}

- (void)blinkEyes {
    // Create an animation to switch between open and closed eyes.
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.autoreverses = YES;
    animation.duration = 0.2f;
    animation.fromValue = (id)_eyes.path;
    animation.toValue = (id)[self closedEyesPath].CGPath;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    // Put the animation in a group to delay it before repeating
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[animation];
    animationGroup.duration = 3.0f;
    animationGroup.repeatCount = INFINITY;
    
    [_eyes addAnimation:animationGroup forKey:@"pulse"];
}

- (void)drawRect:(CGRect)rect {
    [RobotStyleKit drawRobot];
}

@end
