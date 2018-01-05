//
//  SecondTableViewCell.m
//  MWTableViewDemo
//
//  Created by 石茗伟 on 2018/1/5.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import "SecondTableViewCell.h"

@implementation SecondTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)configUIWithParams:(id)params {
    [super configUIWithParams:params];
    self.textLabel.text = params[@"label"];
}

+ (CGFloat)cellHeight {
    return 44.f;
}

@end
