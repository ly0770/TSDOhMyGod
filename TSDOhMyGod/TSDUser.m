//
//  TSDUser.m
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/1.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import "TSDUser.h"

@implementation TSDUser
+ (instancetype)userInstance {
    static dispatch_once_t onceToken;
    static id shareInstance;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    return shareInstance;
}

- (void)setNavBarColorWithNavBar:(UINavigationBar *)navBar color:(UIColor *)color alpha:(CGFloat)alpha {
    if (color) {
        navBar.barTintColor = color;
    }
    NSArray *subviews = navBar.subviews;
    for (id view in subviews) {
        if ([view isKindOfClass:NSClassFromString(@"_UIBarBackground")]) {
            UIView *v = view;
            v.alpha = alpha;
        }
    }
}

@end
