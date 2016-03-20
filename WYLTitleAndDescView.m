//
//  WYLTitleAndDescView.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/13.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLTitleAndDescView.h"

@implementation WYLTitleAndDescView

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        [self addSubview:self.titleLabel];
        [self addSubview:self.descLabel];
        [self addSubview:self.userHeaderImage];
        [self makeMansory];
//        self.mas_height
//        [[NSNotificationCenter defaultCenter] addObserver:self forKeyPath:@"mas_height" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

//- (void)addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context {
//    if ([keyPath isEqualToString:@"frame"]) {
//        [self makeMansory];
//    }
//}

- (void)setTitle:(NSString *)title desc:(NSString *)desc {
    self.titleLabel.text = title;
    self.descLabel.text = desc;
}

- (void)setTitle:(NSString *)title desc:(NSString *)desc userHeaderImage:(NSString *)image {
    [self setTitle:title desc:desc];
    
    [self.userHeaderImage sd_setImageWithURL:[NSURL URLWithString:image] placeholderImage:[UIImage imageNamed:@"kong"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}

- (void)makeMansory {
    __weak typeof(self) weakSelf = self;
    [self.userHeaderImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(kSpace);
        make.top.equalTo(weakSelf).offset(kZeroSpace);
        
        make.size.mas_equalTo(CGSizeMake(kUserHeadImageWidth, kUserHeadImageWidth));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userHeaderImage.mas_right).offset(kSpace);
        make.top.right.equalTo(weakSelf).offset(kSpace);
        make.right.equalTo(weakSelf).offset(-kSpace);
        
        make.bottom.equalTo(self.descLabel.mas_top).offset(-kSpace);
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel).offset(kZeroSpace);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(kSpace);
        make.right.equalTo(self.titleLabel.mas_right).offset(kZeroSpace);
        
        make.bottom.equalTo(weakSelf).offset(-kSpace);
    }];
}

- (UIImageView *)userHeaderImage {
    if (!_userHeaderImage) {
        _userHeaderImage = [[UIImageView alloc] init];
        _userHeaderImage.clipsToBounds = YES;
        
        _userHeaderImage.layer.cornerRadius = kUserHeadImageWidth / 2.f;
    }
    return _userHeaderImage;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [WYLFactory factoryLableWithFrame:CGRectZero color:[UIColor whiteColor] font:[UIFont fontWithName:@"Oriya Sangam MN" size:14]];
    }
    return _titleLabel;
}

- (UILabel *)descLabel {
    if (!_descLabel) {
        _descLabel = [WYLFactory factoryLableWithFrame:CGRectZero color:[UIColor whiteColor] font:[UIFont fontWithName:@"Oriya Sangam MN" size:11]];
    }
    return _descLabel;
}

@end
