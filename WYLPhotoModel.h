//
//  WYLPhotoModel.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/20.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLDataRequestModel.h"

@interface WYLPhotoModel : WYLDataRequestModel

@property (nonatomic, strong) NSNumber * image_width;
@property (nonatomic, strong) NSNumber * image_height;

@property (nonatomic, strong) NSNumber * image_file_size;

@property (nonatomic, strong) NSNumber * exif_lat;
@property (nonatomic, strong) NSNumber * exif_lng;

@property (nonatomic, strong) NSNumber * exif_date_time_original;

@property (nonatomic, copy) NSString * url;

@end
