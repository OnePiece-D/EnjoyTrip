//
//  WYLSpecialView.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/9.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYLSpecialView : UIView

@property (nonatomic, strong) NSMutableArray * dataSource;

@property (nonatomic, copy) void (^gotoDetilBlock) (id);

@end
