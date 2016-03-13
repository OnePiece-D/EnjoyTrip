//
//  WYLTopAdsView.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/10.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WYLTopAdsView : UIView

/**
 *  图片参数
 */
@property (nonatomic,strong) NSArray * adsDataSource;

@property (nonatomic, copy) void (^adsTouchBlock) (NSInteger);

+ (instancetype)adsView;

@end
