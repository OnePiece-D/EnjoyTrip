//
//  WYLTitleAndDescView.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/13.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLTitleAndDescView.h"

@implementation WYLTitleAndDescView

- (instancetype)init {
    if ([super init]) {
        [self makeMansory];
    }
    return self;
}


- (void)setTitle:(NSString *)title desc:(NSString *)desc {
    self.titleLabel.text = title;
    self.descLabel.text = desc;
}

- (void)makeMansory {
    __weak typeof(self) weakSelf = self;
    [self.userHeaderImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(weakSelf).offset(kSpace);
        
        make.right.equalTo(self.titleLabel.mas_left).offset(kSpace);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userHeaderImage.mas_right).offset(-kSpace);
        make.top.right.equalTo(weakSelf).offset(kZeroSpace);
        make.bottom.equalTo(self.descLabel.mas_top).offset(kSpace);
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.titleLabel).offset(kZeroSpace);
        
        make.top.equalTo(self.titleLabel.mas_bottom).offset(-kSpace);
        make.height.mas_equalTo(kLabelHeight);
    }];
}

- (UIImageView *)userHeaderImage {
    if (!_userHeaderImage) {
        _userHeaderImage = [[UIImageView alloc] init];
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
