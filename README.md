# GWLIndicator
自定义的菊花

```oc
初始化方法
 + (GWLIndicator *)indicatorViewWithType:(GWLIndicatorType)showType;
 - (instancetype)initWithShowType:(GWLIndicatorType)showType;
```

```oc
typedef NS_ENUM(NSUInteger, GWLIndicatorType) {
    GWLIndicatorTypeAtView,  // 显示在view上
    GWLIndicatorTypeAtWindow // 显示在window上（会盖住底层view不能交互）
};
```

```oc
开始动画
- (void)startAnimatingAtView:(UIView *)view;
```

```oc
停止动画
- (void)stopAnimating;
```
