//
//  WYLIntroductCell.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/9.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WYLIntroductModel;

@interface WYLIntroductCell : UITableViewCell

@property (nonatomic, strong) UILabel * titleLable;

@property (nonatomic, strong) UILabel * dateLabel;

@property (nonatomic, strong) UIImageView * stateView;

@property (nonatomic, strong) UIImageView * backgroundBigView;

@property (nonatomic, strong) UIImageView * userHeadView;

@property (nonatomic, strong) WYLIntroductModel * model;

@end
