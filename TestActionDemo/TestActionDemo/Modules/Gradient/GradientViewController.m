//
//  GradientViewController.m
//  TestActionDemo
//
//  Created by rayor on 2022/6/29.
//  Copyright © 2022 rayor. All rights reserved.
//

#import "GradientViewController.h"

@interface GradientViewController ()
/* 容器视图 */
@property (weak, nonatomic) IBOutlet UIView *containerView;
/* 图片遮罩 */
@property (weak, nonatomic) IBOutlet UIView *myImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topY;

@end

@implementation GradientViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self updateAlbumRectGradientMaskRatio:1];
}

- (IBAction)resetTopYAction:(id)sender {
    self.topY.constant = 0;
}


- (void)updateAlbumRectGradientMaskRatio:(CGFloat)ratio {
    if (ratio > 1) {
        ratio = 1;
    }
    if (ratio < 0) {
        ratio = 0;
    }
    
    // 需要对albumeView添加遮罩信息
    // 设置渐变图层
    CAGradientLayer *gradientMask = [CAGradientLayer layer];
    gradientMask.frame = self.containerView.bounds;
    gradientMask.colors = @[(id)[UIColor whiteColor].CGColor,
                            (id)[UIColor whiteColor].CGColor,
                            (id)[UIColor clearColor].CGColor,
                            (id)[UIColor clearColor].CGColor];
    
    
    gradientMask.locations = @[@0,@0.3,@(0.6+0.4*ratio),@1];
    
    gradientMask.startPoint = CGPointMake(0.5, 0);  // 竖直方向上渐变
    gradientMask.endPoint = CGPointMake(0.5, 1);
    
    //    self.containerView.layer.mask = nil;
    self.containerView.layer.mask = gradientMask;
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    
    self.topY.constant = self.topY.constant + 30;
    
    
}

@end
