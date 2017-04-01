//
//  TSDTabBar.m
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/1.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import "TSDTabBar.h"
#import "UIButton+ImageAndTitle.h"
#import "TSDAnimationManager.h"
#define MSelectColor [UIColor redColor]
#define MUnselectColor [UIColor grayColor]

@interface TSDTabBar()<CAAnimationDelegate> {
    NSArray<NSString*> *_selectedItems;
    NSArray<NSString*> *_unselectedItems;
    NSArray<NSString*> *_titles;//如果titles为nil则不设置文字
}
@end

@implementation TSDTabBar
+ (instancetype)mTabBar {
    return [[self alloc] init];
}

- (instancetype)init {
    self = [super init];
    self.backgroundColor = [UIColor whiteColor];
    self.m_index = 0;
    self.isItemAnimition = NO;
    return self;
}
- (void)setSelectedItemIcon:(NSArray<NSString*> *)selectIcons unselectedItemIcon:(NSArray<NSString*> *)unselectIcons titles:(NSArray<NSString *> *)titles{
    _selectedItems = selectIcons;
    _unselectedItems = unselectIcons;
    _titles = titles;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.superview) {
        [self mReloadViews];
    }
}

- (void)mReloadViews {
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSInteger count = _selectedItems.count;
    CGFloat width = UScreenWidth/count;
    for (int i = 0; i < count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = i + 1000;
        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
        button.frame = CGRectMake(i*width, 0, width, CGRectGetHeight(self.superview.frame));
        if (i == _m_index) {
            [button setImage:[UIImage imageNamed:_selectedItems[i]] forState:UIControlStateNormal];
            [button setTitleColor:MSelectColor forState:UIControlStateNormal];
        } else {
            [button setImage:[UIImage imageNamed:_unselectedItems[i]] forState:UIControlStateNormal];
            [button setTitleColor:MUnselectColor forState:UIControlStateNormal];
            
        }
        if (_titles) {
            button.titleLabel.font = [UIFont systemFontOfSize:10];
            [button setTitle:_titles[i] forState:UIControlStateNormal];
            [button verticalImageAndTitle];
        }
        [button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}

-(void)buttonDidClick:(UIButton*)button{
    NSInteger index = button.tag - 1000;
    if (!(index == self.m_index)) {
        self.m_index = index;
        if (self.isItemAnimition) {
            [[TSDAnimationManager animationManager] animitionWithToolButtonClickOnView:button.imageView];
        }
    }
}

-(void)setM_index:(NSInteger)m_index{
    //若选中与未选中图片一样则不改变button状态
    if ([_unselectedItems[m_index] isEqualToString:_selectedItems[m_index]]) {
        if (self.didSelectedIndex) {
            self.didSelectedIndex(m_index);
        }
        return;
    }
    //将之前选中的button设置为未选中状态
    UIButton* old = [self viewWithTag:_m_index+1000];
    [old setImage:[UIImage imageNamed:_unselectedItems[_m_index]] forState:UIControlStateNormal];
    //设置新选中的button为已选中状态
    UIButton* new = [self viewWithTag:m_index+1000];
    [new setImage:[UIImage imageNamed:_selectedItems[m_index]] forState:UIControlStateNormal];
    
    if (_titles) {
        [old setTitleColor:MUnselectColor forState:UIControlStateNormal];
        [new setTitleColor:MSelectColor forState:UIControlStateNormal];
        
    }
    _m_index = m_index;
    
    if (self.didSelectedIndex) {
        self.didSelectedIndex(m_index);
    }
}

@end
