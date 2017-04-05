//
//  TSDBlogListViewController.m
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/5.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import "TSDBlogListViewController.h"

@interface TSDBlogListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *m_tableView;
@property (nonatomic, strong) NSArray *m_dataSource;

@end

@implementation TSDBlogListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"常用博客列表";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self getDataSource];
    [[TSDUser userInstance] setNavBarColorWithNavBar:self.navigationController.navigationBar color:nil alpha:1];
    CGRect rect = [UIScreen mainScreen].bounds;
    if (!self.m_tableView) {
        self.m_tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStyleGrouped];
        self.m_tableView.delegate = self;
        self.m_tableView.dataSource = self;
        [self.view addSubview:self.m_tableView];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
- (void)getDataSource {
    self.m_dataSource = [[TSDUser userInstance] readDataFromJsonFile:@"bloglist"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -- TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.m_dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
//    cell.imageView.image = [UIImage imageNamed:@"user0"];
    if (self.m_dataSource.count>indexPath.row) {
        cell.textLabel.text = self.m_dataSource[indexPath.row][@"title"];
    }
    return cell;

}

#pragma mark -- TableViewDelegate 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.m_dataSource.count>indexPath.row) {
        NSURL *url = [NSURL URLWithString:self.m_dataSource[indexPath.row][@"url"]];
        [[UIApplication sharedApplication] openURL:url];
    }
}
@end
