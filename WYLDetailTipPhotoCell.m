//
//  WYLDetailTipPhotoCell.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/20.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLDetailTipPhotoCell.h"

@implementation WYLDetailTipPhotoCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.photoView];
        [self.contentView addSubview:self.tipLabel];
        
        [self makeMansory];
    }
    return self;
}

- (void)makeMansory {
    [_photoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kSpace);
        make.top.equalTo(self.contentView).offset(kSpace);
        make.right.equalTo(self.contentView).offset(-kSpace);
        
        make.bottom.equalTo(self.tipLabel.mas_top).offset(-kSpace);
    }];
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kSpace);
        make.bottom.equalTo(self.contentView).offset(-(btnHeight + kSpace * 2));
        make.right.equalTo(self.contentView).offset(-kSpace);
        
        make.top.equalTo(self.photoView.mas_bottom).offset(kSpace);
    }];
}

- (void)updateMansorySize:(CGSize)size {
    [_photoView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kSpace);
        make.top.equalTo(self.contentView).offset(kSpace);
        make.right.equalTo(self.contentView).offset(-kSpace);
        
        make.size.mas_equalTo(size);
    }];
    [_tipLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kSpace);
        make.bottom.equalTo(self.contentView).offset(-(btnHeight + kSpace * 2));
        make.right.equalTo(self.contentView).offset(-kSpace);
        
        make.top.equalTo(self.photoView.mas_bottom).offset(kSpace);
    }];
}

- (void)setModel:(WYLDetailDaysNodesNotesModel *)model {
    [super setModel:model];
    
    self.tipLabel.text = model.desc;
    [self updateMansorySize:[WYLTool scaleImageOriginalSize:CGSizeMake([model.photo.image_width floatValue], [model.photo.image_height floatValue])]];
    [self.photoView sd_setImageWithURL:[NSURL URLWithString:model.photo.url] placeholderImage:[UIImage imageNamed:@"kong"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
    
}


- (UIImageView *)photoView {
    if (!_photoView) {
        _photoView = [[UIImageView alloc] init];
    }
    return _photoView;
}

- (UILabel *)tipLabel {
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] init];
        
        _tipLabel.numberOfLines = 0;
        _tipLabel.font = Font(14);
    }
    return _tipLabel;
}

@end
