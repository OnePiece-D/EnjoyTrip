//
//  WYLDateHeaderView.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/20.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLDateHeaderView.h"

@implementation WYLDateHeaderView

+ (instancetype)dateHeaderViewWithHeight:(CGFloat)height {
    return [[self alloc] initWithFrame:CGRectMake(0, 0, SCREEN_Size.width, height)];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.dayCount];
        [self addSubview:self.detailDay];
        
        [self makeMansory];
    }
    return self;
}

- (void)makeMansory {
    __weak typeof(self) weakSelf = self;
    
    [_dayCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(80);
        make.top.equalTo(weakSelf).offset(kSpace);
        make.bottom.equalTo(weakSelf).offset(-kSpace);
        
        make.right.equalTo(self.detailDay.mas_left).offset(-kZeroSpace);
    }];
    [_detailDay mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.dayCount.mas_right).offset(kZeroSpace);
        
        make.top.equalTo(weakSelf).offset(kSpace);
        make.right.equalTo(weakSelf).offset(-80);
        make.bottom.equalTo(weakSelf).offset(-kSpace);
    }];
}

- (void)setDayCOunt:(NSNumber *)count detail:(NSString *)detail {
    self.dayCount.text = [NSString stringWithFormat:@"DAY%@",count];
    self.detailDay.text = [NSString stringWithFormat:@"%@ 周一",detail];
}

- (UILabel *)dayCount {
    if (!_dayCount) {
        _dayCount = [[UILabel alloc] init];
        
        _dayCount.font = Font(14);
        _dayCount.textColor = [UIColor blackColor];
    }
    return _dayCount;
}

- (UILabel *)detailDay {
    if (!_detailDay) {
        _detailDay = [[UILabel alloc] init];
        
        _detailDay.textAlignment = NSTextAlignmentLeft;
        _detailDay.font = Font(12);
        _detailDay.textColor = [UIColor colorWithWhite:0.581 alpha:1.000];
    }
    return _detailDay;
}

@end
