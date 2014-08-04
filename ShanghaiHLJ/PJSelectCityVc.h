//
//  PJSelectCityVc.h
//  ShanghaiHLJ
//
//  Created by Anne Pan on 14-8-1.
//  Copyright (c) 2014年 com.pa. All rights reserved.
//

#import "PJBaseViewController.h"

typedef void (^selectedCityBlock)(NSString *selectedCity);

@interface PJSelectCityVc : PJBaseViewController

@property (nonatomic, copy) selectedCityBlock selectedBlock;

@end
