//
//  WYLIntroductCell.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/9.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLIntroductCell.h"

#import "WYLIntroductModel.h"


@interface WYLIntroductCell()


@end

@implementation WYLIntroductCell

- (void)awakeFromNib {
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.backgroundBigView];
        
        [self.backgroundBigView addSubview:self.titleLable];
        [self.backgroundBigView addSubview:self.dateLabel];
        [self.backgroundBigView addSubview:self.stateView];
        
        [self.backgroundBigView addSubview:self.userHeadView];
        
        [self makeMansonry];
    }
    return self;
}

- (void)setModel:(WYLIntroductModel *)model {
    _model = model;
    
    self.titleLable.text = model.name;
    
    NSString * dateStr = [NSString stringWithFormat:@"%@/%@天/%@图",[WYLTool dateFormatHandleWith:model.start_date],model.days,model.photos_count];
    self.dateLabel.text = dateStr;
    NSString * headStrUrl = [model valueForKeyPath:@"user.image"];
    [self.userHeadView sd_setImageWithURL:[NSURL URLWithString:headStrUrl] placeholderImage:nil];
    [self.backgroundBigView sd_setImageWithURL:[NSURL URLWithString:model.front_cover_photo_url]
                              placeholderImage:[UIImage imageNamed:@"kong"]
                                       options:0
                                     completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                         if ([model.likes_count intValue] >= 100) {
                                             //best
                                             _stateView.hidden = NO;
                                             [self updataMansonry];
                                         }else {
                                             _stateView.hidden = YES;
                                             
//                                             [self updateOtherMansonry];
                                         }
                                     }];
    
}

- (void)updateOtherMansonry {
    [self.titleLable mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backgroundBigView).offset(kSpace);
        make.top.equalTo(self.backgroundBigView).offset(kSpace);
        
        make.right.equalTo(self.stateView.mas_left).offset(-kSpace);
        make.bottom.equalTo(self.dateLabel.mas_top).offset(-kDistanceToVertical);
    }];
    [self.stateView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLable);
        make.right.equalTo(self.backgroundBigView.mas_right).offset(-kZeroSpace);
        
        make.size.mas_equalTo(CGSizeZero);
    }];
}

- (void)updataMansonry {
    [self.titleLable mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.backgroundBigView).offset(kSpace);
        
        make.right.equalTo(self.stateView.mas_left).offset(-kSpace * 2);
        make.bottom.equalTo(self.dateLabel.mas_top).offset(-kDistanceToVertical);
    }];
    [self.stateView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLable);
        make.right.equalTo(self.backgroundBigView.mas_right).offset(-kSpace);
        
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
//    [self.dateLabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.titleLable.mas_bottom).offset(kDistanceToVertical);
//        make.left.right.equalTo(self.titleLable).offset(kZeroSpace);
//        make.height.mas_equalTo(kLabelHeight);
//    }];
}

- (void)makeMansonry {
    __weak typeof(UIView) * contentView = self.contentView;
    
    [self.backgroundBigView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(contentView).with.insets(UIEdgeInsetsMake(kDistanceToVertical, kDistanceToSide, kZeroSpace, kDistanceToSide));
    }];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(self.backgroundBigView).offset(kSpace);
        make.left.equalTo(self.backgroundBigView).offset(kSpace);
        make.bottom.equalTo(self.dateLabel.mas_top).offset(-kDistanceToVertical);
    }];
    
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLable.mas_bottom).offset(kDistanceToVertical);
        make.left.right.equalTo(self.titleLable).offset(kZeroSpace);
        make.height.mas_equalTo(kLabelHeight);
    }];
    
    [self.userHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backgroundBigView).offset(kDistanceToSide);
        make.bottom.equalTo(self.backgroundBigView).offset(-kDistanceToSide);
        make.size.mas_equalTo(CGSizeMake(kUserHeadImageWidth, kUserHeadImageWidth));
    }];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UILabel *)titleLable {
    if (!_titleLable) {
        _titleLable = [WYLFactory factoryLableWithFrame:CGRectZero color:[UIColor whiteColor] font:[UIFont fontWithName:@"Oriya Sangam MN" size:18]];
        
    }
    return _titleLable;
}

- (UILabel *)dateLabel {
    if (!_dateLabel) {
        _dateLabel = [WYLFactory factoryLableWithFrame:CGRectZero color:[UIColor whiteColor] font:[UIFont fontWithName:@"Oriya Sangam MN" size:11]];
    }
    return _dateLabel;
}

- (UIImageView *)stateView {
    if (!_stateView) {
        _stateView = [[UIImageView alloc] init];
        _stateView.image = [UIImage imageNamed:@"FlagBest"];
        _stateView.hidden = YES;
    }
    return _stateView;
}

- (UIImageView *)backgroundBigView {
    if (!_backgroundBigView) {
        _backgroundBigView = [[UIImageView alloc] init];
    }
    return _backgroundBigView;
}

- (UIImageView *)userHeadView {
    if (!_userHeadView) {
        _userHeadView = [[UIImageView alloc] init];
        _userHeadView.layer.cornerRadius = kUserHeadImageWidth / 2.0f;
        _userHeadView.clipsToBounds = YES;
    }
    return _userHeadView;
}

@end
