//
//  WYLSpecialCell.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/10.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLSpecialCell.h"

#import "WYLSpecialModel.h"

@implementation WYLSpecialCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.backgroundBigView];
        [self.backgroundBigView addSubview:self.titleLable];
        [self.backgroundBigView addSubview:self.descLabel];
        
        
        [self makeMansory];
    }
    return self;
}

- (void)makeMansory {
    __weak typeof(UIView) * contentView = self.contentView;
    [self.backgroundBigView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(contentView).with.insets(UIEdgeInsetsMake(kDistanceToSide, kDistanceToVertical, kZeroSpace, kDistanceToSide));
    }];
    [self.descLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.backgroundBigView).offset(kDistanceToSide);
        make.bottom.equalTo(self.backgroundBigView).offset(-kDistanceToVertical);
        
        make.height.mas_equalTo(20);
    }];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backgroundBigView).offset(kDistanceToSide);
        make.right.equalTo(self.backgroundBigView).offset(-kDistanceToSide);
        make.bottom.equalTo(self.descLabel.mas_top).offset(kDistanceToVertical);
        
        make.height.mas_equalTo(50);
    }];
}


- (void)setModel:(WYLSpecialModel *)model {
    _model =model;
    
    [self.backgroundBigView sd_setImageWithURL:[NSURL URLWithString:model.image_url] placeholderImage:[UIImage imageNamed:@"kong"]];
    self.titleLable.text = model.name;
    self.descLabel.text = model.title;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UIImageView *)backgroundBigView {
    if (!_backgroundBigView) {
        _backgroundBigView = [[UIImageView alloc] init];
    }
    return _backgroundBigView;
}

- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [WYLFactory factoryLableWithFrame:CGRectZero color:[UIColor whiteColor] font:[UIFont fontWithName:@"Arial" size:20]];
    }
    return _titleLable;
}

- (UILabel *)descLabel {
    if (!_descLabel) {
        _descLabel = [WYLFactory factoryLableWithFrame:CGRectZero color:[UIColor whiteColor] font:[UIFont fontWithName:@"Arial" size:14]];
    }
    return _descLabel;
}

@end
