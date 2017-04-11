//
//  TSDNewTaskViewController.m
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/11.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import "TSDNewTaskViewController.h"
#import "TSDNewTaskTableViewCell.h"
@interface TSDNewTaskViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *m_tableView;
@property (nonatomic, copy) NSArray *m_sourceArray;
@end

@implementation TSDNewTaskViewController

- (void)initTestData {
    self.m_sourceArray = @[@"任务名称",@"开始时间",@"结束时间"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"新建任务";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initTestData];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //    self.m_tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.m_tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //    self.m_tableView.frame = self.view.bounds;
    self.m_tableView.delegate = self;
    self.m_tableView.dataSource = self;
    [self.view addSubview:self.m_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- TableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.m_sourceArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"TSDNewTaskViewController cellForRowAtIndexPath");
    TSDNewTaskTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"reuseCell"];
    if (!cell) {
        cell = [[TSDNewTaskTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseCell"];
    }
    cell.textLabel.text = @"2";
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"TSDNewTaskViewController heightForRowAtIndexPath");
    return 60;
}











@end
