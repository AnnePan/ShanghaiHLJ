//
//  PJShowListVc.h
//  ShanghaiHLJ
//
//  Created by Anne Pan on 14-8-1.
//  Copyright (c) 2014年 com.pa. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PJShowListType) {
    PJShowListTypeWorks,
    PJShowListTypeWorker,
    
    PJShowListTypeMax
};

@interface PJShowListVc : PJBaseViewController

- (id)initWithListType:(PJShowListType)type;

@end
