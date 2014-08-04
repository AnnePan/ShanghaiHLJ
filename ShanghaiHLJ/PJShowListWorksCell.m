//
//  PJShowListCell.m
//  ShanghaiHLJ
//
//  Created by Anne Pan on 14-8-2.
//  Copyright (c) 2014年 com.pa. All rights reserved.
//

#import "PJShowListWorksCell.h"

@interface PJShowListWorksCell ()
{
    UIImageView *_worksImgV;
    UIView *_worksView;
    UILabel *_worksName;
    UILabel *_worksPrice;
}
@end

@implementation PJShowListWorksCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _worksImgV = [[UIImageView alloc] initWithFrame:self.bounds];
        _worksImgV.layer.masksToBounds = YES;
        _worksImgV.layer.cornerRadius = 10;
        [self addSubview:_worksImgV];
        
        _worksView = [[UIView alloc] initWithFrame:self.bounds];
        _worksView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        _worksView.height = 26;
        [self addSubview:_worksView];
        
        _worksName = [[UILabel alloc] initWithFrame:CGRectZero];
        _worksName.backgroundColor = [UIColor clearColor];
        _worksName.textColor = [UIColor whiteColor];
        _worksName.font = [UIFont systemFontOfSize:13];
        [_worksView addSubview:_worksName];
        
        _worksPrice = [[UILabel alloc] initWithFrame:CGRectZero];
        _worksPrice.backgroundColor = [UIColor clearColor];
        _worksPrice.textColor = [UIColor whiteColor];
        _worksPrice.font = [UIFont systemFontOfSize:13];
        [_worksView addSubview:_worksPrice];
    }
    return self;
}

- (void)setItem:(NSDictionary *)item
{
    _worksImgV.image = [UIImage imageNamed:@"default.jpg"];
    _worksName.text = @"美甲美甲美甲";
    _worksPrice.text = [NSString stringWithFormat:@"¥%0.2f",288.00];
    
    [_worksName sizeToFit];
    [_worksPrice sizeToFit];
    _worksView.bottom = _worksImgV.bottom;
    _worksName.centerY = _worksPrice.centerY = _worksView.height / 2;
    _worksName.left = _worksView.left;
    _worksPrice.right = _worksView.right;
}

@end
