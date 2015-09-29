//
//  GWLIndicator.h
//  CustomActivityIndicatorView
//
//  Created by GaoWanli on 15/9/29.
//  Copyright (c) 2015年 GWL. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GWLIndicatorType) {
    GWLIndicatorTypeAtView,  // 显示在view上
    GWLIndicatorTypeAtWindow // 显示在window上（会盖住底层view不能交互
};

@interface GWLIndicator : UIView

+ (GWLIndicator *)indicatorViewWithType:(GWLIndicatorType)showType;

- (instancetype)initWithShowType:(GWLIndicatorType)showType;

- (void)startAnimatingAtView:(UIView *)view;

- (void)stopAnimating;

@end
