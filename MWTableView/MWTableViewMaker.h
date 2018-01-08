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

- (MWDataSource *)mwTableViewMakeDataSourceForMe;
- (MWTableViewBaseCell *)makeCellForTableView:(UITableView *)tableView identifier:(NSString *)identifier;

@end

@protocol MWTableViewMakerDelegate

- (void)mwTableViewForTableViewDidSelectIndexPath:(NSIndexPath *)indexPath entity:(MWTableViewCellEntity *)entity;

@end

@interface MWTableViewMaker : NSObject

@property (nonatomic, weak) id<MWTableViewMakerDataSource> dataSource;
@property (nonatomic, weak) id<MWTableViewMakerDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame
                contentInsets:(UIEdgeInsets)contentInsets;
- (UITableView *)tableView;
- (void)reloadData;

@end
