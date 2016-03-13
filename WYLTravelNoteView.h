//
//  WYLTravelNoteView.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/9.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYLTravelNoteView : UIView

@property (nonatomic, strong) NSMutableArray * dataSource;

@property (nonatomic, strong) NSMutableArray * adsDataSource;

@property (nonatomic, copy) void (^gotoDetilBlock) (id);

@end
