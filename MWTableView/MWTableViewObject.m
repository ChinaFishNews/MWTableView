//
//  MWTableViewObject.m
//  MWTableViewDemo
//
//  Created by 石茗伟 on 2018/1/5.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import "MWTableViewObject.h"

@interface MWTableViewObject () <UITableViewDelegate, UITableViewDataSource>
{
    MWDataSource *_dataSource;
    CGRect _frame;
    UIEdgeInsets _contentInsets;
}
@property (nonatomic, strong) UITableView *mwTableView;

@end

@implementation MWTableViewObject

- (instancetype)initWithDataSource:(MWDataSource *)dataSource
                             frame:(CGRect)frame
                     contentInsets:(UIEdgeInsets)contentInsets {
    self = [super init];
    if (self) {
        _dataSource = dataSource;
        _frame = frame;
        _contentInsets = contentInsets;
    }
    return self;
}

- (UITableView *)tableView {
    return self.mwTableView;
}

- (void)reloadWithDataSource:(MWDataSource *)dataSource {
    _dataSource = dataSource;
    [self.mwTableView reloadData];
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataSource.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.sections[section].cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MWTableViewCellEntity *cellEntity = _dataSource.sections[indexPath.section].cells[indexPath.row];
    MWTableViewBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:cellEntity.identifier];
    if (!cell) {
        cell = [self.delegate makeCellForTableView:tableView identifier:cellEntity.identifier];
    }
    [cell configUIWithParams:cellEntity.params];
    return cell;
}

#pragma mark -
#pragma mark UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    MWHeaderEntity *headerEntity = _dataSource.sections[section].header;
    [headerEntity configUI];
    return headerEntity.headerView;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    MWFooterEntity *footerEntity = _dataSource.sections[section].footer;
    [footerEntity configUI];
    return footerEntity.footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return _dataSource.sections[indexPath.section].cells[indexPath.row].cellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return _dataSource.sections[section].header.headerViewHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return _dataSource.sections[section].footer.footerViewHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate mwTableViewForTableViewDidSelectIndexPath:indexPath entity:_dataSource.sections[indexPath.section].cells[indexPath.row]];
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
