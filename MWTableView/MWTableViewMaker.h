//
//  MWTableViewMaker.h
//  MWTableViewDemo
//
//  Created by 石茗伟 on 2018/1/5.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWDataSource.h"

@protocol MWTableViewMakerDataSource

/* 生成数据源 */
- (MWDataSource *)mwTableViewMakeDataSourceForMe;
/* 生成cell，identifier默认传cell所属类的字符串 */
- (MWTableViewBaseCell *)makeCellForTableView:(UITableView *)tableView identifier:(NSString *)identifier;

@end

@protocol MWTableViewMakerDelegate

/* 选中某一条cell，回传indexPath和cellEntity */
- (void)mwTableViewDidSelectIndexPath:(NSIndexPath *)indexPath entity:(MWTableViewCellEntity *)entity;

@end

@interface MWTableViewMaker : NSObject

@property (nonatomic, weak) id<MWTableViewMakerDataSource> dataSource;
@property (nonatomic, weak) id<MWTableViewMakerDelegate> delegate;

/* 初始化传参 */
- (instancetype)initWithFrame:(CGRect)frame
                contentInsets:(UIEdgeInsets)contentInsets;
/* 获取tableView */
- (UITableView *)tableView;
/* 刷新数据 */
- (void)reloadData;

@end
