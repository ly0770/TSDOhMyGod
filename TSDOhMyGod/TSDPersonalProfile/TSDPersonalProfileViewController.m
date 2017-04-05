//
//  TSDPersonalProfileViewController.m
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/1.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import "TSDPersonalProfileViewController.h"
#import "TSDBlogListViewController.h"
#define MHeaderHeight 280

@interface TSDPersonalProfileViewController ()<UITableViewDelegate,UITableViewDataSource> {
    CGFloat lastY;
}
@property (nonatomic, strong) UITableView *m_tableView;

@end

@implementation TSDPersonalProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"个人中心";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIView *header_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UScreenWidth, MHeaderHeight)];
    header_view.backgroundColor = [UIColor orangeColor];
    
    [[TSDUser userInstance] setNavBarColorWithNavBar:self.navigationController.navigationBar color:nil alpha:0];
    CGRect rect = [UIScreen mainScreen].bounds;
    rect.origin.y -= 64;
    rect.size.height += 44;
    lastY = rect.origin.y;
    if (!self.m_tableView) {
        self.m_tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStyleGrouped];
        self.m_tableView.tableHeaderView = header_view;
        self.m_tableView.dataSource = self;
        [self.view addSubview:self.m_tableView];
    }
    self.m_tableView.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    //如果delegate不设置为nil,在写一个界面的viewWillAppear后scrollViewDidScroll的方法还会执行，影响导航栏的设置
    self.m_tableView.delegate = nil;
    [super viewWillDisappear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}

#pragma mark - TableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.imageView.image = [UIImage imageNamed:@"user0"];
    if(indexPath.row == 0 && indexPath.section == 0) {
        cell.textLabel.text = @"常用博客";
    } else {
        cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",(long)indexPath.row];
    }
    return cell;
}

#pragma mark - TableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0 && indexPath.row == 0) {//常用博客
        TSDBlogListViewController *next = [[TSDBlogListViewController alloc] init];
        [self.navigationController pushViewController:next animated:YES];
    }
}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    if (section > 0) {
//        return 20;
//    }
//    return 0;
//}

#pragma mark - ScorllViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentOffset.y;
    NSLog(@"offsetY:%f",offsetY);
    if (offsetY > MHeaderHeight-64*2) {
        NSInteger offset = MHeaderHeight-64*2;
        CGFloat alpha = ((offsetY - offset) / 64);
        NSLog(@"offsetY:%f,offset:%ld,alpha:%f",offsetY,(long)offset,alpha);
        [[TSDUser userInstance] setNavBarColorWithNavBar:self.navigationController.navigationBar color:nil alpha:alpha];
    } else {
        [[TSDUser userInstance] setNavBarColorWithNavBar:self.navigationController.navigationBar color:nil alpha:0];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
}
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
}

@end
