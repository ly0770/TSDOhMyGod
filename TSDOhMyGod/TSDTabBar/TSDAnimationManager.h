//
//  TSDAnimationManager.h
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/1.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TSDAnimationManager : NSObject
/*
 *
 */
+ (instancetype)animationManager;
/*
 **为button上的图片添加动画效果
 */
- (void)animitionWithToolButtonClickOnView:(UIImageView *)view;

@end
