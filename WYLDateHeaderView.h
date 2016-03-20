//
//  WYLDateHeaderView.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/20.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYLDateHeaderView : UIView

@property (nonatomic, strong) UILabel * dayCount;

@property (nonatomic, strong) UILabel * detailDay;

+ (instancetype)dateHeaderViewWithHeight:(CGFloat)height;

- (void)setDayCOunt:(NSNumber *)count detail:(NSString *)detail;

@end
