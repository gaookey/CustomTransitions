//
//  ViewController2.m
//  酷我音乐盒自定义转场
//
//  Created by GWL on 2016/11/9.
//  Copyright © 2016年 GWL. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

//控制器的view是调用 loadView 方法创建的
- (void)loadView
{
    //自己创建view
    self.view = [[UIView alloc] init];
    self.view.layer.anchorPoint = CGPointMake(0.5, 2.0);
    self.view.frame = [UIScreen mainScreen].bounds;

}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor cyanColor];
    
    //创建一个 拖拽手势
    UIPanGestureRecognizer *tap = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(PanGestureRecognizer:)];
    [self.view addGestureRecognizer:tap];
}
#pragma mark - 拖拽手势
- (void)PanGestureRecognizer:(UIPanGestureRecognizer *)pan
{
    //判断手势（手指）是否抬起或手势被取消了
    if (pan.state == UIGestureRecognizerStateEnded || pan.state == UIGestureRecognizerStateCancelled) {
        
        if (ABS(pan.view.transform.b) > 0.16) {
            
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            pan.view.transform = CGAffineTransformIdentity;
        }
    } else {
        //1.获取拖拽手势手指的偏移x值
        CGFloat offsetX = [pan translationInView:pan.view].x;
        //2.计算一个百分比
        CGFloat percet = offsetX / self.view.bounds.size.width;
        //3.计算这次要旋转的度数
        CGFloat radians = M_PI_4 * percet;
        //4.让蓝色view做一个旋转的度数
        pan.view.transform = CGAffineTransformMakeRotation(radians);
    }
    
    //输出transform的值
    NSLog(@"%F %F %F %F",pan.view.transform.a,pan.view.transform.b,pan.view.transform.c,pan.view.transform.d);
}

@end
