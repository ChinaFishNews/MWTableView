//
//  MWTableViewMaker.h
//  MWTableViewDemo
//
//  Created by 石茗伟 on 2018/1/5.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWDataSource.h"

@protocol MWTableViewDataSourceMaker

- (MWDataSource *)mwTableViewMakeDataSourceForMe;

@end

@protocol MWTableViewViewMaker

- (MWTableViewBaseCell *)makeCellForMeWithTableView:(UITableView *)tabelView identifier:(NSString *)identifier;

@end

@interface MWTableViewMaker : NSObject

@property (nonatomic, weak) id<MWTableViewViewMaker> delegateMaker;
@property (nonatomic, weak) id<MWTableViewDataSourceMaker> dataSourceMaker;
- (UITableView *)generateTableViewWithFrame:(CGRect)frame;
- (void)reloadData;

@end
