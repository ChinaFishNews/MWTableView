//
//  MWHeaderEntity.h
//  MWTableViewDemo
//
//  Created by 石茗伟 on 2018/1/5.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWTableViewBaseHeaderView.h"

@interface MWHeaderEntity : NSObject

/* 参数 */
@property (nonatomic, strong) id params;
/* header视图 */
@property (nonatomic, strong) MWTableViewBaseHeaderView *headerView;
/* header高度 */
@property (nonatomic, assign) CGFloat headerViewHeight;

- (void)configUI;

@end
