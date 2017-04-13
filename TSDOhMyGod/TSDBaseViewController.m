//
//  TSDBaseViewController.m
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/13.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import "TSDBaseViewController.h"

@interface TSDBaseViewController ()

@end

@implementation TSDBaseViewController

- (TSDTabBarController *)m_tabBar {
    if ([self.tabBarController isKindOfClass:[TSDTabBarController class]]) {
        return (TSDTabBarController *)self.tabBarController;
    }
    return nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
