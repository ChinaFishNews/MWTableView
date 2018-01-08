//
//  MWSectionEntity.h
//  MWTableViewDemo
//
//  Created by 石茗伟 on 2018/1/5.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWHeaderEntity.h"
#import "MWFooterEntity.h"
#import "MWTableViewCellEntity.h"

@interface MWSectionEntity : NSObject

/* tableView头视图标题 */
@property (nonatomic, copy) NSString *titleForHeader;
/* header */
@property (nonatomic, strong) MWHeaderEntity *header;
/* footer */
@property (nonatomic, strong) MWFooterEntity *footer;
/* cells */
@property (nonatomic, strong) NSArray<MWTableViewCellEntity *> *cells;

@end
