//
//  MWFooterEntity.h
//  MWTableViewDemo
//
//  Created by 石茗伟 on 2018/1/5.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWTableViewBaseFooterView.h"

@interface MWFooterEntity : NSObject

/* 参数 */
@property (nonatomic, strong) id params;
/* footer视图 */
@property (nonatomic, strong) MWTableViewBaseFooterView *footerView;
/* footer高度 */
@property (nonatomic, assign) CGFloat footerViewHeight;

- (void)configUI;

@end
