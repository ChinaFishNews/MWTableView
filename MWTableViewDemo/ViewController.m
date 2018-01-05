//
//  ViewController.m
//  MWTableView
//
//  Created by 石茗伟 on 2018/1/5.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import "ViewController.h"
#import "MWTableViewMaker.h"
#import "FirstTableViewCell.h"
#import "SecondTableViewCell.h"
#import "TestHeaderView.h"

@interface ViewController () <MWTableViewDataSourceMaker, MWTableViewViewMaker>

@property (nonatomic, strong) MWTableViewMaker *maker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.maker = [[MWTableViewMaker alloc] init];
    self.maker.dataSourceMaker = self;
    self.maker.delegateMaker = self;
    [self.view addSubview:[self.maker generateTableViewWithFrame:self.view.bounds]];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.maker reloadData];
}

#pragma mark -
#pragma mark MWTableViewDataSourceMaker
- (MWDataSource *)mwTableViewMakeDataSourceForMe {
    MWDataSource *dataSource = [[MWDataSource alloc] init];
    MWSectionEntity *section = [[MWSectionEntity alloc] init];
    NSMutableArray *cellEntities = [NSMutableArray array];
    
    MWHeaderEntity *headerEntity = [[MWHeaderEntity alloc] init];
    headerEntity.headerView = [[TestHeaderView alloc] init];
    headerEntity.headerViewHeight = [TestHeaderView headerViewHeight];
    headerEntity.params = @{@"label":@"测试嗷嗷"};
    section.header = headerEntity;
    
    for (NSInteger i = 0; i < 100; i++) {
        MWTableViewCellEntity *firstCellEntity = [[MWTableViewCellEntity alloc] init];
        firstCellEntity.identifier = NSStringFromClass([FirstTableViewCell class]);
        firstCellEntity.cellHeight = [FirstTableViewCell cellHeight];
        firstCellEntity.params = @{@"imgUrl":@"http://a.hiphotos.baidu.com/image/pic/item/b8014a90f603738df1549ce2ba1bb051f919ecd0.jpg"};
        [cellEntities addObject:firstCellEntity];
    }
    
    for (NSInteger i = 0; i < 100; i++) {
        MWTableViewCellEntity *secondCellEntity = [[MWTableViewCellEntity alloc] init];
        secondCellEntity.identifier = NSStringFromClass([SecondTableViewCell class]);
        secondCellEntity.cellHeight = [SecondTableViewCell cellHeight];
        secondCellEntity.params = @{@"label":@"这是什么"};
        [cellEntities addObject:secondCellEntity];
    }
    
    section.cells = cellEntities;
    dataSource.sections = @[section];
    return dataSource;
}

#pragma mark -
#pragma mark MWTableViewViewMaker
- (MWTableViewBaseCell *)makeCellForMeWithTableView:(UITableView *)tabelView identifier:(NSString *)identifier {
    MWTableViewBaseCell *cell;
    if ([identifier isEqualToString:NSStringFromClass([FirstTableViewCell class])]) {
        cell = [[FirstTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    } else if ([identifier isEqualToString:NSStringFromClass([SecondTableViewCell class])]) {
        cell = [[SecondTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

@end
