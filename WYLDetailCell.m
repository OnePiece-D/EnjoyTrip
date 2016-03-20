//
//  WYLDetailCell.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/20.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLDetailCell.h"


@implementation WYLDetailCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor colorWithWhite:0.997 alpha:1.000];
        
        [self.contentView addSubview:self.locatBtn];
        [self.contentView addSubview:self.likeBtn];
        [self.contentView addSubview:self.discussBtn];
        
        [self makeMansory];
    }
    return self;
}

- (void)makeMansory {
    [_discussBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(kSpace);
        make.bottom.equalTo(self.contentView).offset(kSpace);
        
        make.size.mas_equalTo(CGSizeMake(btnHeight, btnHeight));
    }];
    [_likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView).offset(kSpace);
        make.right.equalTo(self.discussBtn.mas_left).offset(-kSpace);
        make.size.equalTo(self.discussBtn);
    }];
}

- (void)setLocationBtnString:(NSString *)string {
    if (string && string.length) {
        CGSize size = [string boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, btnHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontNum]} context:nil].size;
        NSLog(@"locationButtonSize:%@",NSStringFromCGSize(size));
        [self.locatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(kSpace);
            make.bottom.equalTo(self.contentView).offset(-kSpace);
            
            make.size.mas_equalTo(size);
        }];
    }
}

#pragma mark -lazing-
- (UIButton *)locatBtn {
    if (!_locatBtn) {
        _locatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _locatBtn.hidden = YES;
    }
    return _locatBtn;
}

- (UIButton *)likeBtn {
    if (!_likeBtn) {
        _likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _likeBtn;
}

- (UIButton *)discussBtn {
    if (!_discussBtn) {
        _discussBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _discussBtn;
}

@end
