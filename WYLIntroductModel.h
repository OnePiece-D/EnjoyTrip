//
//  WYLIntroductModel.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/9.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WYLUserCommonModel;

@interface WYLIntroductModel : WYLDataRequestModel

@property (nonatomic, copy) NSString * name;
@property (nonatomic, strong) NSNumber * photos_count;
@property (nonatomic, copy) NSString * start_date;
@property (nonatomic, copy) NSString * end_date;
@property (nonatomic, strong) NSNumber * days;
@property (nonatomic, strong) NSNumber * level;
@property (nonatomic, strong) NSNumber * views_count;
@property (nonatomic, strong) NSNumber * comments_count;
@property (nonatomic, strong) NSNumber * likes_count;
@property (nonatomic, copy) NSString * source;
@property (nonatomic, copy) NSString * front_cover_photo_url;
@property (nonatomic, assign) BOOL featured;

@property (nonatomic, strong) WYLUserCommonModel * user;

@end
