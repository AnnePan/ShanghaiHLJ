//
//  PJMineVc.m
//  ShanghaiHLJ
//
//  Created by Anne Pan on 14-8-1.
//  Copyright (c) 2014年 com.pa. All rights reserved.
//

#import "PJMineVc.h"

@interface PJMineVc ()<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_sourceArr;
    UITableView *_sourceTable;
}

@end

@implementation PJMineVc

- (id)init
{
    if (self = [super init]) {
        _sourceArr = @[@{},@{},@{},@{}];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _sourceTable = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _sourceTable.delegate = self;
    _sourceTable.dataSource = self;
    _sourceTable.tableFooterView = [UIView new];
    _sourceTable.bounces = NO;
    [self.view addSubview:_sourceTable];
    
    UIView *headerV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 120)];
    headerV.backgroundColor = [UIColor redColor];
    _sourceTable.tableHeaderView = headerV;
    
    UIButton *userImgBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
    userImgBtn.backgroundColor = [UIColor yellowColor];
    userImgBtn.layer.masksToBounds = YES;
    userImgBtn.layer.cornerRadius = userImgBtn.width / 2;
    [headerV addSubview:userImgBtn];
    
    UILabel *userNameLab = [[UILabel alloc] initWithFrame:CGRectZero];
    userNameLab.textColor = [UIColor yellowColor];
    userNameLab.backgroundColor = [UIColor clearColor];
    userNameLab.font = [UIFont systemFontOfSize:20];
    userNameLab.text = @"未填写昵称";
    [userNameLab sizeToFit];
    [headerV addSubview:userNameLab];
    
    //位置
    userNameLab.centerX = userImgBtn.centerX = headerV.centerX;
    userNameLab.bottom = headerV.bottom - 10;
    userImgBtn.top = headerV.top + 15;
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _sourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class)];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(self.class)];
    }
    cell.textLabel.text = @"1234";
    return cell;
}

@end
