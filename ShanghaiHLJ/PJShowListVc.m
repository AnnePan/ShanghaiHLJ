//
//  PJShowListVc.m
//  ShanghaiHLJ
//
//  Created by Anne Pan on 14-8-1.
//  Copyright (c) 2014年 com.pa. All rights reserved.
//

#import "PJShowListVc.h"
#import "PJShowListCell.h"

@interface PJShowListVc ()<UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource>
{
    // 作品
    NSArray *_worksSourceArr;
    UICollectionView *_worksSourceCollection;
    
    // 艺人
    NSArray *_workerSourceArr;
    UITableView *_workerSourceTable;
    
    PJShowListType _currentType;
}

//@property (nonatomic, assign) PJShowListType currentType;

@end

@implementation PJShowListVc

- (id)initWithListType:(PJShowListType)type;
{
    if (self = [super init]) {
        _currentType = type;
        _worksSourceArr = @[@{},@{},@{},@{},@{},@{},@{},@{},@{},@{},@{},@{},@{},@{},@{},@{},@{}];
        _workerSourceArr = @[@{},@{},@{},@{},@{},@{},@{},@{},@{},@{},@{},@{},@{},@{},@{},@{},@{}];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    _worksSourceCollection = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:flowLayout];
    _worksSourceCollection.backgroundColor = [UIColor whiteColor];
    _worksSourceCollection.delegate = self;
    _worksSourceCollection.dataSource = self;
    [_worksSourceCollection registerClass:PJShowListCell.class forCellWithReuseIdentifier:NSStringFromClass(self.class)];
    _worksSourceCollection.hidden = YES;
    [self.view addSubview:_worksSourceCollection];
    
    _workerSourceTable = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _workerSourceTable.delegate = self;
    _workerSourceTable.dataSource = self;
    _workerSourceTable.tableFooterView = [UIView new];
    _workerSourceTable.hidden = YES;
    [self.view addSubview:_workerSourceTable];
    
    if (_currentType == PJShowListTypeWorks) {
        _worksSourceCollection.hidden = NO;
    } else {
        _workerSourceTable.hidden = NO;
    }
    
    UISegmentedControl *segmentedCon = [[UISegmentedControl alloc] initWithItems:@[@"看作品",@"看美甲师"]];
    segmentedCon.frame = CGRectMake(0, 60, self.view.width, 35);
    segmentedCon.backgroundColor = [UIColor colorWithWhite:1 alpha:0.8];
    segmentedCon.momentary = YES;
    [segmentedCon addTarget:self action:@selector(segmentAction:)forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentedCon];
    
}

#pragma mark - Action
-(void)segmentAction:(UISegmentedControl *)seg
{
    if (seg.selectedSegmentIndex == PJShowListTypeWorks) {
        _worksSourceCollection.hidden = NO;
        _workerSourceTable.hidden = YES;
    } else if(seg.selectedSegmentIndex == PJShowListTypeWorker) {
        _worksSourceCollection.hidden = YES;
        _workerSourceTable.hidden = NO;
    }
}

#pragma mark - UITableViewDelegate, UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _workerSourceArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(self.class)];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(self.class)];
    }
    cell.textLabel.text = @"小李子";
    return cell;
}

#pragma mark - UICollectionViewDelegate, UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _worksSourceArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PJShowListCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass(self.class) forIndexPath:indexPath];
//    cell.backgroundColor = [UIColor redColor];
    [cell setItem:_worksSourceArr[indexPath.row]];
    return cell;
}

//设置元素的的大小框
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets top = {10,10,80,10};
    return top;
}

//设置顶部的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    CGSize size={0,0};
    return size;
}

//设置元素大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (self.view.width - (10 * 3)) / 2 ;
    return CGSizeMake(width , width);
}

//点击元素触发事件
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"index == %@",indexPath);
}

@end
