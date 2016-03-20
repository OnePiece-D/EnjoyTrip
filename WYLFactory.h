//
//  WYLFactory.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/10.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WYLDetailTipCell.h"
#import "WYLDetailPhotoCell.h"
#import "WYLDetailTipPhotoCell.h"

@import UIKit;

@interface WYLFactory : NSObject

+ (UILabel *)factoryLableWithFrame:(CGRect)frame
                           color:(UIColor *)color
                            font:(UIFont *)font;


+ (id)factoryDetailCellTableView:(UITableView *)tableView reusename:(NSString *)reusename model:(id)model selected:(NSInteger)selected;

@end
