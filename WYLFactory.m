//
//  WYLFactory.m
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/10.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLFactory.h"

@implementation WYLFactory

+ (UILabel *)factoryLableWithFrame:(CGRect)frame color:(UIColor *)color font:(UIFont *)font {
    UILabel * label = [[UILabel alloc] initWithFrame:frame];
    
    label.textColor = color;
    label.font = font;
    
    label.numberOfLines = 0;
    
    return label;
}

@end
