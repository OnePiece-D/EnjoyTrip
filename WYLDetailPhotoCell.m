//
//  WYLDetailPhotoCell.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/20.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLDetailPhotoCell.h"


@implementation WYLDetailPhotoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.photoView];
        
        [self makeMansory];
    }
    return self;
}

- (void)makeMansory {
    [_photoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.contentView).insets(UIEdgeInsetsMake(kSpace, kSpace, (btnHeight + kSpace * 2), kSpace));
    }];
}

- (void)updateMansoryWithSize:(CGSize)size {
    [_photoView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(kSpace);
        make.top.equalTo(self.contentView).offset(kSpace);
        make.right.equalTo(self.contentView).offset(kSpace);
        
        make.size.mas_equalTo(size);
    }];
}

- (void)setModel:(WYLDetailDaysNodesNotesModel *)model {
    [super setModel:model];
    
    [self updateMansoryWithSize:[WYLTool scaleImageOriginalSize:CGSizeMake([model.photo.image_width floatValue], [model.photo.image_height floatValue])]];
    [self.photoView sd_setImageWithURL:[NSURL URLWithString:model.photo.url] placeholderImage:[UIImage imageNamed:@"kong"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}

- (UIImageView *)photoView {
    if (!_photoView) {
        _photoView = [[UIImageView alloc] init];
    }
    return _photoView;
}

@end
