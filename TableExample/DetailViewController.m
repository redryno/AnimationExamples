//
//  DetailViewController.m
//  TableExample
//
//  Created by Ryan Bigger on 9/3/15.
//  Copyright © 2017 Ryan Bigger. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *maskView;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self animateMask];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Animate

- (void)animateMask {
    // Add a constraint that overrides the left constraint in the storyboard
    // Make sure the left constraint is set at a lower priority
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:_maskView
                                                                  attribute:NSLayoutAttributeLeft
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:_containerView
                                                                  attribute:NSLayoutAttributeRight
                                                                 multiplier:1
                                                                   constant:0];
    [_containerView addConstraint:constraint];
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         [_containerView layoutIfNeeded];
                     } completion:nil];
}

@end
