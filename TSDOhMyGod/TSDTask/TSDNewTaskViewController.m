//
//  TSDNewTaskViewController.m
//  TSDOhMyGod
//
//  Created by Tiya on 2017/4/11.
//  Copyright © 2017年 Tiya. All rights reserved.
//

#import "TSDNewTaskViewController.h"
#import "TSDNewTaskTableViewCell.h"
@interface TSDNewTaskViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIAlertViewDelegate> {
    UITextField *_m_currentT;
}

@property (nonatomic, strong) UITableView *m_tableView;
@property (nonatomic, copy) NSArray *m_sourceArray;
@property (nonatomic, strong) NSMutableDictionary *m_uploadInfo;
@end

@implementation TSDNewTaskViewController

- (void)initTestData {
//    self.m_sourceArray = @[@{@"name":@"任务名称",@"isMust":@1},
//                           @{@"name":@"开始时间",@"isMust":@1},
//                           @{@"name":@"结束时间",@"isMust":@1},
//                           @{@"name":@"重复方式",@"isMust":@1},
//                           @{@"name":@"提醒设置",@"isMust":@0},
//                           @{@"name":@"任务类型",@"isMust":@0}];
    self.m_sourceArray = @[@{@"name":@"AA",@"isMust":@1},
                           @{@"name":@"BB",@"isMust":@1},
                           @{@"name":@"CC",@"isMust":@1},
                           @{@"name":@"DD",@"isMust":@1},
                           @{@"name":@"EE",@"isMust":@0},
                           @{@"name":@"FF",@"isMust":@0}];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"新建任务";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"SAVE" style:UIBarButtonItemStylePlain target:self action:@selector(saveTaskItemClicked)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"BACK" style:UIBarButtonItemStylePlain target:self action:@selector(backTemClicked)];
    self.navigationItem.rightBarButtonItem.enabled = NO;
    [self initTestData];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.m_tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.m_tableView.delegate = self;
    self.m_tableView.dataSource = self;
    self.m_tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.m_tableView];
    
    [self addKeyboardNotification];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_m_currentT resignFirstResponder];
    [self removeNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- Event
- (void)backTemClicked {
    NSLog(@"backTemClicked");
    BOOL isCanBack = [self checkIfCanBack];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"新建任务未保存，是否退出？" delegate:self cancelButtonTitle:nil otherButtonTitles:@"退出",@"去保存", nil];
    [alert show];
    NSLog(@"isCanSave:%d",isCanBack);
//    [self.navigationController popViewControllerAnimated:YES];
}
- (void)saveTaskItemClicked {
    [_m_currentT resignFirstResponder];
    NSLog(@"saveTaskItemClicked");
    NSLog(@"upload info:%@",_m_uploadInfo);
    BOOL isCanSave = [self checkIfCanSave];
    NSLog(@"isCanSave:%d",isCanSave);
}

#pragma mark -- TableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.m_sourceArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"TSDNewTaskViewController cellForRowAtIndexPath");
    TSDNewTaskTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"reuseCell"];
    if (!cell) {
        cell = [[TSDNewTaskTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseCell"];
    }
    NSDictionary *dic = self.m_sourceArray[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"user0"];
    BOOL isMust = [dic[@"isMust"] boolValue];
    if (isMust) {
        cell.m_textField.placeholder = [NSString stringWithFormat:@"%@ *",dic[@"name"]];
    } else {
        cell.m_textField.placeholder = dic[@"name"];
    }
    cell.m_textField.delegate = self;
    [cell.m_textField addTarget:self action:@selector(textFieldDidChanged:) forControlEvents:UIControlEventEditingChanged];
    cell.m_textField.tag = indexPath.row+1000;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"TSDNewTaskViewController heightForRowAtIndexPath");
    return 50;
}

#pragma mark -- TextField Delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    _m_currentT = textField;
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {

//    if (!_m_uploadInfo) {
//        _m_uploadInfo = [NSMutableDictionary dictionaryWithCapacity:_m_sourceArray.count];
//    }
//    [_m_uploadInfo setObject:textField.text forKey:_m_sourceArray[textField.tag-1000][@"name"]];
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if (!_m_uploadInfo) {
        _m_uploadInfo = [NSMutableDictionary dictionaryWithCapacity:_m_sourceArray.count];
    }
    NSString *value = [textField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *key = _m_sourceArray[textField.tag-1000][@"name"];
    if (![value isEqualToString:@""]) { //空字符串不存储
        value = [value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        [_m_uploadInfo setObject:value forKey:key];
    } else {//如果为空，检查此项之前是否存储过，如果存储过则删除
        NSArray *keyArr = [_m_uploadInfo allKeys];
        if ([keyArr containsObject:key]) {
            [_m_uploadInfo removeObjectForKey:key];
        }
    }
    if ([self checkIfCanSave]) {
        self.navigationItem.rightBarButtonItem.enabled = YES;
    } else {
        self.navigationItem.rightBarButtonItem.enabled = NO;
    }
    return YES;
}
#pragma mark -- Keyboard

- (void)addKeyboardNotification {
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)removeNotification {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)keyboardWillAppear:(NSNotification *)notification {
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat height = keyboardFrame.origin.y;
    CGFloat textField_maxY;
    textField_maxY = CGRectGetMaxY(_m_currentT.frame)*(_m_currentT.tag-1000+1)+64;
    CGFloat transformY = height - textField_maxY;
    if (transformY < 0) {
        CGRect frame = self.view.frame;
        frame.origin.y = transformY ;
        self.view.frame = frame;
    }
}

- (void)keyboardWillDisappear:(NSNotification *)notification {
    //恢复到默认y为0的状态，有时候要考虑导航栏要+64
    CGRect frame = self.view.frame;
    frame.origin.y = 0;
    self.view.frame = frame;
}

- (void)textFieldDidChanged:(UITextField *)textField {
    NSLog(@"textFieldDidChanged info:%@",_m_uploadInfo);
//    if ([self checkIfCanSave]) {
//        self.navigationItem.rightBarButtonItem.enabled = YES;
//    } else {
//        self.navigationItem.rightBarButtonItem.enabled = NO;
//    }
}

#pragma mark -- AlertView Delegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSLog(@"clickedButtonAtIndex :%d",buttonIndex);
    switch (buttonIndex) {
        case 0: //退出
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case 1: //去保存
            break;
        default:
            break;
    }
}


#pragma mark -- Tools
- (BOOL)checkIfCanSave {
    for (NSDictionary *dic in _m_sourceArray) {
        BOOL isMust = [dic[@"isMust"] boolValue];
        if (isMust) {
            NSString *value = _m_uploadInfo[dic[@"name"]];
            if (!value)
                return NO;
            if ([value isEqualToString:@""])
                return NO;
        }
    }
    return YES;
}

- (BOOL)checkIfCanBack {
    if (_m_uploadInfo) {
        return NO;
    }
    return YES;
}

@end
