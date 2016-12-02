//
//  animationPresentedProxy.m
//  酷我音乐盒自定义转场
//
//  Created by GWL on 2016/11/9.
//  Copyright © 2016年 GWL. All rights reserved.
//

#import "animationPresentedProxy.h"

@implementation animationPresentedProxy

//返回这个转场动画的执行时间
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}
//编写具体的转场动画的代码
//只要实现了这个方法 必须自己编写转场动画代码
//transitionContext 表示所有在当前转场过程中包含的信息
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //获取容器view
    UIView *containerView = [transitionContext containerView];
    
    //获取目标view
    UIView *toView = [transitionContext viewForKey:UITransitionContextToViewKey];
 
    //把 目标view加到容器view
    [containerView addSubview:toView];
    
    //开始实现动画
    //设置初始值
    toView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    
    //通过动画形式旋转到默认位置
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        toView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        //当转场动画结束后必须调用这个方法，否则新的视图无法监听任何事件
        [transitionContext completeTransition:YES];
    }];
}

@end
