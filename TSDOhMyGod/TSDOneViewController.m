//
//  TSDOneViewController.m
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/1.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import "TSDOneViewController.h"
#import <objc/objc.h>
#import "TSDPersonalProfileViewController.h"
#import "TSDDatabaseManager.h"
#import "FMDB.h"
@interface TSDOneViewController ()<CAAnimationDelegate> {
    UIView *testView;
    CALayer *layer;
}


@end

@implementation TSDOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.title = @"One";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"left" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"right" style:UIBarButtonItemStylePlain target:self action:@selector(rightBarButtonItemClick)];
    
    //    self.navigationController.title = @"One";
    
}

- (void)leftBarButtonItemClick {
    NSLog(@"leftBarButtonItemClick");
}

- (void)rightBarButtonItemClick {
    NSLog(@"leftBarButtonItemClick");
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //    self.navigationController.navigationBar.translucent = NO;
    //    self.navigationController.navigationBar.alpha = 1;
    [[TSDUser userInstance] setNavBarColorWithNavBar:self.navigationController.navigationBar color:nil alpha:1];
//    [self testAnimation];
//    [self testDB];
}

- (void)testDB {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"FMDB.db"];
    NSString *filePath = [documentDirectory stringByAppendingPathComponent:fileName];
    TSDDatabaseManager *dbManager = [TSDDatabaseManager defaultManager];
    dbManager.dbPath = filePath;
//    if ([dbManager openDB]) {
//        [dbManager createTableWithName:@"TaskTable" items:nil];
//        [dbManager insertIntoTable:@"TaskTable" insertItems:nil];
//    } else {
//        NSLog(@"open failed");
//    }
//    [dbManager closeDB];
    
//    if ([dbManager openDB]) {
//        [dbManager insertIntoTable:@"TaskTable" insertItems:nil];
//    } else {
//        NSLog(@"insert failed");
//    }
//    [dbManager closeDB];
    if ([dbManager openDB]) {
        [dbManager query];
    } else {
        NSLog(@"open failed");
    }
    [dbManager closeDB];

//    [[TSDUser userInstance] redirectNSlogToDocumentFolder];
}

- (void)testAnimation {
    
    //    testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    //    testView.layer.position = CGPointMake(160, 250);
    //    testView.backgroundColor = [UIColor redColor];
    //    [self.view addSubview:testView];
    //
    //    layer = [CALayer layer];
    ////    layer.bounds = CGRectMake(0, 0, 200, 200);
    ////    layer.position = CGPointMake(160, 250);
    //    layer.backgroundColor = [UIColor redColor].CGColor;
    //    layer.borderColor = [UIColor blackColor].CGColor;
    //    layer.opacity = 1.0f;
    //    [testView.layer addSublayer:layer];
    ////    [self.view.layer addSublayer:layer];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 40);
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnClick {
    
    TSDPersonalProfileViewController *next = [[TSDPersonalProfileViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
    //    //改变UIview的layer属性有默认动画
    //    [CATransaction begin];
    //    // 关闭隐式动画
    //    [CATransaction setDisableActions:NO];
    //    testView.layer.position = CGPointMake(100, 100);
    //    [CATransaction commit];
    
    //     [CATransaction setDisableActions:NO];    //  设置是否启动隐式动画
    //     layer.cornerRadius = (layer.cornerRadius == 0.0f) ? 30.0f : 0.0f;    //   设置圆角
    //     layer.opacity = (layer.opacity == 1.0f) ? 0.5f : 1.0f;   // 设置透明度
    //     [CATransaction begin];
    //
    //     //显式事务默认开启动画效果,kCFBooleanTrue关闭
    //     [CATransaction setValue:(id)kCFBooleanFalse forKey:kCATransactionDisableActions];
    //
    //    //动画执行时间
    //    [CATransaction setValue:[NSNumber numberWithFloat:5.0f] forKey:kCATransactionAnimationDuration];
    //     //[CATransaction setAnimationDuration:[NSNumber numberWithFloat:5.0f]];
    ////     layer.cornerRadius = (layer.cornerRadius == 0.0f) ? 30.0f : 0.0f;
    ////     layer.opacity = (layer.opacity == 1.0f) ? 0.5f : 1.0f;
    //        testView.layer.position = CGPointMake(300, 300);
    //     [CATransaction commit];
    
    //    CABasicAnimation *animation = [CABasicAnimation animation];
    //    animation.keyPath = @"transform.scale";
    //    animation.toValue = @1.5;
    //    animation.repeatCount = 1;//MAXFLOAT
    //    animation.repeatDuration = 0.15;
    //    animation.removedOnCompletion = NO;
    //    //    animation.fillMode = kCAFillModeBackwards;
    //    animation.beginTime = 0.0;
    //    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];;//速度控制函数
    //    //    animation.delegate = self;
    //    CABasicAnimation *animationOne = [CABasicAnimation animation];
    //    animationOne.keyPath = @"transform.scale";
    //    animationOne.toValue = @1.2;
    //    animationOne.repeatCount = 1;//MAXFLOAT
    //    animationOne.repeatDuration = 0.1;
    //    animationOne.removedOnCompletion = NO;
    //    //    animationOne.fillMode = kCAFillModeBackwards;
    //    animationOne.beginTime = 0.15;
    //    animationOne.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];;//速度控制函数
    //
    //    CAAnimationGroup *animGroup = [CAAnimationGroup animation];
    //    animGroup.animations = [NSArray arrayWithObjects:animation, animationOne, nil];
    //    animGroup.duration = 0.25;
    //    [testView.layer addAnimation:animGroup forKey:nil];
}

#pragma mark 暂停CALayer的动画
-(void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [testView.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    
    // 让CALayer的时间停止走动
    testView.layer.speed = 0.0;
    // 让CALayer的时间停留在pausedTime这个时刻
    testView.layer.timeOffset = pausedTime;
}

#pragma mark 恢复CALayer的动画
-(void)resumeLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = testView.layer.timeOffset;
    // 1. 让CALayer的时间继续行走
    testView.layer.speed = 1.0;
    // 2. 取消上次记录的停留时刻
    testView.layer.timeOffset = 0.0;
    // 3. 取消上次设置的时间
    testView.layer.beginTime = 0.0;
    // 4. 计算暂停的时间(这里也可以用CACurrentMediaTime()-pausedTime)
    CFTimeInterval timeSincePause = [testView.layer convertTime:CACurrentMediaTime() fromLayer:nil] - pausedTime;
    // 5. 设置相对于父坐标系的开始时间(往后退timeSincePause)
    testView.layer.beginTime = timeSincePause;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - CAAnimation
/* Called when the animation begins its active duration. */
// 动画开始时调用
- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"animationDidStart");
}

/* Called when the animation either completes its active duration or
 * is removed from the object it is attached to (i.e. the layer). 'flag'
 * is true if the animation reached the end of its active duration
 * without being removed. */
// 动画结束后调用
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"animationDidStop");
    
}
@end
