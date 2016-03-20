//
//  WYLDetailCell.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/20.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WYLDetailDaysNodesNotesModel.h"

#define btnHeight 18
#define fontNum 13

@interface WYLDetailCell : UITableViewCell

@property (nonatomic, strong) UIButton * locatBtn;

@property (nonatomic, strong) UIButton * likeBtn;

@property (nonatomic, strong) UIButton * discussBtn;

@property (nonatomic, strong) WYLDetailDaysNodesNotesModel * model;

@property (nonatomic, assign) NSInteger cellHeight;

- (void)setLocationBtnString:(NSString *)string;

@end
