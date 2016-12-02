//
//  ViewController.m
//  酷我音乐盒自定义转场
//
//  Created by GWL on 2016/11/9.
//  Copyright © 2016年 GWL. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"
#import "animationPresentedProxy.h"
#import "animationdismissProxy.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    //1. 创建一个占满整个蓝色view
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    //设置 blueView 的 anchorPoint 修改旋转的方式
    blueView.layer.anchorPoint = CGPointMake(0.5, 2.0);
    blueView.frame = self.view.bounds;
    //[self.view addSubview:blueView];
    
   
}
- (IBAction)click:(id)sender
{
    ViewController2 *vc = [[ViewController2 alloc] init];
    
    //自定义转场
    vc.modalPresentationStyle = UIModalPresentationCustom;
   
    //通过设置代理 自定义转场
    vc.transitioningDelegate = self;
    
    [self presentViewController:vc animated:YES completion:nil];
}
#pragma mark - <UIViewControllerTransitioningDelegate>
//有一个返回值 该返回值表示当 当view呈现的是要通过哪个对象来执行动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    //在此方法中需要返回一个对象
    animationPresentedProxy *present = [[animationPresentedProxy alloc] init];
    return present;
}
//控制器在 Dismiss 的 时候要通过哪个对象来执行转场动画
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    animationdismissProxy *dismiss = [[animationdismissProxy alloc] init];
    return dismiss;
}

@end
