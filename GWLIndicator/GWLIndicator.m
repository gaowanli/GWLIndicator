//
//  GWLIndicator.m
//  CustomActivityIndicatorView
//
//  Created by GaoWanli on 15/9/29.
//  Copyright (c) 2015年 GWL. All rights reserved.
//

#import "GWLIndicator.h"

@interface GWLTheTopView : UIWindow

+ (GWLTheTopView *)theTopViewWithFrame:(CGRect)frame;

- (void)show;
- (void)dismiss;

@end

@implementation GWLTheTopView

+ (GWLTheTopView *)theTopViewWithFrame:(CGRect)frame {
    return [[self alloc]initWithFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.windowLevel = UIWindowLevelAlert;
    }
    return self;
}

- (void)show {
    [self makeKeyAndVisible];
}

- (void)dismiss {
    [self resignKeyWindow];
}

@end

@interface GWLIndicator ()

@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, weak) UIView *showAtView;
@property (nonatomic, assign) GWLIndicatorType showType;
@property (nonatomic, strong) GWLTheTopView *theTopView;

@end

@implementation GWLIndicator

+ (GWLIndicator *)indicatorViewWithType:(GWLIndicatorType)showType {
    return [[self alloc]initWithShowType:showType];
}

- (instancetype)initWithShowType:(GWLIndicatorType)showType {
    if (self = [super init]) {
        self.showType = showType;
        [self addSubview:self.logoImageView];
    }
    return self;
}

- (UIImageView *)logoImageView {
    if (!_logoImageView) {
        _logoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[@"GWLIndicator.bundle" stringByAppendingPathComponent:@"logo.png"]]];
    }
    return _logoImageView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    _logoImageView.frame = (CGRect){ CGPointZero, self.logoImageView.image.size };
    self.frame = (CGRect){ CGPointZero, self.logoImageView.image.size };
    self.center = self.showAtView.center;
}

- (void)startAnimatingAtView:(UIView *)view {
    self.showAtView = view;
    if (self.showType == GWLIndicatorTypeAtWindow) {
        _theTopView = [GWLTheTopView theTopViewWithFrame:view.bounds];
        [_theTopView show];
        [_theTopView addSubview:self];
    }else {
        [view addSubview:self];
    }
    [self startAnimating];
}

- (void)stopAnimating {
    [_logoImageView.layer removeAllAnimations];
    if (self.showType == GWLIndicatorTypeAtWindow) {
        [_theTopView dismiss];
        [_theTopView removeFromSuperview];
        _theTopView = nil;
    }
    [self removeFromSuperview];
}

- (void)startAnimating {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.fromValue = @(0);
    animation.toValue = @(M_PI * 2);
    animation.duration = 1;
    animation.repeatCount = INT64_MAX;
    [self.logoImageView.layer addAnimation:animation forKey:@"rotate"];
}

@end
