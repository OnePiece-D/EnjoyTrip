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

+ (id)factoryDetailCellTableView:(UITableView *)tableView reusename:(NSString *)reusename model:(id)model selected:(NSInteger)selected {
    WYLDetailCell * cell = cell = [tableView dequeueReusableCellWithIdentifier:reusename];
    switch (selected) {
        case 0: {
            //tip
            if (!cell) {
                cell = [[WYLDetailTipCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusename];
            }
            
            break;
        }
        case 1: {
            //photo
            if (!cell) {
                cell = [[WYLDetailPhotoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusename];
            }
            
            break;
        }
        case 2: {
            if (!cell) {
                cell = [[WYLDetailTipPhotoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reusename];
            }
            
            break;
        }
            
        default:
            break;
    }
    cell.model = model;
    return cell;
}

@end
