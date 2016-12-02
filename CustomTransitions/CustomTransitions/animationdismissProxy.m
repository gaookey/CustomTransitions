//
//  animationdismissProxy.m
//  酷我音乐盒自定义转场
//
//  Created by GWL on 2016/11/9.
//  Copyright © 2016年 GWL. All rights reserved.
//

#import "animationdismissProxy.h"

@implementation animationdismissProxy

//返回这个转场动画的执行时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}
//编写具体的转场动画的代码
//只要实现了这个方法 必须自己编写转场动画代码
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //获取转场动画的from
    UIView *fromView = [transitionContext viewForKey:UITransitionContextFromViewKey];
    
    //判断view的旋转角度
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        if (fromView.transform.b > 0) {
            fromView.transform = CGAffineTransformMakeRotation(M_PI_2);
        } else {
            fromView.transform = CGAffineTransformMakeRotation(-M_PI_2);
        } 
    } completion:^(BOOL finished) {
        //当转场动画结束后必须调用这个方法，否则新的视图无法监听任何事件
        [transitionContext completeTransition:YES];
    }];
}

@end
