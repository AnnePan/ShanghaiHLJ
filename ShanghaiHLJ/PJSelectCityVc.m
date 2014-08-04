//
//  PJSelectCityVc.m
//  ShanghaiHLJ
//
//  Created by Anne Pan on 14-8-1.
//  Copyright (c) 2014年 com.pa. All rights reserved.
//

#import "PJSelectCityVc.h"

@interface PJSelectCityVc () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_sourceArr;
    UITableView *_sourceTable;
}

@end

@implementation PJSelectCityVc

- (id)init
{
    if (self = [super init]) {
        _sourceArr = @[@{@"header":@"已开通服务城市",
                         @"cities":@[@{@"name":@"北京",@"alert":@"北京地区：\n\t静安区\n\t徐汇区"},@{@"name":@"上海",@"alert":@"北京地区：\n\t静安区\n\t徐汇区"},@{@"name":@"其它",@"alert":@"目前河狸家App只支持北京、上海部分地区服务。"}]}];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _sourceTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height) style:UITableViewStyleGrouped];
    _sourceTable.delegate = self;
    _sourceTable.dataSource = self;
    _sourceTable.tableFooterView = [UIView new];
    [self.view addSubview:_sourceTable];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _sourceArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = _sourceArr[section][@"cities"];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arr = _sourceArr[indexPath.section][@"cities"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class)];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(self.class)];
    }
    cell.textLabel.text = arr[indexPath.row][@"name"];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _sourceArr[section][@"header"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *arr = _sourceArr[indexPath.section][@"cities"];
    [UIAlertView alertViewWithTitle:@"提示" message:arr[indexPath.row][@"alert"] cancelButtonTitle:@"确定" otherButtonTitles:nil onDismiss:^(int buttonIndex){
    } onCancel:^{
        if (_selectedBlock) {
            _selectedBlock(arr[indexPath.row][@"name"]);
        }
        [self.navigationController popViewControllerAnimated:YES];
    }];
}

@end
