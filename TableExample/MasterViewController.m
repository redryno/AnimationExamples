//
//  MasterViewController.m
//  TableExample
//
//  Created by Ryan Bigger on 9/3/15.
//  Copyright (c) 2015 Raster. All rights reserved.
//

#import "MasterViewController.h"
#import "FaceView.h"

@interface MasterViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *bikeImage;
@property (weak, nonatomic) IBOutlet FaceView *faceView;

@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Scale down the face view to animate in with a bounce
    self.faceView.layer.transform = CATransform3DMakeScale(0, 0, 0);
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self animateInFaceView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Animate

- (void)animateInFaceView {
    
    // Animate in the face view with a bounce
    [UIView animateWithDuration:0.5
                          delay:0.5
         usingSpringWithDamping:0.6
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.faceView.layer.transform = CATransform3DMakeScale(1, 1, 1);
                     } completion:^(BOOL finished) {
                         
                         // Begin blinking the eyes every few seconds
                         [_faceView blinkEyes];
                     }];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UILabel *label1 = (UILabel *)[cell viewWithTag:100];
    label1.text = [NSString stringWithFormat:@"%tu - Table View Cell", indexPath.row];
    
    UILabel *label2 = (UILabel *)[cell viewWithTag:101];
    label2.text = [NSString stringWithFormat:@"%tu", indexPath.row * 80];
    
    return cell;
}

#pragma mark - Scroll View

// UITableView is a subclass of UIScrollView so you can use this scroll view delegate method to adjust the image position
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // 64 is the height of the navigation bar.
    // 110 is the maximum distance we want to move the image down before it starts to move with the table.
    CGFloat offset = MIN(scrollView.contentOffset.y + 64, 110);
    self.bikeImage.transform = CGAffineTransformMakeTranslation(0, offset);
}

@end
