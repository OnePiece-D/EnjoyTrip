//
//  WYLDetailAllDescModel.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/20.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLDataRequestModel.h"

#import "WYLTripDayModel.h"
#import "WYLUserCommonModel.h"

@interface WYLDetailAllDescModel : WYLDataRequestModel

@property (nonatomic, copy) NSString * name;

@property (nonatomic, strong) NSNumber * photos_count;

@property (nonatomic, copy) NSString * start_date;
@property (nonatomic, copy) NSString * end_date;

@property (nonatomic, strong) NSNumber * level;

@property (nonatomic, assign) BOOL privacy;

@property (nonatomic, strong) NSNumber * front_cover_photo_id;

@property (nonatomic, strong) NSNumber * views_count;

@property (nonatomic, strong) NSNumber * comments_count;

@property (nonatomic, strong) NSNumber * likes_count;

@property (nonatomic, strong) NSNumber * favorites_count;

@property (nonatomic, copy) NSString * state;

@property (nonatomic, copy) NSString * source;

@property (nonatomic, strong) NSNumber * serial_id;
@property (nonatomic, strong) NSNumber * serial_position;
@property (nonatomic, strong) NSNumber * serial_next_id;

@property (nonatomic, strong) NSNumber * updated_at;

@property (nonatomic, strong) NSArray<WYLTripDayModel *> * trip_days;

@property (nonatomic, strong) WYLUserCommonModel * user;

@property (nonatomic, strong) NSNumber * upload_token;

@property (nonatomic, assign) BOOL current_user_favorite;

@property (nonatomic, copy) NSString * password;

@property (nonatomic, copy) NSString * front_cover_photo_url;

@property (nonatomic, strong) NSArray * notes_likes_comments;

@end
