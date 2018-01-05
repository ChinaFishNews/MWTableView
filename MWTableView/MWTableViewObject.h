//
//  MWTableViewObject.h
//  MWTableViewDemo
//
//  Created by 石茗伟 on 2018/1/5.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWDataSource.h"

@protocol MWTableViewObjectDelegate

- (MWTableViewBaseCell *)makeCellForTableView:(UITableView *)tableView identifier:(NSString *)identifier;

@end

@interface MWTableViewObject : NSObject

@property (nonatomic, weak) id<MWTableViewObjectDelegate> delegate;

- (instancetype)initWithDataSource:(MWDataSource *)dataSource
                             frame:(CGRect)frame;
- (UITableView *)tableView;
- (void)reloadWithDataSource:(MWDataSource *)dataSource;

@end
