//
//  PJMineCell.m
//  ShanghaiHLJ
//
//  Created by Anne Pan on 14-8-4.
//  Copyright (c) 2014年 com.pa. All rights reserved.
//

#import "PJMineCell.h"

@interface PJMineCell ()
{
    UIImageView *_itemImg;
    UILabel *_itemText;
    UILabel *_itemNum;
    UIImageView *_detailImg;
}
@end

@implementation PJMineCell

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
