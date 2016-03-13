//
//  WYLTitleAndDescView.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/13.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYLTitleAndDescView : UIView

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, strong) UILabel * descLabel;


- (void)setTitle:(NSString *)title desc:(NSString *)desc;

@end
