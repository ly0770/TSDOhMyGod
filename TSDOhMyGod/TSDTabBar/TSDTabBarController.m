//
//  TSDTabBarController.m
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/1.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import "TSDTabBarController.h"
#import "TSDTabBar.h"

@interface TSDTabBarController()<UITabBarControllerDelegate>
@end

@implementation TSDTabBarController
- (void)viewDidLoad {
    [super viewDidLoad];
    [UITabBar appearance].translucent = NO;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.delegate = self;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    if (_m_tabBar&&![_m_tabBar isDescendantOfView:self.tabBar]) {
        [self.tabBar addSubview:_m_tabBar];
        __weak __typeof(self) weakSelf = self;
        _m_tabBar.didSelectedIndex = ^(NSInteger index){
            NSLog(@"-----index:%ld",(long)index);
            [weakSelf setSelectedIndex:index];
        };
    }
    _m_tabBar.frame = self.tabBar.bounds;
}

-(void)setM_tabBar:(TSDTabBar *)m_tabBar{
    if (_m_tabBar) {
        [_m_tabBar removeFromSuperview];
    }
    _m_tabBar = m_tabBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
