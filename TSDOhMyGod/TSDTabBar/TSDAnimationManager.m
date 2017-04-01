//
//  TSDAnimationManager.m
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/1.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import "TSDAnimationManager.h"

@implementation TSDAnimationManager
+ (instancetype)animationManager {
    static dispatch_once_t once;
    static id shareInstance;
    dispatch_once(&once, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

- (void)animitionWithToolButtonClickOnView:(UIImageView *)view {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.toValue = @1.8;
    animation.repeatCount = 1;
    animation.repeatDuration = 0.2;
    animation.removedOnCompletion = NO;
    //    animation.fillMode = kCAFillModeBackwards;
    animation.beginTime = 0.0;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];;//速度控制函数
    //    animation.delegate = self;
    CABasicAnimation *animationOne = [CABasicAnimation animation];
    animationOne.keyPath = @"transform.scale";
    animationOne.toValue = @1.5;
    animationOne.repeatCount = 1;
    animationOne.repeatDuration = 0.1;
    animationOne.removedOnCompletion = NO;
    //    animationOne.fillMode = kCAFillModeBackwards;
    animationOne.beginTime = 0.2;
    animationOne.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];;//速度控制函数
    
    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    animGroup.animations = [NSArray arrayWithObjects:animation, animationOne, nil];
    animGroup.duration = 0.4;
    [view.layer addAnimation:animGroup forKey:nil];
}

@end
