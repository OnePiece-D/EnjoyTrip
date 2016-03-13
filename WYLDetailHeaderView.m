//
//  WYLDetailHeaderView.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/13.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLDetailHeaderView.h"

#import "WYLTitleAndDescView.h"

@implementation WYLDetailHeaderView

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        
        [self addSubview:self.bigBackImage];
        [self.bigBackImage addSubview:self.descView];
        
        [self makeMansory];
    }
    return self;
}

- (void)makeMansory {
    __weak typeof(self) weakSelf = self;
    [self.bigBackImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(weakSelf).offset(kZeroSpace);
    }];
    [self.descView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.bigBackImage).offset(kSpace);
        
        make.height.mas_equalTo(kUserHeadImageWidth);
    }];
}


- (UIImageView *)bigBackImage {
    if (!_bigBackImage) {
        _bigBackImage = [[UIImageView alloc] init];
    }
    return _bigBackImage;
}

- (WYLTitleAndDescView *)descView {
    if (!_descView) {
        _descView = [[WYLTitleAndDescView alloc] initWithFrame:CGRectMake(kSpace, 0, SCREEN_Size.width - 2 * kSpace, kUserHeadImageWidth)];
    }
    return _descView;
}

@end
