# GWLIndicator
自定义的菊花

###示例图片
![gif](https://github.com/gaowanli/GWLIndicator/blob/master/1.gif)

```objective-c
初始化方法
 + (GWLIndicator *)indicatorViewWithType:(GWLIndicatorType)showType;
 - (instancetype)initWithShowType:(GWLIndicatorType)showType;
```

```objective-c
typedef NS_ENUM(NSUInteger, GWLIndicatorType) {
    GWLIndicatorTypeAtView,  // 显示在view上
    GWLIndicatorTypeAtWindow // 显示在window上（会盖住底层view不能交互）
};
```

```objective-c
开始动画
- (void)startAnimatingAtView:(UIView *)view;
```

```objective-c
停止动画
- (void)stopAnimating;
```
