//
//  PJFirstPageVc.m
//  ShanghaiHLJ
//
//  Created by Anne Pan on 14-8-1.
//  Copyright (c) 2014年 com.pa. All rights reserved.
//

#import "PJFirstPageVc.h"
#import "PJSelectCityVc.h"
#import "PJShowListVc.h"

@interface PJFirstPageVc ()<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *_sourceArr;
    UITableView *_sourceTable;
    UIBarButtonItem *_itemBtn;
}

@end

@implementation PJFirstPageVc

- (id)init
{
    if (self = [super init]) {
        _sourceArr = @[@{@"title":@"预约美甲",@"class":@"PJAppointmentVc"},
                       @{@"title":@"美甲作品精选",@"class":@"PJShowListVc",@"listType":@(PJShowListTypeWorks)},
                       @{@"title":@"现在美甲",@"class":@"PJAppointmentVc"},
                       @{@"title":@"空气进化",@"class":@"PJAppointmentVc"},
                       @{@"title":@"选美甲师",@"class":@"PJShowListVc",@"listType":@(PJShowListTypeWorker)}];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _itemBtn = [[UIBarButtonItem alloc] initWithTitle:@"上海" style:UIBarButtonItemStyleDone target:self action:@selector(selectCity:)];
    self.navigationItem.rightBarButtonItem = _itemBtn;
    
    _sourceTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    _sourceTable.delegate = self;
    _sourceTable.dataSource = self;
    _sourceTable.tableFooterView = [UIView new];
    [self.view addSubview:_sourceTable];
}

#pragma mark - Action
- (void)selectCity:(UIButton *)btn
{
    PJSelectCityVc *nextVc = [[PJSelectCityVc alloc] init];
    nextVc.vcTitle = @"选择城市";
    [nextVc setSelectedBlock:^(NSString *selectedCity)
    {
        [self selectedCity:selectedCity];
    }];
    [self.navigationController pushViewController:nextVc animated:YES];
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
    cell.textLabel.text = _sourceArr[indexPath.row][@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *classDic = _sourceArr[indexPath.row];
    if ([classDic[@"class"] isEqualToString:@"PJShowListVc"]) {
        PJShowListVc *nextVc = [[PJShowListVc alloc] initWithListType:[classDic[@"listType"] intValue]];
        [self.navigationController pushViewController:nextVc animated:YES];
    } else {
        PJBaseViewController *nextVc = [[NSClassFromString(classDic[@"class"]) alloc] init];
        nextVc.vcTitle = classDic[@"title"];
        [self.navigationController pushViewController:nextVc animated:YES];
    }
}

#pragma mark - Block
- (void)selectedCity:(NSString *)city
{
    [_itemBtn setTitle:city];
}

@end
