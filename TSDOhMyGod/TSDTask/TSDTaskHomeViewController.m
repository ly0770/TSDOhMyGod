//
//  TSDTaskHomeViewController.m
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/11.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import "TSDTaskHomeViewController.h"
#import "TSDNewTaskViewController.h"
@interface TSDTaskHomeViewController ()

@end

@implementation TSDTaskHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"今日任务";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"New" style:UIBarButtonItemStylePlain target:self action:@selector(addNewTaskButtonClicked)];
}


- (void)leftBarButtonItemClick {
    NSLog(@"leftBarButtonItemClick");
}

- (void)addNewTaskButtonClicked {
    NSLog(@"addNewTaskButtonClicked");
    TSDNewTaskViewController *next = [[TSDNewTaskViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
