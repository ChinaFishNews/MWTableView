//
//  MWTableViewBaseCell.h
//  MWTableViewDemo
//
//  Created by 石茗伟 on 2018/1/5.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MWTableViewBaseCell : UITableViewCell

+ (CGFloat)cellHeight;
- (void)configUIWithParams:(id)params;

@end
