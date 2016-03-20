//
//  WYLVideoModel.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/20.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLDataRequestModel.h"

@interface WYLVideoModel : WYLDataRequestModel

@property (nonatomic, strong) NSNumber * time_length;

@property (nonatomic, strong) NSNumber * lat;
@property (nonatomic, strong) NSNumber * lng;

@property (nonatomic, copy) NSString * url;

@property (nonatomic, strong) NSNumber * video_width;
@property (nonatomic, strong) NSNumber * video_height;

@property (nonatomic, strong) NSNumber * recorded_at;

@end
