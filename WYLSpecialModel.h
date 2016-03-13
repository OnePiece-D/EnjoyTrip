//
//  WYLSpecialModel.h
//  EnjoyTrip
//
//  Created by 王亚龙 on 16/3/10.
//  Copyright © 2016年 YCD. All rights reserved.
//

#import "WYLDataRequestModel.h"

@interface WYLSpecialModel : WYLDataRequestModel

@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * image_url;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * destination_id;
@property (nonatomic, strong) NSNumber * updated_at;

@end
