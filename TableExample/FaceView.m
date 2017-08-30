//
//  FaceView.m
//  TableExample
//
//  Created by Ryan Bigger on 9/3/15.
//  Copyright © 2017 Ryan Bigger. All rights reserved.
//

#import "FaceView.h"

@interface FaceView ()

@property (strong, nonatomic) CAShapeLayer *eyes;

@end


@implementation FaceView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    _eyes = [CAShapeLayer layer];
    _eyes.fillColor = [UIColor whiteColor].CGColor;
    _eyes.path = [self openEyesPath].CGPath;
    [self.layer addSublayer: _eyes];
}

- (UIBezierPath *)closedEyesPath {
    // Used PaintCode to generate the paths
    //// Bezier Closed
    UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
    [bezier2Path moveToPoint: CGPointMake(35, 30)];
    [bezier2Path addCurveToPoint: CGPointMake(30, 29) controlPoint1: CGPointMake(35, 29.45) controlPoint2: CGPointMake(32.76, 29)];
    [bezier2Path addCurveToPoint: CGPointMake(25, 30) controlPoint1: CGPointMake(27.24, 29) controlPoint2: CGPointMake(25, 29.45)];
    [bezier2Path addCurveToPoint: CGPointMake(30, 31) controlPoint1: CGPointMake(25, 30.55) controlPoint2: CGPointMake(27.24, 31)];
    [bezier2Path addCurveToPoint: CGPointMake(35, 30) controlPoint1: CGPointMake(32.76, 31) controlPoint2: CGPointMake(35, 30.55)];
    [bezier2Path closePath];
    [bezier2Path moveToPoint: CGPointMake(74, 30)];
    [bezier2Path addCurveToPoint: CGPointMake(69, 29) controlPoint1: CGPointMake(74, 29.45) controlPoint2: CGPointMake(71.76, 29)];
    [bezier2Path addCurveToPoint: CGPointMake(64, 30) controlPoint1: CGPointMake(66.24, 29) controlPoint2: CGPointMake(64, 29.45)];
    [bezier2Path addCurveToPoint: CGPointMake(69, 31) controlPoint1: CGPointMake(64, 30.55) controlPoint2: CGPointMake(66.24, 31)];
    [bezier2Path addCurveToPoint: CGPointMake(74, 30) controlPoint1: CGPointMake(71.76, 31) controlPoint2: CGPointMake(74, 30.55)];
    [bezier2Path closePath];
    return bezier2Path;
}

- (UIBezierPath *)openEyesPath {
    //// Bezier Open
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(35, 30)];
    [bezierPath addCurveToPoint: CGPointMake(30, 25) controlPoint1: CGPointMake(35, 27.24) controlPoint2: CGPointMake(32.76, 25)];
    [bezierPath addCurveToPoint: CGPointMake(25, 30) controlPoint1: CGPointMake(27.24, 25) controlPoint2: CGPointMake(25, 27.24)];
    [bezierPath addCurveToPoint: CGPointMake(30, 35) controlPoint1: CGPointMake(25, 32.76) controlPoint2: CGPointMake(27.24, 35)];
    [bezierPath addCurveToPoint: CGPointMake(35, 30) controlPoint1: CGPointMake(32.76, 35) controlPoint2: CGPointMake(35, 32.76)];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(74, 30)];
    [bezierPath addCurveToPoint: CGPointMake(69, 25) controlPoint1: CGPointMake(74, 27.24) controlPoint2: CGPointMake(71.76, 25)];
    [bezierPath addCurveToPoint: CGPointMake(64, 30) controlPoint1: CGPointMake(66.24, 25) controlPoint2: CGPointMake(64, 27.24)];
    [bezierPath addCurveToPoint: CGPointMake(69, 35) controlPoint1: CGPointMake(64, 32.76) controlPoint2: CGPointMake(66.24, 35)];
    [bezierPath addCurveToPoint: CGPointMake(74, 30) controlPoint1: CGPointMake(71.76, 35) controlPoint2: CGPointMake(74, 32.76)];
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

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
