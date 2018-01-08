//
//  MWTableViewMaker.m
//  MWTableViewDemo
//
//  Created by 石茗伟 on 2018/1/5.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import "MWTableViewMaker.h"

@interface MWTableViewMaker () <UITableViewDelegate, UITableViewDataSource>
{
    MWDataSource *_dataSourceEntity;
    CGRect _frame;
    UIEdgeInsets _contentInsets;
}
@property (nonatomic, strong) UITableView *mwTableView;

@end

@implementation MWTableViewMaker

- (instancetype)initWithFrame:(CGRect)frame
                contentInsets:(UIEdgeInsets)contentInsets {
    self = [super init];
    if (self) {
        _frame = frame;
        _contentInsets = contentInsets;
    }
    return self;
}

- (UITableView *)tableView {
    return self.mwTableView;
}

- (void)reloadData {
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.dataSource mwTableViewMakeDataSourceForMe].sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataSource mwTableViewMakeDataSourceForMe].sections[section].cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MWTableViewCellEntity *cellEntity = [self.dataSource mwTableViewMakeDataSourceForMe].sections[indexPath.section].cells[indexPath.row];
    MWTableViewBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellEntity.identifier];
    if (!cell) {
        cell = [self.dataSource makeCellForTableView:tableView identifier:cellEntity.identifier];
    }
    [cell configUIWithParams:cellEntity.params];
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    MWHeaderEntity *headerEntity = [self.dataSource mwTableViewMakeDataSourceForMe].sections[section].header;
    [headerEntity configUI];
    return headerEntity.headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    MWFooterEntity *footerEntity = [self.dataSource mwTableViewMakeDataSourceForMe].sections[section].footer;
    [footerEntity configUI];
    return footerEntity.footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self.dataSource mwTableViewMakeDataSourceForMe].sections[indexPath.section].cells[indexPath.row].cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [self.dataSource mwTableViewMakeDataSourceForMe].sections[section].header.headerViewHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [self.dataSource mwTableViewMakeDataSourceForMe].sections[section].footer.footerViewHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate mwTableViewDidSelectIndexPath:indexPath entity:[self.dataSource mwTableViewMakeDataSourceForMe].sections[indexPath.section].cells[indexPath.row]];
}

#pragma mark -
#pragma mark tableView索引相关设置
//添加TableView头视图标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.dataSource mwTableViewMakeDataSourceForMe].sections[section].titleForHeader;
}

//添加索引栏标题数组
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return  [self.dataSource mwTableViewMakeDataSourceForMe].indexTitles;
}

//点击索引栏标题时执行
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];
}

#pragma mark -
#pragma mark Lazy Load
- (UITableView *)mwTableView {
    if (!_mwTableView) {
        self.mwTableView = [[UITableView alloc] initWithFrame:_frame];
        _mwTableView.delegate = self;
        _mwTableView.dataSource = self;
        _mwTableView.contentInset = _contentInsets;
    }
    return _mwTableView;
}

@end
