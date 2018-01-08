//
//  MWTableViewMaker.m
//  MWTableViewDemo
//
//  Created by 石茗伟 on 2018/1/5.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import "MWTableViewMaker.h"
#import "MWTableViewObject.h"

@interface MWTableViewMaker () <MWTableViewObjectDelegate>

@property (nonatomic, strong) MWTableViewObject *tableViewObject;

@end

@implementation MWTableViewMaker

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (UITableView *)generateTableViewWithFrame:(CGRect)frame
                              contentInsets:(UIEdgeInsets)contentInsets {
    self.tableViewObject = [[MWTableViewObject alloc] initWithDataSource:[self.dataSourceMaker mwTableViewMakeDataSourceForMe]
                                                                                 frame:frame
                                                           contentInsets:contentInsets];
    self.tableViewObject.delegate = self;
    return self.tableViewObject.tableView;
}

- (void)reloadData {
    [self.tableViewObject reloadWithDataSource:[self.dataSourceMaker mwTableViewMakeDataSourceForMe]];
}

#pragma mark -
#pragma mark MWTableViewObjectDelegate
- (MWTableViewBaseCell *)makeCellForTableView:(UITableView *)tableView identifier:(NSString *)identifier {
    return [self.dataSourceMaker makeCellForMeWithTableView:tableView identifier:identifier];
}

- (void)mwTableViewForTableViewDidSelectIndexPath:(NSIndexPath *)indexPath entity:(MWTableViewCellEntity *)entity {
    [self.delegateMaker mwTableViewForMeDidSelectIndexPath:indexPath entity:entity];
}

//返回tableView方法
//传递dataSource方法
//根据dataSource构造tableView，将cell实现通过协议代理出去

@end
