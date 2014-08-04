//
//  PJShowListWorkerCell.m
//  ShanghaiHLJ
//
//  Created by Anne Pan on 14-8-4.
//  Copyright (c) 2014年 com.pa. All rights reserved.
//

#import "PJShowListWorkerCell.h"

@interface PJShowListWorkerCell()
{
    UIImageView *_userImgV;//用户头像
    UILabel *_userNameLab;//用户名
    UILabel *_juliLab;//距离
    UILabel *_moneyLab;//价格
    UILabel *_countLab;//共接单数
}

@end

@implementation PJShowListWorkerCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
