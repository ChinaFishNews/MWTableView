//
//  TestHeaderView.m
//  MWTableViewDemo
//
//  Created by 石茗伟 on 2018/1/5.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import "TestHeaderView.h"

@interface TestHeaderView ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation TestHeaderView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (void)configUIWithParams:(id)params {
    [super configUIWithParams:params];
    self.titleLabel.text = params[@"label"];
}

+ (CGFloat)headerViewHeight {
    return 30.f;
}

#pragma mark -
#pragma mark Lazy Load
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.f, 5.f, 100.f, 22.f)];
    }
    return _titleLabel;
}

@end
