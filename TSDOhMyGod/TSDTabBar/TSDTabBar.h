//
//  TSDTabBar.h
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/1.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TSDTabBar : UITabBar
/*
 **当前选中
 */
@property (nonatomic, assign) NSInteger m_index;
/*
 **点击button是否带有动态效果,默认为NO
 */
@property (nonatomic, assign) BOOL isItemAnimition;
/*
 **选中方法
 */
@property (nonatomic, copy) void(^didSelectedIndex)(NSInteger index);

/*
 **初始化
 */
+ (instancetype)mTabBar;
/*
 **设置选中状态和非选中状态图片,传入参数为icon名称数组
 */
- (void)setSelectedItemIcon:(NSArray<NSString*> *)selectIcons unselectedItemIcon:(NSArray<NSString*> *)unselectIcons titles:(NSArray<NSString *> *)titles;

@end
