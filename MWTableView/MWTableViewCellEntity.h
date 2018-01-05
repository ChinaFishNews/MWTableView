//
//  MWTableViewCellEntity.h
//  MWTableViewDemo
//
//  Created by 石茗伟 on 2018/1/5.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MWTableViewBaseCell.h"

@interface MWTableViewCellEntity : NSObject

@property (nonatomic, strong) id params;
@property (nonatomic, copy) NSString *identifier;
@property (nonatomic, assign) CGFloat cellHeight;

@end
