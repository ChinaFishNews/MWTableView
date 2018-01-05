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

@property (nonatomic, strong) MWHeaderEntity *header;
@property (nonatomic, strong) MWFooterEntity *footer;
@property (nonatomic, strong) NSArray<MWTableViewCellEntity *> *cells;

@end
