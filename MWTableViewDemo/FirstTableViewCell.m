//
//  FirstTableViewCell.m
//  MWTableViewDemo
//
//  Created by 石茗伟 on 2018/1/5.
//  Copyright © 2018年 驴妈妈. All rights reserved.
//

#import "FirstTableViewCell.h"

@interface FirstTableViewCell ()

@property (nonatomic, strong) UIImageView *picImageView;

@end

@implementation FirstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.picImageView];
    }
    return self;
}

- (void)configUIWithParams:(id)params {
    [super configUIWithParams:params];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        self.picImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:params[@"imgUrl"]]]];
    });
}

+ (CGFloat)cellHeight {
    return 100.f;
}

#pragma mark -
#pragma mark Lazy Load
- (UIImageView *)picImageView {
    if (!_picImageView) {
        self.picImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10.f, 10.f, 300.f, 80.f)];
    }
    return _picImageView;
}

@end
