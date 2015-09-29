//
//  ViewController.m
//  GWLIndicatorExample
//
//  Created by 高万里 on 15/9/29.
//  Copyright © 2015年 gaowanli. All rights reserved.
//

#import "ViewController.h"
#import "GWLIndicator.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat btnWidth = 44;
    CGFloat btnX = (CGRectGetWidth(self.view.bounds) - 2 * btnWidth) * 0.5;
    for (NSInteger i = 0; i < 2; i++) {
        [self.view addSubview:({
            UIButton *addButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
            addButton.tag = i;
            addButton.frame = CGRectMake(btnX, 100, btnWidth, btnWidth);
            [addButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            addButton;
        })];
        btnX += btnWidth;
    }
    
    [self.view addSubview:({
        CGFloat width = 100;
        CGFloat x = (CGRectGetWidth(self.view.bounds) - width) * 0.5;
        UIButton *testClickButton = [[UIButton alloc]initWithFrame:CGRectMake(x, 200, width, 44)];
        testClickButton.backgroundColor = [UIColor redColor];
        [testClickButton setTitle:@"测试点击" forState:UIControlStateNormal];
        [testClickButton addTarget:self action:@selector(testClickButtonClick) forControlEvents:UIControlEventTouchUpInside];
        testClickButton;
    })];
    
    [self.view addSubview:({
        CGFloat width = 200;
        CGFloat x = (CGRectGetWidth(self.view.bounds) - width) * 0.5;
        UIView *blackView = [[UIButton alloc]initWithFrame:CGRectMake(x, 300, width, 200)];
        blackView.backgroundColor = [UIColor blackColor];
        
        [blackView addSubview:({
            UIButton *blackViewButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
            [blackViewButton addTarget:self action:@selector(blackViewButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            blackViewButton;
        })];
        blackView;
    })];
}

- (void)testClickButtonClick {
    NSLog(@"可以点击");
}

- (void)blackViewButtonClick:(UIButton *)blackViewBtn {
    UIView *blackView = blackViewBtn.superview;
    GWLIndicator *indicatorView = [[GWLIndicator alloc]initWithShowType:GWLIndicatorTypeAtWindow];
    [blackView addSubview:indicatorView];
    [indicatorView startAnimatingAtView:blackView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [indicatorView stopAnimating];
    });
}

- (void)addButtonClick:(UIButton *)addBtn {
    addBtn.userInteractionEnabled = NO;
    if (addBtn.tag == 0) {
        GWLIndicator *indicatorView = [[GWLIndicator alloc]initWithShowType:GWLIndicatorTypeAtView];
        [self.view addSubview:indicatorView];
        [indicatorView startAnimatingAtView:self.view];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [indicatorView stopAnimating];
            addBtn.userInteractionEnabled = YES;
        });
    }else if (addBtn.tag == 1) {
        GWLIndicator *indicatorView = [[GWLIndicator alloc]initWithShowType:GWLIndicatorTypeAtWindow];
        [self.view addSubview:indicatorView];
        [indicatorView startAnimatingAtView:self.view];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [indicatorView stopAnimating];
            addBtn.userInteractionEnabled = YES;
        });
    }
}

@end
