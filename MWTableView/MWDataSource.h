//
//  MWDataSource.h
//  MWTableViewDemo
//
//  Created by 石茗伟 on 2018/1/5.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MWSectionEntity.h"

@interface MWDataSource : NSObject

/* 索引栏标题数组 */
@property (nonatomic, strong) NSArray *indexTitles;
/* MWSectionEntity对象数组 */
@property (nonatomic, strong) NSArray<MWSectionEntity *> *sections;

@end
