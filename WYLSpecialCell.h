//
//  WYLSpecialCell.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/10.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WYLSpecialModel;

@interface WYLSpecialCell : UITableViewCell


@property (nonatomic, strong) UILabel * titleLable;

@property (nonatomic, strong) UILabel * descLabel;

@property (nonatomic, strong) UIImageView * backgroundBigView;

@property (nonatomic, strong) WYLSpecialModel * model;

@end
