//
//  WYLDetailTipCell.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/20.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLDetailTipCell.h"

@implementation WYLDetailTipCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.tipLabel];
        
        [self makeMansory];
    }
    return self;
}

- (void)makeMansory {
    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.right.equalTo(self.contentView).insets(UIEdgeInsetsMake(kSpace, kSpace, (btnHeight + kSpace * 2), -kSpace));
    }];
}


- (void)setModel:(WYLDetailDaysNodesNotesModel *)model {
    [super setModel:model];
    
    self.tipLabel.text = model.desc;
    
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
